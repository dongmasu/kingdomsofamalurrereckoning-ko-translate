#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareProperNameDiscoveryD21844
  extend self

  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21844.tsv')
  REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21844.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  TWELVE = 'person:aisling-twelve-fingers'
  THIRTEEN = 'person:aisling-thirteen-fingers'

  def definitions
    [
      {
        'entity_key' => TWELVE,
        'english_canonical' => 'Aisling Twelve Fingers',
        'category' => 'person',
        'korean_canonical' => '열두 손가락 에이슬링(Aisling Twelve Fingers)',
        'english_aliases' => 'Aisling Twelve-Fingers|Aisling',
        'korean_variants' => '열두 손가락 에이슬링|손가락 열두 개의 에이슬링|에이슬링(Aisling)|에이슬링',
        'evidence_ids' => 'base:4557:11|default:2503|default:26320|default:37200|default:48468',
        'status' => 'confirmed',
        'notes' => 'English identifies Aisling Twelve Fingers as the infamous swindler in the label, summary and Balethorpe tale. The tale spells the same name Aisling Twelve-Fingers and later uses the short form Aisling; Japanese 十二指のエイスリング and Chinese 十二指爱丝琳 corroborate the epithet and person. Use the already established Korean short name 에이슬링 and standardize the epithet as 열두 손가락. At default:26320, the short-name match is a homonym inside the distinct name Aisling Thirteen Fingers and is explicitly excluded for this person. Do not infer a relationship between the two people beyond the source statement that the modern person may have taken her name from the older one.'
      },
      {
        'entity_key' => THIRTEEN,
        'english_canonical' => 'Aisling Thirteen Fingers',
        'category' => 'person',
        'korean_canonical' => '열세 손가락 에이슬링(Aisling Thirteen Fingers)',
        'english_aliases' => '',
        'korean_variants' => "'열세 손가락' 아이슬링|열세 손가락 에이슬링|아이슬링",
        'evidence_ids' => 'default:26320',
        'status' => 'confirmed',
        'notes' => 'English identifies the modern Aisling Thirteen Fingers as a woman feared in the Almere Valley and explicitly contrasts her name with the older Aisling Twelve Fingers. Japanese 十三指のエイスリング and Chinese 十三指爱丝琳 corroborate the distinct epithet. Standardize the Korean display using the established 에이슬링 spelling and preserve the thirteen-finger distinction. Do not merge the two people or infer any relationship beyond the source statement that the modern person may have taken her name from the older one.'
      }
    ]
  end

  def pair_keys(rows)
    rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
  end

  def run
    [DEFINITIONS, REVIEWS,
     File.join(AUDIT, 'proper-name-edits-D21844.tsv'),
     File.join(AUDIT, 'named-scope-review-D21844-20261019.md'),
     File.join(AUDIT, 'named-scope-edit-addendum-D21844-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory
    definitions = self.definitions
    glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    terms = definitions.flat_map do |row|
      [row.fetch('english_canonical'), *row.fetch('english_aliases').split('|')]
    end
    glossary.each do |row|
      existing_terms = [row.fetch('english_canonical'), *row.fetch('english_aliases').to_s.split('|')]
      overlap = terms.product(existing_terms).find { |left, right| left.casecmp?(right) }
      raise "English term already owned by #{row.fetch('entity_key')}: #{overlap.first}" if overlap
    end

    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = [
      [TWELVE, 'base', '4557', '11'],
      [TWELVE, 'default', '2503', ''],
      [TWELVE, 'default', '26320', ''],
      [TWELVE, 'default', '37200', ''],
      [TWELVE, 'default', '48468', ''],
      [THIRTEEN, 'default', '26320', '']
    ].sort
    raise "unexpected generated person/source matches: #{pair_keys(generated).inspect}" unless
      pair_keys(generated) == expected

    by_key = generated.group_by { |row| M.key(row) }
    reviews = by_key.keys.sort_by do |resource, id, variant|
      [M::RESOURCES.index(resource), id.to_i, variant]
    end.map do |key|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = old.dup
      entities = by_key.fetch(key).map { |row| row.fetch('entity_key') }.sort
      dispositions = {}

      case key
      when ['base', '4557', '11']
        expected_old = '손가락 열두 개의 에이슬링(Aisling)'
        raise 'base:4557 Korean source changed' unless old.include?(expected_old)
        new_text.sub!(expected_old, '열두 손가락 에이슬링(Aisling Twelve Fingers)')
        dispositions[TWELVE] = 'accepted'
      when ['default', '2503', '']
        expected_old = '에이슬링(Aisling)의 이야기'
        raise 'default:2503 Korean source changed' unless old.include?(expected_old)
        new_text.sub!(expected_old, '에이슬링(Aisling Twelve Fingers)의 이야기')
        dispositions[TWELVE] = 'accepted'
      when ['default', '26320', '']
        expected_old = "'열세 손가락' 아이슬링"
        raise 'default:26320 Korean source changed' unless old.include?(expected_old)
        new_text.sub!(expected_old, '열세 손가락 에이슬링(Aisling Thirteen Fingers)')
        dispositions[THIRTEEN] = 'accepted'
        dispositions[TWELVE] = 'excluded'
      when ['default', '37200', '']
        expected_old = '열두 손가락 에이슬링(Aisling)'
        raise 'default:37200 Korean source changed' unless old.include?(expected_old)
        new_text.sub!(expected_old, '열두 손가락 에이슬링(Aisling Twelve Fingers)')
        dispositions[TWELVE] = 'accepted'
      when ['default', '48468', '']
        full_name = '열두 손가락 에이슬링(Aisling Twelve-Fingers)'
        raise 'default:48468 full-name introduction differs' unless
          new_text.sub!('열두 손가락 에이슬링입니다', "#{full_name}입니다")
        short_name_count = new_text.scan(/에이슬링(?!\()/).length
        raise "default:48468 short-name count differs: #{short_name_count}" unless
          short_name_count == 4
        new_text.gsub!(/에이슬링(?!\()/, '에이슬링(Aisling)')
        dispositions[TWELVE] = 'accepted'
      else
        raise "unplanned source key: #{key.inspect}"
      end

      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "missing English evidence at #{key.inspect}" if english.empty?
      raise "missing Japanese evidence at #{key.inspect}" if japanese.empty?
      evidence = case key
                 when ['default', '26320', '']
                   'English names the modern Aisling Thirteen Fingers and contrasts her with the older Aisling Twelve Fingers. Japanese 十三指のエイスリング and Chinese 十三指爱丝琳 support the distinct epithet. Standardize the complete Korean name as 열세 손가락 에이슬링(Aisling Thirteen Fingers); classify the overlapping short Aisling match for person:aisling-twelve-fingers as excluded in this exact row. Do not merge the people or infer more than the possible name inspiration stated by English.'
                 when ['default', '48468', '']
                   'English introduces Aisling Twelve-Fingers, then uses the short form Aisling for the same person throughout this tale. Japanese 十二指のエイスリング and Chinese 十二指爱丝琳 corroborate. Standardize the full introduction as 열두 손가락 에이슬링(Aisling Twelve-Fingers) and pair each later short Korean 에이슬링 as 에이슬링(Aisling); preserve all unrelated text and punctuation.'
                 else
                   'English names Aisling Twelve Fingers in this exact label or sentence. Japanese 十二指のエイスリング and Chinese 十二指爱丝琳 corroborate the same person and epithet. Use the consistent Korean form 열두 손가락 에이슬링 and pair the complete source name as 열두 손가락 에이슬링(Aisling Twelve Fingers), preserving surrounding wording and particles.'
                 end
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'),
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end

    raise 'expected five distinct reviewed source rows' unless reviews.length == 5
    raise 'expected five Texto edits' unless reviews.count { |row| row['old'] != row['new'] } == 5
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, definitions)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "D-21844 prepared: 2 people; #{generated.length} entity/source matches; " \
         "#{reviews.length} distinct rows; #{reviews.count { |row| row['old'] != row['new'] }} edits."
  end
end

PrepareProperNameDiscoveryD21844.run
