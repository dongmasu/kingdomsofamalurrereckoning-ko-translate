#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module TheCrowsD20944
  extend self

  M = ReviewedNameBatches
  ENTITY = 'organization:the-crows'
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'The Crows',
    'category' => 'organization',
    'korean_canonical' => '크로우즈(The Crows)',
    'english_aliases' => 'Crows',
    'korean_variants' => '크로우(Crow)|크로우즈(Crows)|크로우들|크로우스|까마귀단|까마귀 팀',
    'evidence_ids' => 'D-20944-D-20946|default:266|default:299|default:744|default:18198|default:37880|default:39239|default:57726|default:62360',
    'status' => 'confirmed',
    'notes' => 'English identifies the Valor Arena organization in the reviewed team contexts; Japanese クロウズ and Chinese 鸦群/鸦群队 corroborate. Canonical team name is 크로우즈(The Crows); a singular member designation is 크로우(Crow). Six literal bird/poem references and the separate place title Road of Crows are excluded. Existing decisions about other entities in overlapping rows are not reopened; this pass changes only the bounded Crows team/member spans and two Korean subject particles. No PAK-derived evidence.'
  }.freeze

  NO_CHANGE_IDS = %w[
    266 296 1617 2176 2403 2691 2916 3016 3160 3524 3762 4045 4632
    4711 7063 11154 11643 11787 12118 12333 12617 13549 13837 13946
    15731 15954 16049 16592 16938 17948 18536 18682 21988 22390 32731
    34010 40787 41085 50258 51920 54427 57792 57947 58032 58314 62360
  ].freeze

  BARE_TEAM_IDS = %w[
    299 491 5070 2103 2199 6262 9629 9698 9873 10100 10699 14519 14536
    15406 17375 18198 21633 21694 29259 29262 30304 30504 30738 31180
    31189 31275 31328 31554 31758 31972 32328 32443 36178 36607 43599
    46767 47125 49063 56376 56447 56776 56779 57696 58393 63052 64187
    64810 20403
  ].freeze

  ROMANIZED_IDS = %w[7657 8393 29221 55406 60928 63486 63785].freeze

  CUSTOM = {
    '41' => [['크로우(Crows)는', '크로우즈(The Crows)는']],
    '53936' => [['크로우(Crows) 팀이', '크로우즈(The Crows) 팀이']],
    '23377' => [['크로우들(The Crows)', '크로우즈(The Crows)']],
    '8549' => [['크로우스는', '크로우즈(The Crows)는']],
    '8625' => [['크로우스가', '크로우즈(The Crows)가']],
    '9363' => [['크로우스에', '크로우즈(The Crows)에']],
    '19576' => [['크로우', '크로우즈(The Crows)']],
    '21248' => [['크로우들', '크로우즈(The Crows)']],
    '1457' => [['크로우는', '크로우즈(The Crows)는']],
    '21260' => [['크로우도', '크로우즈(The Crows)도']],
    '44413' => [['크로우들', '크로우즈(The Crows)']],
    '44736' => [['크로우들은', '크로우즈(The Crows)는']],
    '59582' => [['크로우 팀', '크로우즈(The Crows) 팀']],
    '38744' => [['크로우들이', '크로우즈(The Crows)가']],
    '44884' => [['크로우들의', '크로우즈(The Crows)의']],
    '59749' => [['크로우들의', '크로우즈(The Crows)의']],
    '25510' => [['까마귀 팀은', '크로우즈(The Crows)는']],
    '26379' => [['까마귀단의', '크로우즈(The Crows)의']],
    '23472' => [['까마귀단도', '크로우즈(The Crows)도']],
    '48578' => [['까마귀단이', '크로우즈(The Crows)가']],
    '60283' => [['까마귀단이', '크로우즈(The Crows)가']],
    '51438' => [['까마귀단(Crows)의', '크로우즈(The Crows)의']],
    '51497' => [['까마귀단(Crows)이라면', '크로우즈(The Crows)라면']],
    '55719' => [['까마귀(Crows) 팀은', '크로우즈(The Crows) 팀은']],
    '60253' => [['까마귀단(Crows) 두 명', '크로우즈(The Crows) 두 명']],
    '60388' => [['까마귀단(Crows)이', '크로우즈(The Crows)가']],
    '62103' => [['까마귀 팀이', '크로우즈(The Crows)가']],
    '744' => [
      ['크로우 네 명', '크로우(Crow) 네 명'],
      ['네 번째 크로우가', '네 번째 크로우(Crow)가']
    ],
    '20959' => [
      ['크로우가', '크로우(Crow)가'],
      ['크로우들이지', '크로우(Crow)들이지']
    ],
    '38382' => [['크로우는', '크로우(Crow)는']],
    '37880' => [
      ['크로우(Crows)로서', '크로우(Crow)로서'],
      ['크로우들을', '크로우즈(The Crows)를']
    ],
    '39239' => [['크로우즈(The Crows)이', '크로우즈(The Crows)가']],
    '57726' => [['크로우즈(The Crows)이', '크로우즈(The Crows)가']]
  }.freeze

  EXCLUDED = {
    '1905' => 'Literal crows chased from a tower; not the Arena team.',
    '6325' => 'Literal birds filling a city; not the Arena team.',
    '27627' => 'Crow appears in a poem as a bird; not the Arena team.',
    '48153' => 'Literal carrion crows; not the Arena team.',
    '57013' => 'Crow nest appears in a poem; not the Arena team.',
    '58000' => 'Literal wildlife description; not the Arena team.',
    '61810' => 'Separate named place Road of Crows; not the Arena team.'
  }.freeze

  def replace_once(text, before, after, key)
    count = text.scan(Regexp.new(Regexp.escape(before))).length
    raise "unexpected span count at #{key.inspect}: #{before.inspect}: #{count}" unless count == 1
    text.sub(before, after)
  end

  def expected_team_ids
    (NO_CHANGE_IDS + BARE_TEAM_IDS + ROMANIZED_IDS + CUSTOM.keys).uniq.sort_by(&:to_i)
  end

  def transform(key, text)
    id = key[1]
    return [text, 'excluded', EXCLUDED.fetch(id)] if EXCLUDED.key?(id)

    updated = text.dup
    if BARE_TEAM_IDS.include?(id)
      expected = { '5070' => 2, '9873' => 2, '18198' => 5, '20403' => 2 }.fetch(id, 1)
      pattern = /크로우즈(?!\()/
      raise "unexpected bare team spans at #{key.inspect}" unless updated.scan(pattern).length == expected
      updated.gsub!(pattern, '크로우즈(The Crows)')
    end
    if ROMANIZED_IDS.include?(id)
      updated = replace_once(updated, '크로우즈(Crows)', '크로우즈(The Crows)', key)
    end
    CUSTOM.fetch(id, []).each do |before, after|
      updated = replace_once(updated, before, after, key)
    end

    status = updated == text ? 'not-an-issue' : 'accepted'
    evidence = 'English identifies the Valor Arena team or an individual team-member designation in this exact context. Japanese and Chinese corroborate the named-team reading. Use 크로우즈(The Crows) for the team and 크로우(Crow) only for a singular member; preserve sentence meaning and attached Korean particles. Existing decisions for other entities in this cell are not reopened.'
    [updated, status, evidence]
  end

  def run
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    raise 'The Crows already registered' if glossary.any? { |row| row['entity_key'] == ENTITY }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end.select { |row| row['resource'] == 'default' }
    raise "unexpected English source-key count #{generated.length}" unless generated.length == 141
    raise 'team/exclusion partition does not cover all source keys' unless
      (expected_team_ids + EXCLUDED.keys).uniq.sort_by(&:to_i) ==
      generated.map { |row| row['ID_Linha'] }.uniq.sort_by(&:to_i)
    raise 'unexpected team-key count' unless expected_team_ids.length == 134
    raise 'unexpected exclusion-key count' unless EXCLUDED.length == 7

    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text, status, reason = transform(key, old)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => reason,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end.sort_by { |row| row.fetch('ID_Linha').to_i }

    raise 'review does not cover all source keys' unless reviews.length == 141
    raise 'unexpected changed team-key count' unless
      reviews.count { |row| row['status'] == 'accepted' } == 88
    raise 'unexpected excluded source-key count' unless
      reviews.count { |row| row['status'] == 'excluded' } == 7

    M.write_table(
      File.join(__dir__, 'proper-name-discovery-definitions-D20944.tsv'),
      glossary.headers,
      [DEFINITION]
    )
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-D20944.tsv'),
      M::HEADERS,
      reviews
    )
    puts "#{reviews.length} exact source keys; #{reviews.count { |row| row['status'] == 'accepted' }} edits; #{reviews.count { |row| row['status'] == 'not-an-issue' }} retained; #{reviews.count { |row| row['status'] == 'excluded' }} excluded"
  end
end

TheCrowsD20944.run if $PROGRAM_NAME == __FILE__
