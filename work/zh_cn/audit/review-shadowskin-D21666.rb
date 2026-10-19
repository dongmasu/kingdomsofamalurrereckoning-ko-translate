#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'run-reviewed-discovery-specs'

module ShadowskinD21666
  extend self

  D = 21_666
  M = ReviewedNameBatches
  AUDIT = File.expand_path(__dir__)
  ROOT = File.expand_path('../../..', __dir__)

  PIECES = {
    ['base', '962', '11'] => {
      english: 'Shadowskin Boots',
      japanese: 'シャドウスキン・ブーツ',
      chinese: '暗影之皮靴子',
      korean: '그림자가죽 장화',
      revised: '섀도스킨 장화(Shadowskin Boots)'
    },
    ['base', '2107', '11'] => {
      english: 'Shadowskin Cowl',
      japanese: 'シャドウスキン・カウル',
      chinese: '暗影之皮斗篷',
      korean: '그림자가죽 두건',
      revised: '섀도스킨 두건(Shadowskin Cowl)'
    },
    ['base', '2335', '11'] => {
      english: 'Shadowskin Leggings',
      japanese: 'シャドウスキン・レギング',
      chinese: '暗影之皮护腿',
      korean: '그림자가죽 레깅스',
      revised: '섀도스킨 레깅스(Shadowskin Leggings)'
    },
    ['base', '3199', '11'] => {
      english: 'Shadowskin Vest',
      japanese: 'シャドウスキン・ベスト',
      chinese: '暗影之皮马甲',
      korean: '그림자가죽 조끼',
      revised: '섀도스킨 조끼(Shadowskin Vest)'
    },
    ['base', '3724', '11'] => {
      english: 'Shadowskin Gloves',
      japanese: 'シャドウスキン・グローブ',
      chinese: '暗影之皮手套',
      korean: '그림자가죽 장갑',
      revised: '섀도스킨 장갑(Shadowskin Gloves)'
    }
  }.freeze

  SET_ROWS = {
    ['default', '43728', ''] => {
      english: 'Shadowskin',
      japanese: 'シャドウスキン',
      chinese: '影肤',
      korean: '그림자 가죽',
      revised: '섀도스킨(Shadowskin)'
    },
    ['default', '54687', ''] => {
      english: 'Shadowskin is a Rogue armor set crafted from the Shroud of Omission, a magical cloth that can make anything placed beneath it be forgotten. It is jet-black and ragged in appearance, with an oily sheen on its surface. Similar to the powers of the Shroud, its wearer is placed out of the minds of the people around him.',
      japanese: 'シャドウスキンは、覆われたものを人々の記憶から消してしまう魔法の布"隠れ蓑"で作られたローグの防具セットだ。見た目は真っ黒でみすぼらしく、表面に微かな光沢がある。布の力と同様に、身に着けた者は周囲の者の意識から消えることになる。',
      chinese: '影肤是一套用遗忘尸布制作的侠盗护甲，这种魔法织物可以让人遗忘置于其下的任何东西。 它的色泽漆黑，外观破烂，表面泛着油光。和裹布的力量类似，它的穿戴者会被排斥在周围人的思绪之外。',
      korean: '섀도스킨(Shadowskin)은 망각의 장막(Shroud of Omission)으로 만든 도적 방어구 세트다. 수의 아래에 놓인 것은 무엇이든 사람들의 기억에서 지워 버리는 마법의 천이다. 표면에 기름기 어린 윤기가 도는, 칠흑처럼 검고 해진 천이다. 수의의 힘처럼, 착용자는 주변 사람들의 기억에서 사라진다.'
    }
  }.freeze

  SOURCE_ROWS = (PIECES.merge(SET_ROWS)).freeze
  PIECE_KEYS = PIECES.keys.freeze
  KEYS = SOURCE_ROWS.keys.freeze
  SET_ENTITY = 'item:shadowskin'
  SHROUD_ENTITY = 'unique_item:shroud-of-omission'

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:54687 explicitly identifies Shadowskin as a Rogue armor
    set; default:43728 is its standalone label. Reuse 섀도스킨(Shadowskin).
    The five exact base labels are separate named equipment items, each
    annotated as one complete bilingual label. Their component match to
    Shadowskin is excluded on those rows, not registered as an item alias.
    Japanese シャドウスキン and Chinese 影肤/暗影之皮 corroborate the name
    and compounds. Preserve the already paired set mention and full sentence
    at default:54687. D-16549's translation uncertainty was closed by
    D-20168; D-21433's accepted Shroud of Omission disposition at this row
    remains unchanged. This batch reviews only the new Shadowskin entity and
    does not reopen either prior disposition or recount historical totals.
  TEXT

  CONTEXT = <<~TEXT.strip.freeze
    Review the explicit Shadowskin armor-set label and five source-exact
    equipment titles across base/default; affix has no matching source row.
    Keep the Shadowskin set identity separate from the Shroud of Omission.
    English supplies the explicit armor-set classification; Japanese and
    Chinese corroborate the name and complete equipment labels. On each
    equipment row, exclude the set-name component match and register only
    the whole bilingual item title. Preserve the existing sentence and
    Shroud disposition at default:54687. D-16549 was closed as not an issue
    by D-20168; neither that translation decision nor D-21433's Shroud
    decision is reopened or recounted here. The official Korean manual
    extraction/reference has no direct Shadowskin entry.
  TEXT

  CHANGES = begin
    result = {}
    PIECES.each { |key, row| result[key] = [row.fetch(:korean), row.fetch(:revised)] }
    key = ['default', '43728', '']
    result[key] = [SET_ROWS.fetch(key).fetch(:korean), SET_ROWS.fetch(key).fetch(:revised)]
    result.freeze
  end

  SPECS = begin
    specs = [{
      key: SET_ENTITY, english: 'Shadowskin', category: 'item',
      korean: '섀도스킨(Shadowskin)', count: 7,
      notes: 'English default:54687 explicitly calls Shadowskin a Rogue armor set. The five equipment-title component matches are excluded as standalone set occurrences; they are handled as complete, separate bilingual item labels.'
    }]
    PIECES.each do |key, row|
      english = row.fetch(:english)
      slug = english.downcase.tr(' ', '-')
      specs << {
        key: "item:#{slug}", english: english, category: 'item',
        korean: row.fetch(:revised), count: 1,
        notes: "English base:#{key[1]} supplies the complete named armor-piece title; Japanese and Chinese corroborate the compound. Register the whole item label, not the component Shadowskin as an alias."
      }
    end
    specs.freeze
  end

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def source_csv_path(locale, resource)
    File.join(ROOT, 'src/csv', locale,
              "locatexts_#{locale}.koalocatext_#{resource}.csv")
  end

  def work_csv_path(resource)
    File.join(ROOT, 'work/zh_cn',
              "locatexts_zh_cn.koalocatext_#{resource}.csv")
  end

  def rows_for(path, resource)
    rows = CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
    rows.each_with_object({}) do |row, found|
      variant = resource == 'default' ? '' : row.fetch('Tipo_Variante').to_s
      key = [resource, row.fetch('ID_Linha'), variant]
      next unless SOURCE_ROWS.key?(key)
      raise "duplicate exact source key #{key.inspect} in #{path}" if found.key?(key)
      found[key] = row.fetch('Texto')
    end
  end

  def load_exact_source_rows
    result = {}
    %w[en_us ja_jp zh_cn].each do |locale|
      %w[affix base default].each do |resource|
        rows_for(source_csv_path(locale, resource), resource).each do |key, text|
          result[key] ||= {}
          raise "duplicate #{locale} source key #{key.inspect}" if result[key].key?(locale)
          result[key][locale] = text
        end
      end
    end
    %w[base default].each do |resource|
      rows_for(work_csv_path(resource), resource).each do |key, text|
        result[key] ||= {}
        raise "duplicate Korean source key #{key.inspect}" if result[key].key?('ko')
        result[key]['ko'] = text
      end
    end
    raise "source key coverage differs: #{result.keys.sort.inspect}" unless
      result.keys.sort == KEYS.sort
    SOURCE_ROWS.each do |key, expected|
      actual = result.fetch(key)
      expected.each do |field, text|
        next if field == :revised
        locale = { english: 'en_us', japanese: 'ja_jp', chinese: 'zh_cn', korean: 'ko' }.fetch(field)
        raise "source #{locale} text changed at #{key.inspect}" unless actual[locale] == text
      end
    end
    result
  end

  def verify_full_english_scope!
    matches = []
    %w[affix base default].each do |resource|
      path = source_csv_path('en_us', resource)
      CSV.foreach(path, headers: true, col_sep: ';', encoding: 'bom|utf-8') do |row|
        next unless row['Texto'].to_s.match?(/(?<![A-Za-z])Shadowskin(?![A-Za-z])/i)
        matches << [resource, row.fetch('ID_Linha'),
                    resource == 'default' ? '' : row.fetch('Tipo_Variante').to_s]
      end
    end
    raise "full English Shadowskin scope changed: #{matches.sort.inspect}" unless
      matches.sort == KEYS.sort
  end

  def verify_history!
    glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    raise 'Shadowskin already registered; review must be reconciled first' if
      glossary.any? { |row| row['entity_key'] == SET_ENTITY || row['entity_key'].to_s.start_with?('item:shadowskin-') }
    index = M.table(M::INDEX).map(&:to_h)
    candidate_keys = SPECS.map { |spec| "candidate:#{spec.fetch(:english).downcase}" }
    candidates = M.table(File.join(AUDIT, 'proper-name-candidates.tsv')).map(&:to_h)
    candidate_rows = candidates.select { |row| candidate_keys.include?(row['candidate_key']) }
    raise 'candidate history missing or already dispositioned' unless
      candidate_rows.length == candidate_keys.length &&
      candidate_rows.all? { |row| row['status'] == 'needs-context' }
    planned_entities = SPECS.map { |spec| spec.fetch(:key) }
    raise 'planned Shadowskin occurrences already exist' if
      index.any? { |row| planned_entities.include?(row['entity_key']) }
    shroud = index.find do |row|
      row['entity_key'] == SHROUD_ENTITY &&
        M.key(row) == ['default', '54687', '']
    end
    raise 'historical Shroud disposition missing or changed' unless
      shroud && shroud['status'] == 'accepted'
    register = File.read(File.join(AUDIT, 'decision-register-20261009.md'))
    raise 'D-16549 historical decision missing' unless
      register.include?('| D-16549 | `default` 54687 | Shadowskin / Shroud of Omission |')
    d20168 = File.read(File.join(AUDIT, 'named-scope-review-D20168-20261013.md'))
    raise 'D-20168 closure evidence missing' unless
      d20168.include?('| 54687 | Earlier uncertain D-16549; closed `not an issue` |')
    d21433 = M.table(File.join(AUDIT, 'proper-name-discovery-D21433.tsv')).map(&:to_h)
    shroud_review = d21433.find do |row|
      row['resource'] == 'default' && row['ID_Linha'] == '54687' &&
        row['entity_key'] == SHROUD_ENTITY
    end
    raise 'D-21433 Shroud record missing or changed' unless
      shroud_review && shroud_review['status'] == 'accepted'
  end

  def expected_occurrences(inventory)
    definitions = SPECS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => spec.fetch(:aliases, '')
      }
    end
    built = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    grouped = built.group_by { |row| row.fetch('entity_key') }
    expected = { SET_ENTITY => KEYS.length }
    PIECES.each_key do |key|
      spec = SPECS.find { |item| item[:english] == PIECES.fetch(key).fetch(:english) }
      expected[spec.fetch(:key)] = 1
    end
    actual = grouped.transform_values(&:length)
    raise "English entity coverage differs: #{actual.inspect}" unless actual == expected
    built
  end

  def transform(spec, key, text, source)
    if spec.fetch(:key) == SET_ENTITY && PIECE_KEYS.include?(key)
      expected = PIECES.fetch(key).fetch(:korean)
      raise "unexpected set-component text at #{key.inspect}" unless text == expected
      return [text, true]
    end

    if key == ['default', '54687', '']
      expected = SET_ROWS.fetch(key).fetch(:korean)
      raise 'default:54687 must remain byte-for-byte unchanged' unless text == expected
      raise 'set name missing from reviewed lore sentence' unless
        JSON.parse(source.fetch('en_texts_json')).join("\n").include?('Shadowskin is a Rogue armor set')
      return [text, false]
    end

    from, to = CHANGES.fetch(key)
    return [text, false] if text == to
    raise "reviewed source span differs at #{key.inspect}" unless text == from
    [to, false]
  end

  def plan(inventory)
    actual_keys = inventory.keys.sort
    raise "source scope differs: #{actual_keys.inspect}" unless actual_keys == KEYS.sort
    inventory.each do |key, source|
      expected = SOURCE_ROWS.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      raise "English source changed at #{key.inspect}" unless english == expected.fetch(:english)
      raise "Japanese source changed at #{key.inspect}" unless japanese == expected.fetch(:japanese)
      raise "Chinese source changed at #{key.inspect}" unless source.fetch('zh_text') == expected.fetch(:chinese)
      raise "Korean source changed at #{key.inspect}" unless source.fetch('work_text') == expected.fetch(:korean)
    end

    generated = expected_occurrences(inventory)
    grouped = generated.group_by { |row| M.key(row) }
    reviews = grouped.keys.sort_by { |key| [M::RESOURCES.index(key[0]), key[1].to_i, key[2]] }.map do |key|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      grouped.fetch(key).each do |occurrence|
        spec = SPECS.find { |item| item.fetch(:key) == occurrence.fetch('entity_key') }
        new_text, excluded = transform(spec, key, new_text, source)
        dispositions[spec.fetch(:key)] = excluded ? 'excluded' : nil
      end
      status = if dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               elsif old == new_text
                 'not-an-issue'
               else
                 'accepted'
               end
      dispositions.transform_values! { |value| value || status }
      {
        key: key, old: old, new: new_text, status: status,
        dispositions: dispositions
      }
    end
    raise 'expected seven distinct reviewed row keys' unless reviews.length == 7
    raise 'unexpected number of proposed cell edits' unless reviews.count { |row| row[:old] != row[:new] } == 6
    reviews
  end

  def actual_source_dry_run
    verify_full_english_scope!
    exact = load_exact_source_rows
    verify_history!
    inventory = exact.to_h do |key, locales|
      [
        key,
        {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'work_text' => locales.fetch('ko'),
          'en_texts_json' => JSON.generate([locales.fetch('en_us')]),
          'ja_texts_json' => JSON.generate([locales.fetch('ja_jp')]),
          'zh_text' => locales.fetch('zh_cn')
        }
      ]
    end
    plan(inventory)
  end

  def apply
    actual_source_dry_run
    ReviewedDiscoverySpecs.run(
      D, 'Shadowskin Armor Set And Complete Equipment Labels',
      SPECS, CONTEXT, '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      transform(spec, key, text, source)
    end
  end
end

ShadowskinD21666.apply if $PROGRAM_NAME == __FILE__
