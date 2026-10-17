#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module TheWidowD21413
  extend self

  M = ReviewedNameBatches
  ENTITY = 'person:the-widow'
  ENGLISH = 'The Widow'
  KOREAN = '위도우(The Widow)'
  ENGLISH_PATTERN = /(?<![A-Za-z])The\s+Widow(?![A-Za-z])/i
  KOREAN_PATTERN = /(?:과부|미망인|위도우)(?:\s*\((?:The\s+)?Widow\))?/i
  CANDIDATES = '/private/tmp/proper-name-candidates-residual-D21412.tsv'
  GENERIC_WIDOW_KEYS = [['default', '28076', '']].freeze
  ATOMIC_TITLE_KEYS = [['default', '28024', '']].freeze
  MERCY_KEYS = [
    ['default', '7681', ''], ['default', '22205', ''], ['default', '29324', '']
  ].freeze

  def paths
    [
      File.join(__dir__, 'proper-name-discovery-definitions-D21413.tsv'),
      File.join(__dir__, 'proper-name-discovery-D21413.tsv')
    ]
  end

  def definition(glossary, scope)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then ENTITY
              when 'english_canonical' then ENGLISH
              when 'category' then 'person'
              when 'korean_canonical' then KOREAN
              when 'english_aliases' then ''
              when 'korean_variants'
                '과부|과부(The Widow)|미망인|위도우|위도우(Widow)'
              when 'evidence_ids'
                (['D-21413-D-21414'] + scope.map do |row|
                  M.key(row).reject(&:empty?).join(':')
                end).join('|')
              when 'status' then 'confirmed'
              when 'notes'
                'English identifies the legendary Summer Fae witch who leads the spiders in Webwood and attacks Canneroc. Japanese ウィドウ and Chinese 寡妇 corroborate the same character. Use the distinctive transliteration 위도우(The Widow), not the generic Korean noun 과부. This record covers the explicit source form The Widow only. Do not register Widow as a global English alias: standalone Widow also occurs as an ordinary spouse term and in the separate place Seven Widow Mine; review short forms contextually.'
              end
      [header, value]
    end
  end

  def prepare!
    abort "missing residual candidate list: #{CANDIDATES}" unless File.file?(CANDIDATES)
    candidate = M.table(CANDIDATES).find do |row|
      row['candidate_key'] == 'candidate:the widow'
    end
    abort 'The Widow residual candidate is missing' unless candidate
    residual_keys = candidate.fetch('source_context_keys').split('|')
    raise "expected 37 residual The Widow keys, got #{residual_keys.length}" unless
      residual_keys.length == 37
    raise 'duplicate residual The Widow source keys' unless residual_keys.uniq == residual_keys

    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    abort 'The Widow entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY }
    abort 'The Widow canonical already belongs to another entity' if
      glossary.any? do |row|
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .compact.any? { |term| term.casecmp?(ENGLISH) }
      end
    abort 'The Widow occurrence keys already exist' if
      index.any? { |row| row['entity_key'] == ENTITY }

    scoped = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json') || '[]').compact.any? do |text|
        text.match?(ENGLISH_PATTERN)
      end
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s]
    end
    actual_keys = scoped.map { |row| M.key(row).reject(&:empty?).join(':') }
    raise 'The Widow scope has duplicate source rows' unless
      actual_keys.uniq.length == scoped.length
    raise 'residual candidate keys are not in the refreshed source scope' unless
      (residual_keys - actual_keys).empty?
    raise "expected 92 complete The Widow source keys, got #{scoped.length}" unless
      scoped.length == 92

    reviews = scoped.map do |source|
      key = M.key(source)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      english_hits = english.to_enum(:scan, ENGLISH_PATTERN).count
      raise "missing aligned source locale at #{key.inspect}" if
        [english, japanese, chinese].any?(&:empty?)

      if GENERIC_WIDOW_KEYS.include?(key)
        status = 'excluded'
        new_text = old
        evidence = 'The aligned English refers to an unrelated ordinary widow grieving her dead lover, not the named Webwood spider-ruling Fae. Japanese and Chinese context confirms the ordinary bereavement sense. Exclude this homonym from person:the-widow and preserve the Korean.'
      elsif ATOMIC_TITLE_KEYS.include?(key)
        status = 'not-an-issue'
        new_text = old
        evidence = "The source is a complete named title already rendered with its full English title in parentheses; preserve the bilingual title atomically rather than nesting #{KOREAN} inside it. Japanese and Chinese support the same titled work."
      elsif MERCY_KEYS.include?(key)
        status = 'accepted'
        new_text = old.sub(/(?:과부|위도우)(?:\s*\(The Widow\))?의 자비(?:\(Widow's mercy\))?/,
                           '위도우의 자비(Widow\'s mercy)')
        raise "Widow's mercy span changed at #{key.inspect}" if new_text == old
        evidence = "This is the established invocation Widow's mercy, already paired with its complete English phrase. Standardize only its character-derived Korean form from 과부 to 위도우; do not nest a second English annotation. Japanese and Chinese support the same invocation."
      elsif key == ['default', '37517', '']
        status = 'accepted'
        new_text = old.sub(/과부의 분노(?:\(The Widow's Wrath\))?/,
                           '위도우의 분노(The Widow\'s Wrath)')
        raise 'Widow title span changed at default:37517' if new_text == old
        evidence = 'The complete title is already paired with its English source. Standardize its Korean character-name component from 과부 to 위도우 without nesting another annotation or changing the title.'
      else
        korean_matches = old.to_enum(:scan, KOREAN_PATTERN)
          .map { Regexp.last_match.dup }
        raise "missing bounded Korean Widow name at #{key.inspect}" if korean_matches.empty?
        new_text = old.dup
        korean_matches.reverse_each do |match|
          new_text[match.begin(0)...match.end(0)] = KOREAN
        end
        new_text.gsub!(/위도우\(The Widow\)(을|이|은|과|으로)/) do
          particle = {
            '을' => '를', '이' => '가', '은' => '는',
            '과' => '와', '으로' => '로'
          }.fetch(Regexp.last_match(1))
          "위도우(The Widow)#{particle}"
        end
        new_text.gsub!(/위도우\(The Widow\)([’'”"])(을|이|은|과|으로)/) do
          quote = Regexp.last_match(1)
          particle = {
            '을' => '를', '이' => '가', '은' => '는',
            '과' => '와', '으로' => '로'
          }.fetch(Regexp.last_match(2))
          "위도우(The Widow)#{quote}#{particle}"
        end
        status = new_text == old ? 'not-an-issue' : 'accepted'
        evidence = if status == 'accepted'
                     "English identifies the Webwood spider-ruling Summer Fae called The Widow. Japanese ウィドウ and Chinese 寡妇 corroborate the character. Normalize only Korean references to this named character as #{KOREAN}; preserve particles, title wording, unrelated names, line breaks, and opaque tokens. English full-name hits in this cell: #{english_hits}."
                   else
                     "The Korean already uses the canonical bilingual character form #{KOREAN}. Japanese ウィドウ and Chinese 寡妇 corroborate. No text change is needed."
                   end
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end

    definition_path, review_path = paths
    M.write_table(definition_path, glossary.headers, [definition(glossary, scoped)])
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    puts "Prepared D-21413-D-21414: #{reviews.length} complete The Widow keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}."
    puts "Changed rows: #{reviews.select { |row| row['old'] != row['new'] }.map { |row| M.key(row).reject(&:empty?).join(':') }.join(', ')}"
  end

  def apply!
    abort 'run prepare first; discovery TSVs are missing' unless paths.all? { |path| File.file?(path) }
    ReviewedProperNameDiscovery.run([*paths, '21413'])
  end
end

case ARGV.fetch(0, 'prepare')
when 'prepare'
  TheWidowD21413.prepare!
when 'apply'
  TheWidowD21413.apply!
else
  abort 'usage: review-the-widow-D21413.rb [prepare|apply]'
end
