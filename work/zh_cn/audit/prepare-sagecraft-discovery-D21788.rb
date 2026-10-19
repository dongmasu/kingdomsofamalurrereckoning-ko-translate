#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module PrepareSagecraftDiscoveryD21788
  extend self

  M = ReviewedNameBatches
  ENTITY = 'skill:sagecraft'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-reviewed-D21788.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-reviewed-D21788.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  TOKEN = /(?<![A-Za-z0-9])(?:Sagecrafting|Sagecraft)(?![A-Za-z0-9])/i
  KO_TERM = /마법물품 제작|세공술|보석술/
  GENERAL_EVIDENCE = <<~TEXT.strip
    The official Korean manual extraction/reference identifies Sagecraft as the non-combat skill 마법물품 제작(Sagecraft) (PDF p. 4) and lists Sagecrafting as its English variation. English context distinguishes this named skill/crafting discipline from ordinary objects and generic crafts; Japanese 宝石術/セージクラフト and Chinese 附魔 support the same game system. Reuse the official Korean canonical form, pairing direct skill references with their source-attested English form. Preserve unrelated text, entities, tokens, particles and line breaks.
  TEXT
  OUT_OF_SKILL_SCOPE = {
    'base:3299' => 'Sagecraft Altar is a repeatable generic workstation, not the skill entity; D-21787 already verified this exact key without a translation edit.',
    'base:4438' => 'Hall of Sagecrafting may be a distinct venue. The isolated title and aligned localizations do not settle its referent; retain a separate place-discovery hold and exclude it from the skill entity.',
    'default:1820' => 'Sagecraft altar is a generic workstation reference, not a direct skill-name use.',
    'default:10315' => 'Sagecraft Altar is a generic workstation reference, not a direct skill-name use.',
    'default:12918' => 'Sagecraft altar is a generic workstation reference, not a direct skill-name use.',
    'default:13119' => 'Sagecraft Altar is a generic workstation reference, not a direct skill-name use.',
    'default:16205' => 'Sagecraft altar is a generic workstation reference, not a direct skill-name use.',
    'default:16989' => 'Sagecraft altar is a generic workstation reference, not a direct skill-name use. The existing Korean terminology is left unchanged in this name-only scope.',
    'default:18072' => 'Sagecrafting modifies the generic description of Cynoc’s Eye as a tool; it does not name the skill in this row.',
    'default:29299' => 'Sagecraft Altars are generic workstations; this UI label does not name the skill entity.',
    'default:30952' => 'Sagecrafting modifies the generic description of a relic; it does not name the skill in this row.',
    'default:33960' => 'Sagecrafting table is a generic workstation, not the skill entity.',
    'default:35602' => 'Sagecraft altar is a generic workstation reference, not a direct skill-name use.',
    'default:38217' => 'Sagecraft altar is a generic workstation reference, not a direct skill-name use.',
    'default:42991' => 'Sagecrafting Altars are generic workstations, not the skill entity.',
    'default:45713' => 'Sagecrafting modifies generic goods offered by a merchant; it does not name the skill in this row.',
    'default:46813' => 'Sagecraft altar is a generic workstation reference, not a direct skill-name use.',
    'default:48525' => 'Sagecraft Altars are generic workstations, not the skill entity.',
    'default:50880' => 'Sagecraft Altar is a repeatable generic workstation; D-21787 already verified this exact key without a translation edit.',
    'default:53167' => 'Sagecraft Altar is a generic workstation, not the skill entity; D-21787 already verified this exact key without a translation edit.',
    'default:60455' => 'Sagecrafting altar is a generic workstation reference, not a direct skill-name use.',
    'default:63998' => 'Sagecrafting workbench is a generic workstation, not the skill entity.'
  }.freeze

  def source_terms(row)
    JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
      .scan(/[A-Za-z]+/)
      .select { |token| %w[sagecraft sagecrafting].include?(token.downcase) }
  end

  def replacement(term)
    canonical = term.casecmp?('Sagecrafting') ? 'Sagecrafting' : 'Sagecraft'
    "마법물품 제작(#{canonical})"
  end

  def replace_aligned_terms(text, terms)
    targets = text.to_enum(:scan, KO_TERM).map { Regexp.last_match[0] }
    raise "source/translation occurrence count differs: source=#{terms.length}, Korean=#{targets.length}" unless
      targets.length == terms.length

    index = 0
    text.gsub(KO_TERM) do |match|
      term = terms.fetch(index)
      index += 1
      next match if Regexp.last_match&.post_match&.match?(/\A\(Sagecraft(?:ing)?\)/i)

      replacement(term)
    end
  end

  def translate(row, terms)
    key = M.key(row)
    scope_key = "#{key[0]}:#{key[1]}"
    old = row.fetch('work_text')
    if reason = OUT_OF_SKILL_SCOPE[scope_key]
      evidence = "#{reason} Preserve the active Korean text and prior entity/translation decisions; this is an exclusion from skill:sagecraft, not a reclassification of an earlier finding."
      return [old, 'excluded', evidence]
    end

    if key == ['base', '1905', '11']
      expected = '기술서(마법물품 제작)'
      raise 'D-21788 1905 Korean source text changed' unless old == expected
      return ['마법물품 제작(Sagecraft) 기술서', 'accepted', GENERAL_EVIDENCE]
    end

    if key == ['default', '20667', '']
      old_text = '마법물품 제작 실습 강의와 이론 심포지엄'
      new_text = '마법물품 제작(Sagecrafting) 실습 강의와 마법물품 제작(Sagecraft) 이론 심포지엄'
      raise 'D-21788 20667 Korean source text changed' unless old.include?(old_text)
      return [old.sub(old_text, new_text), 'accepted', GENERAL_EVIDENCE]
    end

    if key == ['default', '27791', '']
      old_text = '필요한 마법물품 제작 기술'
      new_text = '필요한 마법물품 제작(Sagecraft) 기술'
      raise 'D-21788 27791 Korean skill phrase changed' unless old.include?(old_text)
      return [old.sub(old_text, new_text), 'accepted', GENERAL_EVIDENCE]
    end

    if key == ['default', '56074', '']
      old_text = '마법물품 제작의 세 가지 체계'
      new_text = '마법물품 제작(Sagecraft)의 세 가지 체계'
      raise 'D-21788 56074 Korean skill phrase changed' unless old.include?(old_text)
      return [old.sub(old_text, new_text), 'accepted', GENERAL_EVIDENCE]
    end

    if %w[28090 32556 49520].include?(key[1]) && key[0] == 'default'
      matches = old.to_enum(:scan, KO_TERM).map { Regexp.last_match[0] }
      raise "D-21788 #{key[1]} expected a translated craft phrase" if matches.length < 2
      last = matches.length - 1
      index = -1
      updated = old.gsub(KO_TERM) do |match|
        index += 1
        index == last ? replacement(terms.last) : match
      end
      return [updated, 'accepted', GENERAL_EVIDENCE]
    end

    proposed = replace_aligned_terms(old, terms)
    status = proposed == old ? 'not-an-issue' : 'accepted'
    [proposed, status, GENERAL_EVIDENCE]
  end

  def run
    [DEFINITIONS, REVIEWS].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end
    inventory = M.refresh_inventory
    targets = inventory.values.each_with_object([]) do |row, result|
      terms = source_terms(row)
      result << [row, terms] unless terms.empty?
    end
    raise "expected 100 exact source keys, found #{targets.length}" unless targets.length == 100

    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Sagecraft',
      'category' => 'skill',
      'korean_canonical' => '마법물품 제작(Sagecraft)',
      'english_aliases' => 'Sagecrafting',
      'korean_variants' => '마법물품 제작|마법물품 제작(Sagecrafting)|세공술|보석술',
      'evidence_ids' => 'D-21788|official-manual:PDF4',
      'status' => 'confirmed',
      'notes' => GENERAL_EVIDENCE
    }
    reviews = targets.map do |row, terms|
      old = row.fetch('work_text')
      new_text, status, evidence = translate(row, terms)
      {
        'resource' => row.fetch('resource'),
        'ID_Linha' => row.fetch('ID_Linha'),
        'Tipo_Variante' => row['Tipo_Variante'].to_s,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => JSON.parse(row.fetch('en_texts_json')).compact.join("\n---\n"),
        'japanese' => JSON.parse(row.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => row.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    ReviewedProperNameDiscovery.validate!([definition], reviews, generated, glossary, index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'duplicate Sagecraft review key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    statuses = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise 'D-21788 must retain one unresolved Hall discovery hold outside skill registration' unless
      reviews.find { |row| M.key(row) == ['base', '4438', '11'] }&.fetch('status') == 'excluded'
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
    M.write_table(REVIEWS, REVIEW_HEADERS, reviews)
    puts "Prepared #{reviews.length} exact source keys: #{statuses.inspect}"
    puts "Prepared changed cells: #{reviews.count { |row| row.fetch('old') != row.fetch('new') }}"
  end
end

PrepareSagecraftDiscoveryD21788.run if $PROGRAM_NAME == __FILE__
