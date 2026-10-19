#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module AdarusArgothSourceLabelsD21646
  extend self
  M = ReviewedNameBatches
  D = 21_646
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  INDEX = File.join(__dir__, 'proper-name-occurrences.tsv')
  CANDIDATES = File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv')
  TARGETS = {
    ['default', '42550', ''] => {
      english: 'Adarus', old: '아다루스', new: '아다루스(Adarus)',
      japanese: 'Adarus', chinese: 'Adarus',
      evidence: 'The exact Adarus label is already bilingual as 아다루스(Adarus) at base:2837 and default:27259, whose aligned Japanese アダラス and Chinese 阿达鲁斯 corroborate. The target locale cells leave the English label untranslated. This row-local annotation does not resolve the historical Adarus Hollow/Fae hollow category or Paling Wand questions.'
    },
    ['default', '29539', ''] => {
      english: 'Argoth', old: '아르고스', new: '아르고스(Argoth)',
      japanese: 'Argoth', chinese: 'Argoth',
      evidence: 'The exact standalone label is Argoth. In the aligned Hallam the White sentence at default:13773, English names Argoth the Mighty, Japanese uses アーゴス, Chinese uses 阿戈斯, and the existing Korean already says 아르고스(Argoth). The target locale cells leave the English label untranslated. D-20383 did not establish Argoth as a person; this row-local annotation does not classify it as one or reopen that finding.'
    }
  }.freeze

  def source_texts(row)
    [
      JSON.parse(row.fetch('en_texts_json')).compact.uniq.join("\n"),
      JSON.parse(row.fetch('ja_texts_json')).compact.uniq.join("\n"),
      row.fetch('zh_text'),
      row.fetch('work_text')
    ]
  end

  def validate_scope!(inventory)
    TARGETS.each do |key, spec|
      english, japanese, chinese, current = source_texts(inventory.fetch(key))
      raise "English source mismatch at #{key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese source mismatch at #{key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese source mismatch at #{key.inspect}" unless chinese == spec.fetch(:chinese)
      raise "Korean cell mismatch at #{key.inspect}" unless [spec.fetch(:old), spec.fetch(:new)].include?(current)
    end

    adarus_exact = inventory.select do |_key, row|
      JSON.parse(row.fetch('en_texts_json')).compact.uniq == ['Adarus']
    end.keys.sort
    expected_adarus = [
      ['base', '2837', '11'], ['default', '27259', ''], TARGETS.keys.first
    ].sort
    raise "unexpected Adarus source-label scope: #{adarus_exact.inspect}" unless
      adarus_exact == expected_adarus
    [['base', '2837', '11'], ['default', '27259', '']].each do |key|
      raise "Adarus parallel bilingual label changed at #{key.inspect}" unless
        inventory.fetch(key).fetch('work_text') == '아다루스(Adarus)'
    end
    argoth_exact = inventory.select do |_key, row|
      JSON.parse(row.fetch('en_texts_json')).compact.uniq == ['Argoth']
    end.keys
    raise "unexpected Argoth exact source-label scope: #{argoth_exact.inspect}" unless
      argoth_exact == [TARGETS.keys.last]

    related = inventory.fetch(['default', '13773', ''])
    raise 'Argoth cross-locale contextual evidence changed' unless
      JSON.parse(related.fetch('en_texts_json')).compact.join("\n").include?('Slayer of Argoth the Mighty') &&
      JSON.parse(related.fetch('ja_texts_json')).compact.join("\n").include?('アーゴス') &&
      related.fetch('zh_text').include?('阿戈斯') &&
      related.fetch('work_text').include?('아르고스(Argoth)')
    true
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    previous = documents.values.first[marker]
    raise 'unexpected current checkpoint' unless
      previous&.include?('Latest verified proper-name batch: D-21645 ')
    raise 'checkpoint documents differ' unless
      documents.values.all? { |text| text[marker] == previous }

    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    report_path = File.join(__dir__, report_name)
    addendum_path = File.join(__dir__, addendum_name)
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'D-21646 output already exists' if
      [report_path, addendum_path, manifest].any? { |path| File.exist?(path) }

    active_hashes = M.hashes
    glossary_hash = Digest::SHA256.file(GLOSSARY).hexdigest
    index_hash = Digest::SHA256.file(INDEX).hexdigest
    candidates_hash = Digest::SHA256.file(CANDIDATES).hexdigest
    inventory = M.refresh_inventory
    validate_scope!(inventory)
    index = M.table(INDEX)
    raise 'a target already has an occurrence-index disposition' if
      index.any? { |item| TARGETS.key?(M.key(item)) }

    reviews = TARGETS.map do |key, spec|
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => "source-label:#{spec.fetch(:english).downcase}",
        'status' => 'accepted', 'old' => spec.fetch(:old), 'new' => spec.fetch(:new),
        'evidence' => spec.fetch(:evidence),
        'english' => spec.fetch(:english), 'japanese' => spec.fetch(:japanese),
        'chinese' => spec.fetch(:chinese),
        'entity_dispositions_json' => '{}',
        'previous_status' => '{}', 'previous_evidence' => '{}'
      }
    end
    M.write_table(manifest, M::HEADERS, reviews)
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, active_hashes)
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', manifest, '--backup-dir', backup_dir
    )
    inventory = M.refresh_inventory
    reviews.each do |review|
      raise "post-edit mismatch at #{M.key(review).inspect}" unless
        inventory.fetch(M.key(review)).fetch('work_text') == review.fetch('new')
    end
    validate_scope!(inventory)
    hashes = M.hashes
    raise 'CSV hashes differ from editor output' unless
      hashes.fetch('default') == checks.first.fetch(:after_sha256)
    raise 'glossary changed' unless Digest::SHA256.file(GLOSSARY).hexdigest == glossary_hash
    raise 'occurrence index changed' unless Digest::SHA256.file(INDEX).hexdigest == index_hash
    raise 'candidate shortlist changed' unless
      Digest::SHA256.file(CANDIDATES).hexdigest == candidates_hash

    data_validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless data_validation.include?('PASS')
    raise 'residual source/index audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    index_rows = M.table(INDEX)
    counts = index_rows.group_by { |item| item['status'] }.transform_values(&:length)
    unresolved = index_rows.select { |item| item['status'] == 'uncertain' }
    pending = index_rows.select { |item| item['status'] == 'needs-context' }
    retained = previous[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'prior backup history missing' unless retained
    retained = retained.lines.reject { |line| line.start_with?('- default:') }
    retained << "- default: 2 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.\n"
    residual_lines = residual.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented row-scoped Syl)/
    ).map(&:strip)
    glossary_count = M.table(GLOSSARY).length
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest

    rows = reviews.map do |review|
      "| `#{review['resource']}:#{review['ID_Linha']}` | `#{review['english']}` | `#{review['old']}` | `#{review['new']}` |"
    end.join("\n")
    batch = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed two exact standalone source labels: `Adarus` at default:42550 and `Argoth` at default:29539. Added the exact English spellings to the already established Korean forms `아다루스` and `아르고스`. Adarus is already paired at base:2837/default:27259; the English-led Hallam sentence at default:13773 already pairs Argoth, with Japanese アーゴス and Chinese 阿戈斯. Only the two target cells changed.
      These row-local annotations do not settle the historical Adarus Hollow/Fae hollow or Paling Wand questions and do not classify Argoth as a person. No identity category, glossary entity, occurrence-index disposition, prior terminal decision, or historical tally was added or reopened.
      Indexed matches: #{index_rows.length}; #{counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{pending.length}, in #{pending.map { |item| M.key(item) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{unresolved.length}, in #{unresolved.map { |item| M.key(item) }.uniq.length} distinct CSV row keys; these are not the complete residual discovery set.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backup and byte validation:
      - default: 2 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained.join.rstrip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index_rows.length} rows; SHA-256 `#{index_hash}` (unchanged).
      Proper-name glossary: #{glossary_count} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.
      Residual source/index audit: PASS; #{residual_lines.join('; ')}.
      Data validation: #{data_validation.strip}
      Next: D-21647; continue deduplicated discovery of unregistered and unpaired proper-name source labels across affix/base/default.
    TEXT

    report = <<~TEXT
      # D-#{D}: Adarus and Argoth Source-Label Consistency

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      Reviewed two exact standalone source labels across the active resources.
      For `Adarus`, base:2837 and default:27259 already use
      `아다루스(Adarus)`; default:42550 omitted the English source spelling.
      Japanese `アダラス` and Chinese `阿达鲁斯` corroborate the existing
      Korean form. No Adarus Hollow/Fae hollow classification or Paling Wand
      decision is changed.

      For `Argoth`, default:29539 omitted the English spelling after the
      established Korean `아르고스`. In the aligned Hallam the White sentence
      at default:13773, English names Argoth the Mighty, Japanese uses
      `アーゴス`, Chinese uses `阿戈斯`, and Korean already says
      `아르고스(Argoth)`. The prior D-20383 finding that available context did
      not establish Argoth as a person remains intact; this edit assigns no
      identity category.

      | Key | English | Korean old | Korean new |
      | --- | --- | --- | --- |
      #{rows}

      These are row-local source-label annotations only. No glossary owner,
      occurrence-index record, global alias, or historical tally was added
      or changed.

      ## Validation

      - #{verification.strip}
      - Glossary, occurrence index, candidate shortlist, and non-target CSV bytes remained unchanged.
      - #{residual_lines.join("\n- ")}
      - #{data_validation.strip}

      No PAK or PAK-derived data was consulted. Full proper-name discovery
      remains incomplete.
    TEXT
    addendum = <<~TEXT
      # D-#{D} Edit Addendum

      Two default `Texto` cells were paired with their exact standalone English
      source labels: `아다루스` -> `아다루스(Adarus)` and `아르고스` ->
      `아르고스(Argoth)`. Parallel labels and contextual text were retained.

      No glossary, occurrence index, prior disposition, or global tally was
      changed. The pre-edit byte-identical backup is
      `#{checks.first.fetch(:backup)}`.

      #{verification.strip}
    TEXT

    register_path = M::DOCS[3]
    register = File.read(register_path)
    heading = "## D-#{D}: Adarus and Argoth Source-Label Consistency"
    raise 'decision-register section already exists' if register.include?(heading)
    register << <<~REGISTER

      #{heading}

      Added source-label English annotations at default:42550
      (`아다루스` -> `아다루스(Adarus)`) and default:29539
      (`아르고스` -> `아르고스(Argoth)`). The identical Adarus labels at
      base:2837/default:27259 and Argoth's contextual label at default:13773
      were retained. This does not resolve existing Adarus place/item holds
      or classify Argoth as a person, and adds no glossary/index disposition
      or global tally. Full discovery remains incomplete.
    REGISTER

    File.write(report_path, report + "\n")
    File.write(addendum_path, addendum + "\n")
    File.write(register_path, register)
    documents.each do |path, text|
      raise "missing checkpoint in #{path}" unless text.match?(marker)
      text.sub!(
        marker,
        "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{batch}<!-- current-proper-name-batch:end -->\n"
      )
      File.write(path, text)
    end
    puts "D-#{D}: two source-label edits; entity/index/glossary dispositions unchanged.\n#{verification}\n#{data_validation}\n#{residual}"
  end
end

AdarusArgothSourceLabelsD21646.run if $PROGRAM_NAME == __FILE__
