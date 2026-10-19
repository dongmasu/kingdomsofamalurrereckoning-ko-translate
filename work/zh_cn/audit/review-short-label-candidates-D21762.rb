#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21762
  extend self

  M = ReviewedNameBatches
  D = 21_762
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21761.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  MANIFEST_HEADERS = M::HEADERS.take(12)

  SPECS = [
    {
      key: 'resource:lapidus-root',
      english: 'Lapidus Root',
      category: 'resource',
      korean: '라피두스 뿌리(Lapidus Root)',
      variants: '라피두스(Lapidus) 뿌리|라피두스(Lapidus)의 뿌리|라피두스 뿌리|라피두스 뿌리(Lapidus Root)',
      count: 7,
      notes: 'English default:15709 explicitly calls Lapidus Root a herb and says it alleviates slow-acting poisons; other source rows describe its leaf and gathering. Japanese ラピダスの根 and Chinese 拉皮德斯根 corroborate the plant/root reading. Register the exact named reagent as a resource, distinct from the shorter Lapidus plant name and Lapidus Leaf. Standardize complete occurrences as 라피두스 뿌리(Lapidus Root); preserve the Korean particle outside the name span.'
    },
    {
      key: 'title:lord-kandrian',
      english: 'Lord Kandrian',
      category: 'title',
      korean: '칸드리안 경(Lord Kandrian)',
      variants: '칸드리안 경|칸드리안(Kandrian) 경|칸드리아 경|캔드리안 경|캔드리언 성주|영주 칸드리안|칸드리안 경(Lord Kandrian)',
      count: 57,
      notes: 'English identifies the source-written title Lord Kandrian across affix/base/default; Japanese カンドリアン卿 and Chinese 坎德利安领主 corroborate a lord title. English default:54366 explicitly distinguishes the deceased old Lord Kandrian from Erion Rheidarn as the new Lord Kandrian. Register the title/designation, not one person identity, and keep it distinct from place:kandrian, Kandrian Keep, the Kandrian family, and other people bearing the surname. Reuse the corpus-established 칸드리안 경 and pair the complete title as 칸드리안 경(Lord Kandrian). Do not alter other Kandrian compounds or title words.'
    },
    {
      key: 'title:loremaster',
      english: 'Loremaster',
      category: 'title',
      korean: '전승지기(Loremaster)',
      variants: '전승지기|전승지기(Loremaster)|전승학자(Loremaster)',
      count: 9,
      notes: 'English default:5809, 13240, 13486, and 52070 use Loremaster as a specific office/title; Japanese 伝承師 and Chinese 智慧之主 support the lore-keeper/learned-office sense. Register those four title references as 전승지기(Loremaster), without inferring the office-holder’s identity. The other five exact-source matches use lowercase generic loremaster descriptions and are excluded from the proper-title scope without edits.'
    }
  ].freeze

  GROUPS = {
    'Lady Oleyn' => {
      count: 4, status: 'not-an-issue',
      evidence: 'All four candidate keys are already owned by person:oleyn and carry terminal row dispositions. English Lady Oleyn, Japanese レディー・オレイン, and Chinese 奥蕾因女士 agree; the Korean forms already pair the established Oleyn name and translated title. Preserve every prior disposition and do not re-open the person rows.'
    },
    'Lapidus Root' => {
      count: 4, status: 'candidate',
      evidence: 'The named plant/reagent identity is established by the complete source scan and registered as resource:lapidus-root. The bounded candidate keys are classified from their exact new/old Korean cells; the full seven-key occurrence scope is in the occurrence index and edit manifests.'
    },
    'Leanashe Tentacle' => {
      count: 3, status: 'not-an-issue',
      evidence: 'These rows refer to a tentacle of the already registered Leanashe monster, not a second named monster or unique item. Existing monster:leanashe row dispositions are preserved. Japanese リャナンシーの触手 and Chinese 蛇身女妖触须 corroborate the anatomy reading.'
    },
    'Legs' => {
      count: 2, status: 'not-an-issue',
      evidence: 'English Legs is a generic body-part/category label; the other candidate key is an alphabet poem in which “Legs” is not an entity label. Japanese 腰 and Chinese 腿 support ordinary anatomy, and Korean 다리 is appropriate. No proper-name registration or edit.'
    },
    'Longbow' => {
      count: 4, status: 'not-an-issue',
      evidence: 'Longbow is the generic weapon class, including a skill description, not a uniquely named weapon. Japanese ロングボウ and Chinese 长弓 corroborate the equipment term; Korean 장궁 and the existing 장궁(Longbow) pair are retained.'
    },
    'Lord Kandrian' => {
      count: 17, status: 'candidate',
      evidence: 'The full 57-key source scan registers Lord Kandrian as a transferable/local lord title, not a single person; default:54366 explicitly identifies a deceased title-holder and Erion as the new one. The bounded candidate keys are classified from the reviewed cell transformation; prior place:kandrian exclusions remain untouched.'
    },
    'Loremaster' => {
      count: 2, status: 'candidate',
      evidence: 'The two bounded source keys identify the Loremaster office/title, not a named individual. Four exact-source title uses are registered as title:loremaster and standardized to 전승지기(Loremaster); five lowercase generic uses are excluded without edits.'
    }
  }.freeze

  LORD_KOREAN = /
    칸드리안\(Kandrian\)\s*경 |
    칸드리안\s*경(?!비)(?:\(Lord\ Kandrian\))? |
    칸드리아\s*경 |
    캔드리안\s*경 |
    캔드리언\s*성주님? |
    영주\s*칸드리안
  /x.freeze
  LAPIDUS_ROOT_KOREAN = /
    라피두스\(Lapidus\)(?:의)?\s*뿌리 |
    라피두스\s*뿌리(?:\(Lapidus\ Root\))?
  /x.freeze
  LOREMASTER_TITLE_KEYS = [
    ['default', '5809', ''],
    ['default', '13240', ''],
    ['default', '13486', ''],
    ['default', '52070', '']
  ].to_set.freeze

  def row_key(row)
    M.key(row)
  end

  def source_count(source, term)
    pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
    JSON.parse(source.fetch('en_texts_json')).compact.sum { |text| text.scan(pattern).length }
  end

  def candidate_keys(candidate)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |key| key.map(&:to_s) }
    end.uniq.sort
  end

  def definitions
    headers = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers
    SPECS.map do |spec|
      headers.zip([
        spec.fetch(:key), spec.fetch(:english), spec.fetch(:category),
        spec.fetch(:korean), '', spec.fetch(:variants), "D-#{D}",
        'confirmed', spec.fetch(:notes)
      ]).to_h
    end
  end

  def transform(spec, key, text, source)
    term = spec.fetch(:english)
    english_count = source_count(source, term)
    raise "English occurrence missing at #{key.inspect}" unless english_count.positive?
    pattern, canonical = case term
                         when 'Lord Kandrian'
                           [LORD_KOREAN, SPECS.fetch(1).fetch(:korean)]
                         when 'Lapidus Root'
                           [LAPIDUS_ROOT_KOREAN, SPECS.fetch(0).fetch(:korean)]
                         when 'Loremaster'
                           return [text, true] unless LOREMASTER_TITLE_KEYS.include?(key)
                           [/(?:전승지기(?:\(Loremaster\))?|전승학자(?:\(Loremaster\))?)/, SPECS.fetch(2).fetch(:korean)]
                         else
                           raise "missing transform for #{term}"
                         end
    found = 0
    updated = text.gsub(pattern) do
      found += 1
      canonical
    end
    raise "Korean/source occurrence count differs for #{term} at #{key.inspect}: #{found}/#{english_count}" unless found == english_count
    [updated, false]
  end

  def full_source_keys(inventory, term)
    inventory.values.select { |source| source_count(source, term).positive? }
             .map { |source| row_key(source) }.uniq.sort
  end

  def build_candidate_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| row_key(row) }
    reviewed = GROUPS.flat_map do |term, decision|
      keys = candidate_keys(candidates.fetch(term))
      raise "#{term} candidate key count differs: #{keys.length}" unless keys.length == decision.fetch(:count)
      spec = SPECS.find { |item| item.fetch(:english) == term }
      keys.map do |key|
        source = inventory.fetch(key)
        old = source.fetch('work_text')
        new_text = spec ? transform(spec, key, old, source).first : old
        status = if decision.fetch(:status) == 'candidate'
                   new_text == old ? 'not-an-issue' : 'accepted'
                 else
                   decision.fetch(:status)
                 end
        {
          'english_candidate' => term,
          'disposition' => status,
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => old,
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(key, []).map do |row|
              [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
            end
          )
        }
      end
    end
    keys = reviewed.map { |row| row_key(row) }
    raise "D-#{D} candidate scope exceeds 50 distinct keys" if keys.uniq.length > 50
    raise 'duplicate candidate/key disposition' unless
      reviewed.map { |row| [row.fetch('english_candidate'), *row_key(row)] }.uniq.length == reviewed.length
    raise 'candidate key overlap requires explicit combined review' unless keys.uniq.length == keys.length
    reviewed
  end

  def build_discovery_reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = SPECS.to_h { |spec| [spec.fetch(:key), spec.fetch(:count)] }
    actual = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "full-source coverage differs: #{actual.inspect}" unless actual == expected
    generated.group_by { |occurrence| row_key(occurrence) }.map do |key, occurrences|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      occurrences.each do |occurrence|
        spec = SPECS.find { |item| item.fetch(:key) == occurrence.fetch('entity_key') }
        new_text, excluded = transform(spec, key, new_text, source)
        dispositions[spec.fetch(:key)] = excluded ? 'excluded' : nil
      end
      dispositions.transform_values! do |value|
        value || (old == new_text ? 'not-an-issue' : 'accepted')
      end
      status = if dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               elsif old == new_text
                 'not-an-issue'
               else
                 'accepted'
               end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "D-#{D}: #{occurrences.map { |occurrence| SPECS.find { |spec| spec.fetch(:key) == occurrence.fetch('entity_key') }.fetch(:notes) }.uniq.join(' ')}",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
  end

  def append_candidate_summary(reviews, next_snapshot)
    counts = reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    group_counts = reviews.group_by { |row| row.fetch('english_candidate') }.transform_values(&:length)
    next_term = next_snapshot.first&.fetch('english_candidate', 'none')
    note = <<~TEXT

      ## D-#{D}: Full-Name Candidate And Title Review

      Reviewed 36 bounded short-label candidate keys across Lady Oleyn,
      Lapidus Root, Leanashe Tentacle, Legs, Longbow, Lord Kandrian, and
      Loremaster: #{group_counts.inspect}. Registered all seven Lapidus Root
      occurrences as resource:lapidus-root; the exact source calls it a herb,
      and aligned Japanese/Chinese support the named root/reagent. Registered
      all 57 Lord Kandrian occurrences as the transferable title
      title:lord-kandrian, not one person; default:54366 distinguishes the
      deceased holder from Erion as the new holder. Registered four specific
      Loremaster office/title uses as title:loremaster and excluded five
      lowercase generic uses. Standardized
      only the reviewed title/resource spans. Lady Oleyn and Leanashe
      dispositions remain under their existing owners; Legs and Longbow are
      generic labels. Prior terminal findings were preserved and not
      recounted. Candidate dispositions: #{counts.inspect}. Exact candidate
      evidence is in `proper-name-short-label-dispositions-D#{D}.tsv`;
      complete entity edit manifests are in `proper-name-edits-D#{D}.tsv`
      and `proper-name-edits-D#{D + 1}.tsv`.
      The next bounded candidate queue has #{next_snapshot.length} groups and
      begins with `#{next_term}`; it is not an exhaustive completion estimate.
      Full proper-name discovery/residual validation remains incomplete.
    TEXT
    %W[
      named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
      named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md
      named-scope-review-D#{D + 1}-#{M::RUN_DATE_COMPACT}.md
      named-scope-edit-addendum-D#{D + 1}-#{M::RUN_DATE_COMPACT}.md
      README.md decision-register-20261009.md
    ].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
  end

  def refresh_next_checkpoint(next_snapshot)
    next_term = next_snapshot.first&.fetch('english_candidate', 'none')
    line = "Next batch: D-#{D + 2}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; begins `#{next_term}`; not exhaustive or a completion estimate)."
    report = File.join(__dir__, "named-scope-review-D#{D + 1}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D + 1}-#{M::RUN_DATE_COMPACT}.md")
    (M::DOCS + [report, addendum]).each do |path|
      text = File.read(path)
      text.sub!(/Next batch: D-#{D + 2};.*?\n/, "#{line}\n") ||
        raise("missing D-#{D + 2} checkpoint in #{path}")
      File.write(path, text)
    end
  end

  def run
    raise "D-#{D} outputs already exist" if [OUTPUT, SNAPSHOT].any? { |path| File.exist?(path) }
    before = M.hashes
    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path).map(&:to_h)
    SPECS.each do |spec|
      raise "entity already exists: #{spec.fetch(:key)}" if glossary.any? do |row|
        row.fetch('entity_key') == spec.fetch(:key) ||
          ([row.fetch('english_canonical')] + row.fetch('english_aliases', '').to_s.split('|'))
            .any? { |term| term.casecmp?(spec.fetch(:english)) }
      end
    end
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_candidate_reviews(inventory, M.table(M::INDEX).map(&:to_h), candidates)
    definitions_tsv = definitions
    discovery_reviews = build_discovery_reviews(inventory)
    raise 'active CSV changed while assembling review scope' unless M.hashes == before
    M.write_table(OUTPUT, HEADERS, reviews)
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    M.write_table(definition_path, M.table(glossary_path).headers, definitions_tsv)
    M.write_table(review_path, MANIFEST_HEADERS, discovery_reviews)

    ReviewedProperNameDiscovery.run([definition_path, review_path, D.to_s])
    inventory = M.refresh_inventory
    glossary = M.table(glossary_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    next_snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    append_candidate_summary(reviews, next_snapshot)
    refresh_next_checkpoint(next_snapshot)
    puts "D-#{D}-D-#{D + 1}: candidate_keys=#{reviews.length}; new entity matches=#{discovery_reviews.length}; " \
         "next bounded groups=#{next_snapshot.length}; begins=#{next_snapshot.first&.fetch('english_candidate', 'none')}."
  end
end

if $PROGRAM_NAME == __FILE__
  ReviewShortLabelCandidatesD21762.run
end
