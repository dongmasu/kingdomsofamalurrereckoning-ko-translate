#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewLateAlphabetD21731
  extend self

  M = ReviewedNameBatches
  D = 21_731
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21730.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  CONTEXT = 'Reviewed only the eight requested late-alphabet candidate groups across all exact English source hits. English is primary; aligned Japanese and Chinese corroborate per key. The official Korean manual reference/extraction has no direct entry for these names and does not establish a competing rendering. New entity rows are additive: all existing entity/key dispositions, historical holds, and global counts remain untouched. Do not globalize Well, Vorm, or Warsworn aliases. Keep Warsworn Galley/Keep as translated faction descriptors, not unique vessel/place identities. Exclude the Wall of Thorns quest objective from its lore-term scope; exclude the Draught of the Wandering Well atomic item and retain D-11477 default:35453 as uncertain. Preserve D-11506/D-14973 Warsworn Keep, D-15934 Warsworn Galley, D-16493 Warden of Light, D-17488 Wall of Thorns, and prior person:vorm exclusions.'.freeze

  SPECS = [
    {
      key: 'item:votive-of-leaf',
      english: 'Votive of Leaf',
      category: 'unique item',
      korean: '잎사귀 봉헌물(Votive of Leaf)',
      variants: '잎의 봉헌물|잎사귀 봉헌물',
      count: 2,
      notes: 'base:2051 is an exact standalone item label, and default:11834 repeats it in the item-label context. Japanese 葉の装身具 and Chinese 绿叶还愿符/树叶还愿符 support a leaf votive/ornament rather than an ordinary leaf. Reuse 잎사귀 봉헌물(Votive of Leaf) from default:11834; no person, deity, or broader leaf-item alias is inferred.'
    },
    {
      key: 'lore:wall-of-thorns',
      english: 'Wall of Thorns',
      category: 'lore term',
      korean: '가시 장벽(Wall of Thorns)',
      variants: '가시 장벽|가시덤불 장벽|가시의 벽|가시의 장벽|가시나무 장벽|가시덩굴 장벽',
      count: 10,
      notes: 'English default:9499 explicitly describes the Wall of Thorns as the bramble barrier blocking progress; 35134 calls it magical, while 8428/25389/38294 tie passage to the House of Ballads armor challenge. Japanese 茨の壁 and Chinese 荆棘之墙 corroborate the named obstacle. Register the bounded magical barrier as a lore term, not a place or generic wall. Preserve D-17488 history; exclude default:57998 because it is the atomic quest objective “Pass the Wall of Thorns,” not a place label.'
    },
    {
      key: 'place:wandering-well',
      english: 'Wandering Well',
      category: 'place',
      korean: '떠도는 샘(Wandering Well)',
      variants: '방랑하는 샘|방랑의 샘|떠도는 샘',
      count: 7,
      notes: 'default:11942/15496/35453 describe finding or visiting the same mystical, moving water source; 32580 is the exact “Find the Wandering Well” objective and base:3893 is its standalone label. Japanese さまよいの泉 and Chinese 流浪之泉 corroborate. Register only this named source, with no generic Well alias. Exclude base:3618/default:33169 where the phrase occurs inside the atomic Draught of the Wandering Well item. Keep default:35453 unchanged and out of this entity occurrence because D-11477 explicitly leaves its quest-sequence/name relationship uncertain.'
    },
    {
      key: 'title:warden-of-light',
      english: 'Warden of Light',
      category: 'title',
      korean: '빛의 수호자(Warden of Light)',
      variants: '빛의 감시자|빛의 수호자',
      count: 4,
      notes: 'default:26184 explicitly calls Warden of Light a bestowed title requiring its bearer to lead others on a righteous path; default:12265/54484 present the male/female bearer against darkness. Japanese 光の番人 and Chinese 光之守望者/光明守望者 corroborate. Register one title, not a person or general warden office. Preserve D-16493 historical uncertainty and D-19286 title context.'
    },
    {
      key: 'unique_item:warsworn-ledger',
      english: 'Warsworn Ledger',
      category: 'unique item',
      korean: '워스원 장부(Warsworn Ledger)',
      variants: '워스원 장부',
      count: 3,
      notes: 'base:839/default:63774 are exact item-label rows; default:14343 says a corpse contains the Mission Brief from Shieldring Keep identified as “Warsworn Ledger.” Japanese ウォースウォーンの台帳 and Chinese 誓战者分类账/誓战者账簿 corroborate. Register this document/item atomically; preserve the existing faction:warsworn component decisions and do not add a Warsworn alias.'
    },
    {
      key: 'place:vorm-lodge',
      english: 'Vorm Lodge',
      category: 'place',
      korean: '보름 산장(Vorm Lodge)',
      variants: '보름(Vorm) 산장|보름 별장|보름 산장|보름 로지',
      count: 4,
      notes: 'base:4137 is the standalone label; default:81 locates Gunnar Frode there in the Sidhe, and default:34595/default:59086 repeat the location label. Japanese ヴォームの山荘 and Chinese 沃尔姆小屋/沃姆旅馆 corroborate the place. Reuse the established 보름 stem and standardize to 보름 산장(Vorm Lodge). Keep person:vorm D-20561/D-20567/D-20571 exclusions unchanged; do not create a global Vorm person alias or merge the lodge with the Vorm family.'
    }
  ].freeze

  GROUPS = {
    'Votive of Leaf' => {
      expected_keys: 2,
      evidence: SPECS[0].fetch(:notes)
    },
    'Wall of Thorns' => {
      expected_keys: 10,
      evidence: SPECS[1].fetch(:notes)
    },
    'Wandering Well' => {
      expected_keys: 7,
      evidence: SPECS[2].fetch(:notes)
    },
    'Warden of Light' => {
      expected_keys: 4,
      evidence: SPECS[3].fetch(:notes)
    },
    'Warsworn Galley' => {
      expected_keys: 3,
      evidence: 'The exact rows describe a Warsworn galley/vessel by faction and type; Japanese ウォースウォーンのガレー船 and Chinese 誓战者战舰 corroborate that descriptor. No source names an individual ship. Preserve D-15934 at default:52447 as uncertain and retain all faction:warsworn row decisions; do not register a unique vessel or nested label.'
    },
    'Warsworn Keep' => {
      expected_keys: 11,
      evidence: 'The source uses Warsworn Keep generically: “any” Keep, the nearest Keep, three Keeps in the Summer Faelands, and a Keep as a faction base. Japanese ウォースウォーン砦 and Chinese 誓战要塞 corroborate a faction fort, not one uniquely named place. Keep the translated descriptor and faction:warsworn decisions; preserve D-11506 default:35531 and D-14973 default:48933 uncertainty. Do not create one global Keep/place identity.'
    },
    'Warsworn Ledger' => {
      expected_keys: 3,
      evidence: SPECS[4].fetch(:notes)
    },
    'Vorm Lodge' => {
      expected_keys: 4,
      evidence: SPECS[5].fetch(:notes)
    }
  }.freeze

  EXCLUDED_KEYS = {
    'lore:wall-of-thorns' => [['default', '57998', '']],
    'place:wandering-well' => [
      ['base', '3618', '11'], ['default', '33169', ''], ['default', '35453', '']
    ]
  }.freeze
  COMPLETE_KEYS = {
    'item:votive-of-leaf' => [['default', '11834', '']],
    'lore:wall-of-thorns' => [['default', '8428', '']],
    'place:wandering-well' => [['default', '11942', '']],
    'title:warden-of-light' => [['default', '54484', '']],
    'unique_item:warsworn-ledger' => [['default', '14343', '']]
  }.freeze
  SPANS = {
    'item:votive-of-leaf' => {
      ['base', '2051', '11'] => ['잎의 봉헌물', '잎사귀 봉헌물(Votive of Leaf)']
    },
    'lore:wall-of-thorns' => {
      ['base', '4612', '11'] => ['가시 장벽', '가시 장벽(Wall of Thorns)'],
      ['default', '9499', ''] => ['가시의 벽', '가시 장벽(Wall of Thorns)'],
      ['default', '21275', ''] => ['가시 장벽', '가시 장벽(Wall of Thorns)'],
      ['default', '25389', ''] => ['가시의 장벽', '가시 장벽(Wall of Thorns)'],
      ['default', '35134', ''] => ['가시덤불 장벽', '가시 장벽(Wall of Thorns)'],
      ['default', '38294', ''] => ['가시 장벽', '가시 장벽(Wall of Thorns)'],
      ['default', '40285', ''] => ['가시의 장벽', '가시 장벽(Wall of Thorns)'],
      ['default', '50367', ''] => ['가시나무 장벽', '가시 장벽(Wall of Thorns)']
    },
    'place:wandering-well' => {
      ['base', '3893', '11'] => ['방랑하는 샘', '떠도는 샘(Wandering Well)'],
      ['default', '15496', ''] => ['방랑의 샘', '떠도는 샘(Wandering Well)'],
      ['default', '32580', ''] => ['떠도는 샘', '떠도는 샘(Wandering Well)']
    },
    'title:warden-of-light' => {
      ['default', '8050', ''] => ['빛의 감시자', '빛의 수호자(Warden of Light)'],
      ['default', '12265', ''] => ['빛의 수호자', '빛의 수호자(Warden of Light)'],
      ['default', '26184', ''] => ['빛의 수호자', '빛의 수호자(Warden of Light)']
    },
    'unique_item:warsworn-ledger' => {
      ['base', '839', '11'] => ['워스원(Warsworn) 장부', '워스원 장부(Warsworn Ledger)'],
      ['default', '63774', ''] => ['워스원(Warsworn) 장부', '워스원 장부(Warsworn Ledger)']
    },
    'place:vorm-lodge' => {
      ['base', '4137', '11'] => ['보름(Vorm) 산장', '보름 산장(Vorm Lodge)'],
      ['default', '81', ''] => ['보름 로지(Vorm Lodge)', '보름 산장(Vorm Lodge)'],
      ['default', '34595', ''] => ['보름 별장', '보름 산장(Vorm Lodge)'],
      ['default', '59086', ''] => ['보름 산장', '보름 산장(Vorm Lodge)']
    }
  }.freeze
  HISTORICAL_HOLDS = {
    'Wandering Well' => [['default', '35453', '']],
    'Warden of Light' => [['default', '54484', '']],
    'Warsworn Galley' => [['default', '52447', '']],
    'Warsworn Keep' => [['default', '35531', ''], ['default', '48933', '']]
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
    end.uniq
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

  def all_source_keys(inventory, term)
    inventory.values.select { |source| source_term?(source, term) }
      .map { |source| row_key(source) }.sort
  end

  def transform(spec, key, text, source)
    entity = spec.fetch(:key)
    raise "English source missing at #{key.inspect}" unless source_term?(source, spec.fetch(:english))
    return [text, true] if EXCLUDED_KEYS.fetch(entity, []).include?(key)
    if COMPLETE_KEYS.fetch(entity, []).include?(key)
      canonical = key == ['default', '11942', ''] ?
        '떠도는 샘(Wandering Well)' : spec.fetch(:korean)
      raise "reviewed complete pair missing at #{key.inspect}" unless text.include?(canonical)
      return [text, false]
    end
    old, replacement = SPANS.fetch(entity).fetch(key) do
      raise "unmapped source occurrence for #{entity} at #{key.inspect}"
    end
    return [text, false] if text.include?(replacement)
    raise "expected one Korean span at #{key.inspect}" unless text.scan(old).length == 1
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
      candidate = candidates.fetch(term) { raise "candidate missing in D-#{21_718}: #{term}" }
      keys = (candidate_keys(candidate) + all_source_keys(inventory, term)).uniq.sort
      raise "#{term} key count differs: #{keys.length}" unless keys.length == decision.fetch(:expected_keys)
      spec = SPECS.find { |item| item.fetch(:english) == term }
      keys.map do |key|
        source = inventory.fetch(key)
        raise "English candidate missing at #{key.inspect}" unless source_term?(source, term)
        text = source.fetch('work_text')
        proposed, excluded = spec ? transform(spec, key, text, source) : [text, false]
        hold = HISTORICAL_HOLDS.fetch(term, []).include?(key)
        status = if hold
                   'uncertain'
                 elsif excluded
                   'excluded'
                 elsif proposed != text
                   'accepted'
                 elsif spec
                   'not-an-issue'
                 else
                   'not-an-issue'
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
    raise "D-#{D} exceeds 50 distinct source keys: #{keys.uniq.length}" if keys.uniq.length > 50
    raise 'duplicate candidate/key disposition' unless
      reviewed.map { |row| [row.fetch('english_candidate'), *row_key(row)] }.uniq.length == reviewed.length
    reviewed
  end

  def validate_ownership!(glossary)
    terms = SPECS.map { |spec| spec.fetch(:english).downcase }
    SPECS.each do |spec|
      raise "new entity already registered: #{spec.fetch(:key)}" if
        glossary.any? { |row| row.fetch('entity_key') == spec.fetch(:key) }
    end
    glossary.each do |row|
      owned = [row.fetch('english_canonical'), *row.fetch('english_aliases', '').to_s.split('|')]
      collision = owned.find { |term| terms.include?(term.downcase) }
      raise "English label already owned: #{collision} by #{row.fetch('entity_key')}" if collision
    end
  end

  def load_candidates(path = INPUT)
    M.table(path).to_h { |row| [row.fetch('english_candidate'), row.to_h] }
  end

  # Check mode reads source files and the saved alignment only.
  def preflight
    before = M.hashes
    inventory = M.table(M::INVENTORY).to_h { |row| [row_key(row), row.to_h] }
    M::RESOURCES.each do |resource|
      CSV.foreach(M.csv_path(resource), headers: true, col_sep: ';', encoding: 'bom|utf-8') do |row|
        key = [resource, row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
        inventory.fetch(key)['work_text'] = row.fetch('Texto')
      end
    end
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    validate_ownership!(glossary)
    reviews = build_candidate_reviews(
      inventory, M.table(M::INDEX).map(&:to_h), load_candidates
    )
    raise 'active CSV changed during read-only preflight' unless M.hashes == before
    puts JSON.generate(batch: "D-#{D}", mode: 'read-only',
                       groups: GROUPS.length, keys: reviews.map { |row| row_key(row) }.uniq.length,
                       registered: SPECS.length,
                       dispositions: reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length))
    reviews
  end

  def append_candidate_summary
    section = <<~TEXT

      ## D-#{D}: Late-Alphabet Short-Label Review

      Reviewed 44 exact source keys across eight requested groups. Registered
      Votive of Leaf, Wall of Thorns as a lore term, Wandering Well, Warden
      of Light, Warsworn Ledger, and Vorm Lodge. Warsworn Galley and Warsworn
      Keep remain generic faction/vessel/building descriptors. The quest
      objective, atomic Draught item, D-11477 Wandering Well hold, and all
      D-11506/D-14973/D-15934/D-16493/D-17488 historical decisions remain
      preserved. Existing Vorm-person exclusions and all other prior
      entity/key states are unchanged. Exact locale and prior-index evidence
      is in `proper-name-short-label-dispositions-D#{D}.tsv`.
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
    raise 'active CSV changed while assembling reviewed scope' unless M.hashes == before
    ReviewedDiscoverySpecs.run(
      D, 'Late-Alphabet Named Items, Place, Lore Term, and Title',
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
    puts "D-#{D}: reviewed 44 keys/8 groups; registered #{SPECS.length} supported scopes."
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewLateAlphabetD21731.preflight
  when ['--apply']
    ReviewLateAlphabetD21731.run
  else
    abort 'Usage: review-late-alphabet-D21731.rb [--check|--apply]'
  end
end
