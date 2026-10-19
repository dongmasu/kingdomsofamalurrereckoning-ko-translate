#!/usr/bin/env ruby
# Preparation only. This script never writes, refreshes, applies, or allocates D numbers.
require 'digest'
require 'json'
require_relative 'build-proper-name-inventory'
require_relative 'build-proper-name-occurrences'

module ScoutTailD21779
  extend self
  ROOT = File.expand_path('../../..', __dir__)
  SNAPSHOT = File.join(__dir__, 'proper-name-short-label-discovery-D21774.tsv')
  EXCLUDED = ['Shrine of Air', 'Shrine of Earth'].freeze
  OWNERS = {
    'Sir Airmer' => 'person:airmer', 'Sir Farrara' => 'person:farrara',
    'Sister Zelda' => 'person:zelda', 'Squire Brio' => 'person:brio',
    'Templar Jorielle' => 'person:jorielle', 'Templar Octienne' => 'person:octienne'
  }.freeze
  ALIASES = { 'Soulbind' => 'Soulbind Curse' }.freeze
  NOTE = 'Preparation only; main assigns serial D numbers. English anchors identity; aligned Japanese and Chinese corroborate. Every exact source match in affix/base/default is retained. Only explicitly mapped Korean spans may change; complete bilingual compounds remain atomic. Prior index dispositions and historical holds are included verbatim and are NOT resolved by these proposals. No CSV, index, glossary, shared inventory, report, or document is changed.'.freeze

  SPECS = {
    'Siegebreaker' => ['title:siegebreaker', 'title', '공성 파괴자(Siegebreaker)',
      'Eight exact default keys identify the player with this epithet: 1939/6289 says it can inspire soldiers; 15325/33022 lists it among the player’s titles; 24100/29402/57027 address the player as the Siegebreaker. JA 包囲を破りし者/救国の英雄; ZH 破城者/攻城者. Named player epithet, not generic siege equipment.',
      %w[default:1939: default:6289: default:15325: default:24100: default:26452: default:29402: default:33022: default:57027:]],
    'Soulbind' => ['lore term:soulbind', 'lore term', '영혼 결속(Soulbind)',
      "Thirteen exact default keys refer to Ticneri's named curse/spell or its cure. 43681 says he calls the curse the Soulbind; 32115 calls it his latest creation. JA 魂縛/魂縛の呪い; ZH 魂缚/魂缚诅咒. Soulbind Curse is a full alias of the same lore term, not a separate entity. Preserve D-165/default:1201 as an unchanged uncertain translation hold.",
      %w[default:1201: default:18190: default:21963: default:23313: default:29910: default:32115: default:3410: default:34443: default:36745: default:43681: default:45004: default:52078: default:61690:]],
    'Shine and Shadow' => ['unique item:shine-and-shadow', 'unique item', '빛과 그림자(Shine and Shadow)',
      'default:56562 explicitly calls them a set of daggers; 3289/46157 confirms the pair of artifacts. JA シャイン&シャドウ/ペアのダガー; ZH 光影之刃/一对匕首. One collective weapon label; no individual Shine or Shadow aliases.',
      %w[base:241:11 default:1918: default:3289: default:18328: default:23971: default:31896: default:41749: default:46157: default:50123: default:56562: default:61231:]],
    'Sioran Crypt' => ['place:sioran-crypt', 'place', '시오란 지하묘지(Sioran Crypt)',
      'default:24159 calls it a stronghold in the Drowned Forest; 17189/32717 describe entering and finding Cadoroc. JA シオラン地下聖堂/シオランの墓所; ZH 赛欧澜地窖. Do not register Sioran alone.',
      %w[base:3549:11 default:9475: default:17189: default:23904: default:24159: default:30621: default:32717: default:55201:]],
    'Spidersac Ichor' => ['resource:spidersac-ichor', 'resource', '거미낭 이코르(Spidersac Ichor)',
      'base:3552 and default:8633/19569/51518 name the acquired reagent; 30807/44368/45168 list the same English ingredient. JA イコル/蜘蛛の分泌液; ZH 蜘蛛囊液. Reuse D-6169 거미낭 이코르, not ordinary blood. Fennwrac/grist holds remain untouched.',
      %w[base:3552:11 default:8633: default:19569: default:30807: default:44368: default:45168: default:51518:]],
    'Still Manor' => ['place:still-manor', 'place', '스틸 저택(Still Manor)',
      'base:1631/default:12629 name the manor; base:1292/1886 explicitly label its guard/servants entrances. JA スティル邸/警備員入口; ZH 寂静庄园/平静庄园. Preserve whole entrance labels, not nested Still annotations.',
      %w[base:1292:11 base:1631:11 base:1886:11 default:12629:]],
    'Sylvanite' => ['resource:sylvanite', 'resource', '실바나이트(Sylvanite)',
      'default:3476 explicitly identifies an unknown variant of the material; 4730 discusses carrying it. JA シルバナイト; ZH 针碲金银矿. Existing complete equipment compounds are source-label translations, not 15 new unique items; preserve each whole compound and do not nest a Sylvanite annotation.',
      %w[affix:30:11 affix:30:12 affix:30:14 affix:30:21 affix:30:22 affix:30:24 base:854:11 base:919:11 base:1141:11 base:1616:11 base:1623:11 base:1927:11 base:2155:11 base:2213:11 base:2394:11 base:3024:11 base:3168:11 base:3376:11 base:3611:11 base:3850:11 base:4078:11 default:3476: default:4730: default:30434:]],
    'Tear of Mitharu' => ['unique item:tear-of-mitharu', 'unique item', '미사루의 눈물(Tear of Mitharu)',
      "default:54405 explicitly names one missing gem and a family heirloom; 13271/30179/43776 places that gem in/removes it from an amulet. JA ミサールの涙; ZH 米萨鲁之泪/眼泪. Distinct from Amulet of Rithen and Grim's Gem; do not import the latter identity from Japanese default:35381.",
      %w[affix:343:11 affix:343:12 affix:343:14 affix:343:21 affix:343:22 affix:343:24 base:3792:11 default:13271: default:30179: default:43776: default:54405:]],
    'Temperance' => ['title:temperance', 'title', '절제(Temperance)',
      'default:8404 explicitly christens the player a pseudonym; 22684 says alias, Temperance. JA 節義ある者/節制; ZH 节制. Prudent Temperance remains an atomic full label at 37564. Ordinary temperance in sermon 59722 is excluded. No misspelling alias is inferred.',
      %w[default:8404: default:10493: default:22684: default:37564: default:59722:]],
    'Templar Montainel' => ['person:templar-montainel', 'person', '템플러 몬테이넬(Templar Montainel)',
      'default:33551 identifies the Persuasion trainer; 14087/39845 are the exact titled name, base:2087 its storage. JA 聖堂騎士モンタイネル; ZH 圣殿骑士蒙泰纳尔. Reuse existing paired 몬테이넬. Bare Montainel and Administrator Montainel/desk/key occurrences are not aliases absent independent identity evidence.',
      %w[base:2087:11 default:14087: default:33551: default:39845:]],
    'Stalwart' => ['item:stalwart', 'item', '스톨워트(Stalwart)',
      'default:64178 explicitly says The Stalwart, she is called, a worthy vessel; JA スタルワート号/船; ZH 忠诚号/船. Register only the named ship. Six affix variants and seven adjectival prose uses are excluded; do not turn the adjective into a global entity.',
      %w[affix:360:11 affix:360:12 affix:360:14 affix:360:21 affix:360:22 affix:360:24 default:3844: default:3962: default:13575: default:23481: default:34853: default:40790: default:40922: default:64178:]]
  }.freeze

  # Exact, source-key-bounded spans. No entry means no proposed cell edit.
  SPANS = {
    'base:241:11' => ['빛과 그림자', '빛과 그림자(Shine and Shadow)'],
    'default:1918:' => ['빛과 그림자', '빛과 그림자(Shine and Shadow)'],
    'default:3289:' => ['샤인 앤 섀도(Shine and Shadow)', '빛과 그림자(Shine and Shadow)'],
    'default:18328:' => ['광휘와 그림자(Shine and Shadow)', '빛과 그림자(Shine and Shadow)'],
    'default:23971:' => ['샤인(Shine)과 섀도(Shadow)', '빛과 그림자(Shine and Shadow)'],
    'default:31896:' => ['샤인 앤드 섀도', '빛과 그림자(Shine and Shadow)'],
    'default:41749:' => ['샤인과 섀도', '빛과 그림자(Shine and Shadow)'],
    'default:46157:' => ['샤인과 섀도', '빛과 그림자(Shine and Shadow)'],
    'default:50123:' => ['샤인 앤 섀도', '빛과 그림자(Shine and Shadow)'],
    'default:56562:' => ['샤인(Shine)과 섀도(Shadow)', '빛과 그림자(Shine and Shadow)'],
    'base:3549:11' => ['시오란(Sioran) 지하묘지', '시오란 지하묘지(Sioran Crypt)'],
    'default:9475:' => ['시오란 지하 묘지', '시오란 지하묘지(Sioran Crypt)'],
    'default:30621:' => ['시오란 지하묘지', '시오란 지하묘지(Sioran Crypt)'],
    'default:32717:' => ['시오란 지하묘지', '시오란 지하묘지(Sioran Crypt)'],
    'base:3552:11' => ['거미 주머니 이코르', '거미낭 이코르(Spidersac Ichor)'],
    'default:19569:' => ['거미낭 이코르', '거미낭 이코르(Spidersac Ichor)'],
    'default:30807:' => ['거미 주머니의 진액', '거미낭 이코르(Spidersac Ichor)'],
    'default:44368:' => ['거미 주머니의 진액', '거미낭 이코르(Spidersac Ichor)'],
    'default:45168:' => ['거미 주머니의 이코르', '거미낭 이코르(Spidersac Ichor)'],
    'default:51518:' => ['거미주머니 진액', '거미낭 이코르(Spidersac Ichor)'],
    'base:1292:11' => ['스틸 저택 경비 출입구', '스틸 저택 경비 출입구(Still Manor Guard Entrance)'],
    'base:1631:11' => ['스틸(Still) 저택', '스틸 저택(Still Manor)'],
    'base:1886:11' => ['스틸 저택 하인 출입구', '스틸 저택 하인 출입구(Still Manor Servants Entrance)'],
    'base:854:11' => ['곡선형 실바나이트 칼날', '곡선형 실바나이트 칼날(Curved Sylvanite Blades)'],
    'base:919:11' => ['실바나이트 수호자', '실바나이트 수호자(Sylvanite Guard)'],
    'base:1141:11' => ['실바나이트 칼날 운송품', '실바나이트 칼날 운송품(Sylvanite Blade Shipment)'],
    'base:1616:11' => ['대형 실바나이트 칼날', '대형 실바나이트 칼날(Large Sylvanite Blade)'],
    'base:1623:11' => ['실바나이트 벙어리장갑', '실바나이트 벙어리장갑(Sylvanite Mitt)'],
    'base:1927:11' => ['실바나이트 다림추', '실바나이트 다림추(Sylvanite Plumb)'],
    'base:2155:11' => ['실바나이트 전격 원반', '실바나이트 전격 원반(Sylvanite Shock Disc)'],
    'base:2213:11' => ['소형 실바나이트 칼날', '소형 실바나이트 칼날(Small Sylvanite Blades)'],
    'base:2394:11' => ['실바나이트 뒤축', '실바나이트 뒤축(Sylvanite Heel)'],
    'base:3024:11' => ['실바나이트 흉갑', '실바나이트 흉갑(Sylvanite Chestpiece)'],
    'base:3168:11' => ['실바나이트 칼날', '실바나이트 칼날(Sylvanite Blade)'],
    'base:3376:11' => ['실바나이트 증식', '실바나이트 증식(Sylvanite Growth)'],
    'base:3611:11' => ['실바나이트 머리장식', '실바나이트 머리장식(Sylvanite Headdress)'],
    'base:3850:11' => ['실바나이트 화염 원반', '실바나이트 화염 원반(Sylvanite Flame Disc)'],
    'base:4078:11' => ['실바나이트 서리 원반', '실바나이트 서리 원반(Sylvanite Frost Disc)'],
    'default:30434:' => ['실바나이트', '실바나이트(Sylvanite)'],
    'base:3792:11' => ['미사루(Mitharu)의 눈물', '미사루의 눈물(Tear of Mitharu)'],
    'default:30179:' => ['미사루(Mitharu)의 눈물', '미사루의 눈물(Tear of Mitharu)'],
    'default:43776:' => ['미사루(Mitharu)의 눈물', '미사루의 눈물(Tear of Mitharu)'],
    'default:10493:' => ['절제', '절제(Temperance)'],
    'default:14087:' => ['템플러 몽테넬(Montainel)', '템플러 몬테이넬(Templar Montainel)'],
    'default:33551:' => ['템플러 몬타이넬', '템플러 몬테이넬(Templar Montainel)'],
    'default:39845:' => ['성전 기사 몬테이넬', '템플러 몬테이넬(Templar Montainel)'],
    'default:15325:' => ['공성 파괴자', '공성 파괴자(Siegebreaker)'],
    'default:24100:' => ['성벽 파괴자(Siegebreaker)', '공성 파괴자(Siegebreaker)'],
    'default:26452:' => ['공성 파괴자', '공성 파괴자(Siegebreaker)'],
    'default:29402:' => ['공성파괴자', '공성 파괴자(Siegebreaker)'],
    'default:57027:' => ['공성전의 파괴자', '공성 파괴자(Siegebreaker)'],
    'default:18190:' => ['영혼 결속 저주', '영혼 결속 저주(Soulbind Curse)'],
    'default:21963:' => ['영혼결속', '영혼 결속(Soulbind)'],
    'default:23313:' => ['영혼 결속', '영혼 결속(Soulbind)'],
    'default:29910:' => ['영혼 결속', '영혼 결속(Soulbind)'],
    'default:32115:' => ['영혼결속', '영혼 결속(Soulbind)'],
    'default:3410:' => ['영혼 속박 저주(Soulbind Curse)', '영혼 결속 저주(Soulbind Curse)'],
    'default:34443:' => ['영혼 결속 저주', '영혼 결속 저주(Soulbind Curse)'],
    'default:36745:' => ['영혼결속의 저주', '영혼 결속 저주(Soulbind Curse)'],
    'default:43681:' => ['영혼 결속', '영혼 결속(Soulbind)'],
    'default:45004:' => ['소울바인드로', '영혼 결속(Soulbind)으로'],
    'default:52078:' => ['영혼 속박(Soulbind)', '영혼 결속(Soulbind)']
  }.merge(%w[11 12 14 21 22 24].each_with_object({}) do |variant, map|
    map["affix:30:#{variant}"] = ['실바나이트', '실바나이트(Sylvanite)']
    map["affix:343:#{variant}"] = ['미사루(Mitharu)의 눈물', '미사루의 눈물(Tear of Mitharu)']
  end).freeze

  def table(path)
    CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8').map(&:to_h)
  end

  def key(row)
    row.values_at('resource', 'ID_Linha', 'Tipo_Variante')
  end

  def pattern(term)
    /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
  end

  def groups
    snapshot = table(SNAPSHOT)
    first = snapshot.index { |row| row.fetch('english_candidate') == 'Shadow Walk' }
    last = snapshot.index { |row| row.fetch('english_candidate') == 'Templars' }
    raise 'bounded snapshot endpoints missing' unless first && last && first <= last
    snapshot[first..last].reject { |row| EXCLUDED.include?(row.fetch('english_candidate')) }
  end

  def load_inventory
    rows = RESOURCES.flat_map do |resource|
      locales = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    raise 'duplicate aligned key' unless rows.map { |row| key(row) }.uniq.length == rows.length
    rows.to_h { |row| [key(row), row] }
  end

  def hits(inventory, term)
    inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern(term)) }
    end
  end

  def candidate_keys(candidate)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field))
    end.uniq
  end

  def definitions
    SPECS.map do |term, (entity, category, canonical, evidence, _expected)|
      {
        'entity_key' => entity, 'english_canonical' => term, 'category' => category,
        'korean_canonical' => canonical, 'english_aliases' => ALIASES.fetch(term, ''),
        'korean_variants' => '', 'evidence_ids' => '', 'status' => 'confirmed',
        'notes' => "#{evidence} #{NOTE}"
      }
    end
  end

  def replace_once(text, old, replacement, source_key)
    count = text.scan(Regexp.new(Regexp.escape(old))).length
    raise "reviewed span count #{count} at #{source_key}: #{old}" unless count == 1
    raise "already paired span at #{source_key}" if text.include?(replacement)
    text.sub(old, replacement)
  end

  def reviews(inventory)
    used = []
    SPECS.flat_map do |term, (entity, _category, _canonical, evidence, expected)|
      found = hits(inventory, term)
      actual = found.map { |row| key(row).join(':') }.sort
      raise "full source scope drift for #{term}: #{actual.inspect}" unless actual == expected.sort
      found.map do |source|
        parts = key(source)
        source_key = parts.join(':')
        excluded = (term == 'Stalwart' && source_key != 'default:64178:') ||
                   (term == 'Temperance' && source_key == 'default:59722:')
        old = source.fetch('work_text')
        span = SPANS[source_key]
        raise "edit mapped into excluded scope #{source_key}" if excluded && span
        new_text = span ? replace_once(old, *span, source_key) : old
        used << source_key if span
        preserved_hold = term == 'Soulbind' && source_key == 'default:1201:'
        status = if excluded
                   'excluded'
                 elsif preserved_hold
                   'uncertain'
                 else
                   old == new_text ? 'not-an-issue' : 'accepted'
                 end
        raise "line break changed at #{source_key}" unless old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
        {
          'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
          'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
          'evidence' => "#{evidence} Exact source key #{source_key}. #{NOTE}",
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(entity => status)
        }
      end
    end.tap do |rows|
      raise 'unused edit span or duplicate edit key' unless
        used.sort == SPANS.keys.sort && rows.map { |row| key(row) }.uniq.length == rows.length
    end
  end

  def candidate_groups(index, glossary, inventory)
    indexed = index.group_by { |row| key(row) }
    OWNERS.each_value do |entity|
      raise "actual glossary owner missing: #{entity}" unless
        glossary.any? { |row| row.fetch('entity_key') == entity }
    end
    rules = {
      'Shadow Walk' => ['uncertain', 'default:54620 explicitly uses this to reach Dannestar (JA 影の道; ZH 暗影夜行/暗影通道). Standalone labels do not prove skill versus route identity. Keep previous exact dispositions; candidate-only hold.'],
      'Solstice' => ['uncertain', 'Enter/Exit/Use the Dream at 3154/15467/47781 establishes a destination; 30187 describes a Seelie-designed weapon. JA ソルスティス; ZH 至日/索尔斯提斯. Do not join the destination and weapon senses or assign isolated labels 1446/3187/25061 without evidence.'],
      'Southern Lights' => ['excluded', 'default:42656 explicitly describes an aurora (JA オーロラ; ZH 南部之光); 54539 uses it as a topic. Not evidence of a unique place/item/skill. This name-discovery exclusion does not close historical translation holds.'],
      'Sorcery' => ['excluded', 'default:7982 defines the Mage ability-tree category (JA ソーサリー; ZH 魔法), not one unique skill/entity. Follow D-21724 Finesse category treatment. Do not globally rewrite ordinary magic or claim Korean consistency.'],
      'Speakstone' => ['uncertain', 'base:3155 and default:7770/46018 identify a Fae communication rock used by Weod; 31125 is generic interaction. JA さえずり石; ZH 传音石. Evidence supports a device/type, not automatically a uniquely named artifact; prior Korean-term holds remain open.'],
      'Tallyer' => ['excluded', 'default:21437/61461 explicitly gives first-/second-class Domus Politica administrative ranks (JA 一等/二等記録官; ZH 记录官). Generic office/rank, not personal name. Earlier rank-translation holds are untouched.'],
      'Templar' => ['excluded', 'default:52027 describes obeying a Templar office-holder (JA 聖堂騎士; ZH 圣殿骑士). Generic rank/office is not a person or proof of an independent faction. Preserve the rank wording holds.'],
      'Templars' => ['excluded', 'Plural office-holders (JA 聖堂騎士; ZH 圣殿骑士); default:11 mentions their agent. Plural grammar alone does not establish an order/faction. Preserve prior institutional and translation holds.'],
      'Sparrow' => ['uncertain', 'Existing faction:sparrows (D-21671) owns the collective, not a global singular alias. At 31232 a Sparrow of our kind is already paired as 참새단원(Sparrow); isolated labels 3534/19179/20899 remain identity holds. Member and ordinary-bird senses are not new factions.']
    }
    OWNERS.each do |term, owner|
      rules[term] = ['not-an-issue', "Already indexed as #{owner}; retain every exact existing row disposition and complete title/name form, with no duplicate registration. This does not close any independent historical lore/title hold."]
    end
    candidates = groups.to_h { |row| [row.fetch('english_candidate'), row] }
    rules.to_h do |term, (disposition, evidence)|
      keys = candidate_keys(candidates.fetch(term))
      keys.each do |source_key|
        source = inventory[source_key]
        raise "candidate key missing from aligned source: #{term}/#{source_key.inspect}" unless source
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        raise "candidate key no longer matches English: #{term}/#{source_key.inspect}" unless
          english.match?(pattern(term))
      end
      if owner = OWNERS[term]
        raise "candidate lacks existing owner/index disposition: #{term}" unless keys.all? do |parts|
          indexed.fetch(parts, []).any? do |row|
            row['entity_key'] == owner && %w[accepted not-an-issue].include?(row['status'])
          end
        end
      end
      overrides = term == 'Sparrow' ? { 'default:31232:' => 'not-an-issue' } : {}
      [term, { keys: keys, disposition: disposition, dispositions: overrides, evidence: evidence }]
    end
  end

  def queued_registrations(inventory)
    {}
  end

  def history_rows
    File.readlines(File.join(__dir__, 'decision-register-20261009.md')).each_with_object([]) do |line, rows|
      next unless line.start_with?('| D-')
      cells = line.split('|')
      scope = cells[2].to_s
      next unless scope.match?(/affix|base|default/)
      ranges = scope.scan(/(\d+)\s*-\s*(\d+)/).map { |a, b| a.to_i..b.to_i }
      ids = scope.gsub(/\d+\s*-\s*\d+/, '').scan(/\d+/).map(&:to_i)
      rows << [scope, ranges, ids, line.chomp]
    end
  end

  def prepare
    protected = RESOURCES.map { |resource| inventory_paths(ROOT, 'work', resource) } +
      %w[proper-name-glossary.tsv proper-name-occurrences.tsv].map { |file| File.join(__dir__, file) }
    hashes = protected.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
    inventory = load_inventory
    index = table(File.join(__dir__, 'proper-name-occurrences.tsv'))
    glossary = table(File.join(__dir__, 'proper-name-glossary.tsv'))
    definitions.each do |definition|
      proposed = [definition.fetch('english_canonical')] + definition.fetch('english_aliases').split('|')
      glossary.each do |entry|
        terms = [entry.fetch('english_canonical')] + entry.fetch('english_aliases', '').split('|')
        raise "existing glossary lexical owner requires reconciliation: #{proposed.first}" if
          (proposed - ['']).any? { |name| terms.any? { |existing| name.casecmp?(existing) } }
      end
    end
    prior_by_key = index.group_by { |row| key(row) }
    history = history_rows
    evidence_manifest = groups.flat_map do |group|
      term = group.fetch('english_candidate')
      hits(inventory, term).map do |source|
        source_key = key(source)
        source.merge(
          'english_candidate' => term,
          'prior_index_dispositions_json' => JSON.generate(prior_by_key.fetch(source_key, [])),
          'historical_dispositions_json' => JSON.generate(history.select do |scope, ranges, ids, _line|
            scope.include?(source_key[0]) &&
              (ids.include?(source_key[1].to_i) || ranges.any? { |range| range.cover?(source_key[1].to_i) })
          end.map(&:last)
        ))
      end
    end
    prepared = {
      definitions: definitions, reviews: reviews(inventory),
      candidate_groups: candidate_groups(index, glossary, inventory),
      queued_registrations: queued_registrations(inventory),
      evidence_manifest: evidence_manifest
    }
    handled = SPECS.keys + ALIASES.values + prepared[:candidate_groups].keys +
      prepared[:queued_registrations].keys
    raise 'scope must be exactly Shadow Walk through Templars (shrines excluded)' unless
      handled.sort == groups.map { |row| row.fetch('english_candidate') }.sort
    raise 'protected input changed during preparation' unless
      hashes.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash }
    prepared
  end

  def summary(prepared)
    {
      preparation_only: true,
      new_entity_definitions: prepared[:definitions].length,
      reviews: prepared[:reviews].group_by { |row| row['entity_key'] }.transform_values do |rows|
        { source_keys: rows.length, edits: rows.count { |row| row['old'] != row['new'] },
          excluded: rows.count { |row| row['status'] == 'excluded' } }
      end,
      candidate_groups: prepared[:candidate_groups].transform_values do |row|
        { source_keys: row[:keys].length, disposition: row[:disposition] }
      end,
      queued_registration_groups: prepared[:queued_registrations].transform_values do |row|
        { entity: row[:proposed_entity], source_keys: row[:keys].length }
      end,
      aligned_evidence_memberships: prepared[:evidence_manifest].length,
      distinct_source_keys: prepared[:evidence_manifest].map { |row| key(row) }.uniq.length
    }
  end

  def self_test
    raise 'scope leak past Templars' unless groups.last.fetch('english_candidate') == 'Templars'
    raise 'excluded shrines included' if groups.any? { |row| EXCLUDED.include?(row['english_candidate']) }
    raise 'range starts incorrectly' unless groups.first.fetch('english_candidate') == 'Shadow Walk'
    raise 'atomic source span failed' unless replace_once('미사루(Mitharu)의 눈물 가져오기:',
      '미사루(Mitharu)의 눈물', '미사루의 눈물(Tear of Mitharu)', 'fixture') ==
      '미사루의 눈물(Tear of Mitharu) 가져오기:'
    raise 'particle must follow the Hangul name, not the English annotation' unless
      replace_once('소울바인드로 널 건드렸나 봐.', '소울바인드로',
                   '영혼 결속(Soulbind)으로', 'fixture') ==
      '영혼 결속(Soulbind)으로 널 건드렸나 봐.'
    ['', 'x x', 'x(X)'].each do |text|
      failed = false
      begin
        replace_once(text, 'x', 'x(X)', 'fixture')
      rescue RuntimeError
        failed = true
      end
      raise 'span map must fail closed on missing/duplicate/already-paired input' unless failed
    end
    prepared = prepare
    stale = load_inventory
    stale.delete(['base', '241', '11'])
    failed = false
    begin
      reviews(stale)
    rescue RuntimeError
      failed = true
    end
    raise 'source drift guard did not fail closed' unless failed
    raise 'generic Stalwart adjective must not be edited' if prepared[:reviews].any? do |row|
      row['entity_key'] == 'item:stalwart' && row['status'] == 'accepted' && row['ID_Linha'] != '64178'
    end
    raise 'ordinary temperance must remain excluded' unless prepared[:reviews].any? do |row|
      row['ID_Linha'] == '59722' && row['status'] == 'excluded' && row['old'] == row['new']
    end
    raise 'registration queue must not be treated as no-edit candidates' unless
      (prepared[:candidate_groups].keys & prepared[:queued_registrations].keys).empty?
    puts JSON.pretty_generate(summary(prepared))
    warn 'PASS: boundary, glossary schema, source coverage, explicit spans and fail-closed guards; no apply/write.'
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['--self-test']
    ScoutTailD21779.self_test
  when ['--prepare']
    puts JSON.pretty_generate(ScoutTailD21779.prepare)
  when ['--summary']
    puts JSON.pretty_generate(ScoutTailD21779.summary(ScoutTailD21779.prepare))
  else
    abort 'Usage: scout-tail-D21779.rb --summary | --prepare | --self-test (stdout only)'
  end
end
