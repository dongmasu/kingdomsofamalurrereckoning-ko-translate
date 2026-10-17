#!/usr/bin/env ruby
# encoding: UTF-8

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module TellingDiscovery
  M = ReviewedNameBatches
  AUDIT = __dir__
  DEFINITION_PATH = File.join(AUDIT, 'proper-name-discovery-definitions-D21017.tsv')
  REVIEW_PATH = File.join(AUDIT, 'proper-name-review-Telling-D21017-D21020.tsv')
  ORDINARY_VERB_ID = '60343'
  LOWERCASE_LORE_IDS = %w[
    452 610 4149 9071 9611 11620 13731 20103 25220 25336 25556 25569
    30083 32463 34056 34555 36156 37203 37545 41479 42781 43954 51917
    34642 51223 53713 54759 57550 59895 60262 61094 61376 63024 63635
  ].freeze

  REPLACEMENTS = {
    '498' => ['새로운 전승을 배우겠지', '새로운 전승(The Telling)을 배우겠지'],
    '1649' => ['이야기 전승에는', '전승(The Telling)에는'],
    '1782' => ['전승에서 파라라', '전승(The Telling)에서 파라라'],
    '4193' => ['전승에서 주목할', '전승(The Telling)에서 주목할'],
    '5253' => ['종족 전체가 공유하는 이야기의 끊임없는 굽이',
               '종족 전체가 공유하는 전승(The Telling)의 끊임없는 굽이'],
    '5754' => ['전승에 새로운 변화를', '전승(The Telling)에 새로운 변화를'],
    '8954' => ['전승의 흐름', '전승(The Telling)의 흐름'],
    '9137' => ['전부 이야기의 일부일 뿐이야',
               '전부 전승(The Telling)의 일부일 뿐이야'],
    '9379' => ['전승에 남을 만하군', '전승(The Telling)에 남을 만하군'],
    '9625' => ['전승은 절대 복원할 수 없어', '전승(The Telling)은 절대 복원할 수 없어'],
    '14303' => ['이야기 전승을 이어 갈 권리', '전승(The Telling)을 이어 갈 권리'],
    '16563' => ['전승', '전승(The Telling)'],
    '17562' => ['전승', '전승(The Telling)'],
    '22373' => ['전승', '전승(The Telling)'],
    '19972' => ['전승을 방해하게 될 거야', '전승(The Telling)을 방해하게 될 거야'],
    '21045' => ['우리 전승을 바꾸고', '우리 전승(The Telling)을 바꾸고'],
    '21113' => ['전승은 보존되었다', '전승(The Telling)은 보존되었다'],
    '22629' => ['전승에 나오는 웬센', '전승(The Telling)에 나오는 웬센'],
    '25134' => ['전승은 어떻게 된 거지', '전승(The Telling)은 어떻게 된 거지'],
    '25373' => ['전승이 풀어지고 있어', '전승(The Telling)이 풀어지고 있어'],
    '25423' => ['이어진 전승을 무너뜨리고', '이어진 전승(The Telling)을 무너뜨리고'],
    '26012' => ['이번 전승과 앞으로 이어질', '이번 전승(The Telling)과 앞으로 이어질'],
    '31058' => ['그게 전승의 방식이야', '그게 전승(The Telling)의 방식이야'],
    '31067' => ['페이(Fae)의 전승에 따르면',
                '페이(Fae)의 전승(The Telling)에 따르면'],
    '32418' => ['전승에 나온 그대로', '전승(The Telling)에 나온 그대로'],
    '32615' => ['마지막 텔링(Telling)', '마지막 전승(The Telling)'],
    '33900' => ['전승을 바꾸고', '전승(The Telling)을 바꾸고'],
    '34642' => ['발라드의 집(House of Ballads)의 이야기를 즐기며',
                '발라드의 집(House of Ballads)의 전승(The Telling)에 심취해'],
    '34558' => ['전승이 이어지듯', '전승(The Telling)이 이어지듯'],
    '35252' => ['전승에 변화가 생기리라는', '전승(The Telling)에 변화가 생기리라는'],
    '35890' => ['전승의 섭리가 아니야', '전승(The Telling)의 섭리가 아니야'],
    '36767' => ['위대한 이야기 속에서', '위대한 전승(The Telling) 속에서'],
    '38881' => ['페이(Fae)의 전승은', '페이(Fae)의 전승(The Telling)은'],
    '39542' => ['전승은 어떻게 되는 거지', '전승(The Telling)은 어떻게 되는 거지'],
    '39980' => ['이야기 전승을 보살펴 온', '전승(The Telling)을 보살펴 온'],
    '41152' => ['전승에 관해서라면', '전승(The Telling)에 관해서라면'],
    '41409' => ['전승에 맞서고', '전승(The Telling)에 맞서고'],
    '43215' => ['그게 전승의 이야기야', '그게 전승(The Telling)이야'],
    '43582' => ['이야기 전승이 달라졌고', '전승(The Telling)이 달라졌고'],
    '44249' => ['이야기 전승에 더 잘 어울리는', '전승(The Telling)에 더 잘 어울리는'],
    '45326' => ['페이(Fae)의 전승에서', '페이(Fae)의 전승(The Telling)에서'],
    '57737' => ['새로운 전승의 계절', '새로운 전승(The Telling)의 계절'],
    '57771' => ['이야기가 펼쳐지는 동안 전승 의식을 지켜보지',
                '전승(The Telling)의 전개를 지켜보지'],
    '59826' => ['전승은 다시 우리 것이 됐어', '전승(The Telling)은 다시 우리 것이 됐어'],
    '60555' => ['이야기 전승(The Telling)에 참여하는',
                '전승(The Telling)에 참여하는'],
    '63208' => ['전승 속에서 각자 맡은 역할', '전승(The Telling) 속에서 각자 맡은 역할'],
    '63379' => ['위대한 전승의 일부를 맡지만',
                '위대한 전승(The Telling)의 일부를 맡지만'],
    '64438' => ["'이야기'에서 이런 비극은", "'전승(The Telling)'에서 이런 비극은"]
  }.freeze

  LOWERCASE_REPLACEMENTS = {
    '452' => ['그리고 제가 전할 모든 계절의 이야기를 바치겠다고',
              '그리고 제 전승(The Telling)의 모든 계절을 바치겠다고'],
    '610' => ['내 이야기는 언제나 왕의 이야기의 일부이지, 시녀(The Maid)의 이야기는 아니야.',
              '내 전승(The Telling)은 언제나 왕의 전승에 속하지, 시녀의 전승에 속하는 건 아니야.'],
    '4149' => ['이제 그의 ‘피투성이 뼈의 발라드(Ballad of Bloody Bones)’를 들을 시간이야',
               '이제 그가 전승(The Telling) 속에서 들려줄 ‘피투성이 뼈의 발라드(Ballad of Bloody Bones)’를 들을 시간이야'],
    '5311' => ['훌륭한 텔링(Telling)을 하길 바라네',
               '네 전승(The Telling)이 공정하길 바라네'],
    '9071' => ['전승은 우리 모두의 것이니까', '전승(The Telling)은 우리 모두의 것이니까'],
    '9611' => ['전승 속에서 맡은 역할', '전승(The Telling) 속에서 맡은 역할'],
    '11620' => ['이야기 속 꼭두각시가 되었어', '전승(The Telling) 속 꼭두각시가 되었어'],
    '13731' => ['그의 이야기는 가장 깊숙이 감춰져 있고',
                '그의 전승(The Telling)은 가장 깊숙이 감춰져 있고'],
    '20103' => ['이 새로운 전승은 페이(Fae)들에게',
                '이 새로운 전승(The Telling)은 페이(Fae)들에게'],
    '25220' => ['전승의 귀족들이야', '전승(The Telling)의 귀족들이야'],
    '25336' => ['페이(Fae)에게는 전승의 새로운 매개체',
                '페이(Fae)에게는 전승(The Telling)의 새로운 매개체'],
    '25556' => ['새 전승을 제안받았어', '새 전승(The Telling)을 제안받았어'],
    '25569' => ['페이(Fae)의 전승에서 네 역할은 없어',
                '페이(Fae)의 전승(The Telling)에서 네 역할은 없어'],
    '30083' => ['이번 전승에서 예상치 못한 일이',
                '이번 전승(The Telling)에서 예상치 못한 일이'],
    '32463' => ['내 전승은 전투와 용맹이 아니라 결속에 관한 이야기다',
                '내 전승(The Telling)은 전투와 용맹이 아니라 결속에 관한 이야기다'],
    '34056' => ['내 전승에 진심으로 관심을 보인 유일한 먼지 인간이었지',
                '내 전승(The Telling)에 진심으로 관심을 보인 유일한 먼지 인간이었지'],
    '34555' => ['페이(Fae)에게는 전승을 담을 새로운 매개, 새로운 방식이 필요해',
                '페이(Fae)에게는 전승(The Telling)을 담을 새로운 매개, 새로운 방식이 필요해'],
    '36156' => ['내 역할에 따라 여러 계절 동안 여름의 요람에서 지냈어',
                '내 전승(The Telling)에서 맡은 역할에 따라 여러 계절 동안 여름의 요람에서 지냈어'],
    '37203' => ['페이(Fae) 전승, 즉', '페이(Fae) 전승(The Telling), 즉'],
    '37545' => ['긴 페이(Fae) 전승에서', '긴 페이(Fae) 전승(The Telling)에서'],
    '41479' => ['이번 이야기에서는', '이번 전승(The Telling)에서는'],
    '42781' => ['전승도 바뀌었어', '전승(The Telling)도 바뀌었어'],
    '43954' => ['이야기 전승에 도움이 필요하시오',
                '전승(The Telling)에 도움이 필요하시오'],
    '53713' => ['페이(Fae) 전승에서 가장 위대한 용사',
                '페이(Fae) 전승(The Telling)에서 가장 위대한 용사'],
    '54759' => ['전승 속에서 윈더미어의 시녀',
                '전승(The Telling) 속에서 윈더미어의 시녀'],
    '57550' => ['평생 단 한 번만 이야기를 들려주었지만',
                '평생 단 한 번만 전승(The Telling)에 참여했지만'],
    '59895' => ['새로운 전승이 주어지겠지', '새로운 전승(The Telling)이 주어지겠지'],
    '60262' => ['구전의 어느 노래에서도, 그 모든 계절을 통틀어',
                '이 노래에서도, 전승(The Telling)의 모든 계절을 통틀어'],
    '63024' => ['의미 있는 새로운 이야기, 그러니까 새로운 전승을 원했지',
                '의미 있는 새로운 전승(The Telling)을 원했지'],
    '63635' => ['모든 전승에서 파라라 경', '모든 전승(The Telling)에서 파라라 경'],
    '64844' => ['그것이 하나의 이야기야', '그것이 바로 전승(The Telling)이야']
  }.freeze

  module_function

  def definition
    headers = M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers
    {
      'entity_key' => 'lore:the-telling',
      'english_canonical' => 'The Telling',
      'category' => 'lore term',
      'korean_canonical' => '전승(The Telling)',
      'english_aliases' => 'Telling|Our Telling|Fae Telling',
      'korean_variants' => '이야기 전승|이야기(Telling)|전승|전승(Telling)|텔링(The Telling)|전승 의식',
      'evidence_ids' => 'D-21017|D-21018|default:16563|default:17562|default:22373|default:24266',
      'status' => 'confirmed',
      'notes' => 'Named shared Fae narrative/fate tradition, including roles and ballads within it. English context defines each occurrence; Japanese 伝承 and Chinese 天谕 are corroborating evidence only. Canonical in-text form is 전승(The Telling). Ordinary verbs, individual stories or performances, indefinite generic “a telling,” and descriptive subtitles are excluded per exact row; examples include default:5311, 64844, and sentence-initial participle 60343.'
    }.slice(*headers)
  end

  def revised_text(id, old)
    text = old.gsub('전승(Telling)', '전승(The Telling)')
              .gsub('이야기(Telling)', '전승(The Telling)')
              .gsub('텔링(The Telling)', '전승(The Telling)')
    if (replacement = REPLACEMENTS[id] || LOWERCASE_REPLACEMENTS[id])
      from, to = replacement
      raise "replacement span missing/ambiguous at default:#{id}" unless text.scan(from).length == 1
      text = text.sub(from, to)
    end
    text
  end

  def run
    refresh = ARGV == ['--refresh']
    raise "unexpected arguments: #{ARGV.join(' ')}" unless ARGV.empty? || refresh
    raise 'discovery output already exists (use --refresh to regenerate this draft)' if
      !refresh && (File.exist?(DEFINITION_PATH) || File.exist?(REVIEW_PATH))
    definitions = [definition]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions)
    raise "expected 199 source matches, got #{generated.length}" unless generated.length == 199
    capitalized_ids = generated.map do |values|
      values[2] if values[5].match?(/\bTelling\b/)
    end.compact
    raise "expected 95 capitalized candidates, got #{capitalized_ids.uniq.length}" unless capitalized_ids.uniq.length == 95
    scoped_ids = (capitalized_ids + LOWERCASE_LORE_IDS).uniq - [ORDINARY_VERB_ID]
    raise 'ordinary verb accidentally included' if scoped_ids.include?(ORDINARY_VERB_ID)
    raise "unexpected scoped row count #{scoped_ids.length}" unless scoped_ids.length == 128

    reviews = generated.sort_by { |row| [M::RESOURCES.index(row[1]), row[2].to_i, row[3]] }.map do |values|
      occurrence = OCCURRENCE_HEADERS.zip(values).to_h
      id = occurrence.fetch('ID_Linha')
      old = occurrence.fetch('korean_current')
      source = inventory.fetch(M.key(occurrence))
      unless scoped_ids.include?(id)
        reason = case id
                 when ORDINARY_VERB_ID
                   'English uses sentence-initial “Telling” as a participle in “Telling thieves what to steal”; Japanese and Chinese also express an ordinary verb, not the named Fae lore concept.'
                 when '5311'
                   'English uses the indefinite phrase “a fair telling” as a wish for a fair individual story or fate, not the named shared Fae tradition. Japanese/Chinese wording is supporting evidence only; this row was already closed not-an-issue in D-19638 and its Korean text is preserved.'
                 when '64844'
                   'English defines an individual creature’s story with the generic phrase “a telling,” not the named shared Fae tradition. Preserve the generic Korean story wording; the Chinese 天谕 rendering does not override the English article and context.'
                 else
                   "English uses “#{occurrence.fetch('matched_english')}” for an ordinary verb, personal account, individual story/performance, or descriptive narrative label rather than the named shared Fae tradition; preserve the existing Korean wording."
                 end
        next {
          'resource' => occurrence.fetch('resource'),
          'ID_Linha' => id,
          'Tipo_Variante' => occurrence.fetch('Tipo_Variante'),
          'entity_key' => occurrence.fetch('entity_key'),
          'status' => 'excluded',
          'old' => old,
          'new' => old,
          'evidence' => reason,
          'english' => occurrence.fetch('english_source'),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate('lore:the-telling' => 'excluded')
        }
      end

      new_text = revised_text(id, old)
      if new_text == old
        raise "unreviewed canonical form at default:#{id}" unless old.include?('전승(The Telling)')
        status = 'not-an-issue'
        evidence = 'English context is the named Fae narrative/fate tradition; retain the established canonical bilingual form 전승(The Telling).'
      else
        raise "missing canonical label at default:#{id}" unless new_text.include?('전승(The Telling)')
        status = 'accepted'
        evidence = 'English context identifies the named Fae narrative/fate tradition; standardize its Korean label to the established canonical form 전승(The Telling). Japanese 伝承 and Chinese 天谕 corroborate the concept without controlling the Korean form.'
      end

      {
        'resource' => occurrence.fetch('resource'),
        'ID_Linha' => id,
        'Tipo_Variante' => occurrence.fetch('Tipo_Variante'),
        'entity_key' => occurrence.fetch('entity_key'),
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => occurrence.fetch('english_source'),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate('lore:the-telling' => status)
      }
    end

    raise 'review-key mismatch' unless reviews.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == 199
    M.write_table(DEFINITION_PATH, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers, definitions)
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} reviewed source matches: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
    puts "Batches: #{reviews.each_slice(50).map(&:length).join(', ')} across D-21017-D-21020"
    puts "Definitions: #{DEFINITION_PATH}"
    puts "Reviews: #{REVIEW_PATH}"
  end
end

TellingDiscovery.run if $PROGRAM_NAME == __FILE__
