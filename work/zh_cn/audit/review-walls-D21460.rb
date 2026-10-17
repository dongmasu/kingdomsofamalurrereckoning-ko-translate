#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module WallsD21460
  extend self

  M = ReviewedNameBatches
  D = 21_460
  ENTITY = 'place:the-walls'
  CANONICAL = '장벽(The Walls)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  EXPECTED_IDS = %w[
    766 1274 5573 5678 6827 8090 8609 9255 12486 13306 13977 15619
    18792 19407 19783 21189 22108 22615 23397 23811 24850 25637 28435
    29532 30514 34825 36988 38041 39080 39908 41303 42267 44158 44306
    45421 45698 45848 46393 48226 51361 54048 54053 54222 56258 56321
    56990 57837 59610 60038 61102 61540 63792 64126
  ].freeze
  PENDING_IDS = %w[61540 63792 64126].freeze
  NOTE = 'English default:21189 identifies The Walls as the Adessa district housing ' \
         'the Bursar, Laboratories, Garrison, Prison and Arcadium; default:46393 calls ' \
         'it the center of Adessa labor, and 61102 labels Adessa - The Walls. ' \
         'Aligned Japanese ウォールズ corroborates the district; Chinese uses 墙壁/高墙. ' \
         'Register only this place, not physical walls, Bone Wall or Wall of Thorns. ' \
         'No Wall/Walls alias. Source-local Walls/The Walls annotations and the ' \
         'complete Adessa - The Walls label are retained at their respective scopes.'

  # Each tuple is EN anchor, JA anchor, ZH anchor, exact old/new span, local finding.
  NAMED = begin
    rows = %w[1274 5573 8090 12486 13977 28435 39908 56321].to_h do |id|
      old = { '8090' => CANONICAL, '12486' => '장벽' }.fetch(id, '성벽')
      [id, ['The Walls', 'ウォールズ', '墙壁', old, CANONICAL,
            'Standalone district label, corroborated by Japanese transliteration.']]
    end
    rows.merge(
      '5678' => ['sites of the Walls', 'ウォールズ', '高墙',
                 '월즈(Walls)', '장벽(Walls)',
                 'District sites contrasted with the Arcadium and markets.'],
      '21189' => ['The Walls house the infrastructure of Adessa', 'ウォールズ', '高墙',
                  '월즈', CANONICAL,
                  'Explicit Adessa infrastructure district, not the enclosing fortifications.'],
      '22108' => ['buildings in the Walls', 'ウォールズ', '高墙',
                  '성벽(Walls)', '장벽(Walls)',
                  'Garrison and Livrarium are buildings in the named district; retain surrounding 안에서.'],
      '22615' => ['The Walls are home to the assistants', 'ウォールズ', '高墙',
                  CANONICAL, CANONICAL,
                  'District housing assistants and researchers, contrasted with the Isles; already paired.'],
      '25637' => ['Here in the Walls', 'ウォールズ', '高墙',
                  '장벽', '장벽(Walls)',
                  'Gnomish workers describe their work here in the district.'],
      '44158' => ['Laboratories in the Walls', 'ウォールズ', '高墙',
                  '성벽', '장벽(Walls)',
                  'Assistant transferred from district Laboratories to Basilica; retain surrounding 안.'],
      '45848' => ['artisans in the Walls', 'ウォールズ', '工匠',
                  '월스', '장벽(Walls)',
                  'District artisans supply shop stock. Japanese names the district; Chinese omits its name but supports the artisans context.'],
      '46393' => ["The Walls are the center of Adessa's labors", 'ウォールズ', '高墙',
                  '월스는', "#{CANONICAL}은",
                  'Explicit Adessa labor district; attached topic particle changes 는 to 은 for 장벽.'],
      '59610' => ['crater from the Walls', 'ウォールズ', '高墙',
                  '성벽', '장벽(Walls)',
                  'District viewpoint contrasted with the Isles; Japanese explicitly transliterates both districts.'],
      '60038' => ['scholars in the Walls', 'ウォールズ', '高墙',
                  '월스(Walls)', '장벽(Walls)',
                  'District scholars complain about losing Sandstone Villa workspace; preserve the letter and signature.'],
      '61102' => ['Adessa - The Walls', 'アデッサ - "ウォールズ"', '阿德萨 - 高墙',
                  '아데사 - 성벽(Adessa - The Walls)', '아데사 - 장벽(Adessa - The Walls)',
                  'Complete location label remains one atomic bilingual pair; do not nest a district pair.']
    ).transform_values(&:freeze).freeze
  end

  # Explicit negative dispositions are required by the unchanged case-insensitive matcher.
  EXCLUDED = {
    '766' => ['Scale the walls', '破城槌', '攻城锤', 'Scaling fortifications or battering a gate.'],
    '6827' => ['walls guide me deeper', '壁沿い', '墙壁', 'Physical walls guide a traveler through darkness.'],
    '8609' => ['moisture on the walls', '壁の湿気', '墙上的湿气', 'Damp interior walls in a remembered dream.'],
    '9255' => ['walls of Mel Senshir', 'メル・センシアの城壁', '梅尔森溪', 'Mel Senshir battlefield fortifications.'],
    '13306' => ['walls of Mel Senshir', 'メル・センシアの壁', '梅尔森溪的城墙', 'Day 58 journal passage concerns Mel Senshir defenses, not Adessa.'],
    '15619' => ['walls of the keep', 'カンドリアン', '要塞的城墙', 'Kandrian Keep shelters villagers within its fortifications.'],
    '18792' => ['walls of this stronghold', '要塞', '要塞的城墙', 'Childhood within an explicitly described stronghold.'],
    '19407' => ['walls of Gleir Rathwen', 'グレイール・ラスウェンの壁', '格利尔拉思文的城墙', 'Collapsing Gleir Rathwen fortifications in the Rathir founding poem.'],
    '19783' => ['painted the walls with gore', '彼女は壁を', '墙上涂满鲜血', 'Draug bloodies hall walls in a poem.'],
    '23397' => ['We break the walls', '壁を破壊する', '打碎了墙壁', 'Fyragnos invocation breaks prison walls; not a district.'],
    '23811' => ['walls of Gleir Rathwen', 'グレイール・ラスウェンの壁', '格利尔拉思文的城墙', 'Second Rathir founding poem occurrence, same physical fortifications.'],
    '24850' => ['walls had been scarred with Chaos markings', '壁に混沌の印', '墙壁', 'Old cistern walls bear Chaos markings.'],
    '29532' => ['Egan ventured past the walls', '薪を集めに壁の向こう', '高墙去打柴', 'Egan leaves village defenses to collect firewood.'],
    '30514' => ['walls of Mel Senshir', 'メル・センシアの壁', '梅尔森溪的高墙', 'Mel Senshir battle tactics and Balor arrival.'],
    '34825' => ['walls of Idylla', 'イディラの市外', '伊迪拉的高墙', 'Pacetor cannot leave Idylla city defenses.'],
    '36988' => ['walls of Sandstone Villa', 'サンドストーン邸', '沙石庄园高墙', 'Villa enclosing walls, despite the wider Adessa setting; not the district.'],
    '38041' => ['fight for the walls', '壁を死守', '高墙而战', 'Healed soldiers wish to defend fortifications again.'],
    '39080' => ["walls of the victims' home", '犠牲者の家の壁', '受害者家墙壁', 'Blood spatter on murder victims home walls.'],
    '41303' => ['walls of Klurikon', 'クルリコンの壁', '克琉孔的高墙', 'Winter realm beyond Klurikon walls, not Adessa.'],
    '42267' => ['scale the walls of Mel Senshir', 'メル・センシアの外壁', '梅尔森溪的高墙', 'Tuatha siege ladders climb Mel Senshir fortifications.'],
    '44306' => ['packed to the walls with Alfar', 'アルファーだらけ', '被精灵挤得水泄不通', 'Idiomatic city crowding, not a proper place name.'],
    '45421' => ['on the walls when you killed', 'あの壁で', '在高墙杀死怪物巴洛尔', 'Letter recalls killing Balor on Mel Senshir defenses.'],
    '45698' => ['walls of Mel Senshir', '城砦都市メル・センシア', '梅尔森溪城墙', 'Camden Wulflac killed while serving on Mel Senshir defenses.'],
    '48226' => ['on the walls and the tomes', '砦の壁', '要塞的高墙', 'Warsworn history recorded on keep walls and in books.'],
    '51361' => ["coming up the walls", '壁を登って', '正在爬墙', 'Combat alarm: enemy ladders climb physical walls.'],
    '54048' => ['painted the walls with gore', '彼女は壁を', '墙上涂满鲜血', 'Second Draug poem occurrence, bloodied hall walls.'],
    '54053' => ['walls of Mel Senshir', 'メル・センシアの壁', '梅尔森溪', 'Death personified on Mel Senshir defenses; Chinese omits the wall image.'],
    '54222' => ['woods outside the walls', '村の北方', '村子以北', 'Egan sighted outside village defenses in the northern woods.'],
    '56258' => ['walls of that fortress', '要塞の城壁', '堡垒的城墙', 'Fortress defenses repeatedly saved the speaker.'],
    '56990' => ['beyond the walls', 'ゲイル・クロッシング', '狂风路口', 'Travel beyond defenses toward Gale Crossing and the mountains.'],
    '57837' => ['walls will topple', 'やがて壁が倒れる', '墙会倒塌', 'St. Odwig institution and its walls, literal/metaphorical, not Adessa district.'],
    '61540' => ['We break the walls', '壁を破壊する', '打碎了墙壁', 'Second Fyragnos invocation, breaking prison walls.'],
    '63792' => ['I raised the walls and created the ceiling', '壁を建て', '打造了天花板', 'Basilica Gnostra construction: physical walls and ceiling, even in Adessa.'],
    '64126' => ['scratching behind the walls', '壁の後ろ', '墙后', 'Rats scratch behind damp interior walls.']
  }.transform_values(&:freeze).freeze

  def expected_pairs
    EXPECTED_IDS.map { |id| [ENTITY, 'default', id, ''] }
  end

  def definitions_for(headers)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'The Walls',
      'category' => 'place', 'korean_canonical' => CANONICAL,
      'english_aliases' => '', 'korean_variants' => '성벽|장벽|월즈|월스',
      'evidence_ids' => "D-#{D}", 'status' => 'confirmed', 'notes' => NOTE
    }
    [headers.to_h { |header| [header, fields.fetch(header, '')] }]
  end

  # Build the aligned inventory in memory; preparing never refreshes the shared TSV.
  def source_inventory
    M::RESOURCES.flat_map do |resource|
      rows = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *rows).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end.each_with_object({}) do |row, inventory|
      key = M.key(row)
      raise "duplicate source key #{key.inspect}" if inventory.key?(key)

      inventory[key] = row
    end
  end

  def generated_for(inventory, definitions)
    build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def reviews_for(inventory, generated)
    raise 'Walls classification table differs' unless
      (NAMED.keys + EXCLUDED.keys).sort == EXPECTED_IDS.sort &&
      (NAMED.keys & EXCLUDED.keys).empty?
    pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Walls all-resource source scope differs from the reviewed 53 keys' unless
      pairs.sort == expected_pairs.sort

    generated.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      id = key[1]
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      spec = NAMED[id] || EXCLUDED.fetch(id)
      [english, japanese, chinese].zip(spec.take(3), %w[EN JA ZH]).each do |text, anchor, locale|
        raise "Walls #{locale} evidence differs #{key.inspect}" unless text.include?(anchor)
      end
      raise "Walls English mention count differs #{key.inspect}" unless
        english.scan(/(?<![A-Za-z])the walls(?![A-Za-z])/i).length == 1

      old = source.fetch('work_text')
      if NAMED.key?(id)
        old_span, new_span = spec.values_at(3, 4)
        raise "Walls Korean name span differs #{key.inspect}" unless
          old.scan(Regexp.new(Regexp.escape(old_span))).length == 1
        new_text = old.sub(old_span, new_span)
        status = old == new_text ? 'not-an-issue' : 'accepted'
      else
        new_text = old
        status = 'excluded'
      end
      {
        'resource' => key[0], 'ID_Linha' => id, 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "default:#{id}: #{spec.last} " \
                      "EN anchor=#{spec[0].inspect}; JA=#{spec[1].inspect}; ZH=#{spec[2].inspect}. " \
                      "#{NAMED.key?(id) ? 'Named Adessa district.' : 'Exclude ordinary walls from the district entity; unchanged.'} " \
                      'English is primary; aligned locales support only the stated local reading. ' \
                      'Preserve all other names, complete labels, opaque tokens and exact line breaks. ' \
                      'No prior entity disposition is superseded and no global Wall/Walls alias is inferred.',
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def prior_records(rows)
    rows.each_with_object({}) do |row, records|
      key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate occurrence key #{key.inspect}" if records.key?(key)

      records[key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_records!(before, rows)
    after = prior_records(rows)
    before.each do |key, record|
      raise "prior occurrence record changed #{key.inspect}" unless after[key] == record
    end
    raise 'unexpected new Walls occurrence keys' unless
      (after.keys - before.keys).sort == expected_pairs.sort
  end

  def verify_first_batch!(rows, reviews, generated)
    indexed = rows.select { |row| row.fetch('entity_key') == ENTITY }
                  .to_h { |row| [M.key(row), row] }
    raise 'Walls registered coverage differs' unless
      indexed.keys.sort == reviews.map { |row| M.key(row) }.sort
    originals = generated.to_h { |row| [M.key(row), row] }
    reviews.each_with_index do |review, ordinal|
      key = M.key(review)
      actual = indexed.fetch(key)
      expected = originals.fetch(key).merge('korean_current' => review.fetch('new'))
      if ordinal < 50
        expected = expected.merge('status' => review.fetch('status'),
                                  'evidence' => "D-#{D}: #{review.fetch('evidence')}")
      end
      raise "Walls first-50 registration differs #{key.inspect}" unless actual == expected
    end
    pending = indexed.values.select { |row| row.fetch('status') == 'needs-context' }
    raise 'Walls deferred three keys differ' unless
      pending.map { |row| row.fetch('ID_Linha') }.sort == PENDING_IDS.sort
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'Walls discovery outputs already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX).map(&:to_h)
    inventory = source_inventory
    definitions = definitions_for(glossary.headers)
    generated = generated_for(inventory, definitions)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row.fetch('old') != row.fetch('new') }
    edits.group_by { |row| row.fetch('resource') }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
    end
    puts "Prepared D-#{D}: #{reviews.length} keys; " \
         "#{reviews.group_by { |row| row.fetch('status') }.transform_values(&:length).inspect}. " \
         'Apply processes only the first 50; remaining 3 are reserved for main at D-21463.'
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new'))
    end
    [definitions, reviews, generated]
  end

  def apply
    glossary_path = ReviewedProperNameDiscovery::GLOSSARY
    glossary = M.table(glossary_path)
    index = M.table(M::INDEX)
    before = prior_records(index.map(&:to_h))
    definitions, reviews, generated = prepare
    raise 'glossary changed during Walls preparation' unless
      M.table(glossary_path).map(&:to_h) == glossary.map(&:to_h)
    raise 'index changed during Walls preparation' unless
      M.table(M::INDEX).map(&:to_h) == index.map(&:to_h)

    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    M.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    # D21461/21462 are reserved. Main finishes the three pending exclusions at D21463.
    M.run(REVIEWS, D, 1)

    final_index = M.table(M::INDEX).map(&:to_h)
    verify_prior_records!(before, final_index)
    verify_first_batch!(final_index, reviews, generated)
    raise 'prior glossary records changed' unless
      M.table(glossary_path).map(&:to_h) == glossary.map(&:to_h) + definitions
    puts 'Verified all 53 registrations and prior records; only default:61540/63792/64126 remain needs-context for D-21463.'
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-walls-D21460.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then WallsD21460.prepare
  when 'apply' then WallsD21460.apply
  else abort 'usage: review-walls-D21460.rb [prepare|apply]'
  end
end
