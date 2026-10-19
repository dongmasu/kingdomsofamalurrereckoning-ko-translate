#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21718
  extend self

  M = ReviewedNameBatches
  D = 21_718
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  SPECS = [
    {
      key: 'place:cathedral-of-the-world',
      english: 'Cathedral of the World',
      category: 'place',
      korean: '세계의 대성당(Cathedral of the World)',
      variants: '세계의 대성당|세계의 대성당(Cathedral of the World)',
      count: 2,
      notes: 'English default:11272 calls it a specific destination reached through Grim’s secret entrance, and default:51135 supplies the exact standalone place label. Japanese 世界の大聖堂 and Chinese 世界大教堂 corroborate the referent. Register this named location as a place; pair the standalone Korean label and retain the already paired prose occurrence.'
    },
    {
      key: 'item:chalice-of-forced-vintage',
      english: 'Chalice of Forced Vintage',
      category: 'unique item',
      korean: '강제 숙성의 성배(Chalice of Forced Vintage)',
      variants: '강제 숙성 성배|강제 숙성의 성배|강제 숙성의 성배(Chalice of Forced Vintage)',
      count: 7,
      notes: 'English default:58194 describes the chalice’s unique liquid-to-wine property; quest rows 10188, 27371, 49616 and 50710 identify the same object to be stolen, with base:3745 and default:59271 as standalone labels. Japanese ワイン作りの聖杯 and Chinese 强制酿造酒杯 corroborate the named vessel. Register the unique quest item and standardize only its exact name spans.'
    }
  ].freeze

  GROUPS = {
    'Bolgan Bane' => {
      disposition: 'uncertain',
      expected_keys: 2,
      evidence: 'Both standalone labels name Bolgan Bane, and aligned Japanese ボルガン使い and Chinese 波尔干克星 support a Bolgan-slayer sense. Existing monster:bolgan decisions concern only the Bolgan component and remain untouched. These rows do not establish whether the phrase names a unique item or another source object; preserve both Korean cells and do not register an item without identity evidence.'
    },
    'Burn' => {
      disposition: 'uncertain',
      expected_keys: 10,
      evidence: 'The six affix keys use Burn as a generic action and already translate it as 태우기:, consistent with the Japanese action form 燃やす:. The four capitalized default references use the Burn as a Rathir harbor/district name, but historical records D-4098, D-6435, D-8588, D-8911, D-14528, and D-17798 retain place/event identity or locale-alias uncertainty; D-21694 separately preserves the Llosgiad event/place distinction. Keep the affix rows not-an-issue and retain the four place references as uncertain without reopening their prior key decisions.'
    },
    'Captain Brattigan' => {
      disposition: 'not-an-issue',
      expected_keys: 10,
      evidence: 'All ten exact source keys identify the already registered person Rast Brattigan. The Korean name is paired as 브래티건(Brattigan); 선장 is a translated rank. Preserve every existing person:rast-brattigan disposition and do not add a redundant English title to the name.'
    },
    'Captain Drefan' => {
      disposition: 'not-an-issue',
      expected_keys: 5,
      evidence: 'All five exact source keys identify the already registered person Drefan. The Korean name is paired as 드레판(Drefan), while Captain is translated as 대장 or 선장 according to its source context. Preserve the existing person:drefan terminal decisions; no name or title correction is supported by this candidate review.'
    },
    'Captain Eriad Talibor' => {
      disposition: 'not-an-issue',
      expected_keys: 2,
      evidence: 'Both exact rows already pair the full personal name 에리아드 탈리보르(Eriad Talibor); the source-supported rank Captain is translated as 대장/선장. Existing person:eriad, person:talibor, and place:rathir decisions are preserved. Do not add a redundant parenthetical containing the translated rank.'
    },
    'Captain at Arms' => {
      disposition: 'not-an-issue',
      expected_keys: 3,
      evidence: 'The English term denotes the Warsworn post responsible for arms, not a separate person. Japanese 兵長 and Chinese 武器部部长 corroborate an office/rank; Korean 무기 담당 대장/무장대장 translates that role. Preserve the existing faction:warsworn and title:pledgeshield decisions.'
    },
    'Castellan' => {
      disposition: 'not-an-issue',
      expected_keys: 8,
      evidence: 'English uses Castellan as a translated Warsworn office/title, including as a role held by named individuals; Japanese 城主 and Chinese 城主 corroborate. Korean 성주 already translates the role. Preserve the independent Tine Delfric and other existing person, faction, and place dispositions; do not register the office as a person or place.'
    },
    'Cathedral of the World' => {
      disposition: 'accepted',
      expected_keys: 2,
      evidence: 'English identifies the named destination and its standalone label; Japanese 世界の大聖堂 and Chinese 世界大教堂 corroborate. Register place:cathedral-of-the-world as 세계의 대성당(Cathedral of the World), adding the English pairing only to the standalone label.'
    },
    'Chalice of Forced Vintage' => {
      disposition: 'accepted',
      expected_keys: 7,
      evidence: 'English identifies one named quest vessel and explains its defining magical property; Japanese ワイン作りの聖杯 and Chinese 强制酿造酒杯 corroborate. Register item:chalice-of-forced-vintage as 강제 숙성의 성배(Chalice of Forced Vintage) and standardize the exact name across all seven source keys.'
    }
  }.freeze

  TRANSFORMS = {
    ['base', '3745', '11'] => ['강제 숙성의 성배', '강제 숙성의 성배(Chalice of Forced Vintage)'],
    ['default', '10188', ''] => ['강제 숙성 성배', '강제 숙성의 성배(Chalice of Forced Vintage)'],
    ['default', '27371', ''] => ['강제 숙성 성배(Chalice of Forced Vintage)', '강제 숙성의 성배(Chalice of Forced Vintage)'],
    ['default', '49616', ''] => ['강제 숙성의 성배', '강제 숙성의 성배(Chalice of Forced Vintage)'],
    ['default', '58194', ''] => ['강제 숙성의 성배', '강제 숙성의 성배(Chalice of Forced Vintage)'],
    ['default', '59271', ''] => ['강제 숙성의 성배', '강제 숙성의 성배(Chalice of Forced Vintage)'],
    ['default', '51135', ''] => ['세계의 대성당', '세계의 대성당(Cathedral of the World)']
  }.freeze

  def row_key(row)
    M.key(row)
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
        english = JSON.parse(source.fetch('en_texts_json')).compact
        pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
        raise "English candidate missing at #{key.inspect}" unless
          english.any? { |text| text.match?(pattern) }
        disposition = if term == 'Burn' && key[0] == 'affix'
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
          'disposition' => disposition,
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => english.join("\n"),
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
    return [text, false] unless
      %w[item:chalice-of-forced-vintage place:cathedral-of-the-world].include?(spec.fetch(:key))
    if spec.fetch(:key) == 'item:chalice-of-forced-vintage'
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "English Chalice source missing at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Chalice of Forced Vintage(?![A-Za-z])/)
    end
    replacement = TRANSFORMS[key]
    return [text, false] unless replacement
    old, new_text = replacement
    count = text.scan(old).length
    raise "expected one reviewed name span at #{key.inspect}, found #{count}" unless count == 1
    [text.sub(old, new_text), false]
  end

  def append_disposition_summary
    summary = <<~TEXT

      ## D-#{D}: Remaining Short-Label Candidate Review

      Reviewed 49 exact source keys across nine candidate groups. Registered
      Cathedral of the World as a named place and Chalice of Forced Vintage as
      a unique quest item. Bolgan Bane and the Rathir place-name use of Burn
      remain explicitly uncertain; generic affix Burn, Captain Brattigan,
      Captain Drefan, Captain Eriad Talibor, Captain at Arms, and Castellan
      were closed as already paired names or translated roles. Existing
      occurrence-index decisions and historical totals were not reopened or
      recounted. Exact aligned source text and prior index states are in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + summary)
    end
    {
      File.join(__dir__, 'README.md') => summary,
      File.join(__dir__, 'decision-register-20261009.md') => summary
    }.each do |path, section|
      File.write(path, File.read(path) + section)
    end
  end

  def refresh_checkpoint(candidates)
    hashes = M.hashes
    hash_text = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
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
    index = M.table(M::INDEX)
    before = M.hashes
    raw = ShortLabelDiscovery20261018.build(
      inventory.values, glossary.map(&:to_h), index.map(&:to_h)
    )
    candidates = raw.to_h { |row| [row.fetch('english_candidate'), row.to_h] }
    reviews = build_candidate_reviews(inventory, index, candidates)
    raise 'active CSV changed while assembling candidate scope' unless M.hashes == before

    ReviewedDiscoverySpecs.run(
      D, 'Cathedral of the World and Chalice of Forced Vintage',
      SPECS, 'Register the named Cathedral of the World location and the unique Chalice of Forced Vintage quest item. English establishes identity and meaning; aligned Japanese and Chinese are corroborating evidence. Standardize only the exact source-matched Korean name spans; preserve all other entities, prose, tokens, and line breaks.',
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }

    M.write_table(OUTPUT, HEADERS, reviews)
    candidates_after = ShortLabelDiscovery20261018.build(
      M.refresh_inventory.values,
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h),
      M.table(M::INDEX).map(&:to_h)
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, candidates_after)
    append_disposition_summary
    refresh_checkpoint(candidates_after)
    puts "D-#{D}: reviewed #{reviews.length} distinct source keys/9 candidate groups; " \
         "registered two named scopes with byte-preserving verification; " \
         "next=D-#{D + 1}, bounded residual groups=#{candidates_after.length}."
  end
end

ReviewShortLabelCandidatesD21718.run if $PROGRAM_NAME == __FILE__
