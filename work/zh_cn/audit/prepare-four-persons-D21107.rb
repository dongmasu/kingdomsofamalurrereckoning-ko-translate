#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'apply-reviewed-proper-name-discovery'

module FourPersonsD21107
  M = ReviewedNameBatches
  SPECS = [
    ['niahm-kent', 'Niahm Kent', '니암 켄트', '니엄 켄트|나이엄 켄트',
     %w[7875 8320 24570 25876 30679 32322 33884 38739 40025 52564 53588],
     'Warsworn Oathblade identified in self-introduction 7875; Japanese ニアム・ケント and Chinese 尼亚姆·肯特 corroborate. Preserve the generic scion/wealth judgments at 33884 and 40025. No global Kent or Niahm alias.'],
    ['cartery-jayck', 'Cartery Jayck', '카터리 제이크', '카터리 제익',
     %w[5313 19845 22948 25911 27899 30306 30381 32808 45353 50928 53623 63374 65030],
     'Farmhand named in the Togh family investigation; Japanese カーテリー・ジェイック and Chinese 卡特里·杰克 corroborate. Preserve the distinct justice/killing and payment-for-silence outcomes at 5313/53623. No global Cartery or Jayck alias; opaque 51539 is untouched.'],
    ['nesta-gwynedd', 'Nesta Gwynedd', '네스타 그위네드', '네스타 귀네드',
     %w[872 1552 8474 19979 20609 22397 29882 42528 45378 53181 57343 64820 65017],
     'Castaway identified in self-introduction 45378; Japanese ネスタ・グイネズ and Chinese 奈斯塔·格温内德 corroborate. Cadwallon Gwynedd is her husband, not an alias; preserve family-plural wording at 53181. No global Nesta or Gwynedd alias.'],
    ['byrn-elgar', 'Byrn Elgar', '번 엘가', '번 엘가르',
     %w[8110 8797 9533 9616 12286 21944 25908 31773 61614 64216],
     'Seawatch steward identified in self-introduction 8110; Japanese バーン・エルガー and Chinese 巴林·埃尔加尔 corroborate. Preserve the charges meaning at 21944 and distinguish Byrn Dodwin. No global Byrn or Elgar alias.']
  ].freeze

  def self.definitions
    SPECS.map do |slug, english, korean, variants, ids, note|
      {
        'entity_key' => "person:#{slug}", 'english_canonical' => english,
        'category' => 'person', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => variants,
        'status' => 'confirmed', 'notes' => note,
        'evidence_ids' => (['D-21107'] + ids.map { |id| "default:#{id}:" }).join('|')
      }
    end
  end

  def self.replace_once(text, old, new_text)
    raise "unexpected target span #{old}" unless text.scan(old).length == 1
    text.sub(old, new_text)
  end

  def self.transform(text, entity, id)
    case entity
    when 'person:niahm-kent'
      text = text.gsub('니엄 켄트', '니암 켄트').gsub('나이엄 켄트', '니암 켄트')
    when 'person:cartery-jayck'
      if id == '19845' && text.include?('카터리 제익을')
        text = replace_once(text, '카터리 제익을', '카터리 제이크(Cartery Jayck)를')
      end
      text = text.gsub('카터리 제익', '카터리 제이크')
    when 'person:nesta-gwynedd'
      text = text.gsub('네스타 귀네드', '네스타 그위네드')
      if id == '19979' && text.include?('네스타의')
        text = replace_once(text, '네스타의', '네스타(Nesta)의')
      end
    when 'person:byrn-elgar'
      text = text.gsub('번 엘가르', '번 엘가')
      if id == '9533' && text.include?('총집사 번 엘가와')
        text = replace_once(text, '총집사 번 엘가와', '총집사 번 엘가(Head Steward Byrn Elgar)와')
      end
      if %w[12286 61614].include?(id) && text.include?('번은')
        text = replace_once(text, '번은', '번(Byrn)은')
      end
    else
      raise "unexpected entity #{entity}"
    end
    definition = definitions.find { |d| d['entity_key'] == entity }
    english = definition.fetch('english_canonical')
    korean = definition.fetch('korean_canonical').delete_suffix("(#{english})")
    text.gsub(/#{Regexp.escape(korean)}(?!\()/, "#{korean}(#{english})")
  end

  def self.build
    inventory = M.refresh_inventory
    defs = definitions
    hits = build_occurrences(inventory.values, defs).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    SPECS.each do |slug, _english, _korean, _variants, ids, _note|
      actual = hits.select { |h| h['entity_key'] == "person:#{slug}" }.map { |h| M.key(h) }.sort
      raise "unexpected scope #{slug}" unless actual == ids.map { |id| ['default', id, ''] }.sort
    end
    reviews = hits.map do |hit|
      key = M.key(hit)
      source = inventory.fetch(key)
      entity = hit.fetch('entity_key')
      old = source.fetch('work_text')
      new_text = transform(old, entity, key[1])
      status = old == new_text ? 'not-an-issue' : 'accepted'
      evidence = defs.find { |d| d['entity_key'] == entity }.fetch('notes')
      evidence += ' Independently reviewed against EN/JA/ZH; the manual PDF pp. 7-8 supplies faction-quest and dialogue context, not NPC spelling. Other entity/key decisions are preserved.'
      evidence += ' Only the corrected name and immediately attached object particle change.' if key[1] == '19845'
      evidence += ' The complete Head Steward title/name is paired atomically, without nesting.' if key[1] == '9533'
      evidence += ' A repeated first name in this same sentence is paired locally, with no new global alias.' if %w[19979 12286 61614].include?(key[1])
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end.sort_by { |r| r['ID_Linha'].to_i }
    raise 'unexpected row/edit count' unless reviews.length == 47 && reviews.count { |r| r['old'] != r['new'] } == 31
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, hits,
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h),
      M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21107.tsv'), defs.first.keys, defs)
    M.write_table(File.join(__dir__, 'proper-name-discovery-D21107.tsv'), reviews.first.keys, reviews)
    puts 'Prepared 47 full-name rows; 31 edits, 16 retained; no global aliases.'
  end
end

FourPersonsD21107.build if $PROGRAM_NAME == __FILE__
