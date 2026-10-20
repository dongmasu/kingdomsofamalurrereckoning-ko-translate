#!/usr/bin/env ruby

require 'csv'
require 'date'
require 'digest'
require 'json'
require 'open3'
require_relative 'proper-name-cell-editor'

# Apply already-reviewed manifests, never discover or approve translations here.
module ReviewedNameBatches
  RUN_DATE = Date.today
  RUN_DATE_COMPACT = RUN_DATE.strftime('%Y%m%d')
  RUN_DATE_ISO = RUN_DATE.iso8601
  ROOT = File.expand_path('../../..', __dir__)
  AUDIT = __dir__
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
  HEADERS = %w[resource ID_Linha Tipo_Variante entity_key status old new evidence english japanese chinese entity_dispositions_json previous_status previous_evidence].freeze
  RESOURCES = %w[affix base default].freeze
  DOCS = [
    File.join(ROOT, 'NEXT-SESSION.md'),
    File.join(ROOT, 'work/zh_cn/TRANSLATION_PROGRESS.md'),
    File.join(AUDIT, 'README.md'),
    File.join(AUDIT, 'decision-register-20261009.md'),
    File.join(AUDIT, 'proper-name-continuation-validation-20261015.md')
  ].freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def csv_path(resource)
    File.join(ROOT, 'work/zh_cn', "locatexts_zh_cn.koalocatext_#{resource}.csv")
  end

  def hashes
    RESOURCES.to_h { |resource| [resource, Digest::SHA256.file(csv_path(resource)).hexdigest] }
  end

  def table(path)
    CSV.read(path, headers: true, col_sep: "\t")
  end

  def write_table(path, headers, rows)
    CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << headers
      rows.each { |row| csv << headers.map { |header| row[header] } }
    end
  end

  def command!(*args)
    output, status = Open3.capture2e(*args)
    raise "#{args.inspect}: #{output}" unless status.success?
    output
  end

  def refresh_inventory
    staging = "/private/tmp/proper-name-source-inventory-#{Process.pid}.tsv"
    command!('ruby', File.join(AUDIT, 'build-proper-name-inventory.rb'),
             '--resource', 'all', '--out', staging)
    raise 'incomplete aligned inventory' unless table(staging).length == 73_430
    File.rename(staging, INVENTORY)
    table(INVENTORY).to_h { |row| [key(row), row.to_h] }
  end

  # Combine independently reviewed edits only when their original spans do not
  # overlap. Python's standard-library diff avoids a quadratic Ruby LCS table.
  def rebase_review(old, proposed, current)
    return proposed if old == current
    return current if proposed == old || proposed == current
    program = <<~PYTHON
      import difflib, json, sys
      old, proposed, current = json.load(sys.stdin)
      def changes(new):
          return [(a, b, new[c:d]) for op, a, b, c, d in
                  difflib.SequenceMatcher(None, old, new, autojunk=False).get_opcodes()
                  if op != 'equal']
      existing = changes(current)
      incoming = changes(proposed)
      def overlaps(x, y):
          a, b, _ = x
          c, d, _ = y
          if a == b and c == d:
              return a == c
          if a == b:
              return c < a < d
          if c == d:
              return a < c < b
          return max(a, c) < min(b, d)
      combined = existing[:]
      for patch in incoming:
          if patch in combined:
              continue
          if any(overlaps(patch, other) for other in combined):
              raise SystemExit('overlapping reviewed text transformations need focused re-review')
          combined.append(patch)
      result = old
      for a, b, replacement in sorted(combined, reverse=True):
          result = result[:a] + replacement + result[b:]
      json.dump(result, sys.stdout, ensure_ascii=False)
    PYTHON
    result, error, status = Open3.capture3('python3', '-c', program,
                                          stdin_data: JSON.generate([old, proposed, current]))
    raise error unless status.success?
    JSON.parse(result)
  end

  def checkpoint(d, reviews, checks, verify_output, inventory, review_states: ['needs-context'])
    index = table(INDEX)
    decisions = {}
    reviews.each do |review|
      per_entity = JSON.parse(review['entity_dispositions_json'].to_s.empty? ? '{}' : review['entity_dispositions_json'])
      review.fetch('entity_key').split('|').each do |entity|
        decision = review.dup
        decision['status'] = per_entity.fetch(entity, review.fetch('status'))
        raise 'invalid entity disposition' unless %w[accepted not-an-issue excluded uncertain].include?(decision['status'])
        decisions[[entity, *key(review)]] = decision
      end
    end
    matched = {}
    index.each do |row|
      row['korean_current'] = inventory.fetch(key(row)).fetch('work_text')
      decision_key = [row.fetch('entity_key'), *key(row)]
      review = decisions[decision_key]
      next unless review
      recovering = row['status'] == review.fetch('status') &&
        row['evidence'] == "D-#{d}: #{review.fetch('evidence')}"
      raise "already terminal #{decision_key.inspect}" unless review_states.include?(row['status']) || recovering
      row['status'] = review.fetch('status')
      row['evidence'] = "D-#{d}: #{review.fetch('evidence')}"
      matched[decision_key] = true
    end
    raise 'review entity key missing from index' unless (decisions.keys - matched.keys).empty?
    write_table(INDEX, index.headers, index)
    counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    active = hashes
    unresolved = index.select { |row| %w[needs-context uncertain].include?(row['status']) }
    unreviewed = index.select { |row| row['status'] == 'needs-context' }
    held = index.select { |row| row['status'] == 'uncertain' }
    discovery_candidates = table(File.join(AUDIT, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    candidate_counts = discovery_candidates.group_by { |row| row['status'] }
      .transform_values(&:length)
    next_row = unreviewed.min_by { |row| [row['entity_key'], RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'].to_s] }
    next_text = next_row ? "first unreviewed indexed key: #{next_row['entity_key']} / #{key(next_row).join(':')}" :
      'continue bounded proper-name checks until the user explicitly asks to stop'
    remaining_rows = unresolved.map { |row| key(row) }.uniq.length
    groups = reviews.flat_map { |r| r['entity_key'].split('|') }
      .group_by { |entity| entity }.transform_values(&:length)
    statuses = reviews.group_by { |row| row['status'] }.transform_values(&:length)
    manifest = "proper-name-edits-D#{d}.tsv"
    report = "named-scope-review-D#{d}-#{RUN_DATE_COMPACT}.md"
    addendum = "named-scope-edit-addendum-D#{d}-#{RUN_DATE_COMPACT}.md"
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    prior_block = File.read(DOCS.first)[/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m].to_s
    retained = prior_block[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1]
    retained ||= prior_block.lines.grep(/^- \w+: \d+ cells; pre .*backup `/).join
    backups_by_resource = (retained.lines + integrity.lines).each_with_object({}) do |line, result|
      resource = line[/\A- (\w+): \d+ cells; pre .*backup `/, 1]
      result[resource] = line.strip if resource
    end
    last_backups = RESOURCES.map { |resource| backups_by_resource[resource] }.compact.join("\n")
    hash_lines = active.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    counts_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    last = reviews.last
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{d} (#{RUN_DATE_ISO}).
      Reviewed #{reviews.length} distinct resource/ID/variant keys: #{statuses.inspect}.
      Groups: #{groups.inspect}. Last reviewed key: #{key(last).join(':')} / #{last['entity_key']}.
      Follow-up: #{next_text}.
      Indexed matches: #{index.length}; #{counts_text}.
      Remaining unreviewed indexed matches: #{unreviewed.length}, in #{unreviewed.map { |row| key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| key(row) }.uniq.length} distinct CSV row keys.
      Keep reviewed holds closed unless new, specific evidence appears.
      These are focused entity/row index states, not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{discovery_candidates.length} terms; registered-reviewed=#{candidate_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{candidate_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive; it does not establish an overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; this does not block the user's translation-complete status.
      Active CSV SHA-256:
      #{hash_lines}
      Last batch pre-edit backups and byte validation:
      #{integrity.empty? ? 'No CSV edits in this batch; latest edited-batch backups are retained below.' : integrity}
      #{verify_output.strip.empty? ? 'No changed cells require inverse reconstruction.' : verify_output.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{last_backups.empty? ? 'None found in the prior checkpoint; consult the last edited-batch addendum.' : last_backups}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(INDEX).hexdigest}`.
      Proper-name glossary: #{table(File.join(AUDIT, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(AUDIT, 'proper-name-glossary.tsv')).hexdigest}`.
      Report: `work/zh_cn/audit/#{report}`.
      Addendum: `work/zh_cn/audit/#{addendum}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{manifest}`.
    TEXT
    File.write(File.join(AUDIT, report), <<~TEXT)
      # D-#{d}: Reviewed Proper-Name Batch

      Date: #{RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Evidence

      English is the identity/meaning anchor. The manifest records the aligned
      Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
      Canonical forms reuse the English-indexed glossary; full-name, family,
      title, and homonym exceptions are recorded per row, not inferred from
      capitalization alone. Official-manual setting/terminology context is used
      where relevant; omission from its non-exhaustive list is not a judgment.
      No PAK, PAK-derived resource, or historical global tally was consulted.
    TEXT
    File.write(File.join(AUDIT, addendum), <<~TEXT)
      # D-#{d} Edit Addendum

      #{summary}

      The byte-preserving editor and separate verifier checked BOM, the exact
      mixed line-ending sequence, headers, row count/order, keys/variants,
      target Texto values, unchanged non-target cells/bytes, and inverse
      reconstruction against byte-identical pre-edit backups.
    TEXT
    DOCS.each do |path|
      text = File.read(path)
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      if text.include?('<!-- current-proper-name-batch:start -->')
        text.sub!(/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m, block)
      else
        position = text.index("\n", text.index('#')) + 1
        text.insert(position, "\n#{block}\nOlder checkpoint narratives below are historical; the latest verified batch above takes precedence.\n")
      end
      File.write(path, text)
    end
    puts "D-#{d}: #{statuses.inspect}; remaining matches=#{unresolved.length}, row keys=#{remaining_rows}; next=#{next_text}"
  end

  def run(path, start_d, limit, review_states: ['needs-context'])
    proposals = table(path).map(&:to_h)
    inventory = refresh_inventory
    index = table(INDEX)
    pending = index.select { |r| review_states.include?(r['status']) }.to_h { |r| [[r['entity_key'], *key(r)], r] }
    proposals.select! { |r| r['entity_key'].split('|').all? { |e| pending[[e, *key(r)]] } }
    raise 'duplicate proposed row key' unless proposals.map { |r| key(r) }.uniq.length == proposals.length
    proposals.each_slice(50).with_index do |reviews, ordinal|
      break if limit && ordinal >= limit
      d = start_d + ordinal
      raise "D-#{d} already recorded" if
        Dir.glob(File.join(AUDIT, "named-scope-review-D#{d}-*.md")).any? ||
        File.exist?(File.join(AUDIT, "proper-name-edits-D#{d}.tsv"))
      reviews.each do |review|
        raise "unapproved status #{review['status']}" unless %w[accepted not-an-issue excluded uncertain].include?(review['status'])
        previous = review['entity_key'].split('|').to_h { |entity| [entity, pending.fetch([entity, *key(review)])] }
        review['previous_status'] = JSON.generate(previous.transform_values { |r| r['status'] })
        review['previous_evidence'] = JSON.generate(previous.transform_values { |r| r['evidence'] })
        source = inventory.fetch(key(review))
        if source['work_text'] != review['old']
          review['new'] = rebase_review(review['old'], review['new'], source['work_text'])
          review['old'] = source['work_text']
          review['status'] = 'not-an-issue' if review['status'] == 'accepted' && review['old'] == review['new']
          review['evidence'] += ' Independent already-verified edits on this cell were retained; only non-overlapping reviewed spans were merged.'
        end
        preserved_disposition_edit = review['status'] != 'accepted' &&
          review['old'] != review['new'] &&
          review['evidence'].start_with?('Corrective particle-only residual audit.') &&
          JSON.parse(review.fetch('previous_status')).values.all? do |status|
            status == review['status']
          end
        raise 'non-accepted edit' if review['status'] != 'accepted' &&
          review['old'] != review['new'] && !preserved_disposition_edit
        review['english'] = JSON.parse(source['en_texts_json']).compact.join("\n")
        review['japanese'] = JSON.parse(source['ja_texts_json']).compact.join("\n---\n")
        review['chinese'] = source['zh_text']
      end
      manifest = File.join(AUDIT, "proper-name-edits-D#{d}.tsv")
      write_table(manifest, HEADERS, reviews)
      backup = "/private/tmp/ko-translate-backups/#{RUN_DATE_COMPACT}/before-proper-name-D#{d}"
      checks = ProperNameCellEditor.apply(ROOT, manifest, backup, hashes)
      verify_output = command!('ruby', File.join(AUDIT, 'verify-proper-name-edits.rb'),
                               '--review', manifest, '--backup-dir', backup)
      inventory = refresh_inventory
      reviews.each { |r| raise 'post-edit text mismatch' unless inventory.fetch(key(r))['work_text'] == r['new'] }
      checkpoint(d, reviews, checks, verify_output, inventory, review_states: review_states)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: continue-proper-name-reviewed-batches.rb REVIEW.tsv START_D [BATCH_LIMIT]' unless (2..3).cover?(ARGV.length)
  ReviewedNameBatches.run(ARGV[0], Integer(ARGV[1]), ARGV[2] && Integer(ARGV[2]))
end
