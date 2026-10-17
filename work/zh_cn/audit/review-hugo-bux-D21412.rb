#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module HugoBuxD21412
  extend self

  M = ReviewedNameBatches
  ENTITY = 'person:hugo-bux'
  ENGLISH = 'Hugo Bux'
  SHORT_ENGLISH = 'Hugo'
  KOREAN_FULL = '휴고 벅스(Hugo Bux)'
  KOREAN_SHORT = '휴고(Hugo)'
  ENGLISH_PATTERN = /(?<![A-Za-z])Hugo(?:\s+Bux)?(?![A-Za-z])/i
  KOREAN_PATTERN = /휴고(?:\s+벅스)?(?:\s*\(Hugo(?:\s+Bux)?\))?/
  CANDIDATES = '/private/tmp/proper-name-candidates-residual-D21411.tsv'

  def paths
    [
      File.join(__dir__, 'proper-name-discovery-definitions-D21412.tsv'),
      File.join(__dir__, 'proper-name-discovery-D21412.tsv')
    ]
  end

  def definition(glossary)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then ENTITY
              when 'english_canonical' then ENGLISH
              when 'category' then 'person'
              when 'korean_canonical' then KOREAN_FULL
              when 'english_aliases' then SHORT_ENGLISH
              when 'korean_variants' then '휴고(Hugo)|휴고 벅스'
              when 'evidence_ids'
                'D-21412|default:1460|default:1517|default:7333|default:7343|default:11985|default:22068|default:25398|default:27356|default:37891|default:38656|default:42611|default:45362|default:45929|default:54658|default:55827|default:56631|default:58092|default:60540|default:61383'
              when 'status' then 'confirmed'
              when 'notes'
                'English identifies Hugo Bux as the refugee targeted by bullies in the camp story. Japanese ヒューゴ・バックス/ヒューゴ and Chinese 雨果·巴克斯/雨果 corroborate the full and short forms. All 19 English Hugo source rows were reviewed: use 휴고 벅스(Hugo Bux) for full-name references and 휴고(Hugo) for short references. Hugo is a source-wide alias only for this person; no unrelated person or generic word is merged. The official Korean manual has no direct entry for this DLC character.'
              end
      [header, value]
    end
  end

  def residual_keys!
    abort "missing residual candidate list: #{CANDIDATES}" unless File.file?(CANDIDATES)
    table = M.table(CANDIDATES)
    candidate = table.find { |row| row['candidate_key'] == 'candidate:hugo' }
    full_name = table.find { |row| row['candidate_key'] == 'candidate:hugo bux' }
    abort 'Hugo candidate is missing' unless candidate && full_name
    keys = candidate.fetch('source_context_keys').split('|')
    full_keys = full_name.fetch('source_context_keys').split('|')
    abort "expected 19 Hugo source keys, got #{keys.length}" unless keys.length == 19
    abort 'Hugo Bux keys are not a subset of Hugo keys' unless
      (full_keys - keys).empty? && full_keys.length == 8
    puts "Residual candidates: Hugo has #{keys.length} source keys, including all #{full_keys.length} full-name keys."
    keys
  end

  def prepare!
    expected_keys = residual_keys!
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    abort 'Hugo Bux entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY }
    abort 'Hugo or Hugo Bux English term already belongs to another entity' if
      glossary.any? do |row|
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .compact.any? { |term| [ENGLISH, SHORT_ENGLISH].any? { |name| term.casecmp?(name) } }
      end
    abort 'Hugo Bux occurrence keys already exist' if
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
    raise 'Hugo residual keys differ from refreshed source inventory' unless
      actual_keys.sort == expected_keys.sort
    raise 'Hugo scope changed or includes duplicate rows' unless
      scoped.length == 19 && actual_keys.uniq.length == 19
    raise 'Hugo scope is not entirely in default' unless
      scoped.all? { |row| row['resource'] == 'default' }

    reviews = scoped.map do |source|
      key = M.key(source)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      english_forms = english.to_enum(:scan, ENGLISH_PATTERN)
        .map { Regexp.last_match[0] }
      korean_matches = old.to_enum(:scan, KOREAN_PATTERN)
        .map { Regexp.last_match.dup }
      raise "Hugo/Korean occurrence count differs at #{key.inspect}" unless
        english_forms.length <= korean_matches.length && !english_forms.empty?
      extra_korean_refs = korean_matches.length - english_forms.length
      raise "unexpected Korean-only Hugo reference at #{key.inspect}" unless
        extra_korean_refs.zero? ||
        (key == ['default', '60540', ''] && extra_korean_refs == 1)
      raise "missing aligned locale evidence at #{key.inspect}" if
        [english, japanese, chinese].any?(&:empty?)

      new_text = old.dup
      korean_matches.each_with_index.to_a.reverse_each do |match, index|
        english_form = english_forms[index]
        canonical = english_form&.match?(/\bBux\b/i) ? KOREAN_FULL : KOREAN_SHORT
        new_text[match.begin(0)...match.end(0)] = canonical
      end
      status = new_text == old ? 'not-an-issue' : 'accepted'
      evidence = if status == 'accepted'
                   note = 'English identifies this refugee as Hugo Bux or the contextual short form Hugo. Japanese ヒューゴ・バックス/ヒューゴ and Chinese 雨果·巴克斯/雨果 corroborate the same person. Standardize full references as 휴고 벅스(Hugo Bux) and short references as 휴고(Hugo); preserve particles, line breaks, placeholders, and all unrelated names and text.'
                   note += ' Korean explicitly repeats Hugo once where the aligned English uses a pronoun; preserve and pair that same-person reference.' if extra_korean_refs.positive?
                   note
                 else
                   'The full or contextual short name already uses the established bilingual form for Hugo Bux. English and aligned Japanese/Chinese identify the same refugee; no text change is needed.'
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
    raise 'D-21412 preparation already exists' if paths.any? { |path| File.exist?(path) }
    M.write_table(definition_path, glossary.headers, [definition(glossary)])
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    puts "Prepared D-21412: #{reviews.length} person rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}."
    puts "Changed rows: #{reviews.select { |row| row['old'] != row['new'] }.map { |row| M.key(row).reject(&:empty?).join(':') }.join(', ')}"
  end

  def apply!
    abort 'run prepare first; discovery TSVs are missing' unless paths.all? { |path| File.file?(path) }
    ReviewedProperNameDiscovery.run([*paths, '21412'])
  end
end

case ARGV.fetch(0, 'prepare')
when 'prepare'
  HugoBuxD21412.prepare!
when 'apply'
  HugoBuxD21412.apply!
else
  abort 'usage: review-hugo-bux-D21412.rb [prepare|apply]'
end
