#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module SourceLabelsD21687
  extend self
  M = ReviewedNameBatches
  D = 21_687
  TARGETS = {
    ['base', '377', '11'] => {
      english: "Mala'chim Talisman", japanese: 'マラシムのタリスマン',
      chinese: '马拉奇姆护符', old: "말라킴(Mala'chim)의 부적",
      new: "말라킴(Mala'chim)의 부적",
      note: "The exact personal-name component is already paired. Preserve it; the isolated base label does not establish a unique artifact owner or broader identity."
    },
    ['base', '502', '11'] => {
      english: 'Aster History', japanese: 'アスターの歴史',
      chinese: '阿斯特尔历史', old: '아스터(Aster)의 역사',
      new: '아스터(Aster)의 역사',
      note: 'The exact Aster component is already paired. Preserve it; the isolated label does not establish whether Aster is a place, person, or other referent.'
    },
    ['base', '4354', '11'] => {
      english: 'Timios', japanese: 'ティミオス', chinese: '提莫斯',
      old: '티미오스(Timios)', new: '티미오스(Timios)',
      note: 'Pair this exact standalone English source label with its existing Korean transliteration. Do not merge it with the differently spelled Timos play/person references or infer a referent category.'
    }
  }.freeze
  SUMMARY_MARKER = '<!-- current-proper-name-batch:start -->'

  def source_matches(inventory, term)
    pattern = /(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i
    inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern) }
    end.map { |source| M.key(source) }.uniq.sort
  end

  def reviews(inventory)
    TARGETS.map do |key, spec|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      current = source.fetch('work_text')
      raise "English source differs at #{key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese source differs at #{key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese source differs at #{key.inspect}" unless source.fetch('zh_text') == spec.fetch(:chinese)
      raise "Korean source differs at #{key.inspect}" unless current == spec.fetch(:old) || current == spec.fetch(:new)

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => "source-label:#{spec.fetch(:english).downcase.gsub(/[^a-z0-9]+/, '-')}",
        'status' => current == spec.fetch(:new) && current != spec.fetch(:old) ? 'not-an-issue' :
          (spec.fetch(:old) == spec.fetch(:new) ? 'not-an-issue' : 'accepted'),
        'old' => spec.fetch(:old), 'new' => spec.fetch(:new),
        'evidence' => "Source-local bilingual label review only; no entity category, identity, alias, glossary entry, or occurrence disposition is inferred. #{spec.fetch(:note)}",
        'english' => english, 'japanese' => japanese, 'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => '{}',
        'previous_status' => '{}', 'previous_evidence' => '{}'
      }
    end
  end

  def run
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    prior = documents.values.first[marker]
    raise 'D-21686 checkpoint is not current' unless prior&.include?('Latest verified proper-name batch: D-21686 ')
    raise 'checkpoint documents differ' unless documents.values.all? { |text| text[marker] == prior }
    raise 'D-21687 outputs already exist' if [
      File.join(__dir__, "proper-name-edits-D#{D}.tsv"),
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].any? { |path| File.exist?(path) }

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    TARGETS.each do |key, spec|
      matches = source_matches(inventory, spec.fetch(:english))
      raise "all-resource exact source scope differs for #{spec[:english]}: #{matches.inspect}" unless matches == [key]
    end
    index = M.table(M::INDEX)
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    raise 'source-label target has a pre-existing entity owner' if
      index.any? { |row| TARGETS.key?(M.key(row)) }
    rows = reviews(inventory)
    raise 'unexpected source-label review scope' unless rows.map { |row| M.key(row) }.sort == TARGETS.keys.sort

    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    M.write_table(manifest, M::HEADERS, rows)
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = []
    if rows.any? { |row| row.fetch('old') != row.fetch('new') }
      checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, before_hashes)
      verification = M.command!(
        'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
        '--review', manifest, '--backup-dir', backup_dir
      )
    else
      raise 'CSV changed during no-edit review' unless M.hashes == before_hashes
      verification = 'No CSV edits; active byte hashes are unchanged.'
    end
    inventory = M.refresh_inventory
    rows.each do |row|
      raise "post-edit text differs at #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    raise 'source-label review changed indexed dispositions' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_hash &&
      index.all? { |row| !TARGETS.key?(M.key(row)) }

    hashes = M.hashes
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    index_counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    counts_text = index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    previous_backups = prior[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1].to_s
    retained = previous_backups.lines.reject { |line| line.start_with?('- base:') }
    retained << integrity.lines.find { |line| line.start_with?('- base:') } if
      checks.any? { |check| check[:cells].positive? }
    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 3 distinct base source-label keys: 3 not-an-issue; no Texto cells changed. These are source-local checks only, not glossary entities or indexed occurrences. Last reviewed key: base:4354:11 / source-label:timios.
      Next batch: D-21688; continue all-resource source discovery and residual checks; no unreviewed indexed keys.
      Indexed matches: #{index.length}; #{counts_text}.
      Remaining unreviewed indexed matches: 0; reviewed unresolved indexed holds: #{index.count { |row| row['status'] == 'uncertain' }}. These bounded index counts do not measure the overall discovery remainder.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")}
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained.compact.map(&:strip).join("\n")}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}` (unchanged).
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}` (unchanged).
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.
    TEXT

    reports = {
      "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md" =>
        "# D-#{D}: Source-Local Name Labels\n\n#{block}\n\n## Evidence\n\nEnglish is the spelling/meaning anchor; the aligned Japanese and Chinese labels are corroborative. `Mala'chim Talisman`, `Aster History`, and `Timios` all already carry their exact English name forms in the active Korean labels. `Timios` remains distinct from `Timos`. Historical D-4148 at default:13967 and D-15168 at default:49794 remain unchanged: this batch does not resolve the separate Timos play/discourse text-type questions. No PAK-derived material was consulted.\n",
      "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md" =>
        "# D-#{D} Edit Addendum\n\nNo CSV cell changed. The exact active Korean labels were checked against English, Japanese, and Chinese. No new byte backup was needed; the prior edited-batch backups remain authoritative.\n\n#{block}\n"
    }
    reports.each { |name, text| File.write(File.join(__dir__, name), text) }
    documents.each do |path, text|
      replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n"
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: Source-Local Label Cross-Check\n\nEnglish base:377/502/4354 labels `Mala'chim Talisman`, `Aster History`, and `Timios` are aligned with Japanese and Chinese and already carry their source English name forms in the active Korean cells. No `Texto`, glossary, occurrence index, historical disposition, or global tally changed. These source-local checks do not infer referent categories. Keep `Timios` distinct from `Timos`; preserve D-4148 and D-15168 verbatim and unresolved.\n"
      end
      File.write(path, text)
    end
    edits = rows.count { |row| row.fetch('old') != row.fetch('new') }
    puts "D-#{D}: reviewed #{rows.length} source labels; #{edits} edits; index/glossary unchanged."
  end
end

SourceLabelsD21687.run if $PROGRAM_NAME == __FILE__
