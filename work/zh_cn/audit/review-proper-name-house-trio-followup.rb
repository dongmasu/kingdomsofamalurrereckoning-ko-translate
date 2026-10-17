#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module HouseTrioFollowup
  M = ReviewedNameBatches
  ENTITY = 'faction:house-of-sorrows'
  PRIDE = 'faction:house-of-pride'
  VENGEANCE = 'faction:house-of-vengeance'
  REVIEW_OUT = File.join(__dir__, 'proper-name-reviewed-house-trio-followup.tsv')
  NEXT_D = 20827

  EXPECTED = (
    %w[568 732 911 3109 3403].map { |id| ['base', id, '11'] } +
    %w[
      873 2255 5171 5551 6106 13658 15644 16873 17745 21103 23793
      33088 35901 37265 40178 40199 41383 44017 44868 47103 48341
      48789 51365 52403 58325 59320 59654 61173 64884 65002
    ].map { |id| ['default', id, ''] }
  ).freeze

  HOUSE_ROWS = %w[15644 23793 58325 64884].freeze
  ACCEPTED_SORROW = %w[15644 58325 64884].freeze
  NOT_ISSUE_SORROW = %w[23793].freeze

  EXCLUSION_REASONS = {
    '568' => 'Sandals of Sorrow is a complete equipment title, not the House.',
    '732' => 'Gloves of Sorrow is a complete equipment title, not the House.',
    '911' => 'The standalone Sorrow equipment label is not the House.',
    '3109' => 'Robes of Sorrow is a complete equipment title, not the House.',
    '3403' => 'Crown of Sorrow is a complete equipment title, not the House.',
    '873' => "The widow's sorrow is ordinary grief.",
    '2255' => 'Sorrow Lord is a separate poetic character-title, not the House.',
    '5171' => 'Honored sorrow, broken pride, and due vengeance are abstract motives; the later House reference is distinct.',
    '5551' => 'Lady of Sorrow and Dust is a distinct personal title.',
    '6106' => 'The line uses sorrow for ordinary grief caused by beasts.',
    '13658' => 'Sweet sorrow describes a drink flavor and is not a faction.',
    '16873' => 'Lady of Sorrow and Dust is a distinct personal title.',
    '17745' => "The passage describes Lunala's grief, not the House.",
    '21103' => 'Resigned sorrow is an ordinary emotional state.',
    '33088' => 'The line uses sorrow for grief over a brother’s death.',
    '35901' => 'The sea of sorrow is a figurative image.',
    '37265' => 'The speaker explicitly describes ordinary grief at a death.',
    '40178' => 'Such Sweet Sorrow is a separate complete title.',
    '40199' => "Sorrow's Benefit is a separate complete title.",
    '41383' => 'The line concerns Delvers hearing magical sorrow, not the House faction.',
    '44017' => 'TEMP marks a developer placeholder about Pride and Sorrow returning.',
    '44868' => 'Sorrow is ordinary grief in a line about the separately named House of Vengeance.',
    '47103' => 'The speaker refers to ordinary grief after a brother’s death.',
    '48341' => 'The line describes years of ordinary grief.',
    '48789' => 'The speaker distinguishes melancholy and personal sorrow.',
    '51365' => 'Aligned Chinese uses 悲灵 for the magical force; the line does not name the House.',
    '52403' => 'Sorrow of our race is an abstract/magical force, distinct from the House.',
    '59320' => 'Death and sorrow are ordinary misfortunes attributed to Culn.',
    '59654' => 'Sapling of Sorrow is a separate item title.',
    '61173' => 'Sorrow Lord is a separate poetic character-title, not the House.',
    '65002' => 'The standalone label means sorrow, corroborated by Japanese 悲哀 and Chinese 悲伤.'
  }.freeze

  module_function

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def rewrite_text(id, old)
    case id
    when '15644', '64884'
      from = '복수와 긍지와 슬픔을 지나,'
      to = '복수의 집(House of Vengeance), 긍지의 집(House of Pride), 비탄의 집(House of Sorrows)을 지나,'
      raise "expected one house-list span at #{id}" unless old.scan(Regexp.new(Regexp.escape(from))).length == 1
      old.sub(from, to)
    when '58325'
      from = '비탄의 집과 긍지의 집(House of Pride), 복수의 집이'
      to = '비탄의 집(House of Sorrows), 긍지의 집(House of Pride), 복수의 집(House of Vengeance)이'
      raise "expected one house-list span at #{id}" unless old.scan(Regexp.new(Regexp.escape(from))).length == 1
      old.sub(from, to)
    else
      old
    end
  end

  def dispositions(id)
    return { ENTITY => 'excluded' } unless HOUSE_ROWS.include?(id)
    case id
    when '15644', '64884'
      { ENTITY => 'accepted', PRIDE => 'accepted', VENGEANCE => 'accepted' }
    when '23793'
      { ENTITY => 'not-an-issue', PRIDE => 'not-an-issue', VENGEANCE => 'not-an-issue' }
    when '58325'
      { ENTITY => 'accepted', PRIDE => 'not-an-issue', VENGEANCE => 'accepted' }
    end
  end

  def evidence(id, sources)
    if HOUSE_ROWS.include?(id)
      return 'The paired English references “Houses of Sorrow, Pride, and Vengeance” at default:23793 and default:58325 explicitly identify the same three Winter/Fae houses abbreviated in this list. Japanese ハウス・オブ・ソロー、プライド、ヴェンジェンス corroborates the faction reading. Apply the existing Korean canonicals once per house.'
    end
    "#{EXCLUSION_REASONS.fetch(id)} English: #{sources[0].gsub(/\s+/, ' ')[0, 280]} Japanese: #{sources[1].gsub(/\s+/, ' ')[0, 160]} Chinese: #{sources[2].gsub(/\s+/, ' ')[0, 160]} This hit is excluded from faction:house-of-sorrows; preserve the Korean cell."
  end

  def aggregate_status(old, new, per_entity)
    return 'accepted' unless old == new
    return 'uncertain' if per_entity.value?('uncertain')
    return 'excluded' if per_entity.values.all? { |status| status == 'excluded' }
    'not-an-issue'
  end

  def run
    raise "D-#{NEXT_D} artifacts already exist" if
      File.exist?(File.join(__dir__, "named-scope-review-D#{NEXT_D}-20261015.md"))

    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_text = File.binread(glossary_path).force_encoding('UTF-8')
      .gsub(/\r\n?|\n/, "\n")
    glossary_table = CSV.parse(glossary_text, headers: true, col_sep: "\t")
    glossary = glossary_table.map(&:to_h)
    entity = glossary.find { |row| row['entity_key'] == ENTITY } || raise('House of Sorrows glossary entry missing')
    aliases = entity.fetch('english_aliases').split('|')
    raise 'Sorrow alias missing from glossary' unless aliases.include?('Sorrow')
    collisions = glossary.reject { |row| row['entity_key'] == ENTITY }.any? do |row|
      ([row.fetch('english_canonical')] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp('Sorrow').zero? }
    end
    raise 'Sorrow alias collides with another glossary entity' if collisions

    generated = build_occurrences(inventory.values, glossary).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    candidates = generated.select do |row|
      row['entity_key'] == ENTITY &&
        row['english_source'].match?(/(?<![A-Za-z])Sorrow(?![A-Za-z])/i)
    end
    actual_keys = candidates.map { |row| row_key(row) }.sort
    raise "Sorrow source-key set changed: #{actual_keys.inspect}" unless
      actual_keys == EXPECTED.sort
    raise 'missing exclusion rationale' unless
      (EXPECTED.map { |key| key[1] } - HOUSE_ROWS - EXCLUSION_REASONS.keys).empty?

    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    target_keys = candidates.map { |row| [ENTITY, *row_key(row)] }
    missing = candidates.reject do |row|
      existing.include?([ENTITY, *row_key(row)])
    end
    index_by_key = index.to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row] }

    review_rows = candidates.map do |candidate|
      resource, id, variant = row_key(candidate)
      source = inventory.fetch([resource, id, variant])
      idispositions = dispositions(id)
      if HOUSE_ROWS.include?(id)
        [PRIDE, VENGEANCE].each do |entity_key|
          raise "related house occurrence missing #{entity_key} #{id}" unless
            index_by_key.key?([entity_key, resource, id, variant])
        end
      end
      old = source.fetch('work_text')
      new_text = rewrite_text(id, old)
      source_texts = [
        JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        source.fetch('zh_text')
      ]
      {
        'resource' => resource,
        'ID_Linha' => id,
        'Tipo_Variante' => variant,
        'entity_key' => idispositions.keys.join('|'),
        'status' => aggregate_status(old, new_text, idispositions),
        'old' => old,
        'new' => new_text,
        'evidence' => evidence(id, source_texts),
        'english' => source_texts[0],
        'japanese' => source_texts[1],
        'chinese' => source_texts[2],
        'entity_dispositions_json' => JSON.generate(idispositions)
      }
    end

    raise 'duplicate reviewed row key' unless
      review_rows.map { |row| row_key(row) }.uniq.length == review_rows.length
    raise 'duplicate new occurrence key' unless target_keys.uniq.length == target_keys.length
    review_rows.each do |row|
      raise 'non-accepted review changes text' if row['status'] != 'accepted' && row['old'] != row['new']
      ProperNameCellEditor.prepare(
        File.binread(M.csv_path(row.fetch('resource'))),
        row['status'] == 'accepted' ? [row] : []
      ) if row['status'] == 'accepted'
    end

    generated_by_key = generated.to_h do |row|
      [[row.fetch('entity_key'), *row_key(row)], row]
    end
    refreshed_index = index.map do |row|
      generated_row = generated_by_key[[row.fetch('entity_key'), *M.key(row)]]
      next row unless generated_row && row.fetch('entity_key') == ENTITY
      row.merge(
        'matched_english' => generated_row.fetch('matched_english'),
        'english_source' => generated_row.fetch('english_source'),
        'korean_current' => inventory.fetch(M.key(row)).fetch('work_text')
      )
    end
    refreshed_index.concat(missing)
    index_keys = refreshed_index.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'duplicate occurrence key after Sorrow registration' unless
      index_keys.uniq.length == index_keys.length

    entity['evidence_ids'] = (entity.fetch('evidence_ids').split('|') +
      ["D-#{NEXT_D}", 'default:15644', 'default:23793', 'default:58325', 'default:64884'])
      .uniq.join('|')
    entity['notes'] = 'English Sorrow is a context-specific alias for this House only in the parallel Houses of Sorrow, Pride, and Vengeance list. All other generic, magical-force, personal-title, and item-title hits are separately dispositioned.'
    M.write_table(File.join(__dir__, 'proper-name-glossary.tsv'), glossary_table.headers, glossary)
    M.write_table(M::INDEX, index_table.headers, refreshed_index)
    M.write_table(REVIEW_OUT, M::HEADERS + ['entity_dispositions_json'], review_rows)
    M.run(REVIEW_OUT, NEXT_D, nil,
          review_states: %w[needs-context uncertain excluded accepted not-an-issue])
  end
end

HouseTrioFollowup.run if $PROGRAM_NAME == __FILE__
