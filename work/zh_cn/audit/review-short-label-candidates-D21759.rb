#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21759
  extend self

  M = ReviewedNameBatches
  D = 21_759
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21758.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  HIRELING_KEY = 'title:warsworn-hireling'
  HIRELING = {
    key: HIRELING_KEY,
    english: 'Hireling',
    category: 'title',
    korean: '고용병(Hireling)',
    variants: '고용병|고용 용병|고용인|용병|고용병(Hireling)',
    count: 43,
    notes: 'English default:44646 explicitly places Hireling as the entry rank below Pledgeshield and Oathblade; the existing title:pledgeshield record independently describes this Warsworn rank progression. Japanese commonly renders the rank as 三等傭兵 or 見習い傭兵; Chinese uses 雇佣兵. Use the established Korean 고용병(Hireling), distinguishing this formal Warsworn rank from a generic hired mercenary. The official Korean manual names Warsworn but does not enumerate its ranks. Preserve already complete rank-plus-person labels atomically.'
  }.freeze

  GROUPS = {
    'Hireling' => {
      expected_keys: 43,
      evidence: HIRELING.fetch(:notes)
    },
    'Hoplon' => {
      expected_keys: 2,
      evidence: 'Hoplon denotes a generic round shield class, not a unique named item. Japanese ホプロン supports the equipment term; Chinese 大圆盾 identifies the shield type. Keep the existing Korean transliteration and description; do not add a unique-item entry.'
    },
    'Ice Wolf' => {
      expected_keys: 3,
      disposition: 'uncertain',
      evidence: 'English says a ranged hit summons an Ice Wolf and later refers to “your Ice Wolf”; Japanese アイス・ウルフ and Chinese 冰狼 corroborate the creature wording. These rows do not determine whether this is a generic summoned creature type, a named summon, or a gameplay skill/effect. Preserve all Korean cells and do not register a monster or skill.'
    }
  }.freeze

  def row_key(row)
    M.key(row)
  end

  def source_term?(source, term)
    JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
      text.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
    end
  end

  def candidate_keys(candidate)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |key| key.map(&:to_s) }
    end.uniq.sort
  end

  def definition
    {
      'entity_key' => HIRELING.fetch(:key),
      'english_canonical' => HIRELING.fetch(:english),
      'category' => HIRELING.fetch(:category),
      'korean_canonical' => HIRELING.fetch(:korean),
      'english_aliases' => '',
      'korean_variants' => HIRELING.fetch(:variants),
      'evidence_ids' => "D-#{D}",
      'status' => 'confirmed',
      'notes' => HIRELING.fetch(:notes)
    }
  end

  def full_source_keys(inventory, term)
    pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
    inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern) }
    end.map { |row| row_key(row) }.uniq.sort
  end

  def transform_hireling(key, text, source)
    raise "English Hireling source missing at #{key.inspect}" unless source_term?(source, 'Hireling')
    return [text, false] if text.include?('고용병(Hireling)')
    if key == ['default', '52717', ''] && text.include?('고용병 폴모릭(Hireling Folmoric)')
      return [text, false]
    end
    replacement = if text.include?('고용 용병')
                    ['고용 용병', '고용병(Hireling)']
                  elsif text.include?('고용인')
                    ['고용인', '고용병(Hireling)']
                  elsif text.include?('고용병')
                    ['고용병', '고용병(Hireling)']
                  elsif text.include?('용병')
                    ['용병', '고용병(Hireling)']
                  end
    raise "unmapped Korean Hireling rank at #{key.inspect}: #{text}" unless replacement
    old, new_text = replacement
    raise "expected one Korean rank span at #{key.inspect}" unless text.scan(old).length == 1
    [text.sub(old, new_text), false]
  end

  def transform(term, key, text, source)
    return transform_hireling(key, text, source) if term == 'Hireling'
    raise "English source missing for #{term} at #{key.inspect}" unless source_term?(source, term)
    [text, false]
  end

  def build_short_label_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| row_key(row) }
    reviews = GROUPS.flat_map do |term, decision|
      candidate = candidates.fetch(term) { raise "candidate missing: #{term}" }
      keys = candidate_keys(candidate) | full_source_keys(inventory, term)
      raise "#{term} key count differs: #{keys.length}" unless keys.length == decision.fetch(:expected_keys)
      keys.map do |key|
        source = inventory.fetch(key)
        raise "English candidate missing at #{key.inspect}" unless source_term?(source, term)
        old = source.fetch('work_text')
        proposed, = transform(term, key, old, source)
        disposition = if term == 'Ice Wolf'
                        'uncertain'
                      elsif proposed != old
                        'accepted'
                      else
                        'not-an-issue'
                      end
        prior = prior_by_key.fetch(key, []).map do |row|
          [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
        end
        {
          'english_candidate' => term,
          'disposition' => disposition,
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => old,
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(prior)
        }
      end
    end
    keys = reviews.map { |row| row_key(row) }
    raise "D-#{D} exceeds 50 distinct source keys: #{keys.uniq.length}" if keys.uniq.length > 50
    raise 'duplicate candidate/key disposition' unless
      reviews.map { |row| [row.fetch('english_candidate'), *row_key(row)] }.uniq.length == reviews.length
    raise 'candidate source-key overlap' unless keys.uniq.length == keys.length
    reviews
  end

  def build_discovery_reviews(inventory)
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Hireling occurrence count differs: #{generated.length}" unless
      generated.length == HIRELING.fetch(:count)
    generated.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i] }.map do |occurrence|
      key = row_key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text, = transform_hireling(key, old, source)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => HIRELING_KEY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => HIRELING.fetch(:notes),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(HIRELING_KEY => status)
      }
    end
  end

  def append_summary(reviews)
    counts = reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    note = <<~TEXT

      ## D-#{D}: Hireling Rank, Hoplon, And Ice Wolf

      Reviewed 48 exact source keys across Hireling, Hoplon, and Ice Wolf,
      including full-source checks beyond the bounded candidate snapshot.
      Registered Hireling as the formal Warsworn entry rank `title:warsworn-hireling`;
      default:44646 gives the Hireling/Pledgeshield/Oathblade progression, and
      the existing Pledgeshield record confirms this hierarchy. Standardized
      38 rank spans as 고용병(Hireling); five rows were already fully paired
      or preserved as complete rank-plus-person labels. Hoplon is a generic
      shield type, not a unique item. Ice Wolf's summoned-creature versus
      skill/effect identity remains uncertain, so its three rows are unchanged.
      Prior row-level translation findings and other entity decisions were
      preserved and not recounted. Candidate disposition counts:
      #{counts.inspect}. Exact aligned evidence is in
      `proper-name-short-label-dispositions-D#{D}.tsv`; rank edits are in
      `proper-name-edits-D#{D}.tsv`.
      Full proper-name discovery/residual validation remains incomplete.
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
  end

  def refresh_checkpoint(candidates)
    next_candidate = candidates.first&.fetch('english_candidate', 'none')
    line = "Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{candidates.length} bounded groups; begins `#{next_candidate}`; not exhaustive or a completion estimate)."
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    (M::DOCS + [report, addendum]).uniq.each do |path|
      text = File.read(path)
      text.sub!(/Next batch: D-#{D + 1};.*?\n/, "#{line}\n") ||
        raise("missing D-#{D + 1} checkpoint in #{path}")
      File.write(path, text)
    end
  end

  def run
    raise "D-#{D} outputs already exist" if
      [OUTPUT, SNAPSHOT, DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    before = M.hashes
    raise 'Hireling rank is already owned by a glossary entry' if glossary.any? do |row|
      row.fetch('entity_key') == HIRELING_KEY ||
        ([row.fetch('english_canonical')] + row.fetch('english_aliases', '').to_s.split('|'))
          .any? { |term| term.casecmp?('Hireling') }
    end
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    short_reviews = build_short_label_reviews(inventory, index, candidates)
    discovery_reviews = build_discovery_reviews(inventory)
    raise 'active CSV changed while assembling review scope' unless M.hashes == before

    M.write_table(DEFINITIONS, M.table(glossary_path).headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), discovery_reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    M.write_table(OUTPUT, HEADERS, short_reviews)
    inventory = M.refresh_inventory
    glossary = M.table(glossary_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates_after = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, candidates_after)
    append_summary(short_reviews)
    refresh_checkpoint(candidates_after)
    puts "D-#{D}: candidate keys=#{short_reviews.length}, Hireling occurrences=#{discovery_reviews.length}, " \
         "rank edits=#{discovery_reviews.count { |row| row.fetch('status') == 'accepted' }}, " \
         "next=D-#{D + 1}, residual groups=#{candidates_after.length}."
  end
end

ReviewShortLabelCandidatesD21759.run if $PROGRAM_NAME == __FILE__
