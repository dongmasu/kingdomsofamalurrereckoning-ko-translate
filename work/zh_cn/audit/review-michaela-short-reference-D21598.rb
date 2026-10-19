#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module ReviewMichaelaShortReferenceD21598
  extend self
  M = ReviewedNameBatches
  D = 21_598
  ENTITY = 'person:michaela-vogel'
  TARGET = ['default', '51941', ''].freeze
  ALIAS = 'Michaela'
  R = ReviewedProperNameDiscovery
  EVIDENCE = <<~TEXT.chomp
    Default:51941 says “Michaela's” poachers and identifies the same
    Chaos Critters, Chaos Rifts, farmland and warehouses as the Michaela
    Vogel quest in default:28098 and 33250. Japanese ミカエラ and Chinese
    米凯拉 corroborate the short-name reference; English earlier identifies
    the farmer as Michaela Vogel. Register Michaela as a source-supported
    short-name alias of the existing person entry. The Korean short form is
    already present, so no English parenthetical is needed. If Korean omits
    the English full-name parenthetical, retain the existing translation.
    This is a later short reference after the full name has already been
    paired at default:20080, 23667 and 28098, consistent with the established
    policy of leaving subsequent given-name mentions unannotated. No CSV
    edit is warranted. This resolves only the personal-name residual and
    does not reopen the prior Chaos Critters or quest-text disposition.
  TEXT

  def apply
    R.ensure_unused_batch!(D)
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    index_path = M::INDEX
    glossary_table = M.table(glossary_path)
    glossary = glossary_table.map(&:to_h)
    entity = glossary.find { |row| row['entity_key'] == ENTITY }
    raise "missing existing entity #{ENTITY}" unless entity
    aliases = entity['english_aliases'].to_s.split('|').reject(&:empty?)
    raise "alias already registered: #{ALIAS}" if aliases.include?(ALIAS)
    aliases << ALIAS
    entity['english_aliases'] = aliases.join('|')
    variants = entity['korean_variants'].to_s.split('|').reject(&:empty?)
    variants << '미카엘라' unless variants.include?('미카엘라')
    entity['korean_variants'] = variants.join('|')
    evidence_ids = entity['evidence_ids'].to_s.split('|').reject(&:empty?)
    evidence_ids.concat(["D-#{D}", 'default:51941'])
    entity['evidence_ids'] = evidence_ids.uniq.join('|')
    entity['notes'] = [entity['notes'], EVIDENCE].reject(&:empty?).join(' ')

    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [entity]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_keys = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise "Michaela residual source coverage mismatch: #{generated_keys.inspect}" unless
      generated_keys.count { |key| key == [ENTITY, *TARGET] } == 1
    raise 'short-name alias unexpectedly hits a non-default resource' unless
      generated.all? { |row| row['resource'] == 'default' }

    source = inventory.fetch(TARGET)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    raise 'English possessive evidence missing' unless english.include?("Michaela's")
    raise 'Japanese name evidence missing' unless japanese.include?('ミカエラ')
    raise 'Chinese name evidence missing' unless chinese.include?('米凯拉')
    korean = source.fetch('work_text')
    raise 'Korean short form changed unexpectedly' unless
      korean.match?(/미카엘라(?:가|의|를|에게|는|와|도|에|만)/)

    index_table = M.table(index_path)
    index = index_table.map(&:to_h)
    key = [ENTITY, *TARGET]
    raise 'Michaela residual key already indexed' if
      index.any? { |row| [row.fetch('entity_key'), *M.key(row)] == key }
    candidate = generated.find do |row|
      [row.fetch('entity_key'), *M.key(row)] == key
    end
    raise 'unexpected existing/unknown residual disposition' unless
      candidate && candidate['status'] == 'needs-context'
    candidate['korean_current'] = korean
    index << candidate

    review_path = File.join(__dir__, "proper-name-short-reference-D#{D}.tsv")
    raise "review manifest already exists: #{review_path}" if File.exist?(review_path)
    review = {
      'resource' => TARGET[0], 'ID_Linha' => TARGET[1],
      'Tipo_Variante' => TARGET[2], 'entity_key' => ENTITY,
      'status' => 'not-an-issue', 'old' => korean, 'new' => korean,
      'evidence' => EVIDENCE, 'english' => english, 'japanese' => japanese,
      'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => 'not-an-issue')
    }

    M.write_table(glossary_path, glossary_table.headers, glossary)
    M.write_table(index_path, index_table.headers, index)
    M.write_table(review_path, M::HEADERS, [review])
    M.run(review_path, D, 1)

    detail = <<~TEXT.chomp
      ### D-#{D}: Michaela Short-Name Residual

      #{EVIDENCE}
      Added the direct short-name alias Michaela to the existing
      person:michaela-vogel entry and reviewed default:51941. Its English
      source, Japanese and Chinese identify the already established farmer;
      the Korean short form remains unchanged under the subsequent-given-name
      convention. No CSV edit or backup was needed.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
  end
end

ReviewMichaelaShortReferenceD21598.apply if $PROGRAM_NAME == __FILE__
