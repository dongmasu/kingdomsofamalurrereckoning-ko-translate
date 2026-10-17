#!/usr/bin/env ruby
# encoding: UTF-8

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'review-proper-name-people-continuation'

# Deferred follow-up for English-anchored personal names. Re-run after upstream
# edits; the source guard requires fresh human review if EN/JA/ZH context changes.
module PeopleContinuationNext
  SOURCE_SHA256 = '8f2166911e347cd43ac3126e24c4ff725c3121ab1349f49974a612dfd4dd99c2'.freeze
  SOURCE_MATCHES = 145
  SOURCE_ROWS = 143

  Base = PeopleContinuationReview

  SPECS = [
    {
      key: 'person:airor', english: 'Airor', korean: '에어로르',
      units: [Base.unit('Airor', '에어로르', %w[에어러 에어로어 에어로])],
      evidence: 'base:2161|default:998|default:63500',
      identity: 'Sir Airor, son of Banvalga; the journal and poem identify the same named knight. Japanese アイロア/エアラ and Chinese 艾洛尔/艾尔 corroborate. Korean 에어로르 is the recurring source spelling; preserve the complete Sir Airor title annotation.'
    },
    {
      key: 'person:ambyth', english: 'Ambyth', korean: '앰비스',
      units: [Base.unit('Ambyth', '앰비스', %w[암비스 아므비스])],
      evidence: 'default:4072|default:33259|default:37786',
      identity: 'Lord Ambyth, leader of the Order of Fateweavers; Japanese アムビス and Chinese 安比斯 corroborate. Korean sources vary 앰비스/암비스/아므비스; use the recurring 앰비스 form and retain Lord as a title, not an alias.'
    },
    {
      key: 'person:bromm', english: 'Bromm', korean: '브롬',
      units: [Base.unit('Bromm', '브롬')],
      evidence: 'default:3475|default:18107|default:34037',
      identity: 'Sergeant Bromm of Mel Senshir Command; Japanese ブロム and Chinese 布鲁姆 corroborate. Rank and command are titles/context, not part of the English alias.'
    },
    {
      key: 'person:brasken', english: 'Brasken', korean: '브라스켄',
      units: [Base.unit('Brasken', '브라스켄', %w[브라스컨])],
      evidence: 'default:422|default:12716|default:45504',
      identity: 'Master Brasken, the blacksmith who took in and trained the orphan; Japanese マスター・ブラスケン and Chinese 布拉斯肯 corroborate. Old/Master are descriptive titles; keep any complete bilingual title/name annotation intact.'
    },
    {
      key: 'person:dodwyn', english: 'Dodwyn', korean: '도드윈',
      units: [Base.unit('Dodwyn', '도드윈')],
      evidence: 'default:182|default:6815|default:36261',
      identity: 'Captain Dodwyn, the Rathir harbor captain who sails the player to Mel Senshir; Japanese ドドウィン and Chinese 多德文 corroborate. Keep Captain as a translated title rather than an alias.'
    },
    {
      key: 'person:enright', english: 'Enright', korean: '엔라이트',
      units: [Base.unit('Enright', '엔라이트', %w[에인라이트])],
      evidence: 'default:192|default:26896|default:56262',
      identity: 'Captain Dorothy Enright of the Alfar military; her signed discharge certificate identifies Dorothy Enright and the dialogue/quest rows call the same officer Captain Enright. Japanese エンライト and Chinese 恩赖特 corroborate. Normalize the name only; preserve rank and unrelated soldier names.'
    },
    {
      key: 'person:farlun', english: 'Farlun', korean: '파를룬',
      units: [Base.unit('Farlun', '파를룬')],
      evidence: 'base:1139|default:55922|default:58677',
      identity: 'King Farlun is explicitly named in the house label and the return/speak quest rows; Japanese ファーラン and Chinese 法隆/法伦 corroborate. King remains a title, not an alias.'
    },
    {
      key: 'person:janya', english: 'Janya', korean: '잔야',
      units: [Base.unit('Janya', '잔야', %w[자냐])],
      evidence: 'base:375|default:11161|default:23699',
      identity: 'Captain Janya of the Alfar Army, identified on her grave as the beloved of Lyria; Japanese ジャンヤ and Chinese 简娅/让雅 corroborate. Keep Captain as a title and preserve the Lyria name.'
    },
    {
      key: 'person:kerrod', english: 'Kerrod', korean: '케로드',
      units: [Base.unit('Kerrod', '케로드')],
      evidence: 'base:2598|default:11165|default:56315',
      identity: 'Captain Kerrod of the Alfar Army, identified by the grave inscriptions and his named armor pieces; Japanese ケロッド and Chinese 克罗德/克洛德 corroborate. The separate source full name Kerrod Graine is excluded unless identity is independently established; do not insert the component into that atomic name.'
    },
    {
      key: 'person:koch', english: 'Koch', korean: '코흐',
      units: [Base.unit('Koch', '코흐', %w[코치])],
      evidence: 'default:624|default:39084|default:59132',
      identity: 'Captain Koch, leader of the Crownhold Garrison; the source identifies Koch with she/her pronouns. Japanese コチ and Chinese 科赫 corroborate. Korean varies 코흐/코치; use recurring 코흐 and retain Captain as a title.'
    },
    {
      key: 'person:whenery', english: 'Whenery', korean: '웨너리',
      units: [Base.unit('Whenery', '웨너리', %w[웨네리 위너리])],
      evidence: 'default:7495|default:29481|default:47756',
      identity: 'Warlord/Lady Whenery, Lady of the Red Sands; the dialogue identifies the same woman across those titles. Japanese ウェネリー and Chinese 韦纳里 corroborate. Normalize only her name and retain all full English titles in bilingual compounds.'
    },
    {
      key: 'person:setter', english: 'Setter', korean: '세터',
      units: [Base.unit('Setter', '세터')],
      evidence: 'default:3374|default:4456|default:59764',
      identity: 'Lord/Viscount Setter, also called the Allseer; the source title contexts identify one man. Japanese セッター and Chinese 赛特 corroborate. Setter the Allseer and Viscount Setter the Allseer remain whole source-supported labels; do not split or shorten their English annotations.'
    },
    {
      key: 'person:harst', english: 'Harst', korean: '하스트',
      units: [Base.unit('Harst', '하스트', %w[하스트 허스트 하르스트 하르스트])],
      evidence: 'default:4983|default:12291|default:54292',
      identity: 'Mad Harst, the Rathir Customs House thief and subordinate of Lord Besin; the quest/dialogue contexts track the same man. Japanese ハースト and Chinese 哈斯特 corroborate. Korean sources vary 하스트/허스트/하르스트; do not conflate Harst with his employer Besin or absorb Mad into the name.'
    },
    {
      key: 'person:farraglen', english: 'Farraglen', korean: '파라글렌',
      units: [Base.unit('Farraglen', '파라글렌', %w[패러글렌 패러글렌])],
      evidence: 'base:3103|default:3308|default:4468',
      identity: 'Farraglen is one of the three Tuatha Master Makers, alongside Belne and Kiftal; quest/dialogue contexts consistently identify this individual. Japanese ファラグレン and Chinese 法拉格伦 corroborate. Preserve complete Master Farraglen labels and do not register Master as an alias.'
    },
    {
      key: 'person:matrim-hawkins', english: 'Matrim Hawkins', korean: '매트림 호킨스',
      units: [Base.unit('Matrim Hawkins', '매트림 호킨스', %w[메이트림 호킨스 마트림 호킨스])],
      evidence: 'default:3095|default:12514|default:19841',
      identity: 'Matrim Hawkins is the wounded Alfar soldier targeted by Corialia Scathe; the quest, dialogue, and kill-target rows refer to the same full-name bearer. Japanese メイトリム・ホーキンス and Chinese 马特里姆·霍金斯 corroborate. Keep the complete bilingual full name atomic; do not create separate Matrim/Hawkins labels.'
    }
  ].freeze

  module_function

  def row_key(row)
    ReviewedNameBatches.key(row)
  end

  def source_guard!(generated, sources)
    keys = generated.map { |row| row_key(row) }.uniq.sort_by do |resource, id, variant|
      [resource, id.to_i, variant]
    end
    values = keys.map do |key|
      source = sources.fetch(key)
      [key, JSON.parse(source.fetch('en_texts_json')).compact,
       JSON.parse(source.fetch('ja_texts_json')).compact, source.fetch('zh_text').to_s]
    end
    raise 'continuation source scope changed; inspect all new contexts before running' unless
      generated.length == SOURCE_MATCHES && keys.length == SOURCE_ROWS &&
      Digest::SHA256.hexdigest(JSON.generate(values)) == SOURCE_SHA256
  end

  def normalize(text, english, spec, key, glossary)
    if spec[:key] == 'person:kerrod' && key == ['default', '51963', '']
      return [text, 'excluded',
              'Source names Kerrod Graine as a complete separate full name; evidence does not establish this as Captain Kerrod, so preserve it atomically and do not label the component.']
    end
    Base.normalize(text, english, spec, key, glossary)
  end

  def token_skeleton(text)
    text.scan(/\{[^{}]*\}|\$[^$]*\$/)
  end

  def run(start_d)
    raise 'START_D must be positive' unless start_d.positive?
    m = ReviewedNameBatches
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_table = m.table(glossary_path)
    glossary = glossary_table.map(&:to_h)
    resolved = SPECS.map { |spec| Base.register_definition(spec, glossary) }
    definitions = resolved.map(&:first)
    specs = resolved.map(&:last).to_h { |spec| [spec[:key], spec] }
    raise 'duplicate resolved people identities' unless specs.length == SPECS.length
    registered_keys = definitions.map { |row| row.fetch('entity_key') }
    updated_glossary = glossary.reject { |row| registered_keys.include?(row['entity_key']) } + definitions

    inventory = m.refresh_inventory.values
    sources = inventory.to_h { |row| [row_key(row), row.to_h] }
    generated = build_occurrences(inventory, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'duplicate generated entity/row keys' unless
      generated.map { |row| [row.fetch('entity_key'), *row_key(row)] }.uniq.length == generated.length
    source_guard!(generated, sources)

    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    indexed = index.to_h { |row| [[row.fetch('entity_key'), *row_key(row)], row] }
    raise 'duplicate indexed entity/row keys' unless indexed.length == index.length
    additions = generated.reject { |row| indexed.key?([row.fetch('entity_key'), *row_key(row)]) }
    pending = generated.select do |row|
      existing = indexed[[row.fetch('entity_key'), *row_key(row)]]
      !existing || existing.fetch('status') == 'needs-context'
    end

    reviews = pending.group_by { |row| row_key(row) }.map do |key, occurrences|
      source = sources.fetch(key)
      english, japanese, chinese = Base.source_texts(source)
      raise "missing aligned JA/ZH at #{key.inspect}" if japanese.empty? || chinese.empty?
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = []
      occurrences.sort_by { |row| row.fetch('entity_key') }.each do |occurrence|
        entity = occurrence.fetch('entity_key')
        spec = specs.fetch(entity)
        text, status, detail = normalize(text, english, spec, key, updated_glossary)
        dispositions[entity] = status
        evidence << "#{entity} / #{key.join(':')}: #{spec[:identity]} #{detail}"
      end
      raise "changed tokens/line breaks at #{key.inspect}" unless
        token_skeleton(old) == token_skeleton(text) &&
        old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)
      status = if text != old
                 'accepted'
               elsif dispositions.value?('uncertain')
                 'uncertain'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
        'old' => old, 'new' => text, 'evidence' => evidence.join(' '),
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by do |row|
      [m::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante')]
    end
    raise 'duplicate reviewed row keys' unless reviews.map { |row| row_key(row) }.uniq.length == reviews.length
    raise 'non-accepted edit' unless
      reviews.all? { |row| row.fetch('status') == 'accepted' || row.fetch('old') == row.fetch('new') }

    # Registration and batch application are deferred to the main runner.
    m.write_table(glossary_path, glossary_table.headers, updated_glossary)
    m.write_table(m::INDEX, index_table.headers, index + additions)
    out = File.join(__dir__, 'proper-name-reviewed-people-continuation-next.tsv')
    m.write_table(out, m::HEADERS, reviews)
    puts "People continuation: #{SPECS.length} identities; source matches=#{generated.length}, source rows=#{SOURCE_ROWS}; pending matches=#{pending.length}, reviewed rows=#{reviews.length}; #{reviews.group_by { |row| row.fetch('status') }.transform_values(&:length).inspect}"
    m.run(out, start_d, 50) unless reviews.empty?
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-proper-name-people-continuation-next.rb START_D' unless ARGV.length == 1
  PeopleContinuationNext.run(Integer(ARGV.fetch(0)))
end
