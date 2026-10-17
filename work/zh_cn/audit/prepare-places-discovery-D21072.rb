#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module PlacesDiscoveryD21072
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21072.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21072.tsv')
  ENTITY_SPECS = [
    {
      'entity_key' => 'place:castle-gastyr',
      'english_canonical' => 'Castle Gastyr',
      'korean_canonical' => '가스티르 성(Castle Gastyr)',
      'english_aliases' => '',
      'korean_variants' => '가스티르 성|가스티르(Gastyr) 성|개스티르 성|개스티어 성|가스티어 성',
      'evidence_ids' => 'D-21072|base:3632:11|default:35131|default:48154|default:58183',
      'notes' => 'The exact place is Castle Gastyr, corroborated by Japanese ガスティア城 and Chinese 加斯提尔城堡. Reuse the registered person-name spelling Gastyr = 가스티르 (person:hillared-gastyr); the person/family name is not an alias for this place. Normalize only the castle span to 가스티르 성(Castle Gastyr), retaining particles and surrounding quest, letter, and dialogue wording. Do not rewrite bare Gastyr family/person references.'
    },
    {
      'entity_key' => 'place:skoria-mine',
      'english_canonical' => 'Skoria Mine',
      'korean_canonical' => '스코리아 광산(Skoria Mine)',
      'english_aliases' => '',
      'korean_variants' => '스코리아 광산|스코리아(Skoria) 광산|스코리아(Scoria) 광산',
      'evidence_ids' => 'D-21072|base:1526:11|default:22573|default:56178|default:62507',
      'notes' => 'The English mine name is corroborated by Japanese スコーリア鉱山 and Chinese 斯考瑞亚矿场/矿井. Normalize the full mine component to 스코리아 광산(Skoria Mine), correcting the isolated Korean parenthetical typo Scoria. Preserve complete deed, door, quest, and narrative compounds; this place is distinct from person:skoria and person:adath-skoria. Skoria Miner is not a mine-name occurrence.'
    },
    {
      'entity_key' => 'place:hall-of-the-firstsworn',
      'english_canonical' => 'Hall of the Firstsworn',
      'korean_canonical' => '첫서약자 전당(Hall of the Firstsworn)',
      'english_aliases' => '',
      'korean_variants' => '첫서약자 전당|첫 맹세자들의 전당|최초의 맹세자들의 전당|퍼스트스원 전당',
      'evidence_ids' => 'D-21072|base:1796:11|default:7531|default:61804|default:62616',
      'notes' => 'English and Chinese 首誓者大厅 identify a hall named for the Firstsworn; Japanese ファーストスウォーンの祠 corroborates the proper group name while using a different place noun. Among the 34 exact place rows, active Korean root forms are 첫서약자 17, 퍼스트스원 7, 최초맹세자 6, 첫맹세자 4. Therefore use the prevailing semantic Korean form 첫서약자 전당(Hall of the Firstsworn), not a newly invented phonetic or literal wording. This is a place-name component pass, not a global Firstsworn/faction renaming. Correct the stale row-local English label Firstsworn Hall when present.'
    },
    {
      'entity_key' => 'place:gallows-tree',
      'english_canonical' => 'Gallows Tree',
      'korean_canonical' => '교수대 나무(Gallows Tree)',
      'english_aliases' => '',
      'korean_variants' => '교수대 나무|교수형 나무|갤로스 나무|갤로우스 나무',
      'evidence_ids' => 'D-21072|default:34031|default:15349|default:34587|default:62834',
      'notes' => 'The exact Gallows Tree is the named, revered Winter Fae tree in the Midden, corroborated by Japanese ガローズの大樹 and Chinese 绞架树. Normalize its Korean forms to 교수대 나무(Gallows Tree), including in the complete hymn title and longer notes. Ordinary gallows and the separate island Gallows End are excluded; no bare 교수대/gallows wording is rewritten.'
    }
  ].map(&:freeze).freeze

  REVIEWED_KEYS = {
    'place:castle-gastyr' => [
      ['base', '3632', '11'],
      ['default', '5072', ''], ['default', '14390', ''],
      ['default', '17718', ''], ['default', '18656', ''],
      ['default', '18825', ''], ['default', '19849', ''],
      ['default', '24731', ''], ['default', '30091', ''],
      ['default', '32905', ''], ['default', '33944', ''],
      ['default', '35131', ''], ['default', '37825', ''],
      ['default', '39528', ''], ['default', '42245', ''],
      ['default', '44237', ''], ['default', '46227', ''],
      ['default', '46380', ''], ['default', '48097', ''],
      ['default', '48154', ''], ['default', '51629', ''],
      ['default', '58183', ''], ['default', '58525', ''],
      ['default', '62230', '']
    ].freeze,
    'place:skoria-mine' => [
      ['base', '340', '11'], ['base', '1526', '11'],
      ['base', '2331', '11'],
      ['default', '3578', ''], ['default', '9853', ''],
      ['default', '16854', ''], ['default', '17466', ''],
      ['default', '22573', ''], ['default', '25040', ''],
      ['default', '27471', ''], ['default', '27539', ''],
      ['default', '33318', ''], ['default', '37352', ''],
      ['default', '37934', ''], ['default', '38817', ''],
      ['default', '40598', ''], ['default', '41236', ''],
      ['default', '41554', ''], ['default', '43328', ''],
      ['default', '45298', ''], ['default', '47939', ''],
      ['default', '49427', ''], ['default', '50221', ''],
      ['default', '54225', ''], ['default', '56178', ''],
      ['default', '60729', ''], ['default', '62507', ''],
      ['default', '64282', '']
    ].freeze,
    'place:hall-of-the-firstsworn' => [
      ['base', '1796', '11'],
      ['default', '1829', ''], ['default', '3708', ''],
      ['default', '7506', ''], ['default', '7531', ''],
      ['default', '15687', ''], ['default', '21053', ''],
      ['default', '22398', ''], ['default', '25324', ''],
      ['default', '25950', ''], ['default', '26524', ''],
      ['default', '29014', ''], ['default', '33223', ''],
      ['default', '33653', ''], ['default', '37363', ''],
      ['default', '40384', ''], ['default', '42597', ''],
      ['default', '43564', ''], ['default', '45127', ''],
      ['default', '45938', ''], ['default', '48330', ''],
      ['default', '48772', ''], ['default', '49934', ''],
      ['default', '49935', ''], ['default', '52226', ''],
      ['default', '54362', ''], ['default', '55023', ''],
      ['default', '55862', ''], ['default', '56782', ''],
      ['default', '60419', ''], ['default', '61804', ''],
      ['default', '62616', ''], ['default', '63871', ''],
      ['default', '64167', '']
    ].freeze,
    'place:gallows-tree' => [
      ['default', '6519', ''], ['default', '9830', ''],
      ['default', '15349', ''], ['default', '16216', ''],
      ['default', '28282', ''], ['default', '28611', ''],
      ['default', '33095', ''], ['default', '34031', ''],
      ['default', '34587', ''], ['default', '34957', ''],
      ['default', '35884', ''], ['default', '36919', ''],
      ['default', '38318', ''], ['default', '40701', ''],
      ['default', '41630', ''], ['default', '41660', ''],
      ['default', '42701', ''], ['default', '43049', ''],
      ['default', '43278', ''], ['default', '44194', ''],
      ['default', '44418', ''], ['default', '44608', ''],
      ['default', '45041', ''], ['default', '45313', ''],
      ['default', '46025', ''], ['default', '46786', ''],
      ['default', '47206', ''], ['default', '51345', ''],
      ['default', '55480', ''], ['default', '57585', ''],
      ['default', '62124', ''], ['default', '62834', ''],
      ['default', '64574', ''], ['default', '64960', '']
    ].freeze
  }.freeze

  EXCLUDED_FALSE_POSITIVES = {
    ['default', '38986', ''] => 'Skoria Miner is a person/title label, not Skoria Mine.',
    ['default', '39517', ''] => 'The ordinary phrase walk the gallows is not the named Gallows Tree.',
    ['default', '44958', ''] => 'The ordinary phrase meet a gallows is not the named Gallows Tree.',
    ['default', '51951', ''] => 'The looming gallows is ordinary gallows wording, not the named tree.',
    ['default', '62717', ''] => 'The idiom cheated the gallows is not the named Gallows Tree.'
  }.freeze

  module_function

  def definitions
    ENTITY_SPECS.map do |spec|
      spec.merge(
        'category' => 'place',
        'status' => 'confirmed'
      )
    end
  end

  def spec_for(entity_key)
    ENTITY_SPECS.find { |spec| spec.fetch('entity_key') == entity_key } ||
      raise("unknown D21072 entity #{entity_key.inspect}")
  end

  def key_set
    REVIEWED_KEYS.flat_map do |entity_key, keys|
      keys.map { |key| [entity_key, *key] }
    end
  end

  def reviewed_key?(entity_key, key)
    REVIEWED_KEYS.fetch(entity_key).include?(key)
  end

  def normalize_name(entity_key, text)
    pattern = case entity_key
              when 'place:castle-gastyr'
                /(?:가스티르|가스티어|개스티르|개스티어)(?:\s*\((?:Castle Gastyr|Gastyr)\))?\s*성(?:\s*\((?:Castle Gastyr|Gastyr)\))?(?!문)/
              when 'place:skoria-mine'
                /스코리아(?:\s*\((?:Skoria Mine|Skoria|Scoria)\))?\s*광산(?:\s*\((?:Skoria Mine|Skoria|Scoria)\))?/ 
              when 'place:hall-of-the-firstsworn'
                /(?:첫\s*맹세자(?:들의\s*|의\s*)?\s*전당|최초(?:의)?\s*맹세자(?:들의\s*|의\s*)?\s*전당|첫\s*서약자(?:들의\s*|의\s*)?\s*전당|첫\s*서약자의\s*전당|퍼스트스원(?:의\s*)?\s*전당)(?:\s*\((?:Hall of the Firstsworn|Firstsworn Hall)\))?/
              when 'place:gallows-tree'
                /(?:교수대|교수형|갤로스|갤로우스)\s*나무(?:\s*\(Gallows Tree\))?/ 
              else
                raise("unknown D21072 entity #{entity_key.inspect}")
              end
    result = text.dup
    count = 0
    if entity_key == 'place:castle-gastyr'
      result = result.gsub(
        /(?:가스티르|가스티어|개스티르|개스티어)(?:\s*\((?:Castle Gastyr|Gastyr)\))?\s*성(?:\s*\((?:Castle Gastyr|Gastyr)\))?문/
      ) do
        count += 1
        '가스티르(Castle Gastyr) 성문'
      end
    end
    canonical = spec_for(entity_key).fetch('korean_canonical')
    result = result.gsub(pattern) do
      count += 1
      canonical
    end
    [result, count]
  end

  def csv_map(path)
    CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8').to_h do |row|
      [[row['ID_Linha'], row['Tipo_Variante'].to_s], row['Texto']]
    end
  end

  def aligned_maps(keys)
    resources = keys.map { |_, resource, _, _| resource }.uniq
    maps = {}
    resources.each do |resource|
      %w[en_us ja_jp zh_cn].each do |locale|
        path = File.join(
          M::ROOT, 'src/csv', locale,
          "locatexts_#{locale}.koalocatext_#{resource}.csv"
        )
        maps[[locale, resource]] = csv_map(path)
      end
      path = File.join(
        M::ROOT, 'work/zh_cn',
        "locatexts_zh_cn.koalocatext_#{resource}.csv"
      )
      maps[['ko', resource]] = csv_map(path)
    end
    maps
  end

  def source_text(maps, locale, key)
    resource, id, variant = key
    map = maps.fetch([locale, resource])
    map.fetch([id, variant]) { map.fetch([id, '']) }
  end

  def validate_aligned_rows!(inventory, maps)
    REVIEWED_KEYS.each do |entity_key, keys|
      keys.each do |key|
        source = inventory.fetch(key) do
          raise "missing inventory row #{key.join(':')} for #{entity_key}"
        end
        en = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
        ja = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
        raise "English source mismatch at #{key.join(':')}" unless
          source_text(maps, 'en_us', key) == en
        raise "Japanese source mismatch at #{key.join(':')}" unless
          source_text(maps, 'ja_jp', key) == ja
        raise "Chinese source mismatch at #{key.join(':')}" unless
          source_text(maps, 'zh_cn', key) == source.fetch('zh_text')
        raise "active Korean mismatch at #{key.join(':')}" unless
          source_text(maps, 'ko', key) == source.fetch('work_text')
      end
    end
  end

  def read_inventory
    CSV.read(M::INVENTORY, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
       .map(&:to_h)
       .to_h { |row| [M.key(row), row] }
  end

  def build_review_data(inventory = read_inventory)
    keys = key_set
    raise 'duplicate D21072 reviewed key' unless keys.uniq.length == keys.length
    maps = aligned_maps(keys)
    validate_aligned_rows!(inventory, maps)

    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = keys.sort
    actual = generated.map do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end.sort
    raise 'D21072 exact source occurrence coverage differs from reviewed keys' unless
      actual == expected

    generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      matches.each do |match|
        entity_key = match.fetch('entity_key')
        raise "unreviewed D21072 row #{entity_key} #{key.join(':')}" unless
          reviewed_key?(entity_key, key)
        new_text, replaced = normalize_name(entity_key, new_text)
        raise "no reviewed Korean name span at #{key.join(':')}" if replaced.zero?
        dispositions[entity_key] = old == new_text ? 'not-an-issue' : 'accepted'
      end
      status = old == new_text ? 'not-an-issue' : 'accepted'
      evidence = matches.map do |match|
        spec = spec_for(match.fetch('entity_key'))
        "Exact-key review #{key.join(':')}: #{spec.fetch('notes')} " \
          'Compared this complete English row with its aligned Japanese, Chinese, and active Korean cells. ' \
          "Disposition: #{old == new_text ? 'already normalized; no edit' : 'normalize only the named-place component'}; " \
          'retain all surrounding compound/title wording, particles, punctuation, placeholders, and line breaks.'
      end.join(' ')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => new_text, 'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def run
    inventory = read_inventory
    reviews = build_review_data(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "Prepared D21072 places: #{reviews.length} rows, #{generated.length} entity matches " \
         "(#{(reviews.length.to_f / 50).ceil} apply batches): " \
         "#{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

PlacesDiscoveryD21072.run if $PROGRAM_NAME == __FILE__
