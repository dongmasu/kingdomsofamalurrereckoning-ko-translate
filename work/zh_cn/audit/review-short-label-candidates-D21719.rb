#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21719
  extend self

  M = ReviewedNameBatches
  D = 21_719
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  SPECS = [
    {
      key: 'title:champion-of-valor',
      english: 'Champion of Valor',
      category: 'title',
      korean: '용맹의 챔피언(Champion of Valor)',
      variants: '용맹의 투사|용맹의 챔피언|발로의 챔피언|용맹의 챔피언(Champion of Valor)',
      count: 24,
      notes: 'English names the title earned by the leader of the winning Crows team and borne by Engard; default:5070 and default:40966 instead refer to the distinct longer rank Grand Champion of Valor and are excluded from this title component. Japanese チャンピオン/バローのチャンピオン and Chinese 英勇冠军 corroborate. Register the title, not the House of Valor faction or a separate person, and preserve all existing faction:house-of-valor exclusions.'
    },
    {
      key: 'monster:chaos-critters',
      english: 'Chaos Critters',
      category: 'monster',
      korean: '혼돈 생물(Chaos Critters)',
      variants: '혼돈 생물|혼돈의 괴물들|혼돈 생물(Chaos Critters)',
      count: 5,
      notes: 'English default:51941 identifies Chaos Critters as spawn that cross from Chaos Rifts into Amalur; default:54144 and default:56263 confirm they are hostile creatures yielding silk and drawn to a farm. Japanese 混沌の動物 and Chinese 混乱小鬼 corroborate the creature group. Register the hostile creature class and normalize only those exact name spans.'
    },
    {
      key: 'title:chariot',
      english: 'Chariot',
      category: 'title',
      korean: '전차를 모는 자(Chariot)',
      variants: '전차|채리엇(Chariot)|전차(Chariot)|전차를 모는 자(Chariot)',
      count: 8,
      notes: 'English default:29774 says Grim bestowed Chariot as the player’s new Travelers hero-name/alias; default:33161 and default:45495 explicitly describe the title and its songs. Japanese 戦車を駆る者 corroborates the epithet. Register the Travelers title, not a vehicle; standardize its labels and mentions as 전차를 모는 자(Chariot).'
    }
  ].freeze

  GROUPS = {
    'Champion of Valor' => {
      expected_keys: 24,
      evidence: 'The exact title belongs to the leader of the winning team and to Engard. Normalize its Korean forms to 용맹의 챔피언(Champion of Valor). The longer Grand Champion of Valor rank at default:5070 and default:40966 is a distinct title; record those substring matches as excluded. Existing faction:house-of-valor decisions remain unchanged.'
    },
    'Chaos Critters' => {
      expected_keys: 5,
      evidence: 'English identifies the Chaos Critters as spawn/creatures from Chaos Rifts; aligned Japanese 混沌の動物 and Chinese 混乱小鬼 support the creature reading. Register the hostile monster group and use 혼돈 생물(Chaos Critters) consistently.'
    },
    'Chariot' => {
      expected_keys: 8,
      evidence: 'English explicitly says the Travelers grant Chariot as a new hero name/title; Japanese 戦車を駆る者 supports “one who drives the chariot.” Register title:chariot and distinguish it from a generic vehicle.'
    },
    'Chausses' => {
      disposition: 'not-an-issue',
      expected_keys: 3,
      evidence: 'Chausses is a generic leg-armour/clothing term, not an identified unique item or named entity. Japanese シャッセ and Chinese 马裤 support a garment sense; base already translates it as 각반. Do not register a proper-name entity or alter generic equipment terminology in this name-only scope.'
    },
    'Circle' => {
      expected_keys: 3,
      evidence: 'default:16609 uses Circle for a magical glyph, supported by Japanese 魔法陣 and Korean 마법진; this is not a proper name. default:3773 and default:61549 use a capitalized Circle for Florion’s group/sect (Japanese サークル, Chinese 教派), but the source does not establish a unique organization identity or its relation to Narca. Preserve those two cells and prior Narca/Florion decisions as uncertain; do not merge them into a new faction.'
    }
  }.freeze

  EXCLUDED_TITLE_KEYS = [
    ['default', '5070', ''],
    ['default', '40966', '']
  ].freeze

  CHAMPION_SPANS = {
    ['default', '280', ''] => ['페이(Fae) 챔피언', '페이(Fae) 챔피언(Champion of Valor)'],
    ['default', '1292', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '3181', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '5619', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '7181', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '7352', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '8059', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '9044', ''] => ['발로의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '10771', ''] => ['용맹의 투사', '용맹의 챔피언(Champion of Valor)'],
    ['default', '12452', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '14710', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '15200', ''] => ['최초의 필멸자 챔피언', '최초의 필멸자 챔피언(Champion of Valor)'],
    ['default', '26575', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '32635', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '41700', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '42900', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '47621', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '56402', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '61204', ''] => ['용맹의 투사', '용맹의 챔피언(Champion of Valor)'],
    ['default', '62013', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)'],
    ['default', '64348', ''] => ['용맹의 챔피언', '용맹의 챔피언(Champion of Valor)']
  }.freeze
  CHAOS_SPANS = {
    ['default', '30129', ''] => ['혼돈 생물', '혼돈 생물(Chaos Critters)'],
    ['default', '54144', ''] => ['혼돈 생물', '혼돈 생물(Chaos Critters)'],
    ['default', '56263', ''] => ['혼돈의 괴물들', '혼돈 생물(Chaos Critters)들']
  }.freeze
  CHARIOT_SPANS = {
    ['default', '10808', ''] => ['전차', '전차를 모는 자(Chariot)'],
    ['default', '12470', ''] => ['채리엇(Chariot)', '전차를 모는 자(Chariot)'],
    ['default', '29774', ''] => ['전차', '전차를 모는 자(Chariot)'],
    ['default', '33161', ''] => ['전차(Chariot)', '전차를 모는 자(Chariot)'],
    ['default', '36955', ''] => ['전차', '전차를 모는 자(Chariot)'],
    ['default', '58709', ''] => ['전차', '전차를 모는 자(Chariot)'],
    ['default', '59285', ''] => ['전차', '전차를 모는 자(Chariot)']
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
    (JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json')))
      .map { |key| key.map(&:to_s) }.uniq.sort
  end

  def build_candidate_reviews(inventory, index, candidates)
    reviewed = []
    GROUPS.each do |term, decision|
      candidate = candidates.fetch(term) { raise "candidate missing: #{term}" }
      keys = candidate_keys(candidate)
      spec = SPECS.find { |item| item.fetch(:english) == term }
      if spec
        definition = {
          'entity_key' => spec.fetch(:key),
          'english_canonical' => spec.fetch(:english),
          'category' => spec.fetch(:category),
          'korean_canonical' => spec.fetch(:korean),
          'english_aliases' => '',
          'korean_variants' => spec.fetch(:variants),
          'evidence_ids' => "D-#{D}",
          'status' => 'confirmed',
          'notes' => spec.fetch(:notes)
        }
        generated = build_occurrences(inventory.values, [definition]).map do |values|
          OCCURRENCE_HEADERS.zip(values).to_h
        end
        keys = (keys + generated.map { |row| row_key(row) }).uniq.sort
      end
      raise "#{term} key count differs: #{keys.length}" unless
        keys.length == decision.fetch(:expected_keys)
      keys.each do |key|
        source = inventory.fetch(key)
        raise "English candidate missing at #{key.inspect}" unless source_term?(source, term)
        spec = SPECS.find { |item| item.fetch(:english) == term }
        proposed, excluded = spec ? transform(spec, key, source.fetch('work_text'), source) :
          [source.fetch('work_text'), false]
        status = if excluded
                   'excluded'
                 elsif proposed != source.fetch('work_text')
                   'accepted'
                 elsif term == 'Circle'
                   key == ['default', '16609', ''] ? 'not-an-issue' : 'uncertain'
                 elsif spec
                   'not-an-issue'
                 else
                   decision.fetch(:disposition)
                 end
        prior = index.select { |row| row_key(row) == key }
          .map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        reviewed << {
          'english_candidate' => term,
          'disposition' => status,
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(prior)
        }
      end
    end
    keys = reviewed.map { |row| row_key(row) }
    raise "D-#{D} exceeds 50 distinct source keys: #{keys.uniq.length}" if
      keys.uniq.length > 50
    raise 'duplicate candidate/key disposition' unless
      reviewed.map { |row| [row.fetch('english_candidate'), *row_key(row)] }.uniq.length == reviewed.length
    reviewed
  end

  def transform(spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English source missing for #{spec.fetch(:english)} at #{key.inspect}" unless
      source_term?(source, spec.fetch(:english))
    if spec.fetch(:key) == 'title:champion-of-valor'
      return [text, true] if EXCLUDED_TITLE_KEYS.include?(key)
      return [text, false] if text.include?('용맹의 챔피언(Champion of Valor)')
      old, replacement = CHAMPION_SPANS.fetch(key) do
        raise "unmapped Champion of Valor occurrence at #{key.inspect}: #{english[0, 180]}"
      end
    elsif spec.fetch(:key) == 'monster:chaos-critters'
      return [text, false] if text.include?('혼돈 생물(Chaos Critters)')
      old, replacement = CHAOS_SPANS.fetch(key) do
        raise "unmapped Chaos Critters occurrence at #{key.inspect}"
      end
    else
      return [text, false] if text.include?('전차를 모는 자(Chariot)')
      old, replacement = CHARIOT_SPANS.fetch(key) do
        raise "unmapped Chariot occurrence at #{key.inspect}"
      end
    end
    count = text.scan(old).length
    raise "expected one reviewed Korean span at #{key.inspect}, found #{count}" unless count == 1
    [text.sub(old, replacement), false]
  end

  def refresh_snapshot
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, candidates)
    candidates
  end

  def append_candidate_summary
    section = <<~TEXT

      ## D-#{D}: Short-Label Candidate Review

      Reviewed 43 exact source keys across five candidate groups, including
      full-source checks for every occurrence of Champion of Valor, Chaos
      Critters, and Chariot. Registered the House of Valor title Champion
      of Valor, the Travelers title Chariot, and the Chaos Critters monster group. The nested
      Champion of Valor matches in the distinct Grand Champion of Valor rank
      were explicitly excluded. Chausses is generic armor terminology;
      Circle's magical-glyph sense was closed, while Florion's ambiguous
      Circle group remains uncertain. Existing faction and person decisions
      were preserved. Exact locale text and prior row states are in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + section)
    end
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + section)
    end
  end

  def refresh_checkpoint(candidates)
    hash_text = M.hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    line = "Next batch: D-#{D + 1}; continue unreviewed short-label candidates from `proper-name-short-label-discovery-D#{D}.tsv` (#{candidates.length} bounded groups; not exhaustive or a completion estimate)."
    M::DOCS.each do |path|
      text = File.read(path)
      text.sub!(/Next batch: D-#{D + 1};.*?\n/, "#{line}\n") ||
        raise("missing D-#{D + 1} checkpoint in #{path}")
      text.sub!(/Active CSV SHA-256:\n(?:- (?:affix|base|default): `[^`]+`\.\n){3}/,
                "Active CSV SHA-256:\n#{hash_text}\n") ||
        raise("missing active hash block in #{path}")
      File.write(path, text)
    end
  end

  def run
    raise "D-#{D} outputs already exist" if
      [OUTPUT, SNAPSHOT].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    index = M.table(M::INDEX).map(&:to_h)
    before = M.hashes
    raw = ShortLabelDiscovery20261018.build(
      inventory.values, glossary.map(&:to_h), index
    )
    candidates = raw.to_h { |row| [row.fetch('english_candidate'), row.to_h] }
    candidate_reviews = build_candidate_reviews(inventory, index, candidates)
    raise 'active CSV changed while assembling candidate scope' unless M.hashes == before

    ReviewedDiscoverySpecs.run(
      D, 'Champion of Valor, Chaos Critters, and Chariot',
      SPECS, 'Register the House of Valor title Champion of Valor, the Travelers title Chariot, and the hostile Chaos Critters monster group. English establishes identity and role; aligned Japanese and Chinese corroborate. Exclude only the Champion of Valor component nested in the distinct Grand Champion of Valor title. Preserve all other names, faction decisions, prose, tokens, and line breaks.',
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }

    M.write_table(OUTPUT, HEADERS, candidate_reviews)
    candidates_after = refresh_snapshot
    append_candidate_summary
    refresh_checkpoint(candidates_after)
    puts "D-#{D}: reviewed #{candidate_reviews.length} distinct source keys/5 groups; " \
         "registered three named scopes with byte-preserving verification; " \
         "next=D-#{D + 1}, bounded residual groups=#{candidates_after.length}."
  end
end

ReviewShortLabelCandidatesD21719.run if $PROGRAM_NAME == __FILE__
