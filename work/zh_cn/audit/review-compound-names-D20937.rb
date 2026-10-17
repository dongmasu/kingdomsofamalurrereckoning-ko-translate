#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module CompoundNamesD20937
  extend self

  M = ReviewedNameBatches
  DEFINITION_SPECS = [
    {
      'entity_key' => 'unique_item:belnes-staff-of-ire',
      'english_canonical' => "Belne's Staff of Ire",
      'category' => 'unique item',
      'korean_canonical' => "벨른의 분노 지팡이(Belne's Staff of Ire)",
      'english_aliases' => '',
      'korean_variants' => '벨른(Belne)의 분노의 지팡이|벨른의 분노 지팡이',
      'evidence_ids' => 'D-20937|base:109:11|default:9396',
      'status' => 'confirmed',
      'notes' => "EN primary names the exact unique staff. Base 109:11 JA ベルンの憤怒の杖 and both Chinese 贝尔尼的愤怒法杖 corroborate; default 9396 JA 強力な杖 is only a generic 'powerful staff' label, while EN and ZH identify the same item. Reuse the complete Korean-English title already present at default:9396. Official Korean manual PDF p.7 provides only generic equipment context (Staves = 지팡이), not this item's name or spelling. Keep prior person:belne exclusions unchanged; no PAK-derived evidence."
    },
    {
      'entity_key' => 'place:livrarium-vaults',
      'english_canonical' => 'Livrarium Vaults',
      'category' => 'place',
      'korean_canonical' => '리브라리움 금고(Livrarium Vaults)',
      'english_aliases' => '',
      'korean_variants' => '리브라리움(Livrarium) 금고',
      'evidence_ids' => 'D-20937|base:3154:11',
      'status' => 'confirmed',
      'notes' => 'EN primary names the complete Livrarium Vaults compound. JA 図書院の宝物庫 and ZH 图书馆金库 are descriptive localizations of the library vault, not a competing Korean spelling. Keep this exact compound distinct from parent place:livrarium. Official Korean manual PDF p.7 is setting/institution background only and does not establish this compound spelling. Preserve the prior place:livrarium exclusion; no PAK-derived evidence.'
    },
    {
      'entity_key' => 'place:adessa-livrarium',
      'english_canonical' => 'Adessa Livrarium',
      'category' => 'place',
      'korean_canonical' => '아데사 리브라리움(Adessa Livrarium)',
      'english_aliases' => '',
      'korean_variants' => '아데사 도서관(Adessa Livrarium)|아데사(Adessa)의 리브라리움|아데사 기록관(Adessa Livrarium)',
      'evidence_ids' => 'D-20937|default:28432|default:42535|default:50551|default:53552',
      'status' => 'confirmed',
      'notes' => 'EN primary repeatedly identifies the complete Adessa Livrarium compound. JA アデッサ図書院 / アデッサの図書院 and ZH 阿德萨图书馆 are semantic localizations of the same institution, not direct evidence for a different Korean transliteration. Use the established Adessa and Livrarium Korean forms together as one atomic bilingual compound. Official Korean manual PDF p.7 supplies institutional/quest background only, not this exact compound spelling. Preserve prior place:livrarium exclusions and unrelated place:adessa decisions; no PAK-derived evidence.'
    },
    {
      'entity_key' => 'unique_item:onionskins-hot-wurst',
      'english_canonical' => "Onionskin's Hot Wurst",
      'category' => 'unique item',
      'korean_canonical' => "어니언스킨의 핫부르스트(Onionskin's Hot Wurst)",
      'english_aliases' => '',
      'korean_variants' => '어니언스킨의 핫부르스트',
      'evidence_ids' => 'D-20937|default:15813',
      'status' => 'confirmed',
      'notes' => "EN names the complete food item Onionskin's Hot Wurst. JA オニオンスキンのホットソーセージ and ZH 洋葱皮的辣香肠 corroborate its sausage meaning. EN default:7401 explicitly calls the peppery sausage Onionskin's namesake snack, with aligned JA オニオンスキン and ZH 洋葱皮; this supports the namesake relation, not a person label on the item. Keep the full item title atomic and preserve prior person:onionskin exclusion; no PAK-derived evidence."
    }
  ].freeze

  ROW_SPECS = [
    {
      key: ['base', '109', '11'],
      entity: 'unique_item:belnes-staff-of-ire',
      old: '벨른(Belne)의 분노의 지팡이',
      new: "벨른의 분노 지팡이(Belne's Staff of Ire)",
      english: "Belne's Staff of Ire",
      japanese: 'ベルンの憤怒の杖',
      chinese: '贝尔尼的愤怒法杖',
      status: 'accepted',
      evidence: 'The base label already names Belne and the staff but splits/nests the component label; normalize the whole item to the complete pair already established in default:9396.'
    },
    {
      key: ['base', '3154', '11'],
      entity: 'place:livrarium-vaults',
      old: '리브라리움(Livrarium) 금고',
      new: '리브라리움 금고(Livrarium Vaults)',
      english: 'Livrarium Vaults',
      japanese: '図書院の宝物庫',
      chinese: '图书馆金库',
      status: 'accepted',
      evidence: 'The Japanese and Chinese are generic localized descriptions of the institution and vault; EN supplies the exact full compound. Replace the nested component annotation with one atomic compound label.'
    },
    {
      key: ['default', '9396', ''],
      entity: 'unique_item:belnes-staff-of-ire',
      old: "벨른의 분노 지팡이(Belne's Staff of Ire)",
      new: "벨른의 분노 지팡이(Belne's Staff of Ire)",
      english: "Belne's Staff of Ire",
      japanese: '強力な杖',
      chinese: '贝尔尼的愤怒法杖',
      status: 'not-an-issue',
      evidence: 'The existing Korean already supplies the complete item pair. Japanese 強力な杖 is a generic label and omits the source item name; EN and ZH identify the exact named staff.'
    },
    {
      key: ['default', '15813', ''],
      entity: 'unique_item:onionskins-hot-wurst',
      old: '어니언스킨의 핫부르스트',
      new: "어니언스킨의 핫부르스트(Onionskin's Hot Wurst)",
      english: "Onionskin's Hot Wurst",
      japanese: 'オニオンスキンのホットソーセージ',
      chinese: '洋葱皮的辣香肠',
      status: 'accepted',
      evidence: 'This is the complete food-item title, not a standalone Onionskin person mention. English default:7401 explicitly identifies Onionskin as the namesake of a peppery sausage snack; the JA/ZH item translations corroborate the food meaning.'
    },
    {
      key: ['default', '28432', ''],
      entity: 'place:adessa-livrarium',
      old: '제대로 된 솜씨만 있다면 말이야. 이 땅의 도둑은 누구도 밟아 본 적 없는 곳, 아데사 도서관(Adessa Livrarium) 지하의 금고로 가게 될 거야.',
      new: '제대로 된 솜씨만 있다면 말이야. 이 땅의 도둑은 누구도 밟아 본 적 없는 곳, 아데사 리브라리움(Adessa Livrarium) 지하의 금고로 가게 될 거야.',
      english: 'Adessa Livrarium',
      japanese: 'アデッサ図書院',
      chinese: '阿德萨图书馆',
      status: 'accepted',
      evidence: 'Replace only the complete venue span; retain the surrounding vault description. JA and ZH use semantic localized labels for the same institution.'
    },
    {
      key: ['default', '42535', ''],
      entity: 'place:adessa-livrarium',
      old: '아데사(Adessa)의 리브라리움에서 학자로 한평생을 허비했어. 사람들 사이에서 살아가며 배우는 게 내가 했어야 할 일이었지.',
      new: '아데사 리브라리움(Adessa Livrarium)에서 학자로 한평생을 허비했어. 사람들 사이에서 살아가며 배우는 게 내가 했어야 할 일이었지.',
      english: 'Adessa Livrarium',
      japanese: 'アデッサ図書院',
      chinese: '阿德萨图书馆',
      status: 'accepted',
      evidence: 'Combine the city and institution into one full bilingual venue label, leaving the locative particle 에서 and all following text unchanged. JA and ZH use semantic localized labels.'
    },
    {
      key: ['default', '50551', ''],
      entity: 'place:adessa-livrarium',
      old: '그림(Grim)이 아데사(Adessa) 시 아래 거대한 금고에 세이블 서한(Missives of Sable)이 있다는 사실을 알아냈다. 아데사 기록관(Adessa Livrarium)에서 파스머 험(Phasmer Humm)을 만나야 한다. 금고에 들어가는 방법을 알려 줄 것이다.',
      new: '그림(Grim)이 아데사(Adessa) 시 아래 거대한 금고에 세이블 서한(Missives of Sable)이 있다는 사실을 알아냈다. 아데사 리브라리움(Adessa Livrarium)에서 파스머 험(Phasmer Humm)을 만나야 한다. 금고에 들어가는 방법을 알려 줄 것이다.',
      english: 'Adessa Livrarium',
      japanese: 'アデッサの図書院',
      chinese: '阿德萨图书馆',
      status: 'accepted',
      evidence: 'Normalize only the complete venue label; preserve the separate Grim, Missives of Sable, and Phasmer Humm labels, plus the locative particle 에서. JA and ZH use semantic localized labels.'
    },
    {
      key: ['default', '53552', ''],
      entity: 'place:adessa-livrarium',
      old: '아데사 리브라리움(Adessa Livrarium) 지하 금고에 네가 들어갈 수 있도록 도와 달라고 그에게 부탁해 뒀어. 기다리게 하지 마. 수상해 보이니까.',
      new: '아데사 리브라리움(Adessa Livrarium) 지하 금고에 네가 들어갈 수 있도록 도와 달라고 그에게 부탁해 뒀어. 기다리게 하지 마. 수상해 보이니까.',
      english: 'Adessa Livrarium',
      japanese: 'アデッサ図書院',
      chinese: '阿德萨图书馆',
      status: 'not-an-issue',
      evidence: 'The complete compound is already atomically paired; preserve it and the following descriptive vault phrase unchanged. JA and ZH use semantic localized labels.'
    }
  ].freeze

  PRIOR_EXCLUSIONS = {
    'work/zh_cn/audit/proper-name-discovery-D20933.tsv' => [
      [['base', '3154', '11'], 'place:livrarium'],
      [['default', '28432', ''], 'place:livrarium'],
      [['default', '42535', ''], 'place:livrarium'],
      [['default', '50551', ''], 'place:livrarium'],
      [['default', '53552', ''], 'place:livrarium']
    ],
    'work/zh_cn/audit/proper-name-discovery-D20936.tsv' => [
      [['base', '109', '11'], 'person:belne'],
      [['default', '9396', ''], 'person:belne'],
      [['default', '15813', ''], 'person:onionskin']
    ]
  }.freeze

  CONTEXT_KEY = ['default', '7401', ''].freeze
  EXPECTED_KEYS = ROW_SPECS.map { |row| row.fetch(:key) }.freeze

  def assert_source!(source, spec)
    english = JSON.parse(source.fetch('en_texts_json')).compact
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact
    raise "EN evidence mismatch #{spec.fetch(:key).inspect}" unless english.any? { |text| text.include?(spec.fetch(:english)) }
    raise "JA evidence mismatch #{spec.fetch(:key).inspect}" unless japanese.any? { |text| text.include?(spec.fetch(:japanese)) }
    raise "ZH evidence mismatch #{spec.fetch(:key).inspect}" unless source.fetch('zh_text').include?(spec.fetch(:chinese))
    raise "active Korean mismatch #{spec.fetch(:key).inspect}" unless source.fetch('work_text') == spec.fetch(:old)
  end

  def assert_prior_exclusions!
    PRIOR_EXCLUSIONS.each do |path, expectations|
      rows = M.table(File.join(M::ROOT, path)).map(&:to_h)
      expectations.each do |key, entity|
        row = rows.find do |candidate|
          M.key(candidate) == key && candidate.fetch('entity_key').split('|').include?(entity)
        end
        raise "missing prior exclusion #{path} #{entity} #{key.inspect}" unless row
        dispositions = JSON.parse(row.fetch('entity_dispositions_json'))
        raise "prior exclusion changed #{path} #{entity} #{key.inspect}" unless
          row.fetch('old') == row.fetch('new') &&
          dispositions.fetch(entity) == 'excluded'
      end
    end
  end

  def run
    inventory_rows = M.table(M::INVENTORY).map(&:to_h)
    inventory = inventory_rows.to_h { |row| [M.key(row), row] }
    raise 'duplicate row keys in source inventory' unless inventory.length == inventory_rows.length
    raise 'exact source key coverage changed' unless EXPECTED_KEYS.uniq.sort == EXPECTED_KEYS.sort
    raise 'unexpected source key set' unless EXPECTED_KEYS.sort == [
      ['base', '109', '11'], ['base', '3154', '11'], ['default', '9396', ''],
      ['default', '15813', ''], ['default', '28432', ''], ['default', '42535', ''],
      ['default', '50551', ''], ['default', '53552', '']
    ].sort

    existing_glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    existing_keys = existing_glossary.map { |row| row.fetch('entity_key') }
    proposed_keys = DEFINITION_SPECS.map { |row| row.fetch('entity_key') }
    raise 'duplicate proposed entity key' unless proposed_keys.uniq.length == proposed_keys.length
    raise 'compound entity already registered' unless (proposed_keys & existing_keys).empty?

    assert_prior_exclusions!

    reviews = ROW_SPECS.map do |spec|
      source = inventory.fetch(spec.fetch(:key)) do
        raise "missing exact source key #{spec.fetch(:key).inspect}"
      end
      assert_source!(source, spec)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      {
        'resource' => spec.fetch(:key)[0],
        'ID_Linha' => spec.fetch(:key)[1],
        'Tipo_Variante' => spec.fetch(:key)[2],
        'entity_key' => spec.fetch(:entity),
        'status' => spec.fetch(:status),
        'old' => spec.fetch(:old),
        'new' => spec.fetch(:new),
        'evidence' => "#{spec.fetch(:evidence)} #{DEFINITION_SPECS.find { |d| d.fetch('entity_key') == spec.fetch(:entity) }.fetch('notes')}",
        'english' => english,
        'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(spec.fetch(:entity) => spec.fetch(:status)),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end

    context = inventory.fetch(CONTEXT_KEY)
    context_en = JSON.parse(context.fetch('en_texts_json')).compact.join("\n")
    context_ja = JSON.parse(context.fetch('ja_texts_json')).compact.join("\n")
    raise 'Onionskin namesake context mismatch' unless
      context_en.include?('Onionskin, who is as famous for his appetite') &&
      context_ja.include?('オニオンスキン') &&
      context.fetch('zh_text').include?('洋葱皮')
    raise 'unexpected occurrence count' unless reviews.length == 8
    raise 'unexpected exact key coverage' unless reviews.map { |row| M.key(row) }.sort == EXPECTED_KEYS.sort
    raise 'unexpected status counts' unless reviews.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
      {'accepted' => 6, 'not-an-issue' => 2}

    definitions = DEFINITION_SPECS.map do |row|
      row.merge('category' => row.fetch('category'),
                'notes' => row.fetch('notes'))
    end
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-definitions-D20937.tsv'),
      existing_glossary.first.keys,
      definitions
    )
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-D20937.tsv'),
      M::HEADERS,
      reviews.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i, row.fetch('Tipo_Variante')] }
    )
    puts "#{definitions.length} definitions; #{reviews.length} exact source keys"
    puts reviews.group_by { |row| row.fetch('status') }.transform_values(&:length).inspect
  end
end

CompoundNamesD20937.run if $PROGRAM_NAME == __FILE__
