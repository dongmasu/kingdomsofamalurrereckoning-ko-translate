#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'review-source-labels-D21633'

module ApplySourceLabelsD21633
  extend self
  M = ReviewedNameBatches
  S = ReviewSourceLabelsD21633
  D = S::D
  MARKER = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m

  def manifest_rows(reviews)
    reviews.map do |row|
      term = row.fetch('term')
      status = row.fetch('status') == 'hold' ? 'uncertain' : row.fetch('status')
      {
        'resource' => row.fetch('resource'),
        'ID_Linha' => row.fetch('ID_Linha'),
        'Tipo_Variante' => row.fetch('Tipo_Variante'),
        'entity_key' => "source-label:#{term.downcase.gsub(/[^a-z0-9]+/, '-')}",
        'status' => status,
        'old' => row.fetch('old'),
        'new' => row.fetch('new'),
        'evidence' => row.fetch('evidence'),
        'english' => row.fetch('english'),
        'japanese' => row.fetch('japanese'),
        'chinese' => row.fetch('chinese'),
        'entity_dispositions_json' => '{}',
        'previous_status' => '{}',
        'previous_evidence' => '{}'
      }
    end
  end

  def summary(rows, checks, verification, inventory, prior)
    statuses = rows.group_by { |row| row.fetch('status') }.transform_values(&:length)
    active_hashes = M.hashes
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; " \
        "post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    retained = prior[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1].to_s
    backups = retained.lines.each_with_object({}) do |line, result|
      resource = line[/\A- (\w+): \d+ cells; pre .*backup `/, 1]
      result[resource] = line.strip if resource
    end
    integrity.lines.each do |line|
      resource = line[/\A- (\w+):/, 1]
      backups[resource] = line.strip
    end
    backup_text = M::RESOURCES.map { |resource| backups[resource] }.compact.join("\n")
    hashes_text = active_hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    index = M.table(M::INDEX)
    index_counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    unresolved = index.select { |row| %w[needs-context uncertain].include?(row['status']) }
    pending = index.select { |row| row['status'] == 'needs-context' }
    hold = index.select { |row| row['status'] == 'uncertain' }
    report = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    manifest = "proper-name-edits-D#{D}.tsv"

    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed #{rows.length} distinct source-label keys: #{statuses.inspect}; these are linguistic source-label decisions, not entity/row registrations.
      Groups: #{rows.map { |row| row['entity_key'] }.uniq.length} English labels, including one unresolved spacing candidate. Last reviewed key: default:59082 / Ticnerani.
      Next batch: D-21634; review Jock short-name occurrences against the existing Jock MacNelly owner, then continue all-resource residual discovery.
      Indexed matches: #{index.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{pending.length}, in #{pending.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{hold.length}, in #{hold.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Source-label review keys are not counted in the entity occurrence index or these indexed holds.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{M.table(File.join(M::AUDIT, 'proper-name-candidates.tsv')).length} terms; registered-reviewed=#{prior[/registered-reviewed=(\d+)/, 1]}, heuristic-not-reviewed=#{prior[/heuristic-not-reviewed=(\d+)/, 1]}. This list is not exhaustive.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes_text}
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{backup_text}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(M::AUDIT, 'proper-name-glossary.tsv')).hexdigest}`.
      Report: `work/zh_cn/audit/#{report}`.
      Addendum: `work/zh_cn/audit/#{addendum}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{manifest}`.
    TEXT
  end

  def apply
    prior_documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = prior_documents.fetch(M::DOCS.first)[MARKER]
    raise 'expected synchronized D-21632 checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21632 ') &&
      prior_documents.values.all? { |text| text[MARKER] == prior_block }

    manifest_path = File.join(M::AUDIT, "proper-name-edits-D#{D}.tsv")
    glossary_path = File.join(M::AUDIT, 'proper-name-glossary.tsv')
    index_path = M::INDEX
    glossary_before = Digest::SHA256.file(glossary_path).hexdigest
    index_before = Digest::SHA256.file(index_path).hexdigest
    backup = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    backup_file = File.join(backup, 'locatexts_zh_cn.koalocatext_default.csv')
    if File.exist?(manifest_path)
      raise 'D-21633 backup missing during closeout recovery' unless File.file?(backup_file)
      rows = M.table(manifest_path).map(&:to_h)
      raise 'unexpected recovery manifest scope' unless rows.length == 36
      inventory = M.refresh_inventory
      checks = rows.group_by { |row| row.fetch('resource') }.map do |resource, grouped|
        raise 'unexpected recovery resource' unless resource == 'default'
        {
          resource: resource,
          cells: grouped.count { |row| row['old'] != row['new'] },
          before_sha256: Digest::SHA256.file(backup_file).hexdigest,
          after_sha256: M.hashes.fetch(resource),
          backup: backup_file
        }
      end
      verification = M.command!('ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
                                '--review', manifest_path, '--backup-dir', backup)
    else
      hashes_before = M.hashes
      reviews = S.prepare
      rows = manifest_rows(reviews)
      raise 'duplicate source-label key' unless rows.map { |row| M.key(row) }.uniq.length == rows.length
      M.write_table(manifest_path, M::HEADERS, rows)
      checks = ProperNameCellEditor.apply(M::ROOT, manifest_path, backup, hashes_before)
      verification = M.command!('ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
                                '--review', manifest_path, '--backup-dir', backup)
      inventory = M.refresh_inventory
    end
    rows.each do |row|
      raise "post-edit cell mismatch #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    raise 'glossary changed during source-label review' unless
      glossary_before == Digest::SHA256.file(glossary_path).hexdigest
    raise 'occurrence index changed during source-label review' unless
      index_before == Digest::SHA256.file(index_path).hexdigest

    block_summary = summary(rows, checks, verification, inventory, prior_block)
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n" \
      "#{block_summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      File.write(path, File.read(path).sub(MARKER, block))
    end

    report_path = File.join(M::AUDIT, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum_path = File.join(M::AUDIT, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    explanation = <<~TEXT
      The all-resource English scan found 35 exact source-label keys for
      29 labels; 30 cells received annotations or a supported spelling
      normalization, while five were already paired. No person, place,
      creature, faction, item, or other category is inferred from these
      isolated labels. Every row retains exact aligned English, Japanese,
      Chinese, old Korean, and new Korean evidence in the manifest.

      The candidate “Mendeller Birt” remains uncertain: default:32170's
      English source is the concatenated `MendellerBirt`, while Japanese
      and Chinese suggest separate name components. No spacing or alias
      was invented. All other exact hits were paired with English. Daeges
      is normalized to 데이제스 using the matching Japanese デイジェス
      and Chinese 戴吉斯 evidence; no unrelated wording was changed.
      No glossary entry, occurrence, or indexed decision was created or
      changed. Sequential translation review remains complete through
      ID 65134; proper-name source discovery remains open.
    TEXT
    File.write(report_path, "# D-#{D}: Source-Local Name Labels\n\n#{explanation}\n#{block_summary}\n")
    File.write(addendum_path, <<~TEXT)
      # D-#{D} Edit Addendum

      30 default Texto cells changed; five exact labels were already paired;
      one spacing-mismatch candidate remains an unindexed uncertainty. No
      affix/base edits and no glossary/index registrations were made.

      #{checks.map { |check| "- #{check[:resource]}: #{check[:cells]} target cells; byte-identical backup `#{check[:backup]}`." }.join("\n")}

      #{verification.strip}

      #{block_summary}
    TEXT

    register_path = M::DOCS[3]
    register = File.read(register_path)
    raise 'D-21633 decision register section already exists' if register.include?('## D-21633: Source-Local Name Labels')
    decision_rows = rows.map do |row|
      label = row['entity_key'].sub('source-label:', '')
      disposition = row['status'] == 'uncertain' ? 'uncertain; unchanged' : row['status']
      "| `#{row['resource']}` `#{row['ID_Linha']}` | `#{row['english']}` | `#{row['old']}` | `#{row['new']}` | #{disposition} | Source-local label only; no referent category or identity inferred. |"
    end.join("\n")
    File.write(register_path, register.rstrip + "\n\n## D-#{D}: Source-Local Name Labels\n\n" \
      "Reviewed 35 exact source-label keys and one spacing-mismatch hold. These rows are not entity/row registrations and are excluded from indexed totals.\n\n" \
      "| Key | English label | Previous Korean | Reviewed Korean | Disposition | Evidence |\n| --- | --- | --- | --- | --- | --- |\n#{decision_rows}\n")
    puts "D-#{D}: #{rows.length} reviewed source-label rows; #{checks.sum { |check| check[:cells] }} Texto edits; registry/index unchanged.\n#{verification}"
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: apply-source-labels-D21633.rb apply' unless ARGV == ['apply']
  ApplySourceLabelsD21633.apply
end
