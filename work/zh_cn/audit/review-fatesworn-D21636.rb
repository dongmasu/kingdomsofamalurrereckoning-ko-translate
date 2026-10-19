#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewFateswornD21636
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_636
  LOCALES = %w[en_us ja_jp zh_cn].freeze
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  MANIFEST_HEADERS = (M::HEADERS + %w[scope existing_owner_scope prior_terminal_json]).freeze

  HISTORICAL_KEYS = %w[4598 39567 39916 43993 49217 49657]
    .map { |id| ['default', id, ''].freeze }.freeze
  PRODUCT_KEYS = %w[9945 16239 29630 36174 64450]
    .map { |id| ['default', id, ''].freeze }.freeze
  PLAYER_TITLE_KEYS = [%w[default 60886]].map { |row_key| (row_key + ['']).freeze }.freeze
  HOLD_KEYS = %w[3351 13237 21502 37184 56299 62264]
    .map { |id| ['default', id, ''].freeze }.freeze
  THREAT_KEY = ['default', '62915', ''].freeze
  REVIEW_KEYS = (
    HISTORICAL_KEYS + PRODUCT_KEYS + PLAYER_TITLE_KEYS + HOLD_KEYS + [THREAT_KEY]
  ).freeze

  HOPE_OWNER_KEYS = (
    %w[1338 2088 2741 3405 3564].map { |id| ['base', id, '11'].freeze } +
    %w[505 649 1288 7559 8089 9966 15634 18681 35769 40120 41974 59401 59909]
      .map { |id| ['default', id, ''].freeze }
  ).freeze
  ALL_FATESWORN_KEYS = (REVIEW_KEYS + HOPE_OWNER_KEYS).sort.freeze
  WORD = /(?<![A-Za-z])Fatesworn(?![A-Za-z])/i

  SPECS = {
    ['default', '3351', ''] => {
      'scope' => 'identity-hold',
      'en' => ["What does 'Fatesworn' mean?"],
      'ja' => 'フェイトスウォーン',
      'zh' => '誓命者',
      'hold' => 'The line asks for the term meaning; it does not resolve whether this is a group, title, or product.'
    },
    ['default', '4598', ''] => {
      'scope' => 'historical-group-label',
      'en' => ['the Fatesworn'],
      'ja' => 'フェイトスウォーン',
      'zh' => '誓命者',
      'already_paired' => true,
      'hold' => 'Pairing only; do not assign a new entity or infer a global alias from this custody reference.'
    },
    ['default', '9945', ''] => {
      'scope' => 'dlc-story-product',
      'en' => ['introduced in Fatesworn'],
      'ja' => 'フェイトスウォーンで登場',
      'zh' => '誓命者中引入',
      'replace' => ['페이트스원', '페이트스원(Fatesworn)'],
      'hold' => 'Pair the product name locally; leave every Chaos Weapons/Core decision in this mixed row untouched.'
    },
    ['default', '13237', ''] => {
      'scope' => 'identity-number-hold',
      'en' => ['The Fatesworn will glimpse', 'The Fatesworn will seal', 'The Fatesworn will seek'],
      'ja' => 'フェイトスウォーンは',
      'zh' => '誓命者将',
      'hold' => 'Keep all three prophetic references unchanged; the source does not settle the group identity or number for this glossary scope.'
    },
    ['default', '16239', ''] => {
      'scope' => 'dlc-story-product',
      'en' => ['story of Fatesworn'],
      'ja' => 'フェイトスウォーンのストーリー',
      'zh' => '誓命者故事',
      'already_paired' => true,
      'hold' => 'The existing 운명에 맹세한 자들(Fatesworn) pairing is retained; preserve the Amalur, Chaos Sight, Rift, Portal, and Realm decisions.'
    },
    ['default', '21502', ''] => {
      'scope' => 'identity-number-hold',
      'en' => ['stories of the Fatesworn'],
      'ja' => 'フェイトスウォーンの物語',
      'zh' => '誓命者的故事',
      'hold' => 'The skeptical reference to stories does not resolve whether Fatesworn names a group, product, or legend.'
    },
    ['default', '29630', ''] => {
      'scope' => 'dlc-story-product',
      'en' => ['Get Fatesworn DLC'],
      'ja' => 'Fatesworn',
      'zh' => 'Fatesworn DLC',
      'already_paired' => true,
      'hold' => 'The complete DLC action label is already paired; retain it as a product label, not a faction.'
    },
    ['default', '36174', ''] => {
      'scope' => 'dlc-story-product',
      'en' => ['Pre-Purchase Fatesworn DLC'],
      'ja' => 'Fatesworn DLC',
      'zh' => 'Fatesworn DLC',
      'replace' => ['페이트스원 DLC', '페이트스원(Fatesworn) DLC'],
      'hold' => 'Pair only the product name in the existing purchase label.'
    },
    ['default', '37184', ''] => {
      'scope' => 'identity-hold',
      'en' => ['Fatesworn'],
      'ja' => 'フェイトスウォーン',
      'zh' => '誓命者',
      'hold' => 'The standalone label does not distinguish the historical group, DLC/story product, or title.'
    },
    ['default', '39567', ''] => {
      'scope' => 'historical-group-label',
      'en' => ['the Fatesworn'],
      'ja' => 'フェイトスウォーン',
      'zh' => '誓命者',
      'already_paired' => true,
      'hold' => 'The self-naming statement identifies a group, but does not independently equate it to the later Warsworn.'
    },
    ['default', '39916', ''] => {
      'scope' => 'historical-group-label',
      'en' => ['The Fatesworn became soldiers for hire'],
      'ja' => 'フェイトスウォーンは傭兵の集団',
      'zh' => '誓命者成了雇佣兵',
      'replace' => ['페이트스원은', '페이트스원(Fatesworn)은'],
      'hold' => 'Pair the explicitly named mercenary group locally; do not add a Warsworn alias.'
    },
    ['default', '43993', ''] => {
      'scope' => 'historical-group-label',
      'en' => ['the Fatesworn left us with a method'],
      'ja' => 'フェイトスウォーンは探す方法を残している',
      'zh' => '誓命者给我们留下了追踪部件的方法',
      'replace' => ['페이트스원은', '페이트스원(Fatesworn)은'],
      'hold' => 'Pair the group label locally; the row does not identify it as the Warsworn.'
    },
    ['default', '49217', ''] => {
      'scope' => 'historical-warsworn-name',
      'en' => ['named themselves the Fatesworn', 'the Warsworn'],
      'en_count' => 1,
      'ja' => %w[フェイトスウォーンと名乗った ウォースウォーン],
      'zh' => %w[自称为誓命者 现在的名字叫誓战者],
      'replace' => ['페이트스원이라', '페이트스원(Fatesworn)이라'],
      'owner' => 'faction:warsworn',
      'hold' => 'This exact sentence equates the historical self-name with the Warsworn. Add only this row-scoped Fatesworn pairing under the existing Warsworn owner; preserve its terminal Warsworn decision and add no global alias.'
    },
    ['default', '49657', ''] => {
      'scope' => 'historical-group-modifier',
      'en' => ['old Fatesworn armor'],
      'ja' => '古代のフェイトスウォーンの鎧',
      'zh' => '古老的誓命者护甲',
      'replace' => ['페이트스워른 갑옷', '페이트스워른(Fatesworn) 갑옷'],
      'hold' => 'Pair the group modifier only; do not identify this generic old armor with the Hope of the Fatesworn set or person:skald-atlas.'
    },
    ['default', '56299', ''] => {
      'scope' => 'identity-hold',
      'en' => ['the tale of the Fatesworn'],
      'ja' => 'フェイトスウォーンの物語',
      'zh' => '誓命者的故事',
      'hold' => 'The tale reference does not establish whether the term means the historical group, DLC/story, or a legend.'
    },
    ['default', '60886', ''] => {
      'scope' => 'player-epithet',
      'en' => ['the Fatesworn'],
      'ja' => 'フェイトスウォーンだ',
      'zh' => '誓命者',
      'already_paired' => true,
      'hold' => 'The parallel epithets Fateless One and Dead Soul Walking make this a player title. Keep 운명맹세자(Fatesworn) local to this row; do not alias the faction or DLC.'
    },
    ['default', '62264', ''] => {
      'scope' => 'identity-hold',
      'en' => ['The Fatesworn is behind our liberation'],
      'ja' => 'フェイトスウォーンは解放を助けてくれた',
      'zh' => '誓命者是我们解放背后的力量',
      'hold' => 'The liberation claim does not identify which Fatesworn referent is meant.'
    },
    ['default', '62915', ''] => {
      'scope' => 'atomic-title',
      'en' => ['Threat of the Fatesworn'],
      'ja' => 'フェイトスウォーンの脅威',
      'zh' => '誓命者的威胁',
      'replace' => ['페이트스원의 위협', '페이트스원의 위협(Threat of the Fatesworn)'],
      'hold' => 'Pair the complete source title atomically; do not create a nested Fatesworn occurrence or infer a narrower title subtype.'
    },
    ['default', '64450', ''] => {
      'scope' => 'dlc-story-product',
      'en' => ['Fatesworn story line'],
      'ja' => 'フェイトスウォーンのストーリーライン',
      'zh' => '誓命者故事线',
      'replace' => ['페이트스원 이야기', '페이트스원(Fatesworn) 이야기'],
      'hold' => 'Pair only the story-product name; preserve the existing Chaos Sight, Amalur, and Portal decisions.'
    }
  }.freeze

  def key(resource, id, variant = '')
    [resource, id, variant.to_s]
  end

  def row_key(row)
    M.key(row)
  end

  def source_words(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n").scan(WORD)
  end

  def active_inventory
    rows = M::RESOURCES.flat_map do |resource|
      aligned = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *aligned).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end
    inventory = rows.to_h { |row| [M.key(row), row] }
    raise 'incomplete or duplicate active aligned inventory' unless
      rows.length == 73_430 && inventory.length == rows.length
    inventory
  end

  def exact_source_scope!(inventory)
    actual = inventory.values.each_with_object([]) do |source, matches|
      matches << M.key(source) unless source_words(source).empty?
    end.sort
    expected = ALL_FATESWORN_KEYS.sort
    return if actual == expected

    raise "all-resource Fatesworn scope differs: " \
          "missing=#{(expected - actual).inspect}; extra=#{(actual - expected).inspect}"
  end

  def validate_glossary_and_index!(glossary, index)
    exact_fatesworn_owners = glossary.select do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.to_s.casecmp?('Fatesworn') }
    end
    raise 'unexpected global Fatesworn glossary owner or alias' unless exact_fatesworn_owners.empty?

    hope = glossary.select { |row| row['entity_key'] == 'unique_item:hope-of-the-fatesworn' }
    raise 'Hope owner definition changed' unless hope.length == 1 &&
      hope.first.values_at('english_canonical', 'category', 'korean_canonical', 'status') ==
        ['Hope of the Fatesworn', 'unique item',
         '운명에 맹세한 자들의 희망(Hope of the Fatesworn)', 'confirmed']
    indexed_hope = index.select { |row| row['entity_key'] == 'unique_item:hope-of-the-fatesworn' }
    raise 'D21461 Hope owner key coverage changed' unless
      indexed_hope.map { |row| M.key(row) }.sort == HOPE_OWNER_KEYS.sort
    raise 'D21461 Hope owner status distribution changed' unless
      indexed_hope.count { |row| row['status'] == 'accepted' } == 16 &&
      indexed_hope.count { |row| row['status'] == 'not-an-issue' } == 1 &&
      indexed_hope.count { |row| row['status'] == 'uncertain' } == 1 &&
      indexed_hope.find { |row| M.key(row) == key('default', '8089') }['status'] == 'uncertain'

    warsworn = glossary.select { |row| row['entity_key'] == 'faction:warsworn' }
    raise 'existing Warsworn owner changed' unless warsworn.length == 1 &&
      warsworn.first.values_at('english_canonical', 'category', 'korean_canonical') ==
        ['Warsworn', 'faction', '워스원(Warsworn)']
    terminal_49217 = index.select do |row|
      row['entity_key'] == 'faction:warsworn' && M.key(row) == key('default', '49217')
    end
    raise 'D20789 Warsworn terminal decision changed' unless
      terminal_49217.length == 1 && terminal_49217.first['status'] == 'accepted' &&
      terminal_49217.first['evidence'].include?('D-20789')

    duplicate_index_keys = index.group_by do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end.select { |_entry_key, records| records.length > 1 }
    raise 'existing occurrence index contains duplicate keys' unless duplicate_index_keys.empty?
  end

  def verify_source!(source, source_key, spec)
    english_parts = JSON.parse(source.fetch('en_texts_json')).compact
    japanese_parts = JSON.parse(source.fetch('ja_texts_json')).compact
    english = english_parts.join("\n")
    japanese = japanese_parts.join("\n---\n")
    chinese = source.fetch('zh_text')
    expected_matches = spec.fetch('en')
    actual_matches = english.scan(WORD)
    raise "English Fatesworn mention count differs at #{source_key.inspect}" unless
      actual_matches.length == spec.fetch('en_count', expected_matches.length)
    expected_matches.each do |fragment|
      raise "English identity evidence missing #{fragment.inspect} at #{source_key.inspect}" unless
        english.include?(fragment)
    end
    japanese_anchors = Array(spec.fetch('ja'))
    raise "Japanese evidence missing at #{source_key.inspect}" unless
      japanese_anchors.all? { |anchor| japanese.include?(anchor) }
    chinese_anchors = Array(spec.fetch('zh'))
    raise "Chinese evidence missing at #{source_key.inspect}" unless
      chinese_anchors.all? { |anchor| chinese.include?(anchor) }
    raise "incomplete aligned locale evidence at #{source_key.inspect}" if
      english.empty? || japanese.empty? || chinese.empty?
    [english, japanese, chinese]
  end

  def revised_text(source_key, old, spec)
    return old unless spec.key?('replace')

    korean, bilingual = spec.fetch('replace')
    paired_count = old.scan(Regexp.new(Regexp.escape(bilingual))).length
    if paired_count.positive?
      remainder = old.sub(bilingual, '')
      raise "duplicate or incomplete English annotation at #{source_key.inspect}" unless
        paired_count == 1 &&
        remainder.scan(Regexp.new(Regexp.escape(korean))).empty?
      return old
    end
    count = old.scan(Regexp.new(Regexp.escape(korean))).length
    raise "Korean source span mismatch at #{source_key.inspect}: #{korean.inspect}=#{count}" unless
      count == 1
    proposed = old.sub(korean, bilingual)
    raise "rewrite not idempotent at #{source_key.inspect}" unless
      proposed.scan(Regexp.new(Regexp.escape(bilingual))).length == 1 &&
      proposed.sub(bilingual, korean) == old
    raise "rewrite changed structural tokens at #{source_key.inspect}" unless
      old.scan(R::STRUCTURAL) == proposed.scan(R::STRUCTURAL)
    raise "rewrite changed opaque tokens at #{source_key.inspect}" unless
      old.scan(R::OPAQUE) == proposed.scan(R::OPAQUE)
    raise "rewrite changed line breaks at #{source_key.inspect}" unless
      old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
    proposed
  end

  def review_row(source_key, source, prior_entities)
    spec = SPECS.fetch(source_key)
    english, japanese, chinese = verify_source!(source, source_key, spec)
    old = source.fetch('work_text')
    new_text = revised_text(source_key, old, spec)
    status = if spec.key?('hold')
               if HOLD_KEYS.include?(source_key) then 'uncertain'
               elsif old == new_text then 'not-an-issue'
               else 'accepted'
               end
             else
               raise "missing disposition metadata #{source_key.inspect}"
             end
    {
      'resource' => source_key[0], 'ID_Linha' => source_key[1],
      'Tipo_Variante' => source_key[2], 'scope' => spec.fetch('scope'),
      'existing_owner_scope' => spec.fetch('owner', ''),
      'status' => status, 'old' => old, 'new' => new_text,
      'evidence' => spec.fetch('hold'),
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'prior_terminal_json' => JSON.generate(prior_entities)
    }
  end

  def prepare(inventory: nil, glossary: nil, index: nil, csv_bytes: {})
    R.ensure_unused_batch!(D)
    inventory ||= active_inventory
    glossary_table = glossary || M.table(R::GLOSSARY)
    index_table = index || M.table(M::INDEX)
    glossary_rows = glossary_table.map(&:to_h)
    index_rows = index_table.map(&:to_h)

    exact_source_scope!(inventory)
    validate_glossary_and_index!(glossary_rows, index_rows)
    raise 'D21636 review scope is not exactly 19 distinct keys' unless
      REVIEW_KEYS.length == 19 && REVIEW_KEYS.uniq.length == REVIEW_KEYS.length &&
      SPECS.keys.sort == REVIEW_KEYS.sort

    rows = REVIEW_KEYS.map do |source_key|
      source = inventory.fetch(source_key)
      prior = index_rows.select { |row| M.key(row) == source_key }
      review_row(source_key, source, prior)
    end.sort_by { |row| row['ID_Linha'].to_i }
    raise 'D21636 review row count differs' unless rows.length == 19

    edits = rows.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(
      csv_bytes.fetch('default') { File.binread(M.csv_path('default')) },
      edits.map do |row|
        row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'old', 'new')
      end
    )
    raise 'unexpected D21636 status/edit totals' unless
      edits.length == 8 &&
      rows.count { |row| row['status'] == 'accepted' } == 8 &&
      rows.count { |row| row['status'] == 'not-an-issue' } == 5 &&
      rows.count { |row| row['status'] == 'uncertain' } == 6

    hope_snapshot = index_rows.select do |row|
      row['entity_key'] == 'unique_item:hope-of-the-fatesworn'
    end
    mixed_snapshot = index_rows.select do |row|
      REVIEW_KEYS.include?(M.key(row))
    end
    puts "Prepared D-#{D}: #{rows.length} non-Hope keys; 8 source-label edits; " \
         "5 already paired; 6 holds; preserved #{hope_snapshot.length} Hope owner rows."
    rows.each do |row|
      puts JSON.generate(row.slice(
        'resource', 'ID_Linha', 'scope', 'existing_owner_scope',
        'status', 'old', 'new', 'evidence'
      ))
    end
    {
      reviews: rows,
      definitions: [],
      all_fatesworn_keys: ALL_FATESWORN_KEYS,
      hope_owner_keys: HOPE_OWNER_KEYS,
      hope_index_snapshot: hope_snapshot,
      mixed_index_snapshot: mixed_snapshot,
      glossary_snapshot: glossary_rows,
      index_snapshot: index_rows
    }
  end

  def snapshot
    {
      csv_hashes: M.hashes,
      glossary: File.binread(R::GLOSSARY),
      index: File.binread(M::INDEX)
    }
  end

  def assert_snapshot_unchanged!(before)
    raise 'active CSV changed after D-21636 preflight' unless M.hashes == before.fetch(:csv_hashes)
    raise 'proper-name glossary changed after D-21636 preflight' unless
      File.binread(R::GLOSSARY) == before.fetch(:glossary)
    raise 'proper-name occurrence index changed after D-21636 preflight' unless
      File.binread(M::INDEX) == before.fetch(:index)
  end

  def manifest_rows(reviews)
    reviews.map do |review|
      owner = review.fetch('existing_owner_scope')
      previous = JSON.parse(review.fetch('prior_terminal_json'))
      owner_row = previous.find { |row| row['entity_key'] == owner } if !owner.empty?
      evidence = review.fetch('evidence')
      if owner_row
        raise 'unexpected prior Warsworn evidence' unless
          owner == 'faction:warsworn' &&
          owner_row['status'] == 'accepted' &&
          owner_row['evidence'].include?('D-20789')
        evidence = "#{evidence} The prior D-20789 accepted Warsworn decision is preserved; " \
                   "its original evidence was: #{owner_row['evidence']}"
      end
      {
        'resource' => review.fetch('resource'),
        'ID_Linha' => review.fetch('ID_Linha'),
        'Tipo_Variante' => review.fetch('Tipo_Variante'),
        'entity_key' => owner,
        'status' => review.fetch('status'),
        'old' => review.fetch('old'),
        'new' => review.fetch('new'),
        'evidence' => evidence,
        'english' => review.fetch('english'),
        'japanese' => review.fetch('japanese'),
        'chinese' => review.fetch('chinese'),
        'entity_dispositions_json' => owner.empty? ? '' : JSON.generate(owner => review.fetch('status')),
        'previous_status' => owner_row ? JSON.generate(owner => owner_row.fetch('status')) : '',
        'previous_evidence' => owner_row ? JSON.generate(owner => owner_row.fetch('evidence')) : '',
        'scope' => review.fetch('scope'),
        'existing_owner_scope' => owner,
        'prior_terminal_json' => review.fetch('prior_terminal_json')
      }
    end
  end

  def updated_index(prepared, manifest, inventory)
    index = prepared.fetch(:index_snapshot).map(&:dup)
    reviews_by_key = manifest.to_h { |row| [M.key(row), row] }
    index.each do |row|
      source_key = M.key(row)
      next unless reviews_by_key.key?(source_key)

      review = reviews_by_key.fetch(source_key)
      row['korean_current'] = review.fetch('new')
      next unless row['entity_key'] == 'faction:warsworn' &&
        source_key == key('default', '49217')

      row['matched_english'] = 'Fatesworn|Warsworn'
      row['evidence'] = "D-#{D}: #{review.fetch('evidence')}"
    end
    owner_row = index.select do |row|
      row['entity_key'] == 'faction:warsworn' && M.key(row) == key('default', '49217')
    end
    raise 'row-scoped Fatesworn/Warsworn occurrence was not preserved' unless
      owner_row.length == 1 && owner_row.first['status'] == 'accepted' &&
      owner_row.first['matched_english'] == 'Fatesworn|Warsworn' &&
      owner_row.first['korean_current'] == inventory.fetch(key('default', '49217')).fetch('work_text')
    index
  end

  def render_summary(reviews, checks, verify_output, inventory, index)
    statuses = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    scopes = reviews.group_by { |row| row.fetch('scope') }.transform_values(&:length)
    indexed_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    unreviewed = index.select { |row| row['status'] == 'needs-context' }
    held = index.select { |row| row['status'] == 'uncertain' }
    candidates = M.table(R::DISCOVERY_CANDIDATES)
    candidate_counts = candidates.group_by { |row| row['status'] }.transform_values(&:length)
    active = M.hashes
    hash_lines = active.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    checks_text = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; " \
        "post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")

    prior_block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ].to_s
    retained_text = prior_block[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1
    ].to_s
    backup_records = retained_text.lines.each_with_object({}) do |line, result|
      resource = line[/\A- (\w+): \d+ cells; pre .*backup `/, 1]
      result[resource] = line.strip if resource
    end
    checks.each do |check|
      backup_records[check[:resource]] =
        "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; " \
        "post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end
    last_backups = M::RESOURCES.map { |resource| backup_records[resource] }.compact.join("\n")
    status_text = statuses.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    scope_text = scopes.sort.inspect
    index_text = indexed_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    next_work = 'D-21637: Syl source-scope review (default:9918, 17547, 30641, 55176, 59101); ' \
      'keep person Syl at 24765 and uncontextualized 43207/47222 separate. Then D-21638 Coilsbane ' \
      '(default:30165, 33116, 62903) without creating a Ruins alias; separately assess default:32170 ' \
      'MendellerBirt without inserting a space.'

    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed #{reviews.length} source-local Fatesworn keys: #{status_text}.
      Scope groups: #{scope_text}. These source-local dispositions are not added to indexed entity/row totals.
      The 18 `unique_item:hope-of-the-fatesworn` keys from D-21461 were preserved, not reopened or recounted; default:8089 remains uncertain.
      The sole indexed row-scoped alias is `Fatesworn` under the existing `faction:warsworn` decision at default:49217; no global Fatesworn glossary alias was added.
      Next work: #{next_work}
      Indexed matches: #{index.length}; #{index_text}.
      Remaining unreviewed indexed matches: #{unreviewed.length}, in #{unreviewed.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      These focused index states are not global translation totals. Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{candidates.length} terms; registered-reviewed=#{candidate_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{candidate_counts.fetch('heuristic-not-reviewed', 0)}. The list is not exhaustive and gives no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hash_lines}
      Last batch pre-edit backups and byte validation:
      #{checks_text}
      #{verify_output.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{last_backups}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(R::GLOSSARY).length} entries; SHA-256 `#{Digest::SHA256.file(R::GLOSSARY).hexdigest}`.
      Report: `work/zh_cn/audit/#{File.basename(REPORT)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(MANIFEST)}`.
    TEXT
  end

  def append_decision_register!(reviews, hope_snapshot)
    register_path = M::DOCS[3]
    register = File.read(register_path)
    heading = "## D-#{D}: Source-Local Fatesworn Labels"
    raise 'D-21636 decision-register section already exists' if register.include?(heading)
    rows = reviews.map do |row|
      result = case row.fetch('status')
               when 'accepted' then 'Accepted the scoped English label; only the reviewed Korean span changed.'
               when 'not-an-issue' then 'Existing bilingual label retained; no new identity or alias inferred.'
               else 'Retained unchanged; aligned context does not resolve the referent.'
               end
      "| `default` `#{row['ID_Linha']}` | #{row['scope']} | #{row['status']} | #{result} |"
    end.join("\n")
    hope_keys = hope_snapshot.sort_by { |row| row['ID_Linha'].to_i }
      .map { |row| "`#{row['resource']}:#{row['ID_Linha']}:#{row['Tipo_Variante']}` (#{row['status']})" }
      .join(', ')
    register << <<~TEXT

      #{heading}

      Reviewed 19 source-local Fatesworn labels across historical-group,
      DLC/story-product, player-epithet, atomic-title, and unresolved contexts.
      Added eight English pairings, retained five existing bilingual labels,
      and kept six unresolved rows unchanged. The exact EN/JA/ZH sources and
      old/new Korean cells are in `proper-name-edits-D#{D}.tsv`. No global
      Fatesworn faction alias or duplicate entity was added. At `default:49217`,
      the English sentence explicitly equates the historical self-name with
      Warsworn; the existing accepted `faction:warsworn` decision remains
      terminal, with only a row-scoped matched label and evidence addendum.
      The 18 Hope-of-the-Fatesworn keys below remain under D-21461 and are not
      reopened or recounted.

      | Key | Scope | Disposition | Decision |
      | --- | --- | --- | --- |
      #{rows}

      Preserved D-21461 Hope-owner keys: #{hope_keys}.
    TEXT
    File.write(register_path, register)
  end

  def write_reports!(reviews, hope_snapshot, summary, manifest)
    rows = reviews.map do |row|
      action = row['old'] == row['new'] ? 'unchanged' : 'Texto edited'
      "| `default:#{row['ID_Linha']}` | #{row['scope']} | #{row['status']} | #{action} |"
    end.join("\n")
    hope_rows = hope_snapshot.sort_by { |row| row['ID_Linha'].to_i }.map do |row|
      "| `#{row['resource']}:#{row['ID_Linha']}:#{row['Tipo_Variante']}` | #{row['status']} | preserved under D-21461 |"
    end.join("\n")
    File.write(REPORT, <<~TEXT)
      # D-#{D}: Source-Local Fatesworn Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      Reviewed 19 source-local Fatesworn occurrences across affix/base/default;
      all 19 were in `default`. English determines meaning and context, while
      Japanese and Chinese are recorded as supporting evidence. The Fatesworn
      label can refer to a historical group, DLC/story product, player
      epithet, atomic title, or an unresolved referent; no single global
      faction/entity alias is inferred.

      | Key | Context | Disposition | Change |
      | --- | --- | --- | --- |
      #{rows}

      At `default:49217`, English explicitly equates the historical self-name
      with the Warsworn. The prior accepted `faction:warsworn` decision from
      D-20789 remains intact; only this row's matched English labels and
      evidence were extended. No global Fatesworn alias was created.

      ## Preserved Hope Set

      These 18 keys were explicitly checked for scope overlap and retained as
      terminal D-21461 decisions, not re-reviewed or included in this batch's
      disposition counts:

      | Key | Prior status | Handling |
      | --- | --- | --- |
      #{hope_rows}

      ## Evidence

      Exact English, Japanese, Chinese, previous Korean, revised Korean,
      disposition, and per-row rationale are recorded in
      [`proper-name-edits-D#{D}.tsv`](proper-name-edits-D#{D}.tsv).
      The official Korean manual was used only as background where relevant.
      No PAK or PAK-derived resource was consulted.
    TEXT
    File.write(ADDENDUM, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      The byte-preserving editor backed up the active default CSV immediately
      before editing. The verifier checked BOM, exact mixed line-ending
      sequence, headers, row count/order, target keys and Texto values, all
      non-target bytes, and inverse reconstruction against the byte-identical
      backup. Existing occurrence dispositions were preserved; only
      `faction:warsworn` at `default:49217` received the scoped evidence update.
    TEXT
    reports = [REPORT, ADDENDUM]
    raise 'D-21636 report write failed' unless reports.all? { |path| File.file?(path) }
  end

  def replace_checkpoint!(summary)
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      if text.include?('<!-- current-proper-name-batch:start -->')
        text.sub!(/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m, block)
      else
        raise "missing current checkpoint marker in #{path}"
      end
      File.write(path, text)
    end
  end

  def apply!(prepared, before)
    assert_snapshot_unchanged!(before)
    raise 'D-21636 manifest already exists' if File.exist?(MANIFEST)
    raise 'D-21636 report already exists' if File.exist?(REPORT) || File.exist?(ADDENDUM)

    manifest = manifest_rows(prepared.fetch(:reviews))
    M.write_table(MANIFEST, MANIFEST_HEADERS, manifest)
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, M.hashes)
    verify_output = M.command!(
      'ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )
    inventory = M.refresh_inventory
    prepared.fetch(:reviews).each do |review|
      raise "post-edit Fatesworn text mismatch #{M.key(review).inspect}" unless
        inventory.fetch(M.key(review)).fetch('work_text') == review.fetch('new')
    end
    final_index = updated_index(prepared, manifest, inventory)
    M.write_table(M::INDEX, M.table(M::INDEX).headers, final_index)
    raise 'proper-name glossary changed during source-local review' unless
      File.binread(R::GLOSSARY) == before.fetch(:glossary)
    final_inventory = M.refresh_inventory
    validate_output = M.command!('ruby', File.join(M::AUDIT, 'validate-proper-name-data.rb'))
    raise 'proper-name data validation failed' unless validate_output.include?('PASS')
    raise 'post-edit indexed translations differ from active CSV' unless
      final_index.all? do |row|
        final_inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('korean_current')
      end
    summary = render_summary(
      prepared.fetch(:reviews), checks, verify_output, final_inventory.values, final_index
    )
    append_decision_register!(prepared.fetch(:reviews), prepared.fetch(:hope_index_snapshot))
    write_reports!(prepared.fetch(:reviews), prepared.fetch(:hope_index_snapshot), summary, manifest)
    replace_checkpoint!(summary)
    puts "Applied D-#{D}: 19 source-local rows; 8 default Texto edits; 5 retained pairings; 6 holds unchanged."
  end

  def run
    apply = ARGV == ['--apply']
    raise "usage: #{File.basename(__FILE__)} [prepare|--apply]" unless
      ARGV.empty? || ARGV == ['prepare'] || apply
    before = snapshot
    prepared = prepare
    assert_snapshot_unchanged!(before)
    apply!(prepared, before) if apply
  end
end

if $PROGRAM_NAME == __FILE__
  ReviewFateswornD21636.run
end
