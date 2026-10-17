#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module PledgeshieldD21042
  M = ReviewedNameBatches
  ENTITY = 'title:pledgeshield'
  ENGLISH = 'Pledgeshield'
  KOREAN = '서약방패병'
  DEFINITION_PATH = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21042.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21042.tsv'
  ENGLISH_PATTERN = /\b(?<rank>Pledgeshields?)(?:[ \t]+(?<name>Livia Fenan|Fenan|Bolton|Grunberg|Dydyn|Zotikus|McGowan))?\b/i
  KOREAN_RANK_PATTERN = /(?<rank>서약방패병|서약방패|맹세방패|서약의 방패|플레지실드)(?<label>\(Pledgeshields?\))?/i
  COMPOUND_NAMES = {
    'Fenan' => %w[페난 페넌],
    'Bolton' => %w[볼턴 볼튼],
    'Grunberg' => %w[그룬베르크 그룬버그 그룬베르그],
    'Dydyn' => %w[디딘],
    'Zotikus' => %w[조티쿠스],
    'McGowan' => %w[맥고완],
    'Livia Fenan' => ['리비아 페난', '리비아 페넌']
  }.freeze

  module_function

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def final_consonant?(text)
    last = text.to_s[/[\p{Hangul}]\z/]
    return false unless last
    ((last.ord - 0xAC00) % 28) != 0
  end

  def correct_particle(name, particle)
    has_batchim = final_consonant?(name)
    liquid = name.to_s[/[\p{Hangul}]\z/].to_s.ord - 0xAC00
    liquid = liquid >= 0 && liquid % 28 == 8
    case particle
    when '을', '를' then has_batchim ? '을' : '를'
    when '이', '가' then has_batchim ? '이' : '가'
    when '은', '는' then has_batchim ? '은' : '는'
    when '과', '와' then has_batchim ? '과' : '와'
    when '으로', '로' then has_batchim && !liquid ? '으로' : '로'
    end
  end

  def compound_patch(old, rank_match, english_name)
    forms = COMPOUND_NAMES.fetch(english_name)
    form_pattern = forms.sort_by { |form| -form.length }
      .map { |form| Regexp.escape(form) }.join('|')
    parenthetical = "(?:\\((?:Pledgeshield[ \\t]+)?#{Regexp.escape(english_name)}\\))?"
    tail_pattern = /\A[ \t]+(?<korean_name>#{form_pattern})#{parenthetical}/i
    tail = old[rank_match.end(0)..].to_s
    name_match = tail.match(tail_pattern)
    raise "missing Korean compound name for Pledgeshield #{english_name}" unless name_match

    finish = rank_match.end(0) + name_match.end(0)
    korean_name = name_match[:korean_name]
    replacement = "#{KOREAN} #{korean_name}(Pledgeshield #{english_name})"
    particle_match = old[finish..].to_s.match(/\A(으로|[을를이가은는과와로])/)
    if particle_match
      corrected = correct_particle(korean_name, particle_match[1])
      if corrected && corrected != particle_match[1]
        finish += particle_match[1].length
        replacement += corrected
      end
    end
    [rank_match.begin(0), finish, replacement]
  end

  def generic_patch(old, rank_match, english_rank)
    replacement = "#{KOREAN}(#{english_rank})"
    korean_name = KOREAN
    finish = rank_match.end(0)
    plural_label = old[finish..].to_s.match(/\A(?<plural>들)\(Pledgeshields?\)/i)
    if plural_label
      finish += plural_label[0].length
      replacement += plural_label[:plural]
    end
    particle_match = old[finish..].to_s.match(/\A(으로|[을를이가은는과와로])/)
    if particle_match
      corrected = correct_particle(korean_name, particle_match[1])
      if corrected && corrected != particle_match[1]
        finish += particle_match[1].length
        replacement += corrected
      end
    end
    [rank_match.begin(0), finish, replacement]
  end

  def normalize(source, old)
    english = texts(source, 'en').join("\n")
    english_matches = english.to_enum(:scan, ENGLISH_PATTERN).map do
      match = Regexp.last_match
      [match[:rank], match[:name]]
    end
    korean_matches = old.to_enum(:scan, KOREAN_RANK_PATTERN).map do
      Regexp.last_match.dup
    end
    raise "rank/source occurrence count differs at #{source['ID_Linha']}: #{english_matches.length}/#{korean_matches.length}" unless
      english_matches.length == korean_matches.length

    patches = english_matches.zip(korean_matches).map do |(english_rank, english_name), match|
      if english_name
        compound_patch(old, match, english_name)
      else
        generic_patch(old, match, english_rank)
      end
    end
    updated = old.dup
    patches.sort_by(&:first).reverse_each do |start_at, finish, replacement|
      updated[start_at...finish] = replacement
    end
    updated
  end

  def run
    [DEFINITION_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    inventory = M.refresh_inventory.values
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'Pledgeshield title already registered' if glossary.any? do |row|
      row['entity_key'] == ENTITY ||
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .any? { |term| term.casecmp?(ENGLISH) || term.casecmp?('Pledgeshields') }
    end

    sources = inventory.select do |source|
      texts(source, 'en').any? do |text|
        text.match?(/(?<![A-Za-z])Pledgeshields?(?![A-Za-z])/i)
      end
    end.sort_by { |source| [M::RESOURCES.index(source['resource']), source['ID_Linha'].to_i] }
    raise "expected 105 source rows, found #{sources.length}" unless sources.length == 105

    definition = {
      'entity_key' => ENTITY, 'english_canonical' => ENGLISH,
      'category' => 'title', 'korean_canonical' => "#{KOREAN}(#{ENGLISH})",
      'english_aliases' => 'Pledgeshields',
      'korean_variants' => '서약방패|맹세방패|서약의 방패|플레지실드',
      'evidence_ids' => 'D-21042|default:44646|default:15257|default:53175',
      'status' => 'confirmed',
      'notes' => 'Formal Warsworn rank, not a person or the generic shield equipment term. English default:44646 explicitly defines the rank between Hireling and Oathblade; default:15257 and default:53175 show rank-based privileges and plural personnel counts. Japanese 二等傭兵 and Chinese 誓言之盾 corroborate the status. Use 서약방패병(Pledgeshield), with Pledgeshields as the English plural alias; when the source names a Pledgeshield and a person together, pair the complete compound once. The official Korean manual was checked but does not enumerate this rank.'
    }
    M.write_table(DEFINITION_PATH, glossary.headers, [definition])

    reviews = sources.map do |source|
      old = source.fetch('work_text')
      new_text = normalize(source, old)
      {
        'resource' => source.fetch('resource'), 'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s, 'entity_key' => ENTITY,
        'status' => old == new_text ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => new_text,
        'evidence' => 'English identifies the formal Warsworn rank Pledgeshield; default:44646 gives the Hireling/Pledgeshield/Oathblade progression, while aligned Japanese and Chinese corroborate the rank. Standardize Korean rank forms to 서약방패병 and pair the source singular/plural. For named rank-plus-person compounds, preserve the Korean personal form and use the complete English compound once. Correct only particles made obsolete by the canonical rank form; preserve all unrelated text and existing indexed dispositions.',
        'english' => texts(source, 'en').join("\n"),
        'japanese' => texts(source, 'ja').join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => (old == new_text ? 'not-an-issue' : 'accepted')),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    raise 'duplicate Pledgeshield source key' unless
      reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise 'unexpected Pledgeshield source span total' unless
      reviews.sum { |row| texts(inventory.find { |source| M.key(source) == M.key(row) }, 'en').join("\n").scan(ENGLISH_PATTERN).length } == 112
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} rows / 112 rank mentions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

PledgeshieldD21042.run if $PROGRAM_NAME == __FILE__
