#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module AdessaGaleNamesD20929
  extend self

  M = ReviewedNameBatches
  SPECS = [
    ['place:basilica-gnostra', 'Basilica Gnostra', '바실리카 그노스트라(Basilica Gnostra)',
     '노스트라 대성당|그노스트라 대성당|바실리카 노스트라|노스트라(Nostra) 대성당',
     'default:4493|default:33555|base:1577:11',
     'English names the Adessa scholarly institution and its building. Across the aligned corpus, Japanese ノーストラ教会堂 and Chinese 灵知大教堂 corroborate identity, not Korean spelling; individual source exceptions are noted separately. Retain the established source-traceable most frequent form 바실리카 그노스트라; prior sentence-level judgments are not recounted.'],
    ['place:domus-politica', 'Domus Politica', '도무스 폴리티카(Domus Politica)',
     '정치회관|정치의 도무스|도무스 폴리티카',
     'base:3252:11|default:22130|default:58238',
     'English names the Adessa political institution and its building, whose scribes maintain policy and diplomatic records. Japanese 公文書院 and Chinese 市政厅/多姆斯政府 corroborate identity. Reuse the clear majority 도무스 폴리티카.'],
    ['place:gale-crossing', 'Gale Crossing', '게일 크로싱(Gale Crossing)',
     '게일 교차로|게일 크로싱',
     'default:15778|default:3842|default:51150',
     'English names a settlement with residents, shops, a tavern, and nearby routes. Japanese ゲイル・クロッシング and Chinese 狂风路口 generally corroborate identity. Reuse the established majority 게일 크로싱, not a generic road junction.']
  ].freeze
  PATTERNS = {
    'place:basilica-gnostra' => /(?:노스트라\(Nostra\) 대성당|(?:그노스트라|노스트라) 대성당|바실리카 (?:그노스트라|노스트라))(?:\(Basilica Gnostra\))?/,
    'place:domus-politica' => /(?:도무스 폴리티카|정치의 도무스|정치회관)(?:\(Domus Politica\))?/,
    'place:gale-crossing' => /게일 (?:교차로|크로싱)(?:\(Gale Crossing\))?/
  }.freeze
  VOWEL_PARTICLES = {'은' => '는', '이' => '가', '을' => '를', '과' => '와', '으로' => '로'}.freeze
  CONSONANT_PARTICLES = {'는' => '은', '가' => '이', '를' => '을', '와' => '과', '로' => '으로'}.freeze

  def transform(text, entity, canonical)
    result = text.gsub(PATTERNS.fetch(entity), canonical)
    particles = entity == 'place:gale-crossing' ? CONSONANT_PARTICLES : VOWEL_PARTICLES
    particles.each do |old_particle, new_particle|
      result.gsub!(/#{Regexp.escape(canonical)}#{old_particle}(?=\s|[.,!?]|$)/,
                   "#{canonical}#{new_particle}")
    end
    result
  end

  def run
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    definitions = SPECS.map do |key, english, korean, variants, ids, evidence|
      {
        'entity_key' => key, 'english_canonical' => english, 'category' => 'place',
        'korean_canonical' => korean, 'english_aliases' => '',
        'korean_variants' => variants, 'evidence_ids' => "D-20929-D-20931|#{ids}",
        'status' => 'confirmed',
        'notes' => "#{evidence} The manual's PDF p. 1 setting and p. 7 quest/faction context do not provide direct spellings for these names. Its omission is not contrary evidence. English is primary; no PAK-derived evidence."
      }
    end
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    expected_counts = {'place:basilica-gnostra' => 48, 'place:domus-politica' => 36, 'place:gale-crossing' => 53}
    raise 'unexpected source counts' unless generated.group_by { |row| row['entity_key'] }.transform_values(&:length) == expected_counts
    entities = definitions.to_h { |row| [row.fetch('entity_key'), row] }
    reviews = generated.group_by { |row| M.key(row) }.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = []
      matches.each do |match|
        entity = entities.fetch(match.fetch('entity_key'))
        canonical = entity.fetch('korean_canonical')
        transformed = transform(text, entity.fetch('entity_key'), canonical)
        raise "unmatched Korean label #{key.inspect}" unless transformed.include?(canonical)
        dispositions[entity.fetch('entity_key')] = transformed == text ? 'not-an-issue' : 'accepted'
        text = transformed
        evidence << entity.fetch('notes')
      end
      if key == ['default', '31306', '']
        evidence << 'Source divergence: English and Japanese name Basilica Gnostra, but Chinese names the Babellos potion. Follow the unambiguous English place label, corroborated by Japanese and existing Korean; do not claim three-language agreement.'
      elsif key == ['default', '55891', '']
        evidence << 'Source divergence: all three locales name Gale Crossing, but Japanese adds Frostroot where English and Chinese say and beyond. The current Korean already follows the primary English list; normalize its name only, do not import Frostroot, and do not claim the complete lists agree.'
      end
      if key[0] == 'default' && %w[17583 33216].include?(key[1])
        evidence << 'The chapter heading embeds this place name. Preserve the chapter number/heading and normalize only the embedded venue name; do not classify the entire book/chapter title as a place.'
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => matches.map { |row| row['entity_key'] }.join('|'),
        'status' => old == text ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => text, 'evidence' => evidence.join(' '),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i, row['Tipo_Variante']] }
    raise 'unexpected distinct source keys' unless reviews.length == 136
    M.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D20929.tsv'), glossary.headers, definitions)
    M.write_table(File.join(__dir__, 'proper-name-discovery-D20929.tsv'), M::HEADERS, reviews)
    puts "#{definitions.length} definitions; #{generated.length} entity occurrences; #{reviews.length} distinct rows"
    puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
  end
end

AdessaGaleNamesD20929.run if $PROGRAM_NAME == __FILE__
