#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'apply-reviewed-proper-name-discovery'

module FourPersonsD21105
  M = ReviewedNameBatches
  DEFINITIONS_PATH = File.join(__dir__, 'proper-name-discovery-definitions-D21105.tsv')
  REVIEW_PATH = File.join(__dir__, 'proper-name-discovery-D21105.tsv')

  DEFINITIONS = [
    {
      'entity_key' => 'person:stellan-reitan',
      'english_canonical' => 'Stellan Reitan',
      'category' => 'person',
      'korean_canonical' => '스텔란 레이탄(Stellan Reitan)',
      'english_aliases' => 'Stellan',
      'korean_variants' => '스텔란|스텔란 라이탄|스텔란 라이턴',
      'status' => 'confirmed',
      'notes' => 'The mining surveyor who authored the recoverable journal; EN names Stellan Reitan, JA ステラン・レイタン and ZH 斯特兰·雷坦 corroborate. Standardize 스텔란 레이탄(Stellan Reitan), with source-local 스텔란(Stellan). Preserve the complete existing title label at base:2872:11; do not turn Find Stellan\'s Journal objectives into a named-item title. Correct default:9346 atomically to 스텔란 레이탄의 일지(The Journal of Stellan Reitan).'
    },
    {
      'entity_key' => 'person:telemachus-rasp',
      'english_canonical' => 'Telemachus Rasp',
      'category' => 'person',
      'korean_canonical' => '텔레마코스 라스프(Telemachus Rasp)',
      'english_aliases' => 'Telemachus',
      'korean_variants' => '텔레마코스|텔레마쿠스|라스프|랩',
      'status' => 'confirmed',
      'notes' => 'Scholia Arcana instructor and author of the magical-structure treatise; EN, JA テレマコス・ラスプ and ZH 忒勒马科斯·拉斯普 corroborate. Normalize 텔레마쿠스 랩 to 텔레마코스 라스프 and pair source-matched full names/Telemachus mentions only; Rasp is not a global alias. Preserve the complete Master Telemachus Rasp title label at default:1280. Leave standalone Rasp at default:19818 for separate exact-row review.'
    },
    {
      'entity_key' => 'person:calder-vonn',
      'english_canonical' => 'Calder Vonn',
      'category' => 'person',
      'korean_canonical' => '칼더 본(Calder Vonn)',
      'english_aliases' => 'Calder|Lord Vonn',
      'korean_variants' => '칼더 본|캘더 본|칼더|본 경',
      'status' => 'confirmed',
      'notes' => 'The northern-island invader and noble mage; EN, JA コールダー・ヴォン and ZH 卡尔德·冯恩 corroborate. Use 칼더 본(Calder Vonn), with row-local 칼더(Calder), and 본 경(Lord Vonn) only for the explicit title at default:31169. Add 본(Vonn) only to the source-matched later short reference at default:55034. Do not register unrestricted Vonn: Cassera Vonn (22447), Vonn Freeman (41621), Vonn Mercenary (51766), and Vonn-only references (14524,56743) remain outside this scope.'
    },
    {
      'entity_key' => 'person:sigra-thorin',
      'english_canonical' => 'Sigra Thorin',
      'category' => 'person',
      'korean_canonical' => '시그라 소린(Sigra Thorin)',
      'english_aliases' => 'Sigra',
      'korean_variants' => '시그라 토린|시그라',
      'status' => 'confirmed',
      'notes' => 'Ayten potion-shop invoice quest-giver; EN, JA シグラ・ソリン and ZH 希格拉·索林 identify the same woman. Standardize 시그라 소린(Sigra Thorin), reusing 소린 established for Askel Thorin. Sigra is an alias; do not register Thorin as a global alias.'
    }
  ].freeze

  EXPECTED_IDS = {
    'person:stellan-reitan' => %w[
      base:2872:11 default:865: default:1921: default:3914: default:4283:
      default:9346: default:11593: default:11594: default:18313:
      default:26858: default:32243: default:46001: default:61524: default:63282:
    ],
    'person:telemachus-rasp' => %w[
      default:1280: default:1848: default:11719: default:14587: default:14609:
      default:15332: default:16052: default:18611: default:23855:
      default:33273: default:40863: default:41066:
    ],
    'person:calder-vonn' => %w[
      default:12364: default:23913: default:31169: default:40208:
      default:40764: default:41744: default:48589: default:51761:
      default:54779: default:55034: default:59342:
    ],
    'person:sigra-thorin' => %w[
      base:1044:11 default:812: default:11365: default:21566: default:38110:
      default:39169: default:50844: default:62498:
    ]
  }.transform_values { |keys| keys.to_set.freeze }.freeze

  EVIDENCE = {
    'person:stellan-reitan' => 'D-21105 row review: the mining surveyor/journal owner is identified by English; aligned Japanese and Chinese support the same person. Pair only actual name references, preserve complete journal-title labels and objective wording.',
    'person:telemachus-rasp' => 'D-21105 row review: the Scholia Arcana instructor/researcher is identified by English; aligned Japanese and Chinese support the same person. Normalize reviewed Korean name variants and preserve titles, particles, and surrounding prose.',
    'person:calder-vonn' => 'D-21105 row review: the northern invader and noble mage is identified by English; aligned Japanese and Chinese support the same person. Full-name and title labels are atomic; short Calder/Vonn forms are row-scoped, with no unrestricted Vonn alias.',
    'person:sigra-thorin' => 'D-21105 row review: the Ayten invoice quest-giver is identified by English; aligned Japanese and Chinese support the same person. Use the established family spelling 소린; do not create a Thorin alias.'
  }.freeze

  ROW_EVIDENCE = {
    ['base', '2872', '11'] => 'Keep the already complete bilingual journal title as-is; this row is not an invitation to split out a person annotation.',
    ['default', '1280', ''] => 'Keep the complete source-supported title label Master Telemachus Rasp atomic and unchanged.',
    ['default', '9346', ''] => 'Correct the misspelled person component and pair the entire source title atomically as 스텔란 레이탄의 일지(The Journal of Stellan Reitan).',
    ['default', '11594', ''] => 'Objective says Find Stellan\'s Journal; pair the person reference only and do not invent a bilingual named-item title.',
    ['default', '32243', ''] => 'Objective says Find Stellan\'s Journal; pair the person reference only and do not invent a bilingual named-item title.',
    ['default', '31169', ''] => 'English explicitly says Lord Vonn; pair the Korean title as 본 경(Lord Vonn), not a global Vonn alias.',
    ['default', '55034', ''] => 'English later uses Vonn alone for the already established Calder Vonn; pair only this Korean 본 as 본(Vonn).',
    ['default', '19818', ''] => 'Standalone Rasp is intentionally excluded from the global person alias scope; D-21106 handles this exact contextual reference.',
    ['default', '22447', ''] => 'Cassera Vonn is a different full name; excluded because the definitions contain no unrestricted Vonn alias.',
    ['default', '41621', ''] => 'Vonn Freeman is a faction/team label, not the person; excluded.',
    ['default', '51766', ''] => 'Vonn Mercenary is a class/faction compound, not a person reference; excluded.',
    ['default', '14524', ''] => 'Vonn-only reference intentionally remains outside this batch for a separate row-scoped review.',
    ['default', '56743', ''] => 'Vonn-only possessive reference intentionally remains outside this batch for a separate row-scoped review.'
  }.freeze

  FULL_FORMS = {
    'person:stellan-reitan' => %w[스텔란\ 레이탄 스텔란\ 라이탄 스텔란\ 라이턴],
    'person:telemachus-rasp' => %w[텔레마코스\ 라스프 텔레마쿠스\ 라스프 텔레마쿠스\ 랩],
    'person:calder-vonn' => %w[칼더\ 본 캘더\ 본],
    'person:sigra-thorin' => %w[시그라\ 소린 시그라\ 토린]
  }.freeze

  SHORT_FORMS = {
    'person:stellan-reitan' => { '스텔란' => 'Stellan' },
    'person:telemachus-rasp' => { '텔레마코스' => 'Telemachus', '텔레마쿠스' => 'Telemachus' },
    'person:calder-vonn' => { '칼더' => 'Calder', '캘더' => 'Calder' },
    'person:sigra-thorin' => { '시그라' => 'Sigra' }
  }.freeze

  module_function

  def source_texts(source)
    [
      JSON.parse(source.fetch('en_texts_json') || '[]').compact,
      JSON.parse(source.fetch('ja_texts_json') || '[]').compact,
      source.fetch('zh_text').to_s
    ]
  end

  def row_key_string(key)
    key.join(':')
  end

  def sort_key(row)
    [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
     row['Tipo_Variante'].to_s]
  end

  def inside_parentheses?(text, position)
    prefix = text[0...position]
    prefix.count('(') > prefix.count(')')
  end

  def replace_spans(text, pattern)
    matches = text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
    result = text.dup
    matches.reverse_each do |match|
      next if inside_parentheses?(text, match.begin(0))
      replacement = yield(match)
      result[match.begin(0)...match.end(0)] = replacement unless replacement.nil?
    end
    result
  end

  def annotate_full(text, entity)
    korean = FULL_FORMS.fetch(entity).map { |form| Regexp.escape(form.gsub('\\ ', ' ')) }
    pattern = /(?<![가-힣A-Za-z])(?<name>#{korean.join('|')})(?:\((?<label>[^()\r\n]*)\))?/
    canonical = DEFINITIONS.find { |definition| definition['entity_key'] == entity }
                            .fetch('korean_canonical').sub(/\([^)]+\)\z/, '')
    english = DEFINITIONS.find { |definition| definition['entity_key'] == entity }
                          .fetch('english_canonical')
    allowed = [english]
    allowed << 'Master Telemachus Rasp' if entity == 'person:telemachus-rasp'
    replace_spans(text, pattern) do |match|
      label = match[:label]
      raise "unexpected existing full-name annotation #{label.inspect}" if label && !allowed.include?(label)
      if label == 'Master Telemachus Rasp'
        match[0]
      else
        "#{canonical}(#{english})"
      end
    end
  end

  def short_embedded_in_full?(text, match, entity)
    before = text[0...match.begin(0)]
    after = text[match.end(0)..]
    case entity
    when 'person:stellan-reitan'
      after.match?(/\A\s+(?:레이탄|라이탄|라이턴)/)
    when 'person:telemachus-rasp'
      %w[라스프 랩].include?(match[:name]) &&
        before.match?(/(?:텔레마코스|텔레마쿠스)\s+\z/) ||
        %w[텔레마코스 텔레마쿠스].include?(match[:name]) &&
          after.match?(/\A\s+(?:라스프|랩)/)
    when 'person:calder-vonn'
      after.match?(/\A\s+본/)
    when 'person:sigra-thorin'
      after.match?(/\A\s+(?:소린|토린)/)
    else
      false
    end
  end

  def annotate_shorts(text, entity)
    variants = SHORT_FORMS.fetch(entity).keys.sort_by { |value| -value.length }
    alternatives = variants.map { |value| Regexp.escape(value) }.join('|')
    pattern = /(?<![가-힣A-Za-z])(?<name>#{alternatives})(?:\((?<label>[^()\r\n]*)\))?/
    aliases = SHORT_FORMS.fetch(entity)
    allowed = aliases.values
    replace_spans(text, pattern) do |match|
      next nil if short_embedded_in_full?(text, match, entity)
      label = match[:label]
      expected = aliases.fetch(match[:name])
      raise "unexpected existing short-name annotation #{label.inspect}" if label && !allowed.include?(label)
      # Keep the corrected full surname spelling when a known short-form typo
      # occurs in the same word family.
      korean = if entity == 'person:telemachus-rasp'
                 match[:name] == '텔레마쿠스' ? '텔레마코스' :
                   (match[:name] == '랩' ? '라스프' : match[:name])
               elsif entity == 'person:calder-vonn' && match[:name] == '캘더'
                 '칼더'
               else
                 match[:name]
               end
      "#{korean}(#{expected})"
    end
  end

  def transform(text, entity, key)
    if entity == 'person:stellan-reitan'
      if key == ['base', '2872', '11']
        raise 'source-supported Stellan journal title changed' unless
          text == '스텔란 레이탄의 일지 (The Journal of Stellan Reitan)'
        return text
      end
      if key == ['default', '9346', '']
        raise 'Stellan journal-title source changed' unless text == '스텔란 라이탄의 일지'
        return '스텔란 레이탄의 일지(The Journal of Stellan Reitan)'
      end
    elsif entity == 'person:telemachus-rasp'
      if key == ['default', '1280', '']
        raise 'Telemachus title label changed' unless
          text == '텔레마코스 라스프(Master Telemachus Rasp) 선생은 엄격하지만 공정해.'
        return text
      elsif key == ['default', '16052', '']
        source_span = '텔레마쿠스 랩(Telemachus Rasp)이 '
        raise 'Telemachus subject-particle source changed' unless text.include?(source_span)
        text = text.sub(source_span, '텔레마코스 라스프(Telemachus Rasp)가 ')
      end
    elsif entity == 'person:calder-vonn'
      if key == ['default', '31169', '']
        raise 'Lord Vonn title source changed' unless text.include?('본 경이라고')
        text = text.sub('본 경이라고', '본 경(Lord Vonn)이라고')
      elsif key == ['default', '55034', '']
        raise 'row-local Vonn short source changed' unless text.include?('본을 처치해야 해')
        text = text.sub('본을 처치해야 해', '본(Vonn)을 처치해야 해')
      end
    end

    text = annotate_full(text, entity)
    text = annotate_shorts(text, entity)
    raise "nested parentheses for #{entity}" if text.match?(/\([^()\r\n]*\(/)
    text
  end

  def definitions(hits)
    DEFINITIONS.map do |definition|
      keys = hits.select { |hit| hit['entity_key'] == definition['entity_key'] }
                 .map { |hit| row_key_string(M.key(hit)) }
      definition.merge('evidence_ids' => (['D-21105'] + keys).join('|'))
    end
  end

  def build_artifacts(inventory, glossary, index)
    definitions = DEFINITIONS.map(&:dup)
    raise 'D-21105 entity already registered' unless
      (definitions.map { |definition| definition['entity_key'] } &
       glossary.map { |row| row.fetch('entity_key') }).empty?

    hits = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = hits.group_by { |hit| hit['entity_key'] }.transform_values(&:length)
    expected_counts = EXPECTED_IDS.transform_values(&:length)
    raise "unexpected entity/source-key counts #{counts.inspect}" unless counts == expected_counts
    EXPECTED_IDS.each do |entity, expected|
      actual = hits.select { |hit| hit['entity_key'] == entity }
                    .map { |hit| row_key_string(M.key(hit)) }.to_set
      raise "unexpected exact source scope for #{entity}" unless actual == expected
    end

    reviews = hits.group_by { |hit| M.key(hit) }.map do |key, group|
      source = inventory.fetch(key)
      english, japanese, chinese = source_texts(source)
      raise "missing aligned EN/JA/ZH at #{key.inspect}" if
        english.empty? || japanese.empty? || chinese.empty?
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      group.map { |hit| hit.fetch('entity_key') }.uniq.sort.each do |entity|
        new_text = transform(new_text, entity, key)
        dispositions[entity] = new_text == old ? 'not-an-issue' : 'accepted'
      end
      evidence = group.map { |hit| EVIDENCE.fetch(hit.fetch('entity_key')) }.uniq.join(' ')
      evidence += " #{ROW_EVIDENCE[key]}" if ROW_EVIDENCE.key?(key)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'),
        'status' => dispositions.value?('accepted') ? 'accepted' : 'not-an-issue',
        'old' => old, 'new' => new_text, 'evidence' => evidence,
        'english' => english.join("\n"), 'japanese' => japanese.join("\n---\n"),
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by { |row| sort_key(row) }

    final_definitions = definitions(hits)
    ReviewedProperNameDiscovery.validate!(
      final_definitions, reviews, hits, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'unexpected row count' unless reviews.length == 45
    raise 'unapproved changed status' if reviews.any? do |row|
      row['old'] != row['new'] && row['status'] != 'accepted'
    end
    [final_definitions, reviews, hits]
  end

  def build
    raise 'D-21105 definitions output already exists' if File.exist?(DEFINITIONS_PATH)
    raise 'D-21105 review output already exists' if File.exist?(REVIEW_PATH)
    inventory = M.refresh_inventory
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    definitions, reviews, hits = build_artifacts(inventory, glossary, index)
    M.write_table(DEFINITIONS_PATH, definitions.first.keys, definitions)
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{hits.length} entity/source matches over #{reviews.length} rows; #{reviews.count { |row| row['old'] != row['new'] }} edits."
    puts hits.group_by { |hit| hit['entity_key'] }.transform_values(&:length).inspect
  end
end

FourPersonsD21105.build if $PROGRAM_NAME == __FILE__
