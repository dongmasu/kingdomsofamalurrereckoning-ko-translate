#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21760
  extend self

  M = ReviewedNameBatches
  D = 21_760
  TERM = 'Ironhold Passage'
  ENTITY = 'place:ironhold-passage'
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21759.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  NOTES = 'English identifies Ironhold Passage as a named location: it appears as a standalone location label, a place where One-eyed Arka routed the speaker, a destination where Oleander gathered herbs, and a gathering location. Japanese アイアンホールドの通路 consistently supports the passage reading; Chinese 铁堡通道 is supplementary. Register only the full place name, distinct from the shorter Ironhold candidate. Standardize as 아이언홀드 통로(Ironhold Passage); do not infer that Ironhold Passage is a keep or merge it with other Ironhold labels. The official Korean manual reference has no direct entry for this location.'
  EVIDENCE = 'English context establishes the named location rather than a generic passage. The aligned Japanese consistently renders “Ironhold Passage” as アイアンホールドの通路; aligned Chinese uses 铁堡通道, with a divergent transliteration in one unrelated narrative row, so Chinese remains supplementary. The English-indexed corpus has six distinct keys across base/default. Reuse the established Korean stem 아이언홀드 통로, pair the complete English compound once, and keep this entity distinct from the shorter Ironhold candidate.'
  TRANSFORMS = {
    ['base', '634', '11'] => ['아이언홀드(Ironhold) 통로', '아이언홀드 통로(Ironhold Passage)'],
    ['default', '10281', ''] => ['아이언홀드 통로', '아이언홀드 통로(Ironhold Passage)'],
    ['default', '49863', ''] => ['아이언홀드 통로', '아이언홀드 통로(Ironhold Passage)'],
    ['default', '50439', ''] => ['아이언홀드 통로', '아이언홀드 통로(Ironhold Passage)']
  }.freeze

  def row_key(row)
    M.key(row)
  end

  def source_term?(source, term = TERM)
    JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
      text.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
    end
  end

  def candidate_keys(candidate)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |key| key.map(&:to_s) }
    end.uniq.sort
  end

  def full_source_keys(inventory)
    inventory.values.select { |source| source_term?(source) }.map { |source| row_key(source) }.uniq.sort
  end

  def definition
    {
      'entity_key' => ENTITY,
      'english_canonical' => TERM,
      'category' => 'place',
      'korean_canonical' => '아이언홀드 통로(Ironhold Passage)',
      'english_aliases' => '',
      'korean_variants' => '아이언홀드 통로|아이언홀드 통로(Ironhold Passage)',
      'evidence_ids' => "D-#{D}",
      'status' => 'confirmed',
      'notes' => NOTES
    }
  end

  def transform(key, text, source)
    raise "English source missing at #{key.inspect}" unless source_term?(source)
    replacement = TRANSFORMS[key]
    return [text, false] unless replacement
    old, new_text = replacement
    return [text, false] if text.include?(new_text)
    raise "expected one reviewed place-name span at #{key.inspect}" unless text.scan(old).length == 1
    [text.sub(old, new_text), false]
  end

  def build_short_label_reviews(inventory, index, candidate)
    keys = candidate_keys(candidate) | full_source_keys(inventory)
    raise "Ironhold Passage key count differs: #{keys.length}" unless keys.length == 6
    raise "D-#{D} exceeds 50 distinct source keys" if keys.length > 50
    prior_by_key = index.group_by { |row| row_key(row) }
    keys.sort_by { |key| [M::RESOURCES.index(key[0]), key[1].to_i, key[2]] }.map do |key|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      proposed, = transform(key, old, source)
      {
        'english_candidate' => TERM,
        'disposition' => proposed == old ? 'not-an-issue' : 'accepted',
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => old,
        'evidence' => EVIDENCE,
        'prior_index_dispositions_json' => JSON.generate(
          prior_by_key.fetch(key, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
  end

  def build_discovery_reviews(inventory)
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Ironhold Passage occurrence count differs: #{generated.length}" unless generated.length == 6
    generated.sort_by { |row| [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i] }.map do |occurrence|
      key = row_key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text, = transform(key, old, source)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def append_summary(reviews)
    note = <<~TEXT

      ## D-#{D}: Ironhold Passage Location Name

      Reviewed all six English-indexed `Ironhold Passage` source keys: one
      base row and five default rows. English contexts establish one named
      location; Japanese consistently supports the passage reading, while
      Chinese is supplementary. Standardized four missing/partial Korean
      labels to 아이언홀드 통로(Ironhold Passage); two rows were already
      canonically paired. The shorter `Ironhold` candidate remains distinct
      and unreviewed. No prior row disposition was reopened or recounted.
      Exact aligned evidence and prior decisions are in
      `proper-name-short-label-dispositions-D#{D}.tsv`; indexed edits are in
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

  def run
    raise "D-#{D} outputs already exist" if
      [OUTPUT, SNAPSHOT, DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    before = M.hashes
    raise 'Ironhold Passage already has a glossary owner' if glossary.any? do |row|
      row.fetch('entity_key') == ENTITY ||
        ([row.fetch('english_canonical')] + row.fetch('english_aliases', '').to_s.split('|'))
          .any? { |term| term.casecmp?(TERM) }
    end
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch(TERM) { raise "candidate missing: #{TERM}" }
    short_reviews = build_short_label_reviews(inventory, index, candidate)
    discovery_reviews = build_discovery_reviews(inventory)
    raise 'active CSV changed while assembling review scope' unless M.hashes == before

    M.write_table(OUTPUT, HEADERS, short_reviews)
    M.write_table(DEFINITIONS, M.table(glossary_path).headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), discovery_reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    inventory = M.refresh_inventory
    glossary = M.table(glossary_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates_after = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, candidates_after)
    append_summary(short_reviews)
    puts "D-#{D}: reviewed=#{short_reviews.length}; edits=#{discovery_reviews.count { |row| row.fetch('status') == 'accepted' }}; " \
         "next=#{D + 1}; bounded residual groups=#{candidates_after.length}."
  end
end

ReviewShortLabelCandidatesD21760.run if $PROGRAM_NAME == __FILE__
