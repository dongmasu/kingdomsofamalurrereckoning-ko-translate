#!/usr/bin/env ruby

require 'digest'
require_relative 'apply-reviewed-proper-name-discovery'

module OreynVilsarD21438
  extend self

  M = ReviewedNameBatches
  D = 21_438
  ENTITY = 'person:vilsar'
  IDS = %w[23730 33214 37373 39511 48767 61358 63773].freeze
  NOTE = 'The full English form Oreyn Vilsar is already owned by person:vilsar in all seven terminal occurrence decisions. Japanese オレイン・ヴィルサー, Chinese 奥瑞恩·维尔萨 and the existing Korean 오레인 빌사르(Oreyn Vilsar) agree. English 23730 identifies Marga Sammoc\'s lover eaten by Jottun. Promote the same stable entity to its complete name and retain Vilsar as an alias; do not add Oreyn, which also occurs in the deer/transformation story and requires separate contextual review. No prior person/key decision is reopened.'

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    original = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'original Vilsar canonical differs' unless original &&
      original['english_canonical'] == 'Vilsar' &&
      original['korean_canonical'] == '빌사르(Vilsar)' &&
      original['english_aliases'].to_s.empty?
    raise 'full name already owned by another entity' if glossary.any? do |row|
      row['entity_key'] != ENTITY &&
        [row['english_canonical'], *row['english_aliases'].to_s.split('|')].include?('Oreyn Vilsar')
    end
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    contexts = inventory.select do |_key, source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(/\bOreyn Vilsar\b/) }
    end
    raise 'exact full-name source coverage differs' unless
      contexts.keys.sort == IDS.map { |id| ['default', id, ''] }.sort
    evidence = contexts.sort_by { |key, _source| key[1].to_i }.map do |key, source|
      prior = index.find { |row| row['entity_key'] == ENTITY && M.key(row) == key }
      raise "prior terminal disposition absent #{key.inspect}" unless
        prior && %w[accepted not-an-issue].include?(prior['status'])
      batch = prior.fetch('evidence')[/\AD-(\d+):/, 1]
      raise 'prior provenance absent' unless batch
      manifest = M.table(File.join(__dir__, "proper-name-edits-D#{batch}.tsv")).find do |row|
        row['entity_key'].split('|').include?(ENTITY) && M.key(row) == key
      end
      raise "prior manifest differs #{key.inspect}" unless manifest &&
        prior['evidence'] == "D-#{batch}: #{manifest['evidence']}"
      decisions = JSON.parse(manifest['entity_dispositions_json'].to_s.empty? ? '{}' : manifest['entity_dispositions_json'])
      raise 'prior manifest status differs' unless decisions.fetch(ENTITY, manifest['status']) == prior['status']
      ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      zh = source.fetch('zh_text')
      ko = source.fetch('work_text')
      raise "aligned full-name evidence differs #{key.inspect}" unless
        ja.include?('オレイン・ヴィルサー') && zh.include?('奥瑞恩·维尔萨') &&
        ko.include?('오레인 빌사르(Oreyn Vilsar)')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'previous_status' => prior['status'],
        'previous_evidence' => prior['evidence'],
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => ja, 'chinese' => zh, 'korean' => ko
      }
    end
    updated = original.to_h.merge(
      'english_canonical' => 'Oreyn Vilsar',
      'korean_canonical' => '오레인 빌사르(Oreyn Vilsar)',
      'english_aliases' => 'Vilsar',
      'korean_variants' => '빌사르|오레인 빌사르',
      'evidence_ids' => "#{original['evidence_ids']}|D-#{D}",
      'notes' => "#{original['notes']} D-#{D}: #{NOTE}"
    )
    generated = build_occurrences(inventory.values, [updated]).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    existing = index.select { |row| row['entity_key'] == ENTITY }
    raise 'canonical metadata changes existing source keys' unless
      generated.map { |row| M.key(row) }.sort == existing.map { |row| M.key(row) }.sort
    puts "D-#{D}: #{evidence.length} terminal full-name rows checked; no CSV/index edit"
    [glossary, original.to_h, updated, evidence]
  end

  def apply
    glossary, original, updated, evidence = prepare
    before_csv = M.hashes
    before_index = Digest::SHA256.file(M::INDEX).hexdigest
    before_glossary = Digest::SHA256.file(ReviewedProperNameDiscovery::GLOSSARY).hexdigest
    prefix = File.join(__dir__, "proper-name-alias")
    M.write_table("#{prefix}-review-D#{D}.tsv", evidence.first.keys, evidence)
    M.write_table("#{prefix}-definition-D#{D}.tsv", glossary.headers, [updated])
    M.write_table("#{prefix}-registration-D#{D}.tsv", glossary.headers, [original])
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers,
      glossary.map { |row| row['entity_key'] == ENTITY ? updated : row.to_h })
    raise 'CSV changed during no-edit registration' unless M.hashes == before_csv
    raise 'prior occurrence bytes changed' unless Digest::SHA256.file(M::INDEX).hexdigest == before_index
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    residual_lines = residual.lines.grep(/\A(?:Source\/index|Source\/occurrence|Terminal matches)/).map(&:strip)
    raise 'residual audit did not pass' unless residual_lines.any? { |line| line.include?('missing=0') && line.include?('undocumented extras=0') } &&
      residual_lines.include?('Terminal matches without a covering bilingual English label: 0')
    proof = {
      batch: D, entity_key: ENTITY, new_entities: 0, new_occurrences: 0,
      original_entity: original, updated_entity: updated,
      initial_glossary_sha256: before_glossary,
      final_glossary_sha256: Digest::SHA256.file(ReviewedProperNameDiscovery::GLOSSARY).hexdigest,
      initial_occurrence_index_sha256: before_index, final_occurrence_index_sha256: before_index,
      csv_sha256_before: before_csv, csv_sha256_after: M.hashes,
      residual_validation: residual_lines,
      verified: 'Seven exact terminal full-name rows verified against their original manifests; all index bytes and translation CSV bytes preserved.'
    }
    File.write("#{prefix}-registration-D#{D}.json", JSON.pretty_generate(proof) + "\n")
    prior = File.read(M::DOCS.first)[/<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n(.*?)<!-- current-proper-name-batch:end -->/m, 1]
    raise 'active checkpoint absent' unless prior
    summary = prior.dup
    summary.sub!(/Latest verified proper-name batch: D-\d+/, "Latest verified proper-name batch: D-#{D}")
    summary.sub!(/^Reviewed .*?\nGroups: .*?\n/m,
      "Verified #{IDS.length} existing terminal full-name rows for person:vilsar; promoted canonical to Oreyn Vilsar, retaining Vilsar only as its short alias. No new entity, occurrence decision, or CSV edit; prior index bytes are unchanged.\n")
    summary.sub!(/^Next batch: .*$/, "Next batch: D-#{D + 1}; continue source discovery/residual checks; no unreviewed indexed keys.")
    summary.sub!(/Last batch pre-edit backups and byte validation:\n.*?(?=Last actual CSV-edit backups)/m,
      "No CSV edits in D-#{D}; the last actual CSV-edit backups are retained below.\n")
    summary.sub!(/^Proper-name glossary: .*$/,
      "Proper-name glossary: #{glossary.length} entries; SHA-256 `#{proof[:final_glossary_sha256]}`.")
    summary.gsub!(/named-scope-review-D\d+-\d+\.md/, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    summary.gsub!(/named-scope-edit-addendum-D\d+-\d+\.md/, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    summary.sub!(/^Exact source comparison manifest: .*$/,
      "Exact preserved-disposition evidence: `work/zh_cn/audit/proper-name-alias-review-D#{D}.tsv`.")
    summary << "Residual bilingual/index audit: PASS; #{residual_lines.join('; ')}.\n"
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "missing checkpoint #{path}" unless text.include?('<!-- current-proper-name-batch:start -->')
      File.write(path, text.sub(/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m, block))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.write(path, "# D-#{D}: Existing Full-Name Registration\n\n#{summary}\n## Evidence\n\n#{NOTE}\n\nNo CSV backup was created because all translation CSVs remain byte-identical. Prior terminal statuses/evidence were checked against their original manifests and preserved byte-for-byte.\n")
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then OreynVilsarD21438.prepare
  when 'apply' then OreynVilsarD21438.apply
  else abort 'usage: register-oreyn-vilsar-D21438.rb [prepare|apply]'
  end
end
