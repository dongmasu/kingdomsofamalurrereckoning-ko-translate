#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ProperNameTextCorrections20261018
  extend self
  M = ReviewedNameBatches
  MARKER = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m

  def run(d, corrections, title)
    raise 'correction scope must contain 1..50 distinct cells' unless
      (1..50).cover?(corrections.length) &&
      corrections.map { |r| M.key(r) }.uniq.length == corrections.length
    manifest = File.join(__dir__, "proper-name-edits-D#{d}.tsv")
    recovering = File.file?(manifest)
    if recovering
      raise 'correction reports already exist; do not overwrite' unless
        Dir.glob(File.join(__dir__, "named-scope-*-D#{d}-*.md")).empty?
      saved = M.table(manifest).map(&:to_h)
      raise 'recovery must use the exact recorded corrective manifest' unless saved == corrections
    else
      ReviewedProperNameDiscovery.ensure_unused_batch!(d)
    end
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    prior_decisions = index.map { |r| r.to_h.reject { |field, _| field == 'korean_current' } }
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior = docs.fetch(M::DOCS.first)[MARKER]
    raise 'current checkpoints differ' unless prior && docs.values.all? { |text| text[MARKER] == prior }
    retained = prior[/Last actual CSV-edit backups[^\n]*:\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'last-edit backup list missing' unless retained
    reviews = corrections.map do |correction|
      key = M.key(correction)
      source = inventory.fetch(key)
      expected_text = correction.fetch(recovering ? 'new' : 'old')
      raise "stale correction #{key}" unless source.fetch('work_text') == expected_text
      occurrence = index.find do |r|
        M.key(r) == key && r.fetch('entity_key') == correction.fetch('entity_key')
      end
      raise "correction lacks prior entity/row finding #{key}" unless occurrence
      raise "unreviewed correction target #{key}" if occurrence.fetch('status') == 'needs-context'
      if recovering
        entity = correction.fetch('entity_key')
        raise "recovery prior finding differs #{key}" unless
          JSON.parse(correction.fetch('previous_status')).fetch(entity) == occurrence.fetch('status') &&
          JSON.parse(correction.fetch('previous_evidence')).fetch(entity) == occurrence.fetch('evidence')
      end
      correction.merge(
        'status' => 'accepted',
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(correction.fetch('entity_key') => 'accepted'),
        'previous_status' => JSON.generate(correction.fetch('entity_key') => occurrence.fetch('status')),
        'previous_evidence' => JSON.generate(correction.fetch('entity_key') => occurrence.fetch('evidence'))
      )
    end
    M.write_table(manifest, M::HEADERS, reviews) unless recovering
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{d}"
    checks = if recovering
               reviews.group_by { |r| r.fetch('resource') }.map do |resource, targets|
                 backup = File.join(backup_dir, File.basename(M.csv_path(resource)))
                 before_bytes = File.binread(backup)
                 expected_bytes, count = ProperNameCellEditor.prepare(before_bytes, targets)
                 raise "recovered active CSV differs #{resource}" unless
                   expected_bytes == File.binread(M.csv_path(resource))
                 {
                   resource: resource, cells: targets.length, rows: count,
                   before_sha256: Digest::SHA256.hexdigest(before_bytes),
                   after_sha256: Digest::SHA256.hexdigest(expected_bytes), backup: backup
                 }
               end
             else
               ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, M.hashes)
             end
    verification = M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                             '--review', manifest, '--backup-dir', backup_dir)
    inventory = M.refresh_inventory
    index.each { |r| r['korean_current'] = inventory.fetch(M.key(r)).fetch('work_text') }
    raise 'prior entity dispositions changed' unless
      index.map { |r| r.to_h.reject { |field, _| field == 'korean_current' } } == prior_decisions
    M.write_table(M::INDEX, index.headers, index.map(&:to_h))
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'correction residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary.map(&:to_h), index.map(&:to_h))
    snapshot_name = "proper-name-short-label-discovery-D#{d}.tsv"
    M.write_table(File.join(__dir__, snapshot_name), ShortLabelDiscovery20261018::HEADERS, snapshot)
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    backup_lines = retained.lines.each_with_object({}) do |line, map|
      resource = line[/\A- (affix|base|default):/, 1]
      map[resource] = line.strip if resource
    end
    integrity.lines.each { |line| backup_lines[line[/\A- (\w+):/, 1]] = line.strip }
    counts = index.group_by { |r| r['status'] }.transform_values(&:length)
    held = index.select { |r| r['status'] == 'uncertain' }
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{d} (#{M::RUN_DATE_ISO}).
      Corrected #{reviews.length} previously reviewed Texto cells: #{title}.
      Prior entity/row statuses and evidence remain byte-for-byte unchanged; no key, entity, or cumulative decision was added or recounted.
      Next batch: D-#{d + 1}; continue from `#{snapshot_name}` (#{snapshot.length} bounded groups; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{counts.fetch('needs-context', 0)}.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |r| M.key(r) }.uniq.length} distinct CSV row keys.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{M.hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")}
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{M::RESOURCES.map { |resource| backup_lines[resource] }.compact.join("\n")}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(glossary_path).hexdigest}`.
      Data validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/|Terminal matches)/).map(&:strip).join('; ')}
      Report: `work/zh_cn/audit/named-scope-review-D#{d}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{d}-#{M::RUN_DATE_COMPACT}.md`.
      Corrective cell manifest: `work/zh_cn/audit/proper-name-edits-D#{d}.tsv`.
    TEXT
    evidence = reviews.map { |r| "- #{M.key(r).join(':')} / #{r['entity_key']}: #{r['evidence']}" }.join("\n")
    File.write(File.join(__dir__, "named-scope-review-D#{d}-#{M::RUN_DATE_COMPACT}.md"),
               "# D-#{d}: #{title}\n\n#{summary}\n## Evidence\n\n#{evidence}\n")
    File.write(File.join(__dir__, "named-scope-edit-addendum-D#{d}-#{M::RUN_DATE_COMPACT}.md"),
               "# D-#{d}: Corrective Edit Addendum\n\n#{summary}\nAll corrections preserve prior indexed dispositions. The independent byte verifier confirms the backup, BOM, mixed line endings, row order, target-only Texto changes and inverse reconstruction.\n")
    docs.each do |path, text|
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
      File.write(path, text.sub(MARKER, block))
    end
    puts "D-#{d}: #{reviews.length} corrective cells; prior decisions/counts retained; byte/data/residual validation PASS."
  end
end
