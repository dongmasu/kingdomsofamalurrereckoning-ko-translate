#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module PrepareMontainelD21811
  extend self

  M = ReviewedProperNameDiscovery::M
  D = 21_811
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  EXPECTED = {
    %w[base 2087 11] =>
      ['보관소 - 템플러 몬테이넬(Templar Montainel)',
       '보관소 - 템플러 몬테이넬(Templar Montainel)'],
    %w[base 3069 11] =>
      ['몬테이넬(Montainel)의 책상', '몬테이넬(Montainel)의 책상'],
    %w[base 4648 11] =>
      ['몬타이넬(Montainel)의 회계원 열쇠',
       '몬테이넬(Montainel)의 회계원 열쇠'],
    ['default', '11202', ''] =>
      ['몬테이넬(Montainel)', '몬테이넬(Montainel)'],
    ['default', '14087', ''] =>
      ['템플러 몽테넬(Montainel)', '템플러 몬테이넬(Montainel)'],
    ['default', '33182', ''] =>
      ['이 책상은 코던(Courdan) 부서의 책임자인 관리자 몬테이넬의 것이다.',
       '이 책상은 코던(Courdan) 부서의 책임자인 관리자 몬테이넬(Montainel)의 것이다.'],
    ['default', '33551', ''] =>
      ['템플러 몬타이넬이 설득술을 배우려는 학생이라면 누구든 가르쳐 준대.',
       '템플러 몬테이넬(Montainel)이 설득술을 배우려는 학생이라면 누구든 가르쳐 준대.'],
    ['default', '39845', ''] =>
      ['성전 기사 몬테이넬', '성전 기사 몬테이넬(Montainel)'],
    ['default', '41544', ''] =>
      ['관리관 몬테이넬의 책상', '관리관 몬테이넬(Montainel)의 책상']
  }.freeze
  ENTITY = 'person:montainel'
  NOTES = <<~TEXT.strip.freeze
    English identifies the same person as Montainel across the Templar and
    Administrator contexts, including the desk and bursar-key labels. The
    aligned Japanese renders the name as モンタイネル in localized contexts;
    Chinese uses 蒙泰纳尔. These support identity and pronunciation but do not
    override the English spelling. Use the already established Korean
    몬테이넬(Montainel) consistently. Pair only the personal name: Templar and
    Administrator remain localized rank/office descriptions. At base:2087,
    preserve the already complete compound label Templar Montainel rather
    than nesting a second English parenthetical. Prior default:11202 and
    default:14087 transliteration uncertainties are resolved by the combined
    cross-row evidence; this does not reopen unrelated sentence findings.
    No PAK-derived evidence.
  TEXT

  def definition
    {
      'entity_key' => ENTITY,
      'english_canonical' => 'Montainel',
      'category' => 'person',
      'korean_canonical' => '몬테이넬(Montainel)',
      'english_aliases' => '',
      'korean_variants' => '몬타이넬|몽테넬',
      'evidence_ids' => "D-#{D}|base:2087:11|base:3069:11|base:4648:11|" \
                        'default:11202|default:14087|default:33182|' \
                        'default:33551|default:39845|default:41544',
      'status' => 'confirmed',
      'notes' => NOTES
    }
  end

  def build_rows(inventory, index)
    expected_keys = EXPECTED.keys.to_set
    hits = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z])Montainel(?![A-Za-z])/i)
      end
    end
    actual_keys = hits.map { |source| M.key(source) }.to_set
    raise "Montainel source coverage differs: #{actual_keys.to_a.sort.inspect}" unless
      actual_keys == expected_keys && hits.length == EXPECTED.length
    raise 'Montainel already registered in glossary' if
      M.table(ReviewedProperNameDiscovery::GLOSSARY).any? do |row|
        row['entity_key'] == ENTITY
      end

    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    rows = EXPECTED.map do |key, (old_expected, new_text)|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      raise "stale Korean text at #{key.join(':')}" unless old == old_expected
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English Montainel evidence missing at #{key.join(':')}" unless
        english.match?(/(?<![A-Za-z])Montainel(?![A-Za-z])/i)
      raise "Japanese Montainel context missing at #{key.join(':')}" unless
        japanese.match?(/モンタイネル|Montainel/i)
      raise "Chinese Montainel context missing at #{key.join(':')}" unless
        chinese.match?(/蒙泰纳尔|莫泰奈尔|Montainel/i)
      raise "Montainel pair missing from proposed text at #{key.join(':')}" unless
        new_text.include?('몬테이넬(Montainel)') ||
          new_text.include?('(Templar Montainel)')
      raise "duplicate entity occurrence at #{key.join(':')}" if
        existing.include?([ENTITY, *key])

      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{NOTES} Exact source key: #{key.join(':')}.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    statuses = rows.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise "unexpected Montainel dispositions: #{statuses.inspect}" unless
      statuses == { 'accepted' => 6, 'not-an-issue' => 3 }

    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Montainel occurrence coverage differs' unless
      generated.map { |row| M.key(row) }.to_set == expected_keys &&
        generated.length == EXPECTED.length
    [definition, rows]
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    [DEFINITIONS, REVIEWS].each do |path|
      raise "preparation artifact already exists: #{path}" if File.exist?(path)
    end
    before_hashes = M.hashes
    protected = [M::INDEX, ReviewedProperNameDiscovery::GLOSSARY].to_h do |path|
      [path, Digest::SHA256.file(path).hexdigest]
    end
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    entity_definition, rows = build_rows(inventory, index)
    raise 'CSV changed during Montainel preparation' unless M.hashes == before_hashes
    raise 'index or glossary changed during Montainel preparation' unless
      protected.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash }
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [entity_definition])
    M.write_table(REVIEWS, REVIEW_HEADERS, rows)
    puts "Prepared D-#{D}: #{rows.length} Montainel keys; " \
         "#{rows.count { |row| row['status'] == 'accepted' }} Texto edits."
  end
end

PrepareMontainelD21811.prepare if $PROGRAM_NAME == __FILE__
