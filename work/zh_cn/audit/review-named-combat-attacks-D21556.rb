#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module NamedCombatAttacksD21556
  extend self
  M = ReviewedNameBatches
  D = 21_556
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONFIG = {
    'skill:comet-strike' => ['Comet Strike', '혜성 강타', %w[2332 12187 56292 59670]],
    'skill:minotaur-rush' => ['Minotaur Rush', '미노타우로스 돌진', %w[1646 12187 56292 59670]],
    'skill:crushing-blow' => ['Crushing Blow', '분쇄 일격', %w[942 32084 41817 41840]],
    'skill:gut-thrust' => ['Gut Thrust', '복부 찌르기', %w[24135 32084 41817 41840]],
    'skill:unholy-void' => ['Unholy Void', '불경한 공허', %w[1187 22754]],
    'skill:riposte' => ['Riposte', '받아치기', %w[1672 32084 41817 41840 50585 62311]],
    'skill:whirlwind' => ['Whirlwind', '회오리바람', %w[6224 8450 10090 12187 49656 56292 59670]]
  }.freeze
  BREASTPLATE = 'item:whirlwind-breastplate'
  EXCLUDED = {
    'skill:riposte' => %w[1672],
    'skill:whirlwind' => %w[8450 10090 49656]
  }.freeze
  MARKER_REWRITES = {
    '{*1[내장 찌르기]}' => '{*1[복부 찌르기]}',
    '{*1급소 찌르기}' => '{*1복부 찌르기}',
    '{*1[강타]}' => '{*1[분쇄 일격]}',
    '{*1강타}' => '{*1분쇄 일격}',
    '{*1[반격]}' => '{*1[받아치기]}'
  }.freeze
  MARKER_REWRITE_IDS = %w[32084 41817 41840].freeze
  NOTE = 'English default:12187 defines Comet Strike as the charged Longsword attack and Minotaur Rush as the charged Hammer attack; default:41817 defines Gut Thrust as the Greatsword post-parry impale/launch attack and Crushing Blow as the Hammer post-parry lift/smash attack. Aligned Japanese コメットストライク/ミノトールラッシュ/ガットスラスト/クラッシュブロー and Chinese 彗星撞击/米诺陶冲锋/开膛突刺/毁灭性打击 corroborate the separate names and mechanics. Use the explicit Korean labels 혜성 강타, 미노타우로스 돌진, 복부 찌르기 and 분쇄 일격. Unholy Void is a named stacked magical effect, not asserted to be a learned active skill: English default:22754 defines its 5% health restoration plus 2% per stack, with Japanese 不浄の虚空 and Chinese 邪恶虚空 corroboration. Reuse 불경한 공허. No effect, weapon, timing, damage, Fate, quantity or unrelated skill text changes.'
  MARKER_NOTE = 'The English/Japanese/Chinese sources explicitly localize the display payloads inside {*1...}; project rules allow translating such display text while retaining the marker control. On the exact allowlisted IDs 32084/41817/41840 only, replace the approved Korean Gut Thrust/Crushing Blow name payloads, preserving the complete marker prefix, braces and any square brackets; append English outside the marker. Other opaque tokens and already bilingual marker payloads remain byte-identical. This is an explicit display-name correction, not an inference that all brace tokens are translatable. The prior sentence-level D-10401 marker-order decision is not recounted; this new name-consistency evidence supersedes only these isolated localized display spellings.'
  COMMON = 'English is the semantic anchor; Japanese and Chinese are supporting aligned references. The official Korean manual supplies weapon/combat context but no direct entries for these named labels. Riposte is the named post-parry Longsword combo (Japanese リポステ, Chinese 还击); Whirlwind is the named charged Greatsword flurry (Japanese ワールウインド, Chinese 旋涡). Exclude ordinary riposte/whirlwind prose and the nested Whirlwind Breastplate match; hold the isolated Riposte! imperative rather than infer its named-attack identity. No PAK/PAK-derived inspection, source changes or historical global tally recount. Actual game rendering/line width remains untested.'
  DETAIL = <<~TEXT.chomp
    ### D-21556: Named Combat Attacks And Unholy Void

    Registered seven complete English-led attack/effect names: Comet Strike,
    Minotaur Rush, Crushing Blow, Gut Thrust, Riposte, Whirlwind and Unholy
    Void, plus the atomic Whirlwind Breastplate item. Reviewed 20 distinct
    row keys / 33 entity matches across base/default, with no affix hits.
    Reused the standalone Korean labels and paired their named mentions.

    At default:32084/41817/41840, explicitly reviewed localized display
    text is normalized from 내장/급소 찌르기 to 복부 찌르기 and from 강타
    to 분쇄 일격. Each exact marker rewrite is allowlisted; marker numbers,
    braces, optional square brackets and all unrelated tokens are preserved.
    English annotations are outside the markers. Existing bilingual
    default:12187 and default:22754 remain unchanged.
    At default:32084, the localized `[반격]` payload for Riposte is also
    normalized to `[받아치기]` with its brackets retained. The ordinary
    debate retort and three figurative/generic whirlwinds are excluded.
    The isolated `Riposte!` imperative at default:62311 remains unchanged
    and uncertain for named-attack identity; no gameplay cue is inferred.

    The specialized batch gate first validates every changed marker
    against its exact approved before/after pair, then uses display-masked
    copies for the generic discovery validator. The real review manifest
    and CSV editor retain and validate the complete original/revised text.
    No generic discovery-validator or shared editor behavior is changed.
    Attack/effect descriptions, percentages and line breaks are preserved;
    game rendering remains untested. Full proper-name discovery is incomplete.
  TEXT

  def definitions(headers)
    result = CONFIG.map do |entity, (english, korean, _ids)|
      variants = case english
                 when 'Gut Thrust' then '복부 찌르기|내장 찌르기|급소 찌르기'
                 when 'Crushing Blow' then '분쇄 일격|강타'
                 when 'Riposte' then '받아치기|반격'
                 else korean
                 end
      fields = {
        'entity_key' => entity, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => 'skill',
        'english_aliases' => '', 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => "#{NOTE} #{MARKER_NOTE} #{COMMON} Riposte is explicitly defined as the post-parry Longsword combo and Whirlwind as the charged Greatsword flurry; Japanese リポステ/ワールウインド and Chinese 还击/旋涡 corroborate. Exclude ordinary retorts and generic/figurative whirlwinds; hold the isolated Riposte! imperative rather than infer it is an exact attack-name label."
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
    fields = {
      'entity_key' => BREASTPLATE, 'english_canonical' => 'Whirlwind Breastplate',
      'korean_canonical' => '회오리바람 흉갑(Whirlwind Breastplate)', 'category' => 'item',
      'english_aliases' => '', 'korean_variants' => '회오리 흉갑',
      'evidence_ids' => "D-#{D}|base:931:11", 'status' => 'confirmed',
      'notes' => "English base:931 gives the complete Whirlwind Breastplate label; Japanese ワールウインド・ブレストプレート and Chinese 旋风胸甲 corroborate the breastplate noun. Reuse the consistent 회오리바람 stem and existing 흉갑, pairing the full label atomically. Exclude this nested occurrence from the attack identity; no item rarity or attack effect is inferred. #{COMMON}"
    }
    result << headers.to_h { |header| [header, fields.fetch(header, '')] }
    result
  end

  def expected_pairs
    result = CONFIG.flat_map do |entity, (_english, _korean, ids)|
      ids.map { |id| [entity, 'default', id, ''] }
    end
    result + [['skill:whirlwind', 'base', '931', '11'], [BREASTPLATE, 'base', '931', '11']]
  end

  def transform(row_key, entity, text)
    english, korean, = CONFIG.fetch(entity)
    return text if text.include?("(#{english})")
    if text.include?('{*1')
      from = case english
             when 'Gut Thrust'
               row_key[1] == '32084' ? '{*1[내장 찌르기]}' : '{*1급소 찌르기}'
             when 'Crushing Blow'
               row_key[1] == '32084' ? '{*1[강타]}' : '{*1강타}'
             when 'Riposte'
               row_key[1] == '32084' ? '{*1[반격]}' : '{*1받아치기}'
             else "{*1#{korean}}"
             end
      raise "unexpected skill display marker #{row_key.inspect} #{english}" unless text.scan(from).length == 1
      text.sub(from, "#{MARKER_REWRITES.fetch(from, from)}(#{english})")
    else
      raise "unexpected plain skill name #{row_key.inspect} #{english}" unless text.scan(korean).length == 1
      text.sub(korean, "#{korean}(#{english})")
    end
  end

  def validate_marker_changes!(row)
    before = row['old'].scan(ReviewedProperNameDiscovery::OPAQUE)
    after = row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
    raise 'opaque token count changed' unless before.length == after.length
    before.zip(after).each do |from, to|
      next if from == to
      raise "unapproved localized marker change #{M.key(row).inspect}" unless
        row['resource'] == 'default' && MARKER_REWRITE_IDS.include?(row['ID_Linha']) &&
        MARKER_REWRITES[from] == to
    end
    raise 'marker control sequence changed' unless
      ProperNameCellEditor.tokens(row['old']) == ProperNameCellEditor.tokens(row['new'])
    raise 'line-break sequence changed' unless
      row['old'].scan(/\r\n|\r|\n/) == row['new'].scan(/\r\n|\r|\n/)
  end

  def display_mask(text)
    text.gsub(/\{\*\d+[^{}]*\}/) { |marker| marker[/\A\{\*\d+/] + '}' }
  end

  def validation_rows(rows)
    rows.map do |row|
      validate_marker_changes!(row)
      row.merge('old' => display_mask(row['old']), 'new' => display_mask(row['new']))
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions(glossary.headers)
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual = generated.map { |row| [row['entity_key'], *M.key(row)] }
    raise 'combat attack exact source scope differs' unless actual.sort == expected_pairs.sort
    rows = generated.group_by { |row| M.key(row) }.map do |key, occurrences|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      entities = occurrences.map { |row| row['entity_key'] }.sort
      entities.each do |entity|
        if entity == BREASTPLATE
          raise 'Whirlwind Breastplate Korean span differs' unless text == '회오리 흉갑'
          text = '회오리바람 흉갑(Whirlwind Breastplate)'
          dispositions[entity] = 'accepted'
          next
        elsif key == ['base', '931', '11'] || EXCLUDED.fetch(entity, []).include?(key[1])
          dispositions[entity] = 'excluded'
          next
        elsif entity == 'skill:riposte' && key == ['default', '62311', '']
          dispositions[entity] = 'uncertain'
          next
        end
        updated = transform(key, entity, text)
        dispositions[entity] = text == updated ? 'not-an-issue' : 'accepted'
        text = updated
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'),
        'status' => old != text ? 'accepted' : dispositions.value?('uncertain') ? 'uncertain' :
          dispositions.values.all? { |value| value == 'excluded' } ? 'excluded' : 'not-an-issue',
        'old' => old, 'new' => text, 'evidence' => "#{NOTE} #{MARKER_NOTE} #{COMMON}",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h)
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    raise 'combat attack distinct-key count differs' unless rows.length == 20
    ReviewedProperNameDiscovery.validate!(
      definitions, validation_rows(rows), generated,
      glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    rows.select { |row| row['old'] != row['new'] }.group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: #{rows.length} row keys; #{generated.length} matches; #{rows.count { |row| row['old'] != row['new'] }} edits; exact localized-marker gate passed; prepare only."
    [glossary, definitions, rows, generated]
  end

  def apply
    glossary, definitions, rows, generated = prepare
    index = M.table(M::INDEX)
    prior = index.map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, glossary.map(&:to_h) + definitions)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    M.run(REVIEWS, D, nil)
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    prior.each { |key, value| raise "prior skill/entity decision changed #{key.inspect}" unless current[key] == value }
    raise 'unexpected combat attack index additions' unless (current.keys - prior.keys).sort == expected_pairs.sort
    paths = M::DOCS + %w[review edit-addendum].map do |kind|
      File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    end
    paths.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      if text.include?(marker)
        File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
      else
        File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then NamedCombatAttacksD21556.prepare
  when ['apply'] then NamedCombatAttacksD21556.apply
  else abort 'usage: review-named-combat-attacks-D21556.rb [prepare|apply]'
  end
end
