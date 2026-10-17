#!/usr/bin/env ruby

require_relative 'review-well-of-souls-D21510'

module ChaosNodeD21517
  extend self

  M = ReviewedNameBatches
  D = 21_517
  ENTITY = 'lore_term:chaos-node'
  ENGLISH = 'Chaos Node'
  CANONICAL = '혼돈 노드(Chaos Node)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  IDS = %w[9188 11414 12596 13688 13857 20075 22424 29421 52798 55107 56572 57186 63443].freeze
  PLURAL_IDS = %w[11414 13857 57186].freeze
  OPAQUE_PLURAL_KEYS = [
    ['default', '56572', ''], ['default', '63443', '']
  ].map(&:freeze).freeze
  SOURCE_NAMES = {
    '9188' => ['Chaos Node', 1],
    '11414' => ['Chaos Nodes', 1],
    '12596' => ['Chaos Node', 2],
    '13688' => ['Chaos Node', 1],
    '13857' => ['Chaos Nodes', 1],
    '20075' => ['Chaos Node', 1],
    '22424' => ['Chaos Node', 1],
    '29421' => ['Chaos Node', 1],
    '52798' => ['Chaos Node', 1],
    '55107' => ['Chaos Node', 1],
    '56572' => ['Chaos Nodes', 1],
    '57186' => ['Chaos Nodes', 1],
    '63443' => ['Chaos Nodes', 1]
  }.freeze
  # ID => [[old Korean span, source-local bilingual span, count], ...]
  SPANS = {
    '9188' => [['혼돈의 결절에서', '혼돈 노드(Chaos Node)에서', 1]],
    '11414' => [['혼돈 노드를 파괴하고 그 정수를', '혼돈 노드(Chaos Nodes)를 파괴하고 그 정수를', 1]],
    '12596' => [
      ['혼돈 노드는 해당 던전을 안정화합니다.', '혼돈 노드(Chaos Node)는 해당 던전을 안정화합니다.', 1],
      ['노드를 파괴하면 운명 없는 자에게', '노드(Nodes)를 파괴하면 운명 없는 자에게', 1],
      ['노드를 파괴하면 던전이 붕괴되어', '노드(Chaos Node)를 파괴하면 던전이 붕괴되어', 1],
      ['노드를 파괴하기 전에', '노드(Node)를 파괴하기 전에', 1]
    ],
    '13688' => [['혼돈 노드 파괴', '혼돈 노드(Chaos Node) 파괴', 1]],
    '13857' => [['혼돈 노드를 파괴하면 얻을', '혼돈 노드(Chaos Nodes)를 파괴하면 얻을', 1]],
    '20075' => [['혼돈의 결절을 공격하다', '혼돈 노드(Chaos Node)를 공격하다', 1]],
    '22424' => [['혼돈 노드에서 직접 얻은', '혼돈 노드(Chaos Node)에서 직접 얻은', 1]],
    '29421' => [['혼돈의 결절을 파괴하고', '혼돈 노드(Chaos Node)를 파괴하고', 1]],
    '52798' => [['혼돈 노드', CANONICAL, 1]],
    '55107' => [[CANONICAL, CANONICAL, 1]],
    '56572' => [['{*1혼돈 노드}', '{*1혼돈 노드}(Chaos Nodes)', 1]],
    '57186' => [['혼돈 노드를 파괴하면 혼돈 물질', '혼돈 노드(Chaos Nodes)를 파괴하면 혼돈 물질', 1]],
    '63443' => [['{*1혼돈 노드}', '{*1혼돈 노드}(Chaos Nodes)', 1]]
  }.transform_values { |rows| rows.map(&:freeze).freeze }.freeze
  NOTE = 'English default:12596 explains that a Chaos Node stabilizes each Chaos Realm dungeon and that destroying it collapses the dungeon; default:11414/13857/57186 and opaque labels at default:56572/63443 identify Chaos Nodes. Japanese 混沌のノード corroborates; Chinese 混乱节点 supports the prose rows and default:56572, while default:63443 retains English Chaos Nodes in its token. Register lore_term:chaos-node as 혼돈 노드(Chaos Node), with the grammatical English plural alias Chaos Nodes for matching but no bare Node alias. Render plural Korean labels source-locally as 혼돈 노드(Chaos Nodes), placing annotations after unchanged Korean tokens. At default:12596, pair both full singular mentions, the two explicit English short forms Nodes/Node, and the existing Korean noun 노드 that expands English destroying it. That pronominal expansion is linked locally, not counted as an additional English full-name mention; do not generalize Node. Normalize 혼돈의 결절 at default:9188/20075/29421, using 를 after 노드 at 20075/29421. Preserve Chaos Realm and every unrelated phrase, particle, token, line break and prior entity disposition. No source, PAK or historical tally changes.'
  DETAIL = <<~TEXT.chomp
    ### D-21517: Chaos Node

    Registered `lore_term:chaos-node` as `혼돈 노드(Chaos Node)`.
    Reviewed 13 exact default keys containing 14 full-name mentions;
    annotated 12 cells and retained the existing bilingual default:55107.
    Plural forms use source-local `혼돈 노드(Chaos Nodes)`. At
    default:12596 both full names, two English short forms and the existing
    Korean noun expanding English `destroying it` are paired locally;
    the latter is not an extra English name mention. At default:56572/63443 the Korean UI tokens
    remain byte-identical and receive English labels outside the tokens.
    `Chaos Realm` is unchanged.
  TEXT

  def expected_pairs
    IDS.map { |id| [ENTITY, 'default', id, ''] }
  end

  def definition(headers)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => ENGLISH,
      'category' => 'lore term', 'korean_canonical' => CANONICAL,
      'english_aliases' => 'Chaos Nodes', 'korean_variants' => '혼돈 노드|혼돈의 결절',
      'evidence_ids' => "D-#{D}|default:11414|default:12596|default:55107|default:56572|default:63443",
      'status' => 'confirmed', 'notes' => NOTE
    }
    headers.to_h { |header| [header, fields.fetch(header, '')] }
  end

  def source_occurrences(inventory, definition)
    raise 'Chaos Node plural alias differs' unless
      definition.fetch('english_canonical') == ENGLISH &&
      definition.fetch('english_aliases') == 'Chaos Nodes'

    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise 'Chaos Node exact source scope differs' unless actual == expected_pairs.sort
    raise 'Chaos Node batch exceeds fifty rows' if generated.length > 50
    generated
  end

  def normalize(text, key)
    raise "unreviewed Chaos Node key #{key.inspect}" unless expected_pairs.include?([ENTITY, *key])

    id = key.fetch(1)
    proposed = text.dup
    SPANS.fetch(id).each do |old_span, new_span, count|
      old_pattern = if old_span == '혼돈 노드'
                      /(?<![가-힣A-Za-z])혼돈 노드(?!\s*\()/
                    elsif OPAQUE_PLURAL_KEYS.include?(key)
                      Regexp.new("#{Regexp.escape(old_span)}(?!\\()")
                    else
                      Regexp.new(Regexp.escape(old_span))
                    end
      old_count = proposed.scan(old_pattern).length
      new_count = proposed.scan(Regexp.new(Regexp.escape(new_span))).length
      if old_span == new_span
        raise "Chaos Node Korean span count differs #{key.inspect}" unless new_count == count
      elsif new_count == count && old_span != new_span &&
          new_span.start_with?(old_span) && old_count == count
        next
      elsif old_count == count && new_count.zero?
        proposed = proposed.gsub(old_pattern, new_span)
      elsif old_count.zero? && new_count == count
        next
      else
        raise "Chaos Node Korean span count differs #{key.inspect}"
      end
    end

    if OPAQUE_PLURAL_KEYS.include?(key)
      raise 'Chaos Node opaque label differs' unless
        proposed.scan(SPANS.fetch(id).first[1]).length == 1
    else
      expected_labels = SOURCE_NAMES.fetch(id).last
      unless proposed.scan(/혼돈 노드\(Chaos Nodes?\)/).length == expected_labels
        raise "Chaos Node bilingual mention count differs #{key.inspect}"
      end
    end
    raise 'Chaos Node normalization changed opaque tokens or line breaks' unless
      text.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        proposed.scan(ReviewedProperNameDiscovery::OPAQUE) &&
      text.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
    proposed
  end

  def review_source(source)
    key = M.key(source)
    id = key.fetch(1)
    expected_english, expected_count = SOURCE_NAMES.fetch(id)
    english_parts = JSON.parse(source.fetch('en_texts_json')).compact
    raise "Chaos Node English row count differs #{key.inspect}" unless english_parts.one?

    english = english_parts.first
    english_pattern = Regexp.new(
      "(?<![A-Za-z])#{Regexp.escape(expected_english)}(?![A-Za-z])",
      Regexp::IGNORECASE
    )
    raise "Chaos Node English source differs #{key.inspect}" unless
      english.scan(english_pattern).length == expected_count

    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    ja_count = japanese.scan('混沌のノード').length
    zh_term = key == ['default', '63443', ''] ? 'Chaos Nodes' : '混乱节点'
    zh_count = chinese.scan(zh_term).length
    raise "Chaos Node Japanese source differs #{key.inspect}" unless ja_count == expected_count
    raise "Chaos Node Chinese source differs #{key.inspect}" unless zh_count == expected_count

    old = source.fetch('work_text')
    new_text = normalize(old, key)
    status = old == new_text ? 'not-an-issue' : 'accepted'
    {
      'resource' => key.fetch(0), 'ID_Linha' => id, 'Tipo_Variante' => key.fetch(2),
      'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
      'evidence' => NOTE, 'english' => english, 'japanese' => japanese,
      'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => status)
    }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definition = definition(glossary.headers)
    inventory = WellOfSoulsD21510.load_inventory
    generated = source_occurrences(inventory, definition)
    reviews = generated.sort_by { |row| row.fetch('ID_Linha').to_i }
      .map { |row| review_source(inventory.fetch(M.key(row))) }
    raise 'Chaos Node expected twelve changed cells' unless
      reviews.count { |row| row.fetch('old') != row.fetch('new') } == 12
    raise 'Chaos Node unchanged key differs' unless
      reviews.select { |row| row.fetch('old') == row.fetch('new') }
        .map { |row| M.key(row) } == [['default', '55107', '']]
    ReviewedProperNameDiscovery.validate!(
      [definition], reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} keys; 14 full-name mentions; 12 edits; prepare mode, no writes."
    [glossary.headers, [definition], reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |key, _| key == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |key, _| key == 'korean_current' }]
    end
    previous.each do |key, value|
      raise "prior occurrence changed #{key.inspect}" unless current[key] == value
    end
    raise 'Chaos Node additions differ' unless
      (current.keys - previous.keys).sort == expected_pairs.sort
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ChaosNodeD21517.prepare
  when ['apply'] then ChaosNodeD21517.apply
  else abort 'usage: review-chaos-node-D21517.rb [prepare|apply]'
  end
end
