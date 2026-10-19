#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'run-reviewed-discovery-specs'

module AsterStrongboxD21678
  extend self

  D = 21_678
  ROOT = File.expand_path('../../..', __dir__)
  AUDIT = __dir__
  CANONICAL = '애스터 금고(Aster Strongbox)'

  TARGETS = {
    ['base', '4419', '11'] => {
      'en_us' => 'Aster Strongbox',
      'ja_jp' => 'アスターの金庫',
      'zh_cn' => '阿斯特尔保险箱',
      'ko' => '애스터(Aster)의 금고',
      action: 'Pair only the standalone named strongbox label.'
    },
    ['default', '13184', ''] => {
      'en_us' => 'Aster Strongbox',
      'ja_jp' => 'アスターの金庫',
      'zh_cn' => '阿斯特尔保险箱',
      'ko' => '애스터 금고(Aster Strongbox)',
      action: 'Retain the existing complete bilingual name.'
    },
    ['default', '19925', ''] => {
      'en_us' => 'A map that will lead me to the five Aster Strongboxes.',
      'ja_jp' => '5つあるというアスターの金庫の位置を指し示す地図。',
      'zh_cn' => '一张能让我找到五个阿斯特尔保险箱的地图。',
      'ko' => '아스터의 금고 다섯 곳으로 안내하는 지도.',
      action: 'Pair only the item span; retain D19725 terminal not-an-issue verbatim; do not recount.'
    },
    ['default', '29348', ''] => {
      'en_us' => 'The amulets hum with ancient magic in your hand. In a moment, they are gone, replaced with a key around which is wrapped a small paper ‒ a map of Tala-Rane. This map may be used to find the locations of the Aster Strongboxes.',
      'ja_jp' => 'アミュレットは古代の魔力を帯びて手の中で低い音を発していたが、瞬時に消え去り、代わりに小さな紙片が巻きつけられた鍵が現れた。紙片はタラ＝レインの地図のようだ。この地図を使えばアスターの金庫の位置を特定できるかもしれない。',
      'zh_cn' => '护符在你手中低语着古老的魔法。不一会儿，他们就不见了，取而代之的是一把钥匙，钥匙周围包着一张小纸片——一张塔拉莱恩的地图。这张地图可以用来找到阿斯特尔保险箱的位置。',
      'ko' => '손안에서 부적들이 고대 마법의 힘으로 웅웅 울렸다. 순간 부적은 사라지고, 작은 종이가 감긴 열쇠가 나타났다. 종이는 탈라레인(Tala-Rane)의 지도였다. 이 지도로 아스터 가문의 보물 상자 위치를 찾을 수 있을지도 모른다.',
      action: 'Pair only the item span; keep D9213 terminal not-an-issue and separate D9225 uncertainty verbatim.'
    },
    ['default', '46517', ''] => {
      'en_us' => "I have created the key needed to claim the Aster inheritance, and I've also found a map that indicates where the Aster strongboxes are located within Tala-Rane. If I consult the map, then I should be able to find the strongboxes.",
      'ja_jp' => 'アスターの遺産を手に入れるために必要な鍵を作製し、タラ＝レインのどこにアスターの金庫があるかが記された地図も見つけた。地図を使えば金庫を見つけられるはずだ。',
      'zh_cn' => '我打造出了获得阿斯特尔遗产所需的钥匙，并找到了一张标注了塔拉莱恩内阿斯特尔保险箱位置的地图。跟着地图前进，应该就能找到保险箱。',
      'ko' => '아스터 가문의 유산을 손에 넣는 데 필요한 열쇠를 만들었고, 탈라레인(Tala-Rane)에 있는 아스터 가문의 금고 위치가 표시된 지도도 찾았다. 지도를 살펴보면 금고를 찾을 수 있을 것이다.',
      action: 'Pair only the item span; D20764 remains Tala-Rane-only and does not decide Aster ownership.'
    },
    ['default', '50130', ''] => {
      'en_us' => 'I have reconstructed the Aster Key, and used it to uncover all of the Aster strongboxes in Tala-Rane.',
      'ja_jp' => '再製したアスターの鍵を使い、タラ＝レインにある全てのアスターの金庫を開けた。',
      'zh_cn' => '我重铸了阿斯特尔的钥匙，并使用它开启了塔拉莱恩内的所有阿斯特尔保险箱。',
      'ko' => '아스터 열쇠를 복원해 탈라레인(Tala-Rane)에 있는 아스터 가문의 보관함을 전부 찾아냈다.',
      action: 'Annotate only the source-bounded item span; retain D15238 and D20077 verbatim and unresolved; do not change uncover or Aster Key.'
    }
  }.freeze

  KEYS = TARGETS.keys.sort.freeze
  ENGLISH_SCOPE = /\bAster Strongbox(?:es)?\b/i
  SPANS = {
    ['base', '4419', '11'] => ['애스터(Aster)의 금고', CANONICAL],
    ['default', '19925', ''] => ['아스터의 금고', '애스터 금고(Aster Strongboxes)'],
    ['default', '29348', ''] => ['아스터 가문의 보물 상자', '애스터 금고(Aster Strongboxes)'],
    ['default', '46517', ''] => ['아스터 가문의 금고', '애스터 금고(Aster strongboxes)'],
    ['default', '50130', ''] => ['아스터 가문의 보관함을', '애스터 금고(Aster strongboxes)를']
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Register item:aster-strongbox as the named strongbox item label
    애스터 금고(Aster Strongbox), supported by standalone English base:4419 and
    default:13184, Japanese アスターの金庫 and Chinese 阿斯特尔保险箱.
    Reuse the existing 애스터 spelling; no family, group, or personal ownership
    is established or claimed. Only the exact strongbox name spans at
    base:4419 and default:19925/29348/46517/50130 are annotated, retaining each
    English source's singular/plural and capitalization. Default:13184
    already has the complete bilingual label and remains unchanged.
    Aster Key is separate, not an alias; its reference at default:50130
    remains unchanged. D-19725, D-9213, D-9225, D-15238, D-20077, and D-20764
    remain verbatim and are not reopened, superseded, or recounted.
    In particular D-9225 and D-15238 remain unresolved; default:50130
    receives only a source-bounded name annotation, not a sentence judgment.
    Its uncover interpretation and all text outside that name remain
    unchanged except for the single necessary object-particle adjustment
    을→를 attached to the replacement item label. D-20764 remains a
    Tala-Rane-only decision.
    All six exact English source keys across affix/base/default are checked.
    No historical global tally is changed; full discovery remains incomplete.
  TEXT
  HISTORICAL_REGISTER_ROWS = [
    '| D-9213 | `default` 29348 | Amulets / key / map / Aster Strongboxes | unchanged | not an issue | Transformation sequence, map identity, and strongbox-finding purpose are retained. |',
    '| D-9225 | `default` named terms in IDs 29301-29350 | Acolyte / Helyc / Engard / Anokatos / Widow / Canneroc / Tyrenium / Kandrian Keep / Kahrunk / Culminite / Faer Gorta / Kobold / Niskaru / Telogrus / Preordained / Gnarsh / Prismere / Alabastra / Emaire / Scion / Akara / Fateweaver / Lyria / Prismere Orb / Aster Strongboxes / Master Healing Potion | unchanged | uncertain | Defer canonical spelling, faction, creature, rank, item, and lore terms to integrated review; IDs 29326/29330 are dispositioned separately. |',
    '| D-15238 | `default` 50130 | Aster Key / Aster strongboxes / Tala-Rane | Keep current translation. | uncertain | Reconstruction and discovery of every strongbox are retained; whether Aster marks a family/group or another category is not established. |',
    '| D-19725 supersedes open findings in `uncertain-100-D6227-D6308-20261012.jsonl` | `default`; 100 exact English/Japanese/Chinese/Korean keys | accepted (19939, 19942, 19969, 20007, 20018, 20115, 20130, 20194); the other 92 `not an issue` | Apply official-manual Scholia Arcana/Travelers terms and accepted Hyperian, Gallows End, Delvers, Emaire, Kollossae and Belen forms; see the report for exact rows. |'
  ].freeze
  D20077_ROW =
    '| 50130 | Retain D-15238: `Aster strongboxes` does not establish whether Aster denotes a family, organization or owner; active `가문의` is interpretive. Japanese/Chinese read the boxes as opened, English `uncover` does not unequivocally require opening. No safe replacement of the full sentence. |'

  def specs
    [{
      key: 'item:aster-strongbox',
      english: 'Aster Strongbox',
      aliases: 'Aster Strongboxes',
      category: 'item',
      korean: CANONICAL,
      variants: SPANS.values.map(&:first).uniq.join('|'),
      count: KEYS.length,
      notes: NOTE
    }]
  end

  def transform(spec, key, text, source)
    raise 'wrong Aster Strongbox entity' unless spec.fetch(:key) == 'item:aster-strongbox'
    expected = TARGETS.fetch(key) { raise "unreviewed strongbox key: #{key.inspect}" }
    actual = {
      'en_us' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      'ja_jp' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
      'zh_cn' => source.fetch('zh_text'),
      'ko' => text
    }
    actual.each do |locale, value|
      raise "#{locale} text drift at #{key.inspect}" unless value == expected.fetch(locale)
    end
    span = SPANS[key]
    return [text, false] unless span

    old_span, new_span = span
    raise "item span count differs at #{key.inspect}" unless text.scan(old_span).length == 1
    english_span = actual.fetch('en_us').scan(ENGLISH_SCOPE)
    annotated_label = key == ['default', '50130', ''] ? new_span.delete_suffix('를') : new_span
    raise "English item span differs at #{key.inspect}" unless
      english_span.length == 1 && annotated_label.end_with?("(#{english_span.first})")
    if key == ['default', '50130', '']
      raise 'default:50130 particle adjustment differs' unless
        old_span.end_with?('을') && new_span.end_with?('를')
    end
    [text.sub(old_span, new_span), false]
  end

  def source_path(locale, resource)
    File.join(ROOT, 'src/csv', locale,
              "locatexts_#{locale}.koalocatext_#{resource}.csv")
  end

  def work_path(resource)
    File.join(ROOT, 'work/zh_cn',
              "locatexts_zh_cn.koalocatext_#{resource}.csv")
  end

  def row_key(row, resource)
    variant = resource == 'default' ? '' : row.fetch('Tipo_Variante').to_s
    [resource, row.fetch('ID_Linha'), variant]
  end

  def selected_rows(path, resource, wanted_keys)
    found = {}
    CSV.foreach(path, headers: true, col_sep: ';', encoding: 'bom|utf-8') do |row|
      key = row_key(row, resource)
      next unless wanted_keys.include?(key)
      raise "duplicate exact key #{key.inspect} in #{path}" if found.key?(key)
      found[key] = row.fetch('Texto')
    end
    found
  end

  def load_exact_rows
    result = KEYS.to_h { |key| [key, {}] }
    %w[en_us ja_jp zh_cn].each do |locale|
      %w[affix base default].each do |resource|
        selected_rows(source_path(locale, resource), resource, result.keys).each do |key, text|
          result.fetch(key)[locale] = text
        end
      end
    end
    %w[base default].each do |resource|
      selected_rows(work_path(resource), resource, result.keys).each do |key, text|
        result.fetch(key)['ko'] = text
      end
    end
    result
  end

  def exact_english_scope
    matches = []
    %w[affix base default].each do |resource|
      CSV.foreach(source_path('en_us', resource), headers: true, col_sep: ';',
                  encoding: 'bom|utf-8') do |row|
        next unless row.fetch('Texto').to_s.match?(ENGLISH_SCOPE)
        matches << row_key(row, resource)
      end
    end
    matches.sort
  end

  def read_tsv(path)
    CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8').map(&:to_h)
  end

  def verify_history!
    register = File.read(File.join(AUDIT, 'decision-register-20261009.md'))
    HISTORICAL_REGISTER_ROWS.each do |row|
      raise "historical register judgment changed: #{row}" unless register.lines.map(&:chomp).include?(row)
    end
    raise 'D-6229 history for default:19925 missing' unless
      register.include?('| D-6229 | `default` 19925-19926, 19930-19931, 19939, 19942, 19947 |')
    raise 'D-9213 terminal decision missing' unless
      register.include?('| D-9213 | `default` 29348 | Amulets / key / map / Aster Strongboxes | unchanged | not an issue |')
    raise 'D-9225 named-term hold missing' unless
      register.include?('| D-9225 | `default` named terms in IDs 29301-29350 |') &&
      register.include?('Aster Strongboxes / Master Healing Potion | unchanged | uncertain |')
    raise 'D-15238 hold missing or changed' unless
      register.include?('| D-15238 | `default` 50130 | Aster Key / Aster strongboxes / Tala-Rane | Keep current translation. | uncertain |')

    d19725 = File.read(
      File.join(AUDIT, 'consolidated-context-review-default-uncertain-100-D19725-20261012.md')
    )
    raise 'D-19725 default:19925 terminal disposition missing' unless
      d19725.include?('19919-19922, 19925-19926') &&
      d19725.include?('The other 92 exact IDs are `not an issue`')

    d20077 = File.read(File.join(AUDIT, 'named-scope-review-D20077-20261013.md'))
    raise 'D-20077 no longer preserves default:50130 hold' unless
      d20077.lines.map(&:chomp).include?(D20077_ROW)

    d20764 = read_tsv(File.join(AUDIT, 'proper-name-edits-D20764.tsv'))
    %w[46517 50130].each do |id|
      row = d20764.find do |entry|
        entry['resource'] == 'default' && entry['ID_Linha'] == id &&
          entry['entity_key'] == 'place:tala-rane'
      end
      raise "D-20764 Tala-Rane-only history missing at default:#{id}" unless
        row && row['status'] == 'accepted' &&
        row['new'] == TARGETS.fetch(['default', id, '']).fetch('ko') &&
        row['old'].sub('타라레인', '탈라레인(Tala-Rane)') == row['new']
    end

    glossary = read_tsv(File.join(AUDIT, 'proper-name-glossary.tsv'))
    strongbox_owner = glossary.find do |row|
      row['english_canonical'].to_s.casecmp('Aster Strongbox').zero? ||
        row['english_canonical'].to_s.casecmp('Aster Strongboxes').zero? ||
        row['entity_key'] == 'item:aster-strongbox'
    end
    raise 'Aster Strongbox already registered; reconcile before review' if strongbox_owner
    heric = glossary.find { |row| row['entity_key'] == 'person:heric-aster' }
    enton = glossary.find { |row| row['entity_key'] == 'person:enton-aster' }
    raise 'existing Aster person entries changed' unless
      heric && heric['korean_canonical'] == '헤릭 애스터(Heric Aster)' &&
      enton && enton['korean_canonical'] == '엔턴 애스터(Enton Aster)'

    candidates = read_tsv(File.join(AUDIT, 'proper-name-candidates.tsv'))
    expected_candidates = {
      'candidate:aster strongbox' =>
        'base:4419:11|default:13184',
      'candidate:aster strongboxes' =>
        'default:19925|default:29348'
    }
    expected_candidates.each do |candidate_key, source_keys|
      row = candidates.find { |item| item['candidate_key'] == candidate_key }
      raise "#{candidate_key} candidate history changed" unless
        row && row['status'] == 'needs-context' &&
        row['source_context_keys'] == source_keys
    end

    short_labels = read_tsv(
      File.join(AUDIT, 'proper-name-short-label-discovery-20261018.tsv')
    )
    short = short_labels.find { |row| row['english_candidate'] == 'Aster Strongbox' }
    raise 'Aster Strongbox short-label state changed' unless
      short && short['status'] == 'candidate-not-reviewed'

    raise 'D-21678 register entry already exists' if register.include?('## D-21678')
    true
  end

  def validate_exact_rows!(inventory)
    raise "exact row inventory differs: #{inventory.keys.sort.inspect}" unless
      inventory.keys.sort == KEYS
    inventory.each do |key, actual|
      raise "locale coverage differs at #{key.inspect}" unless
        actual.keys.sort == %w[en_us ja_jp ko zh_cn]
      TARGETS.fetch(key).each do |locale, expected|
        next if locale == :action
        raise "#{locale} source text drift at #{key.inspect}" unless actual[locale] == expected
      end
    end
    true
  end

  def review_rows(inventory)
    validate_exact_rows!(inventory)
    TARGETS.map do |key, expected|
      source = {
        'en_texts_json' => JSON.generate([inventory.fetch(key).fetch('en_us')]),
        'ja_texts_json' => JSON.generate([inventory.fetch(key).fetch('ja_jp')]),
        'zh_text' => inventory.fetch(key).fetch('zh_cn')
      }
      proposed, = transform(specs.first, key, inventory.fetch(key).fetch('ko'), source)
      {
        key: key,
        english: expected.fetch('en_us'),
        japanese: expected.fetch('ja_jp'),
        chinese: expected.fetch('zh_cn'),
        current_korean: expected.fetch('ko'),
        recommended_korean: proposed,
        canonical: CANONICAL,
        action: expected.fetch(:action)
      }
    end
  end

  def actual_source_dry_run
    scope = exact_english_scope
    raise "full English Aster Strongbox scope changed: #{scope.inspect}" unless
      scope == KEYS
    rows = review_rows(load_exact_rows)
    verify_history!
    rows
  end

  def apply
    # Preflight is read-only; the shared runner below is the sole write path.
    actual_source_dry_run
    ReviewedDiscoverySpecs.run(
      D, 'Aster Strongbox Named Item', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }
  end
end

AsterStrongboxD21678.apply if $PROGRAM_NAME == __FILE__
