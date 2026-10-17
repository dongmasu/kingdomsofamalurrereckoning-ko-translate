#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module AmalurWorldD20950
  extend self

  M = ReviewedNameBatches
  ENTITY = 'place:amalur'
  GAME_TITLE = 'Kingdoms of Amalur: Re-Reckoning'
  KOREAN = '아말러(Amalur)'
  TITLE_ONLY_COUNT = 32
  WORLD_COUNT = 237

  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'Amalur',
    'category' => 'place',
    'korean_canonical' => KOREAN,
    'english_aliases' => '',
    'korean_variants' => '아말루르|아말루어|아마루르|아마러|아마라|아마룰|아말러',
    'evidence_ids' => 'D-20950-D-20955|official-manual:PDF1|official-manual:PDF8|official-korean-manual-reference.md',
    'status' => 'confirmed',
    'notes' => 'World/realm name, distinct from the game title Kingdoms of Amalur: Re-Reckoning. The official Korean manual uses 아말러 and labels a section 아말러의 세계; use 아말러(Amalur) for the named world. Rows containing only the game title are excluded; mixed default:31113 is reviewed for both the distinct world heading and game title. English is primary; Japanese アマラー and Chinese 阿玛拉 corroborate.'
  }.freeze

  TITLE_ONLY_EVIDENCE =
    'Excluded from the world entity because the English Amalur occurrence is only a component of the complete game title Kingdoms of Amalur: Re-Reckoning; the title was separately reviewed as game:kingdoms-of-amalur-re-reckoning in D-20948.'

  WORLD_EVIDENCE =
    'English uses Amalur as the world/realm, not as the game title. Japanese アマラー and Chinese 阿玛拉 corroborate the referent; the official Korean manual establishes 아말러 (PDF p. 1 and the 아말러의 세계 heading on PDF p. 8). Standardize every occurrence to 아말러(Amalur), preserving attached Korean particles. On default:31113, this disposition applies to the distinct world heading; the game title is separately indexed.'

  VARIANT =
    /(?:아말루어|아말루르|아마루르|아마러|아마라|아마룰|아말러)(?:\(Amalur\))?(?![:：]\s*리-?레코닝)/

  def title_only?(source)
    english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
    without_title = english.gsub(/Kingdoms of Amalur: Re-Reckoning/i, '')
    !without_title.match?(/(?<![A-Za-z])Amalur(?![A-Za-z])/i)
  end

  def transform(text)
    count = text.scan(VARIANT).length
    raise 'English world-name candidate has no matched Korean rendering' if count.zero?
    updated = text.gsub(VARIANT, KOREAN)
    [updated, count]
  end

  def recover_existing(proposals)
    reports = (20_950..20_955).map do |d|
      File.exist?(File.join(__dir__, "named-scope-review-D#{d}-20261015.md"))
    end
    next_d = reports.index(false)
    return if next_d.nil?
    M.run(proposals, 20_950 + next_d, nil)
  end

  def run
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    proposals = File.join(__dir__, 'proper-name-proposals-D20950.tsv')
    if glossary.any? { |row| row['entity_key'] == ENTITY }
      raise 'registered Amalur entity has no recovery proposal file' unless File.exist?(proposals)
      indexed = M.table(M::INDEX).count { |row| row['entity_key'] == ENTITY }
      raise "partial Amalur registration has #{indexed} keys, expected 269" unless indexed == 269
      return recover_existing(proposals)
    end
    raise "#{ENTITY} already has a review report" if
      File.exist?(File.join(__dir__, 'named-scope-review-D20950-20261015.md'))

    inventory = M.refresh_inventory
    raise "active Amalur candidate count changed: #{inventory.length}" unless inventory.length == 73_430
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end.select { |row| row['resource'] == 'default' }
    raise "expected 269 Amalur keys, got #{generated.length}" unless generated.length == 269

    title_only = generated.select { |row| title_only?(inventory.fetch(M.key(row))) }
    world_rows = generated.reject { |row| title_only?(inventory.fetch(M.key(row))) }
    raise "title-only/world split changed: #{title_only.length}/#{world_rows.length}" unless
      title_only.length == TITLE_ONLY_COUNT && world_rows.length == WORLD_COUNT
    raise 'mixed-title/world key missing' unless world_rows.any? { |row| row['ID_Linha'] == '31113' }

    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      current = source.fetch('work_text')
      if title_only.include?(match)
        new_text = current
        status = 'excluded'
        evidence = TITLE_ONLY_EVIDENCE
      else
        new_text, occurrences = transform(current)
        status = new_text == current ? 'not-an-issue' : 'accepted'
        evidence = "#{WORLD_EVIDENCE} Replaced #{occurrences} matched Korean occurrence(s) in this cell."
      end
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status,
        'old' => current, 'new' => new_text, 'evidence' => evidence,
        'english' => english.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by { |row| row['ID_Linha'].to_i }
    changed_world = reviews.count do |row|
      row['status'] == 'accepted' && row['old'] != row['new']
    end
    raise 'expected all 237 world keys to have a reviewed disposition' unless
      reviews.length == 269 &&
      reviews.count { |row| row['status'] == 'excluded' } == TITLE_ONLY_COUNT &&
      reviews.count { |row| %w[accepted not-an-issue].include?(row['status']) } == WORLD_COUNT
    raise 'Boarmasher must not be mistaken for Amalur' if
      reviews.find { |row| row['ID_Linha'] == '55823' }&.fetch('new')&.include?('아말러(Amalur)셔')

    index = M.table(M::INDEX)
    if index.any? { |row| row['entity_key'] == ENTITY }
      raise 'Amalur occurrence key already partially indexed'
    end
    M.write_table(
      glossary_path, glossary.headers,
      glossary.map(&:to_h) + [DEFINITION]
    )
    index_rows = index.map(&:to_h) + generated
    index_rows.sort_by! do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']]
    end
    M.write_table(M::INDEX, index.headers, index_rows)
    M.write_table(proposals, M::HEADERS, reviews)
    recover_existing(proposals)
    puts "Amalur: 269 keys; #{WORLD_COUNT} world/mixed; #{TITLE_ONLY_COUNT} game-title-only; changed #{changed_world} world cells; next checkpoint D-20956."
  end
end

AmalurWorldD20950.run if $PROGRAM_NAME == __FILE__
