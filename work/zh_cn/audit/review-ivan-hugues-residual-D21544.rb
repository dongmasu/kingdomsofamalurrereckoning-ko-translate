#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module IvanHuguesResidualD21544
  extend self

  M = ReviewedNameBatches
  D = 21_544
  ENTITY = 'person:hugues'
  PROPOSAL = File.join(__dir__, "proper-name-reviewed-ivan-hugues-D#{D}.tsv")
  ALL_IDS = %w[
    1234 1973 7350 8302 10387 14539 15917 32543 32642
    35405 40316 51937 53066 54475 57355 59697 63841 65093
  ].freeze
  PATCHES = {
    '35405' => ['아이반 휴그(Hugues)', '이반 휴그(Ivan Hugues)', 'accepted'],
    '59697' => ['아이반 휴그(Hugues)', '이반 휴그(Ivan Hugues)', 'accepted'],
    '63841' => ['이반의 시신', '이반(Ivan)의 시신', 'not-an-issue']
  }.freeze
  NOTE = 'Corrective existing-key name-span residual, not a new person identity or occurrence. English explicitly gives Ivan Hugues, corroborated by Japanese アイヴァン・ヒューズ and Chinese 伊凡·修格斯. The full-source scan finds 18 exact full-name rows already represented under person:hugues; do not register or recount them as a second Ivan entity. Correct only the two 아이반 휴그(Hugues) labels to the established 이반 휴그(Ivan Hugues), and pair the same-row short Ivan at default:63841. The short name is locally linked to the preceding full name, not a global Ivan alias. Keep Fomorous Hugues distinct, all other full-name and surname contexts unchanged, and preserve earlier status/evidence in the manifest. No historical translation tally is revised.'

  def source_inventory
    M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end.to_h { |row| [M.key(row), row] }
  end

  def validate_full_scope!(inventory, index)
    full = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        .match?(/(?<![A-Za-z])Ivan Hugues(?![A-Za-z])/i)
    end
    raise 'Ivan Hugues full-source scope differs' unless
      full.map { |row| M.key(row) }.sort == ALL_IDS.map { |id| ['default', id, ''] }.sort
    full.each do |source|
      raise 'existing full Ivan occurrence missing or duplicated' unless
        index.count { |row| row['entity_key'] == ENTITY && M.key(row) == M.key(source) } == 1
    end
  end

  def reviews(inventory, index)
    validate_full_scope!(inventory, index)
    PATCHES.map do |id, (from, to, previous_status)|
      key = ['default', id, '']
      source = inventory.fetch(key)
      prior = index.find { |row| row['entity_key'] == ENTITY && M.key(row) == key }
      raise "existing Ivan disposition changed #{id}" unless prior['status'] == previous_status
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Ivan identity evidence differs #{id}" unless
        english.include?('Ivan Hugues') && japanese.include?('アイヴァン・ヒューズ') &&
        chinese.include?('伊凡·修格斯')
      old = source.fetch('work_text')
      raise "Ivan reviewed span differs #{id}" unless old.scan(from).length == 1
      if id == '63841'
        raise 'Ivan short-name local link differs' unless
          english.include?("Ivan's body") && japanese.include?('アイヴァンの死体') &&
          chinese.include?('伊凡的尸体') && old.include?('이반 휴그(Ivan Hugues)')
      end
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => old.sub(from, to), 'evidence' => NOTE,
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'Ivan residual proposal already exists' if File.exist?(PROPOSAL)
    inventory = source_inventory
    index = M.table(M::INDEX).map(&:to_h)
    result = reviews(inventory, index)
    ReviewedProperNameDiscovery.validate_sources!(result, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), result)
    result
  end

  def apply
    result = prepare
    glossary_hash = Digest::SHA256.file(ReviewedProperNameDiscovery::GLOSSARY).hexdigest
    before = M.table(M::INDEX).map(&:to_h)
    previous = before.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    M.write_table(PROPOSAL, M::HEADERS, result)
    M.run(PROPOSAL, D, 1, review_states: %w[accepted not-an-issue])
    after = M.table(M::INDEX).map(&:to_h)
    raise 'Ivan residual added occurrences or changed glossary' unless before.length == after.length &&
      Digest::SHA256.file(ReviewedProperNameDiscovery::GLOSSARY).hexdigest == glossary_hash
    targeted = PATCHES.keys.map { |id| [ENTITY, 'default', id, ''] }
    after.each do |row|
      key = [row.fetch('entity_key'), *M.key(row)]
      next if targeted.include?(key)
      raise "unrelated Ivan residual decision changed #{key.inspect}" unless
        row.reject { |field, _| field == 'korean_current' } == previous.fetch(key)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then IvanHuguesResidualD21544.prepare
  when ['apply'] then IvanHuguesResidualD21544.apply
  else abort 'usage: review-ivan-hugues-residual-D21544.rb [prepare|apply]'
  end
end
