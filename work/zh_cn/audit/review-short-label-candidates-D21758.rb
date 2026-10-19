#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21758
  extend self

  M = ReviewedNameBatches
  D = 21_758
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21757.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  HEXES_KEY = 'title:hexes-card-game'
  HEXES = {
    key: HEXES_KEY,
    english: 'Hexes',
    category: 'named work',
    korean: '헥스(Hexes)',
    variants: '헥스|헥스(Hexes)|헥스 게임|헥스 게임하기',
    count: 24,
    notes: 'English identifies Hexes as the in-world card game in contexts involving cards, dealers, wagers, and playing; Japanese ヘックス and Chinese 六牌 corroborate. Confirm only source contexts that identify the game. Keep the standalone labels default:29159, 50522, and 59976, the ambiguous “Damn Hexes” at 25727, the isolated question at 49096, and UI labels 9642/13964 as occurrence-level holds where the exact referent remains unsettled. No official Korean manual entry was found.'
  }.freeze

  GROUPS = {
    'Henge' => {
      expected_keys: 7,
      evidence: 'The seven candidate rows use Henge as the Kollossae transport artifact/device type, not a uniquely identified item. A full-source scan found 29 rows containing Henge; the other 22 include compound location labels and are outside this candidate-key disposition. Preserve those labels and all existing Henge-related decisions.'
    },
    'Hexes' => {
      expected_keys: 24,
      evidence: 'English contexts involving a game, cards, a dealer, wagers, and play establish the named in-world card game Hexes; Japanese ヘックス and Chinese 六牌 corroborate. Pair confirmed game references as 헥스(Hexes). Keep the seven ambiguous/UI/standalone occurrences on hold without changing their Korean text or prior translation dispositions.'
    }
  }.freeze

  UNCERTAIN_KEYS = %w[9642 13964 25727 29159 49096 50522 59976].to_set.freeze

  TRANSFORMS = {
    '3977' => ['헥스?', '헥스(Hexes)?'],
    '4608' => ['헥스 게임', '헥스(Hexes) 게임'],
    '9088' => ['헥스나', '헥스(Hexes)나'],
    '14326' => ['헥스 게임 한판', '헥스(Hexes) 게임 한판'],
    '16198' => ['헥스 게임하기', '헥스(Hexes) 게임하기'],
    '22928' => ['헥스 게임을', '헥스(Hexes) 게임을'],
    '32482' => ['헥스와 나는', '헥스(Hexes)와 나는'],
    '39804' => ['헥스 게임을', '헥스(Hexes) 게임을'],
    '42987' => ['헥스를 즐길', '헥스(Hexes)를 즐길'],
    '43184' => ['헥스 게임을', '헥스(Hexes) 게임을'],
    '44723' => ['헥스?', '헥스(Hexes)?'],
    '46903' => ['헥스 게임 한판', '헥스(Hexes) 게임 한판'],
    '58300' => ['헥스 게임?', '헥스(Hexes) 게임?'],
    '58829' => ['헥스 게임이라고?', '헥스(Hexes) 게임이라고?'],
    '59722' => ['주술 장수', '헥스(Hexes) 장수']
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

  def hexes_keys(inventory)
    build_occurrences(inventory.values, [definition]).map do |values|
      [values[1], values[2], values[3]].map(&:to_s)
    end.uniq.sort
  end

  def definition
    {
      'entity_key' => HEXES.fetch(:key),
      'english_canonical' => HEXES.fetch(:english),
      'category' => HEXES.fetch(:category),
      'korean_canonical' => HEXES.fetch(:korean),
      'english_aliases' => '',
      'korean_variants' => HEXES.fetch(:variants),
      'evidence_ids' => "D-#{D}",
      'status' => 'confirmed',
      'notes' => HEXES.fetch(:notes)
    }
  end

  def transform_hexes(key, text, source)
    raise "English Hexes source missing at #{key.inspect}" unless source_term?(source, 'Hexes')
    return [text, false] if UNCERTAIN_KEYS.include?(key[1])
    replacement = TRANSFORMS[key[1]]
    return [text, false] unless replacement
    old, new_text = replacement
    return [text, false] if text.include?(new_text)
    raise "expected one reviewed Hexes span at #{key.inspect}" unless text.scan(old).length == 1
    [text.sub(old, new_text), false]
  end

  def evidence_for(term, key)
    return GROUPS.fetch('Henge').fetch(:evidence) if term == 'Henge'
    return GROUPS.fetch('Hexes').fetch(:evidence) unless UNCERTAIN_KEYS.include?(key[1])
    case key[1]
    when '9642', '13964'
      'The standalone Play Hexes UI labels align Japanese play wording with Chinese magic wording and have no verified screen context. Preserve the current Korean and D-2734/D-4146 holds.'
    when '25727'
      '“Damn Hexes” lacks a local antecedent that distinguishes the card game from magic or a curse. Preserve the Korean text and D-8425 hold.'
    when '29159', '50522', '59976'
      'The isolated Hexes label is ambiguous: Japanese transliteration supports the game term, while Chinese 魔法 and the current Korean support a magic/skill reading. Do not assign the card-game identity or change Korean.'
    when '49096'
      'The isolated “Hexes?” fragment does not establish whether the speaker means the card game or another concept. Preserve the current Korean and D-15018 hold.'
    else
      raise "missing Hexes evidence for #{key.inspect}"
    end
  end

  def build_short_label_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| row_key(row) }
    reviews = GROUPS.flat_map do |term, decision|
      candidate = candidates.fetch(term) { raise "candidate missing: #{term}" }
      keys = candidate_keys(candidate)
      keys |= hexes_keys(inventory) if term == 'Hexes'
      raise "#{term} key count differs: #{keys.length}" unless keys.length == decision.fetch(:expected_keys)
      keys.map do |key|
        source = inventory.fetch(key)
        raise "English candidate missing at #{key.inspect}" unless source_term?(source, term)
        old = source.fetch('work_text')
        proposed, = term == 'Hexes' ? transform_hexes(key, old, source) : [old, false]
        disposition = if term == 'Hexes' && UNCERTAIN_KEYS.include?(key[1])
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
          'evidence' => evidence_for(term, key),
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
    raise "Hexes occurrence count differs: #{generated.length}" unless generated.length == HEXES.fetch(:count)
    generated.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i] }.map do |occurrence|
      key = row_key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text, = transform_hexes(key, old, source)
      status = if UNCERTAIN_KEYS.include?(key[1])
                 'uncertain'
               elsif new_text == old
                 'not-an-issue'
               else
                 'accepted'
               end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => HEXES_KEY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence_for('Hexes', key),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(HEXES_KEY => status)
      }
    end
  end

  def append_summary(reviews)
    counts = reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    note = <<~TEXT

      ## D-#{D}: Henge And Hexes Short-Label Review

      Reviewed 31 candidate source keys across Henge and Hexes. Henge is the
      generic Kollossae transport-artifact/device type in the seven candidate
      rows; a 29-row full-source scan found compound Henge location labels as
      well, which were not reopened. Registered the named in-world card game
      Hexes as `title:hexes-card-game` after reviewing all 24 exact source
      occurrences: 15 name-span edits, two already-paired game references,
      and seven occurrence-level holds. English game/card/dealer/wager
      contexts and aligned Japanese/Chinese support the confirmed references.
      Ambiguous standalone/UI uses remain unchanged. Prior translation
      dispositions were preserved and not recounted. Candidate disposition
      counts: #{counts.inspect}. Exact aligned text and prior row decisions
      are in `proper-name-short-label-dispositions-D#{D}.tsv`; indexed
      name-scope edits are in `proper-name-edits-D#{D}.tsv`.
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
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    before = M.hashes
    raise 'Hexes is already owned by a glossary entry' if glossary.any? do |row|
      ([row.fetch('english_canonical')] + row.fetch('english_aliases', '').to_s.split('|'))
        .any? { |term| term.casecmp?(HEXES.fetch(:english)) }
    end
    raw = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    candidates = raw.to_h { |row| [row.fetch('english_candidate'), row.to_h] }
    short_reviews = build_short_label_reviews(inventory, index, candidates)
    discovery_reviews = build_discovery_reviews(inventory)
    raise 'active CSV changed while assembling review scope' unless M.hashes == before

    definitions_path = File.join(__dir__, 'proper-name-glossary.tsv')
    definition_headers = M.table(definitions_path).headers
    M.write_table(DEFINITIONS, definition_headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), discovery_reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    M.write_table(OUTPUT, HEADERS, short_reviews)
    inventory = M.refresh_inventory
    glossary = M.table(definitions_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates_after = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, candidates_after)
    append_summary(short_reviews)
    refresh_checkpoint(candidates_after)
    puts "D-#{D}: candidate keys=#{short_reviews.length}, Hexes occurrences=#{discovery_reviews.length}, " \
         "Hexes edits=#{discovery_reviews.count { |row| row.fetch('status') == 'accepted' }}, " \
         "next=D-#{D + 1}, residual groups=#{candidates_after.length}."
  end
end

ReviewShortLabelCandidatesD21758.run if $PROGRAM_NAME == __FILE__
