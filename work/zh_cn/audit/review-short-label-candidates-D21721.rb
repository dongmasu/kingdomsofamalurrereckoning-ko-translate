#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21721
  extend self

  M = ReviewedNameBatches
  D = 21_721
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21718.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  CONTEXT = 'English establishes the quest object, Adessa site, and sacred Fae training site; aligned Japanese and Chinese corroborate each exact row. The official Korean manual reference/extraction has no direct Clan Totem, Consistorium, Counsel, or crown-name entry; its general world/quest context does not establish new identities. Preserve all prior entity/key dispositions and historical translation holds without reopening or recounting them. Exclude the complete Kobold Clan Totem and Consistorium Key labels from their shorter components, leaving those Korean cells byte-identical. Do not infer a second Arkes person or a Crown of Clouds place from a tunnel label. Preserve unrelated names, prose, tokens, particles, and line breaks.'.freeze

  SPECS = [
    {
      key: 'item:clan-totem',
      english: 'Clan Totem',
      category: 'unique item',
      korean: '클랜 토템(Clan Totem)',
      variants: '클랜 토템|부족 토템|씨족 토템',
      count: 12,
      notes: 'default:412/43112 identify the specific Clan Totem to be stolen from the Kobolds in Tearscotter Mine for Paige; 19797 and 16988/29627/63399 identify the stolen object and its recovery. Japanese クラン・トーテム and Chinese 氏族图腾 corroborate. Reuse the complete existing 클랜 토템(Clan Totem) at default:3725. The two base Kobold Clan Totem labels are longer atomic item names: shared wording alone does not prove item identity, so exclude their component matches and preserve the D-20798 monster:kobold decisions and cells exactly.'
    },
    {
      key: 'place:consistorium',
      english: 'Consistorium',
      category: 'place',
      korean: '콘시스토리움(Consistorium)',
      variants: '콘시스토리움',
      count: 5,
      notes: 'default:6846 describes the Consistorium as under construction; default:42869 locates it in Adessa, and base:2166 is the complete the Consistorium location label. Japanese 議会場/アデッサの議会場 and Chinese 阿德萨联盟 corroborate the site, while default:7817 merely repeats English in both supporting locales. Reuse default:6846 콘시스토리움(Consistorium); retain the already complete source-article form 콘시스토리움(the Consistorium) at base:2166. Exclude base:1493 Consistorium Key as a distinct atomic item label; no key entity is inferred. Preserve D-20668 place:adessa at default:42869.'
    },
    {
      key: 'place:crown-of-the-sun',
      english: 'Crown of the Sun',
      category: 'place',
      korean: '태양의 왕관(Crown of the Sun)',
      variants: '태양의 왕관',
      count: 9,
      notes: 'default:13112 explicitly calls the Crown of the Sun a sacred place where Keepers train; default:11017 places it in the desert, 49461 calls it a Fae domain, and 35530/38494 direct travel there to challenge Pura. Japanese クラウン・オブ・ザ・サン and Chinese 太阳之冠/太阳王冠 corroborate. Reuse the complete existing 태양의 왕관(Crown of the Sun) at default:4776/11017/13112. This is a site, not wearable equipment or a quest-title-to-place inference. Preserve D-21539 monster:the-guardian exclusion at 49045, D-21664 place:the-crossing, and prior Pura/Fae decisions.'
    }
  ].freeze

  GROUPS = {
    'Clan Totem' => {
      expected_keys: 12,
      evidence: SPECS[0].fetch(:notes)
    },
    'Consistorium' => {
      expected_keys: 5,
      evidence: SPECS[1].fetch(:notes)
    },
    'Counsel' => {
      expected_keys: 12,
      disposition: 'uncertain',
      evidence: 'Counsel is an ordinary adviser word in other English contexts, but these snapshot rows refer to Anokatos\' captive. English default:42824/63143 explicitly reveals that the Counsel is Arkes; Japanese 助言者/アーケス and Chinese 参谋/阿克斯 corroborate. person:arkes already owns Arkes (D-20383; accepted person rows include 42824/63143), but has no Counsel alias. Hold alias/title treatment and the divergent 고문/조언자/참모/카운슬 Korean forms; do not create a second person, add a global counsel alias, or declare the unpaired 11381/13955 resolved. All twelve snapshot keys stay byte-identical and every prior index disposition is retained.'
    },
    'Crown of Clouds' => {
      expected_keys: 2,
      disposition: 'uncertain',
      evidence: 'default:21867 is only the standalone Crown of Clouds label (Japanese クラウン・オブ・クラウド, Chinese 云的王冠). base:3506 names the longer Crown of Clouds Tunnel (Japanese クラウン・オブ・クラウド地下道, Chinese 云的王冠隧道); Korean pairs only its Crown of Clouds component. Neither row establishes whether the short label is a site, an item, or the same referent as the tunnel. Hold both rows; do not turn a possible topic/quest label into a place, infer item identity, or nest another pair in the longer label.'
    },
    'Crown of the Sun' => {
      expected_keys: 9,
      evidence: SPECS[2].fetch(:notes)
    }
  }.freeze

  EXCLUDED_KEYS = {
    'item:clan-totem' => [['base', '2794', '11'], ['base', '4043', '11']],
    'place:consistorium' => [['base', '1493', '11']],
    'place:crown-of-the-sun' => []
  }.freeze
  COMPLETE_KEYS = {
    'item:clan-totem' => [['default', '3725', '']],
    'place:consistorium' => [['base', '2166', '11'], ['default', '6846', '']],
    'place:crown-of-the-sun' => [
      ['default', '4776', ''], ['default', '11017', ''], ['default', '13112', '']
    ]
  }.freeze
  SPANS = {
    'item:clan-totem' => {
      ['default', '412', ''] => ['부족 토템', '클랜 토템(Clan Totem)'],
      ['default', '16988', ''] => ['부족 토템', '클랜 토템(Clan Totem)'],
      ['default', '19797', ''] => ['부족 토템', '클랜 토템(Clan Totem)'],
      ['default', '25022', ''] => ['부족 토템', '클랜 토템(Clan Totem)'],
      ['default', '26895', ''] => ['부족 토템', '클랜 토템(Clan Totem)'],
      ['default', '29627', ''] => ['부족 토템', '클랜 토템(Clan Totem)'],
      ['default', '43112', ''] => ['씨족 토템', '클랜 토템(Clan Totem)'],
      ['default', '44724', ''] => ['부족 토템', '클랜 토템(Clan Totem)'],
      ['default', '63399', ''] => ['부족 토템', '클랜 토템(Clan Totem)']
    },
    'place:consistorium' => {
      ['default', '7817', ''] => ['콘시스토리움', '콘시스토리움(Consistorium)'],
      ['default', '42869', ''] => ['콘시스토리움', '콘시스토리움(Consistorium)']
    },
    'place:crown-of-the-sun' => {
      ['default', '2208', ''] => ['태양의 왕관', '태양의 왕관(Crown of the Sun)'],
      ['default', '26164', ''] => ['태양의 왕관', '태양의 왕관(Crown of the Sun)'],
      ['default', '35530', ''] => ['태양의 왕관', '태양의 왕관(Crown of the Sun)'],
      ['default', '38494', ''] => ['태양의 왕관', '태양의 왕관(Crown of the Sun)'],
      ['default', '49045', ''] => ['태양의 왕관', '태양의 왕관(Crown of the Sun)'],
      ['default', '49461', ''] => ['태양의 왕관', '태양의 왕관(Crown of the Sun)']
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

  def definitions
    SPECS.map do |spec|
      {
        'entity_key' => spec.fetch(:key), 'english_canonical' => spec.fetch(:english),
        'category' => spec.fetch(:category), 'korean_canonical' => spec.fetch(:korean),
        'english_aliases' => '', 'korean_variants' => spec.fetch(:variants),
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed', 'notes' => spec.fetch(:notes)
      }
    end
  end

  def transform(spec, key, text, source)
    entity = spec.fetch(:key)
    raise "English source missing at #{key.inspect}" unless source_term?(source, spec.fetch(:english))
    return [text, true] if EXCLUDED_KEYS.fetch(entity).include?(key)
    if COMPLETE_KEYS.fetch(entity).include?(key)
      pair = key == ['base', '2166', '11'] ?
        '콘시스토리움(the Consistorium)' : spec.fetch(:korean)
      raise "reviewed complete pair missing at #{key.inspect}" unless text.include?(pair)
      return [text, false]
    end
    old, replacement = SPANS.fetch(entity).fetch(key) do
      raise "unmapped source occurrence for #{entity} at #{key.inspect}"
    end
    return [text, false] if text.include?(replacement)
    raise "expected one Korean span at #{key.inspect}" unless text.scan(old).length == 1
    # Match the reviewed local span only, never a parenthesized longer label.
    raise "partially paired or changed span at #{key.inspect}" if text.include?("#{old}(")
    [text.sub(old, replacement), false]
  end

  def build_candidate_reviews(inventory, index, candidates)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = SPECS.to_h { |spec| [spec.fetch(:key), spec.fetch(:count)] }
    actual = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source coverage mismatch: #{actual.inspect}" unless actual == expected
    prior_by_key = index.group_by { |row| row_key(row) }
    reviewed = GROUPS.flat_map do |term, decision|
      keys = candidate_keys(candidates.fetch(term))
      spec = SPECS.find { |item| item.fetch(:english) == term }
      if spec
        keys |= generated.select { |row| row.fetch('entity_key') == spec.fetch(:key) }
          .map { |row| row_key(row) }
      end
      raise "#{term} key count differs: #{keys.length}" unless keys.length == decision.fetch(:expected_keys)
      keys.sort.map do |key|
        source = inventory.fetch(key)
        raise "English candidate missing at #{key.inspect}" unless source_term?(source, term)
        text = source.fetch('work_text')
        proposed, excluded = spec ? transform(spec, key, text, source) : [text, false]
        status = if excluded
                   'excluded'
                 elsif proposed != text
                   'accepted'
                 elsif spec
                   'not-an-issue'
                 else
                   decision.fetch(:disposition)
                 end
        prior = prior_by_key.fetch(key, []).map do |row|
          [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
        end
        {
          'english_candidate' => term, 'disposition' => status,
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'), 'korean' => text,
          'evidence' => "#{decision.fetch(:evidence)} #{CONTEXT}",
          'prior_index_dispositions_json' => JSON.generate(prior)
        }
      end
    end
    keys = reviewed.map { |row| row_key(row) }
    raise "D-#{D} exceeds 50 distinct source keys" if keys.uniq.length > 50
    raise 'duplicate candidate/key disposition' unless
      reviewed.map { |row| [row.fetch('english_candidate'), *row_key(row)] }.uniq.length == reviewed.length
    reviewed
  end

  def validate_ownership!(glossary)
    terms = SPECS.map { |spec| spec.fetch(:english).downcase }
    glossary.each do |row|
      owned = [row.fetch('english_canonical'), *row.fetch('english_aliases', '').to_s.split('|')]
      raise "new scope already owned: #{row.fetch('entity_key')}" if
        SPECS.any? { |spec| spec.fetch(:key) == row.fetch('entity_key') } ||
        owned.any? { |term| terms.include?(term.downcase) }
    end
    raise 'existing Arkes owner missing' unless
      glossary.any? { |row| row.fetch('entity_key') == 'person:arkes' }
  end

  def load_candidates
    M.table(INPUT).to_h { |row| [row.fetch('english_candidate'), row.to_h] }
  end

  # This path reads the saved source alignment and current Korean CSVs only.
  def preflight
    before = M.hashes
    inventory = M.table(M::INVENTORY).to_h { |row| [row_key(row), row.to_h] }
    M::RESOURCES.each do |resource|
      CSV.foreach(M.csv_path(resource), headers: true, col_sep: ';', encoding: 'bom|utf-8') do |row|
        key = [resource, row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
        inventory.fetch(key)['work_text'] = row.fetch('Texto')
      end
    end
    validate_ownership!(M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h))
    index = M.table(M::INDEX).map(&:to_h)
    reviews = build_candidate_reviews(inventory, index, load_candidates)
    raise 'active CSV changed during preflight' unless M.hashes == before
    puts JSON.generate(batch: "D-#{D}", mode: 'read-only',
                       groups: GROUPS.length, keys: reviews.map { |row| row_key(row) }.uniq.length,
                       dispositions: reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length))
    reviews
  end

  def append_candidate_summary
    section = <<~TEXT

      ## D-#{D}: Short-Label Candidate Review

      Reviewed 40 exact source keys across five groups from the D-21718
      snapshot. Registered Clan Totem, Consistorium, and Crown of the Sun
      using English identity evidence and aligned Japanese/Chinese.
      Excluded the longer Kobold Clan Totem and Consistorium Key component
      matches without editing their cells. Counsel remains held as an
      unregistered alias/title of existing Arkes, not a second person.
      Crown of Clouds remains held: a short label and a Tunnel label do
      not establish the short label's object/place identity. Cur is outside
      this batch: its complete 19-key scan would exceed the 50-key bound.
      Prior row/entity decisions, translation holds, and historical totals
      are preserved. Exact locale and prior-index evidence is in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md README.md decision-register-20261009.md].each do |filename|
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
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise "D-#{D} outputs already exist" if [OUTPUT, SNAPSHOT].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    validate_ownership!(glossary)
    before = M.hashes
    reviews = build_candidate_reviews(inventory, M.table(M::INDEX).map(&:to_h), load_candidates)
    raise 'active CSV changed while assembling scope' unless M.hashes == before
    ReviewedDiscoverySpecs.run(
      D, 'Clan Totem, Consistorium, and Crown of the Sun',
      SPECS, CONTEXT, '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }
    M.write_table(OUTPUT, HEADERS, reviews)
    inventory = M.refresh_inventory
    candidates = ShortLabelDiscovery20261018.build(
      inventory.values,
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h),
      M.table(M::INDEX).map(&:to_h)
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, candidates)
    append_candidate_summary
    refresh_checkpoint(candidates)
    puts "D-#{D}: 40 reviewed keys/5 groups; three new scopes; two held candidate groups."
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewShortLabelCandidatesD21721.preflight
  when ['--apply']
    ReviewShortLabelCandidatesD21721.run
  else
    abort 'Usage: review-short-label-candidates-D21721.rb [--check|--apply]'
  end
end
