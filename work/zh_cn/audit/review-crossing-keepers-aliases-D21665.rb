#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module CrossingKeepersAliasesD21665
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_665
  ENTITY = 'organization:crossing-keepers'
  ALIASES = ['Keepers of the Crossing', 'Crossing Keeper'].freeze
  TARGETS = {
    ['base', '3043', '11'] => [
      '크로싱(The Crossing)의 문지기', '교차점의 수호자(Crossing Keeper)'
    ],
    ['default', '2455', ''] => [
      '크로싱(The Crossing)의 수호자들', '교차점의 수호자들(Keepers of the Crossing)'
    ],
    ['default', '7379', ''] => [
      '교차로의 수호자들(Keepers of the Crossing)', '교차점의 수호자들(Keepers of the Crossing)'
    ],
    ['default', '30852', ''] => [
      '크로싱의 수호자', '교차점의 수호자들(Keepers of the Crossing)'
    ],
    ['default', '47572', ''] => [
      '크로싱의 수호자들', '교차점의 수호자들(Keepers of the Crossing)'
    ],
    ['default', '63854', ''] => [
      '건널목의 수호자들', '교차점의 수호자들(Keepers of the Crossing)'
    ]
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English 30852/63854 explicitly names Maxen and Halcyor as the Keepers
    of the Crossing. The same pair and duty are identified by the already
    registered Crossing Keepers at 52232 and the ancient order description
    at 54080. Japanese 力の交差点の番人/クロッシングの番人 and Chinese
    关口的守护者/交汇之地守护者 corroborate the same order/member title.
    Add Keepers of the Crossing and the singular Crossing Keeper as source
    aliases of the existing organization, not duplicate organizations or
    new people. Reuse its established Korean 교차점의 수호자들; preserve
    singular 수호자 in the base member label and each local English form.
    Replace only the complete organization/member span, preserving following
    predicates and all other text. The independent place remains 크로싱
    (The Crossing); do not nest that place label inside the order's title.
    Existing organization dispositions remain unchanged and are not recounted.
    D-19603's terminal sentence review at 2455 remains intact; this new
    entity/row annotation is not a new global translation disposition.
    D-9993/D-14507's historical classification questions are retained as
    provenance, not silently rewritten. The manual supplies Fae background
    only and no direct spelling. All affix/base/default matches are checked.
  TEXT

  def replacement(key, text)
    old, revised = TARGETS.fetch(key)
    return text if text.include?(revised)
    raise "organization span changed at #{key.inspect}" unless text.scan(old).length == 1
    text.sub(old, revised)
  end

  def apply
    R.ensure_unused_batch!(D)
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    owner = glossary.find { |row| row['entity_key'] == ENTITY }&.to_h
    raise 'organization owner missing or canonical changed' unless
      owner && owner['korean_canonical'] == '교차점의 수호자들(Crossing Keepers)'
    ALIASES.each do |term|
      raise "alias already owned: #{term}" if glossary.any? do |row|
        [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
          .any? { |old| old.casecmp?(term) }
      end
    end
    owner['english_aliases'] = [owner['english_aliases'], *ALIASES].reject(&:empty?).join('|')
    owner['evidence_ids'] = [owner['evidence_ids'], "D-#{D}"].join('|')
    owner['notes'] = [owner['notes'], NOTE].join("\n")
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    previous = index.select { |row| row['entity_key'] == ENTITY }
    raise 'existing organization has unreviewed rows' if previous.any? { |row| row['status'] == 'needs-context' }
    previous_keys = previous.map { |row| M.key(row) }
    fresh = generated.reject { |row| previous_keys.include?(M.key(row)) }
    raise 'unexpected alias source scope' unless fresh.map { |row| M.key(row) }.sort == TARGETS.keys.sort
    reviews = TARGETS.map do |key, _|
      source = inventory.fetch(key)
      en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      zh = source.fetch('zh_text')
      raise 'alias source evidence differs' unless ALIASES.any? { |term| en.include?(term) } &&
        ja.match?(/クロッシング|力の交差点/) && zh.match?(/关口|交汇之地/)
      old = source.fetch('work_text')
      revised = replacement(key, old)
      raise 'expected new annotation edit' if revised == old
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old, 'new' => revised,
        'evidence' => NOTE, 'english' => en, 'japanese' => ja, 'chinese' => zh,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    path = File.join(__dir__, "proper-name-source-alias-D#{D}.tsv")
    raise 'alias manifest already exists' if File.exist?(path)
    M.write_table(R::GLOSSARY, glossary.headers,
      glossary.map { |row| row['entity_key'] == ENTITY ? owner : row.to_h })
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + fresh)
    M.write_table(path, M::HEADERS, reviews)
    M.run(path, D, 1)
  end
end

CrossingKeepersAliasesD21665.apply if $PROGRAM_NAME == __FILE__
