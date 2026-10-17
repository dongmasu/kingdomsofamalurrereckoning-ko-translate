#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module HelmgardD21006
  extend self
  M = ReviewedNameBatches
  PLACE = 'place:helmgard-keep'
  TITLE = 'title:coming-to-helmgard'
  PLACE_LABEL = '헬름가드 요새(Helmgard Keep)'
  SHORT_LABEL = '헬름가드(Helmgard)'
  TITLE_LABEL = '헬름가드로 가는 길(Coming to Helmgard)'
  EN_NAME = /\bHelmgard\b(?:\s+Keeps?\b)?/i
  KO_NAME = /헬름가드(?:\s*\((?:Helmgard|Helmgard Keep)\))?(?:\s*(?:요새|성채|킵))?(?:\s*\((?:Helmgard|Helmgard Keep)\))?/
  OPAQUE = /\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/
  TITLE_KEY = ['base', '1720', '11'].freeze
  OMITTED_REPEAT_KEY = ['default', '9244', ''].freeze

  DEFS = [
    {
      'entity_key' => PLACE, 'english_canonical' => 'Helmgard Keep',
      'category' => 'place', 'korean_canonical' => PLACE_LABEL,
      'english_aliases' => 'Helmgard',
      'korean_variants' => '헬름가드|헬름가드(Helmgard)|헬름가드 요새|헬름가드 성채|헬름가드 킵',
      'evidence_ids' => 'D-21006|base:2489:11|default:12356|default:50844',
      'status' => 'confirmed',
      'notes' => 'English identifies Helmgard Keep and short Helmgard as the same Warsworn stronghold; use the complete atomic label for English mentions that include Keep(s), and the locally short 헬름가드(Helmgard) for short English mentions. Japanese ヘルムガード砦 and Chinese 赫尔姆加德要塞 corroborate the full place; short-name rows retain their local source form and are never expanded merely because this alias is registered. Coming to Helmgard is a separate complete title, not a nested place label. Castellan/Curate of Helmgard Keep, the command/base/cells of Helmgard, and Helmgard Keep contracts are descriptive compounds, not separately inferred named entities. Official Korean manual context was checked, but it does not directly name Helmgard and is not a spelling source.'
    },
    {
      'entity_key' => TITLE, 'english_canonical' => 'Coming to Helmgard',
      'category' => 'title', 'korean_canonical' => TITLE_LABEL,
      'english_aliases' => '',
      'korean_variants' => '헬름가드로 가는 길',
      'evidence_ids' => 'D-21006|base:1720:11',
      'status' => 'confirmed',
      'notes' => 'The standalone base title Coming to Helmgard is kept atomic and separate from the place entity; do not nest Helmgard(Helmgard) inside its Korean title. Japanese ヘルムガードへの到着 and Chinese 来到赫尔姆加德 support the complete title meaning. Official Korean manual context was checked, but it does not directly name this title and is not a spelling source.'
    }
  ].freeze

  def text_list(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def matches(text, pattern)
    text.to_enum(:scan, pattern).map { Regexp.last_match[0] }
  end

  def glossary_terms(glossary)
    glossary.flat_map do |row|
      [row.fetch('english_canonical')] + row.fetch('english_aliases', '').to_s.split('|')
    end.reject(&:empty?).map(&:downcase)
  end

  def verify_unregistered!(glossary)
    existing = glossary_terms(glossary)
    DEFS.each do |definition|
      terms = [definition.fetch('english_canonical')] +
        definition.fetch('english_aliases', '').to_s.split('|')
      collision = terms.reject(&:empty?).find { |term| existing.include?(term.downcase) }
      raise "Helmgard term already registered: #{collision}" if collision
    end
  end

  def transform(old, english, key)
    if key == TITLE_KEY
      raise 'unexpected Coming to Helmgard source title' unless
        english.strip == 'Coming to Helmgard'
      raise 'unexpected Korean title span' unless
        old.scan(/헬름가드로 가는 길(?:\s*\(Coming to Helmgard\))?/).length == 1

      updated = old.sub(
        /헬름가드로 가는 길(?:\s*\(Coming to Helmgard\))?/,
        TITLE_LABEL
      )
      return [updated, { PLACE => 'excluded',
                         TITLE => updated == old ? 'not-an-issue' : 'accepted' }]
    end

    en_mentions = matches(english, EN_NAME)
    ko_mentions = matches(old, KO_NAME)
    raise "missing English Helmgard name #{key.inspect}" if en_mentions.empty?
    if key == OMITTED_REPEAT_KEY
      raise 'default:9244 alignment changed' unless
        en_mentions == ['Helmgard Keep', 'Helmgard'] &&
        ko_mentions == ['헬름가드 요새']
      en_mentions = en_mentions.first(ko_mentions.length)
    elsif en_mentions.length != ko_mentions.length
      raise "English/Korean Helmgard mention count differs #{key.inspect}: " \
        "#{en_mentions.length} vs #{ko_mentions.length}"
    end

    mention_index = 0
    updated = old.gsub(KO_NAME) do
      source_name = en_mentions.fetch(mention_index) do
        raise "unmatched Korean Helmgard span #{key.inspect}"
      end
      mention_index += 1
      source_name.match?(/\bKeep/i) ? PLACE_LABEL : SHORT_LABEL
    end
    raise "unconsumed English Helmgard mention #{key.inspect}" unless
      mention_index == en_mentions.length
    raise "missing transformed Korean Helmgard #{key.inspect}" unless
      updated.include?(PLACE_LABEL) || updated.include?(SHORT_LABEL)
    raise "opaque token or line break changed #{key.inspect}" unless
      old.scan(OPAQUE) == updated.scan(OPAQUE) &&
      old.scan(/\r\n|\r|\n/) == updated.scan(/\r\n|\r|\n/)

    disposition = updated == old ? 'not-an-issue' : 'accepted'
    [updated, { PLACE => disposition }]
  end

  def row_evidence(key, english, japanese, chinese)
    note = 'English identifies the same Helmgard Warsworn stronghold; aligned Japanese and Chinese are recorded as row evidence and corroborate the place context. Normalize only the explicit Korean Helmgard span: full English Keep(s) receives 헬름가드 요새(Helmgard Keep), while short English Helmgard remains 헬름가드(Helmgard). All particles, surrounding wording, punctuation, and line breaks are preserved.'
    case key
    when TITLE_KEY
      'This is the standalone Coming to Helmgard title, not a request to visit the place as ordinary prose. Preserve it atomically as 헬름가드로 가는 길(Coming to Helmgard), supported by Japanese ヘルムガードへの到着 and Chinese 来到赫尔姆加德; do not nest the place label.'
    when ['default', '13436', '']
      note += ' In “Kandrian and Helmgard Keeps,” both Korean place nouns are explicit; normalize only the Helmgard member to the full singular canonical display, leaving Kandrian and the coordination intact.'
    when ['default', '9244', ''], ['default', '26441', '']
      note += ' English repeats short Helmgard after Helmgard Keep. Korean default:9244 omits that redundant second mention, so no text is added; default:26441 preserves both source-aligned Korean mentions with full then short labels.'
    when ['default', '10209', '']
      note += ' Helmgard is coordinated as one member of a list of three Warsworn Keeps, but the source-local name is short; retain the short bilingual form rather than expanding it.'
    when ['default', '32891', '']
      note += ' The source is a roster containing roles at Helmgard Keep; normalize the place spans only and do not register Castellan/Curate role phrases as separate titles.'
    when ['default', '44870', ''], ['default', '58544', '']
      note += ' “Command at/of Helmgard” describes the authority associated with the place; preserve the complete local command wording and annotate only its Helmgard component.'
    end
    note
  end

  def run(mode)
    inventory = M.refresh_inventory
    glossary_table = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    verify_unregistered!(glossary_table.map(&:to_h))
    generated = build_occurrences(inventory.values, DEFS).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    place_rows = generated.select { |row| row['entity_key'] == PLACE }
    title_rows = generated.select { |row| row['entity_key'] == TITLE }
    grouped = generated.group_by { |row| M.key(row) }
    raise "Helmgard distinct source scope changed: #{grouped.length}" unless
      grouped.length == 68
    raise "Helmgard place source scope changed: #{place_rows.length}" unless
      place_rows.length == 68
    raise "Coming to Helmgard title scope changed: #{title_rows.length}" unless
      title_rows.length == 1 && M.key(title_rows.first) == TITLE_KEY
    distribution = grouped.keys.group_by(&:first).transform_values(&:length)
    raise "Helmgard resource distribution changed: #{distribution.inspect}" unless
      distribution == { 'base' => 2, 'default' => 66 }

    reviews = grouped.map do |key, matches_for_key|
      source = inventory.fetch(key)
      english = text_list(source, 'en').join("\n")
      japanese = text_list(source, 'ja').join("\n")
      chinese = source.fetch('zh_text').to_s
      old = source.fetch('work_text')
      updated, states = transform(old, english, key)
      entities = matches_for_key.map { |row| row.fetch('entity_key') }.sort
      dispositions = states.select { |entity, _| entities.include?(entity) }
      raise "unreviewed Helmgard entity #{key.inspect}" unless
        dispositions.keys.sort == entities
      raise "source tokens/newlines changed #{key.inspect}" unless
        old.scan(OPAQUE) == updated.scan(OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == updated.scan(/\r\n|\r|\n/)
      status = if updated != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => entities.join('|'),
        'status' => status, 'old' => old, 'new' => updated,
        'evidence' => row_evidence(key, english, japanese, chinese),
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i,
       row['Tipo_Variante']]
    end

    definitions = File.join(__dir__, 'proper-name-discovery-definitions-D21006.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D21006.tsv')
    M.write_table(definitions, glossary_table.headers, DEFS)
    M.write_table(proposals, M::HEADERS, reviews)
    puts "Helmgard: #{grouped.length} distinct keys, #{generated.length} entity matches; " \
      "#{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    puts reviews.select { |row| row['old'] != row['new'] }
      .map { |row| "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}" }
    if mode == 'apply'
      ReviewedProperNameDiscovery.run([definitions, proposals, '21006'])
    elsif mode != 'prepare'
      abort 'usage: review-helmgard-D21006.rb [prepare|apply]'
    end
  end
end

HelmgardD21006.run(ARGV.fetch(0, 'prepare')) if $PROGRAM_NAME == __FILE__
