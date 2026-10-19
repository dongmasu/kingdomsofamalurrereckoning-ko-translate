#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewJuliaTamD21589
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_589
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'person:julia-tam'
  ENGLISH = 'Julia Tam'
  KOREAN = '줄리아 탐'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  EXPECTED_IDS = %w[1401 18279 20257 2945 34720].freeze
  EDIT_IDS = %w[20257 34720].freeze
  CONTEXT = <<~TEXT.chomp
    English identifies the full personal name Julia Tam in five default
    keys. Japanese ジュリア・タム and Chinese 茱莉亚·塔姆 corroborate the
    established Korean 줄리아 탐. Pair only the unpaired name at default:20257
    and objective at default:34720; the other three keys are already paired.
    Register Julia Tam as a distinct full-name entity, not as an alias or
    component of Bardan Tam. Do not create a global Tam alias or alter
    Bardan's existing decisions. The exact Julia Tam source name has no
    affix/base hits. The official Korean manual files have no direct entry.
    The D-21569 release ZIP is unchanged; proper-name discovery remains
    incomplete.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Julia Tam entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY } ||
      index.any? { |row| row['entity_key'] == ENTITY }

    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL,
      'category' => 'person',
      'english_aliases' => '',
      'korean_variants' => KOREAN,
      'evidence_ids' => "D-#{D}",
      'status' => 'confirmed',
      'notes' => "#{CONTEXT} Every occurrence was checked against aligned English, Japanese and Chinese across affix/base/default."
    }
    entity = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [entity]).map do |row|
      OCCURRENCE_HEADERS.zip(row).to_h
    end
    keys = generated.map { |row| M.key(row) }
    expected = EXPECTED_IDS.map { |id| ['default', id, ''] }
    raise "unexpected source keys: #{keys.inspect}" unless keys.sort == expected.sort
    raise 'unexpected non-default source hit' unless
      generated.all? { |row| row['resource'] == 'default' }

    reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese_text = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese_text = source.fetch('zh_text')
      raise "Japanese name evidence missing at #{key.inspect}" unless
        japanese_text.include?('ジュリア・タム')
      raise "Chinese name evidence missing at #{key.inspect}" unless
        chinese_text.include?('茱莉亚·塔姆')
      raise "English name evidence missing at #{key.inspect}" unless
        english_text.include?(ENGLISH)
      raise "Korean name occurrence is ambiguous at #{key.inspect}" unless
        old.scan(/줄리아 탐(?:\(Julia Tam\))?/).length == 1

      already_paired = old.include?(CANONICAL)
      updated = already_paired ? old : old.sub(KOREAN, CANONICAL)
      raise "unexpected paired state at #{key.inspect}" unless
        already_paired == !EDIT_IDS.include?(key[1]) &&
        (old == updated) == already_paired

      status = old == updated ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => updated,
        'evidence' => CONTEXT,
        'english' => english_text, 'japanese' => japanese_text,
        'chinese' => chinese_text,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    raise 'unexpected edit count' unless
      reviews.count { |row| row['old'] != row['new'] } == EDIT_IDS.length

    R.validate!([entity], reviews, generated, glossary.map(&:to_h),
                index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), edits)
    puts "D-#{D}: one full personal name, five keys, two Texto edits; prepare only."
    [glossary.headers, entity, reviews]
  end

  def apply
    if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
      raise 'only one prepared discovery artifact exists' unless
        [DEFINITIONS, REVIEWS].all? { |path| File.exist?(path) }
      headers = M.table(DEFINITIONS).headers
      entity = M.table(DEFINITIONS).map(&:to_h)
      reviews = M.table(REVIEWS).map(&:to_h)
    else
      headers, entity, reviews = prepare
      M.write_table(DEFINITIONS, headers, [entity])
      M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    end
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Julia Tam Full-Name Pairing

      #{CONTEXT}
      Registered Julia Tam independently from Bardan Tam and reviewed all
      five aligned source keys. Corrected default:20257 and 34720; left
      already-paired default:1401, 18279 and 2945 unchanged.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewJuliaTamD21589.prepare
  when ['apply'] then ReviewJuliaTamD21589.apply
  else abort 'usage: review-julia-tam-D21589.rb [prepare|apply]'
  end
end
