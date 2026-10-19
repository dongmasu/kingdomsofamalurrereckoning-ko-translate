#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'
require_relative 'build-short-label-discovery-20261018'

module LyriatDuneheadMinnD21694
  extend self

  D = 21_694
  ROOT = File.expand_path('../../..', __dir__)
  AUDIT = __dir__
  DEFINITIONS = [
    {
      key: 'place:dunehead',
      english: 'Dunehead',
      aliases: '',
      category: 'place',
      korean: '듄헤드(Dunehead)',
      variants: '듄헤드|듄헤드 광산|듄헤드 작업장|듄스헤드 광산',
      count: 11,
      notes: 'English-led review identifies Dunehead and Dunehead Mine as the same mining site in the Crudok/miner story: English uses Dunehead, Dunehead Mine, Dunehead site, and Dunehead operation; aligned Japanese デューンヘッド鉱山/デューンヘッド and Chinese 沙丘头矿场/沙丘头 corroborate. Canonicalize the place root as 듄헤드(Dunehead), retaining the source-local mine/site wording and exact English case in full labels. Preserve already-correct Dunehead and Dunehead Mine forms. The official Korean manual extraction/reference has no direct Dunehead entry. Do not merge Canyon Hill, Bloodbane, Crudok, or the Hollowlands plant site; preserve their separate source scopes and prior row decisions.'
    },
    {
      key: 'people:lyriat',
      english: 'Lyriat',
      aliases: '',
      category: 'people',
      korean: '리리아 신도(Lyriat)',
      variants: '리리아 신도',
      count: 2,
      notes: 'English addresses a Lyriat as a follower/person of the Lyria faith; Chinese 莉里亚信徒 explicitly supports that group/member sense, while Japanese omits the vocative in default:72 and retains Lyriat in the standalone label. The official Korean manual reference PDF p.2 establishes the deity spelling Lyria as 리리아, but does not list Lyriat. Register only this source-supported follower term, not a separate deity, faction, or named individual; keep it distinct from deity:lyria.'
    },
    {
      key: 'person:minn-the-grinner',
      english: 'Minn the Grinner',
      aliases: '',
      category: 'person',
      korean: '웃음꾼 민(Minn the Grinner)',
      variants: '웃는 민|활짝 웃는 민|웃음꾼 민',
      count: 4,
      notes: 'English identifies the same named dice player through her self-introduction, standalone label, and dialogue. Japanese にやにや笑いのミン and Chinese 微笑者米恩 corroborate Minn and the grin epithet. Reuse 민 and normalize only the exact complete nickname to 웃음꾼 민(Minn the Grinner). Infer no additional biography, family, faction, or global aliases for Minn or Grinner. The official Korean manual extraction/reference has no direct entry.'
    }
  ].freeze
  SPEC_BY_KEY = DEFINITIONS.to_h { |row| [row.fetch(:key), row] }.freeze
  DUNEHEAD_KEYS = %w[
    17860 19894 31581 36419 47538 53610 53824 55099 55777 59563 64718
  ].map { |id| ['default', id, ''] }.to_set.freeze
  LYRIAT_KEYS = [%w[default 72], %w[default 58456]].map { |r, id| [r, id, ''] }.to_set.freeze
  MINN_KEYS = %w[551 19229 27228 43540].map { |id| ['default', id, ''] }.to_set.freeze
  TRANSFORMS = {
    ['default', '19894', ''] => ['듄헤드 작업장', '듄헤드(Dunehead) 작업장'],
    ['default', '31581', ''] => ['듄헤드', '듄헤드(Dunehead)'],
    ['default', '36419', ''] => ['듄헤드 광산', '듄헤드 광산(Dunehead Mine)'],
    ['default', '47538', ''] => ['듄스헤드 광산', '듄헤드(Dunehead) 광산'],
    ['default', '53610', ''] => nil,
    ['default', '53824', ''] => nil,
    ['default', '55099', ''] => nil,
    ['default', '55777', ''] => nil,
    ['default', '17860', ''] => nil,
    ['default', '59563', ''] => ['듄헤드 광산', '듄헤드 광산(Dunehead mine)'],
    ['default', '64718', ''] => ['듄헤드 광산', '듄헤드 광산(Dunehead mine)'],
    ['default', '72', ''] => nil,
    ['default', '58456', ''] => ['리리아 신도', '리리아 신도(Lyriat)'],
    ['default', '551', ''] => nil,
    ['default', '19229', ''] => ['활짝 웃는 민', '웃음꾼 민(Minn the Grinner)'],
    ['default', '27228', ''] => nil,
    ['default', '43540', ''] => ['웃는 민', '웃음꾼 민(Minn the Grinner)']
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Register three source-supported proper-name scopes: place Dunehead,
    the follower term Lyriat, and person Minn the Grinner. The full English,
    Japanese, Chinese, and Korean evidence is in the exact manifest.
    Corthis remains unresolved because its standalone name, Fist of Corthis,
    Corthis Unbroken, and Butcher of Corthis references do not establish one
    referent/category or settle its spelling; preserve D-3867, D-4057,
    D-19529, and D-19539 histories. Llosgiad remains unresolved because the
    sources use the same term for the Second Burning event and for the
    post-fire southern dock area; do not merge event/place or impose a global
    category. Their eight exact source keys are recorded in the D-21694
    candidate-disposition manifest without new glossary/index entries.
    Only explicit, high-confidence label spans were edited; existing
    terminal judgments and historical counts remain unchanged.
  TEXT

  def expected_keys(entity)
    case entity.fetch(:key)
    when 'place:dunehead' then DUNEHEAD_KEYS
    when 'people:lyriat' then LYRIAT_KEYS
    when 'person:minn-the-grinner' then MINN_KEYS
    else raise "unknown D-#{D} entity #{entity.fetch(:key)}"
    end
  end

  def corroborated?(entity_key, source)
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    case entity_key
    when 'place:dunehead'
      (japanese.match?(/デューンヘッド/) || japanese.match?(/Dunehead/i)) &&
        (chinese.match?(/沙丘(?:头|顶)/) || chinese.match?(/Dunehead/i))
    when 'people:lyriat'
      (japanese.include?('ようこそ') || japanese.match?(/Lyriat/i)) &&
        (chinese.include?('莉里亚信徒') || chinese.match?(/Lyriat/i))
    when 'person:minn-the-grinner'
      japanese.match?(/にやにや笑いのミン/) && chinese.include?('微笑者米恩')
    else false
    end
  end

  def transform(spec, key, text, source)
    entity = spec.fetch(:key)
    raise "unreviewed entity #{entity}" unless SPEC_BY_KEY.key?(entity)
    raise "unreviewed source key #{key.inspect} for #{entity}" unless expected_keys(spec).include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English source term missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])#{Regexp.escape(spec.fetch(:english))}(?![A-Za-z])/i)
    raise "aligned JA/ZH evidence differs at #{key.inspect}" unless corroborated?(entity, source)

    edit = TRANSFORMS.fetch(key, :missing)
    raise "transformation coverage missing at #{key.inspect}" if edit == :missing
    return [text, false] unless edit

    old, revised = edit
    raise "Korean span count differs at #{key.inspect}" unless text.scan(old).length == 1
    [text.sub(old, revised), false]
  end

  def definitions
    DEFINITIONS.map do |spec|
      spec.slice(:key, :english, :aliases, :category, :korean, :variants, :count, :notes)
    end
  end

  def occurrence_definitions
    DEFINITIONS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => spec.fetch(:aliases),
        'status' => 'confirmed'
      }
    end
  end

  def dispositions
    {
      'Corthis' => {
        status: 'uncertain',
        keys: %w[13196 13673 15476 30623 62839],
        evidence: 'English uses Corthis in Fist of Corthis, Corthis Unbroken, the standalone label, and Butcher of Corthis; the referent/category and accepted Korean stem remain unresolved. Existing D-3867, D-4057, D-19529, and D-19539 judgments are preserved.'
      },
      'Llosgiad' => {
        status: 'uncertain',
        keys: %w[36097 58769 60471],
        evidence: 'English calls the Second Burning (Llosgiad) an event at default:36097, while default:60471 says the southern docks are now called the Llosgiad, and default:58769 is an uncontextualized label. Event versus place identity is not settled; preserve D-11637, D-17906, D-19836, and D-20284 histories without registering a merged entity.'
      }
    }
  end

  def write_hold_manifest(inventory)
    index = ReviewedNameBatches.table(ReviewedNameBatches::INDEX)
    headers = %w[english_candidate disposition resource ID_Linha Tipo_Variante english japanese chinese korean evidence prior_index_dispositions_json]
    rows = dispositions.flat_map do |term, disposition|
      disposition.fetch(:keys).map do |id|
        key = ['default', id, '']
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact
        raise "missing #{term} source at #{key.inspect}" unless
          english.any? { |text| text.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i) }
        prior = index.select { |entry| ReviewedNameBatches.key(entry) == key }
        {
          'english_candidate' => term,
          'disposition' => disposition.fetch(:status),
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'english' => english.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => disposition.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(
            prior.map { |entry| [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')] }
          )
        }
      end
    end
    raise 'Corthis/Llosgiad hold key collision' unless rows.map { |row| ReviewedNameBatches.key(row) }.uniq.length == 8
    path = File.join(AUDIT, "proper-name-short-label-dispositions-D#{D}.tsv")
    raise "D-#{D} hold manifest already exists" if File.exist?(path)
    ReviewedNameBatches.write_table(path, headers, rows)
    path
  end

  def refresh_candidate_snapshot
    m = ReviewedNameBatches
    inventory = m.table(m::INVENTORY).map(&:to_h)
    glossary = m.table(File.join(AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    index = m.table(m::INDEX).map(&:to_h)
    rows = ShortLabelDiscovery20261018.build(inventory, glossary, index)
    path = File.join(AUDIT, "proper-name-short-label-discovery-D#{D}.tsv")
    raise "D-#{D} snapshot already exists" if File.exist?(path)
    m.write_table(path, ShortLabelDiscovery20261018::HEADERS, rows)
    rows
  end

  def dry_run
    inventory = ReviewedNameBatches.refresh_inventory
    generated = build_occurrences(inventory.values, occurrence_definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_counts = generated.group_by { |row| row.fetch('entity_key') }
      .transform_values(&:length)
    expected = DEFINITIONS.to_h { |spec| [spec.fetch(:key), spec.fetch(:count)] }
    raise "source coverage differs: #{generated_counts.inspect}" unless generated_counts == expected
    source_keys = generated.map { |row| ReviewedNameBatches.key(row) }.to_set
    expected_key_set = DEFINITIONS.flat_map { |spec| expected_keys(spec).to_a }.to_set
    raise 'generated key coverage differs' unless source_keys == expected_key_set
    edit_count = generated.count do |row|
      key = ReviewedNameBatches.key(row)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      revised, = transform(SPEC_BY_KEY.fetch(row.fetch('entity_key')), key, old, source)
      old != revised
    end
    raise "expected nine scoped edits, found #{edit_count}" unless edit_count == 9
    hold_keys = dispositions.values.flat_map do |row|
      row.fetch(:keys).map { |id| ['default', id, ''] }
    end
    raise 'candidate hold scope overlaps registered entities' unless
      (hold_keys.to_set & source_keys).empty?
    puts "D-#{D} read-only dry run: #{generated.length} registered entity matches, " \
         "#{edit_count} Texto edits, 8 separately documented identity-hold keys."
  end

  def run
    discovery = ReviewedDiscoverySpecs
    dry_run
    raise 'transform table coverage differs from registered scopes' unless
      DEFINITIONS.flat_map { |spec| expected_keys(spec).to_a }.to_set == TRANSFORMS.keys.to_set
    discovery.run(D, 'Dunehead, Lyriat, And Minn The Grinner', definitions, NOTE,
                  '<!-- current-proper-name-batch:start -->') do |spec, key, text, source|
      transform(spec, key, text, source)
    end

    inventory = ReviewedNameBatches.refresh_inventory
    hold_path = write_hold_manifest(inventory)
    candidates = refresh_candidate_snapshot
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = ReviewedNameBatches::DOCS.to_h { |path| [path, File.read(path)] }
    report = File.join(AUDIT, "named-scope-review-D#{D}-#{ReviewedNameBatches::RUN_DATE_COMPACT}.md")
    addendum = File.join(AUDIT, "named-scope-edit-addendum-D#{D}-#{ReviewedNameBatches::RUN_DATE_COMPACT}.md")
    hold_note = <<~TEXT

      ## Candidate Holds Reviewed Alongside D-#{D}

      Corthis (five exact rows) and Llosgiad (three exact rows) remain
      unresolved and unchanged. Corthis's referent/category and spelling
      remain unresolved across `Fist of Corthis`, `Corthis Unbroken`, the
      standalone label, and `Butcher of Corthis`; the prior D-3867/D-4057/
      D-19529/D-19539 decisions are preserved. Llosgiad names the Second
      Burning in one source and the resulting southern-dock area in another;
      event/place identity is not merged. D-11637/D-17906/D-19836/D-20284
      histories are preserved. The eight exact bilingual rows and any
      previous row dispositions are in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
    TEXT
    File.open(report, 'a') { |file| file.write(hold_note) }
    File.open(addendum, 'a') { |file| file.write(hold_note) }

    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{ReviewedNameBatches::RUN_DATE_ISO}).
      Registered and reviewed three entities across 17 distinct source keys: place:Dunehead (11), people:Lyriat (2), and person:Minn the Grinner (4). Corthis and Llosgiad remain unchanged, explicitly documented holds across eight additional source keys; no identity is forced and no prior decision is recounted.
      Next batch: D-#{D + 1}; continue candidate/residual discovery from `proper-name-short-label-discovery-D#{D}.tsv` (#{candidates.length} bounded groups, not an exhaustive total or completion estimate). Preserve reviewed hold rationale in `proper-name-short-label-dispositions-D#{D}.tsv`.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
    TEXT
    docs.each do |path, text|
      current = text[marker]
      raise "D-#{D} checkpoint marker missing or stale in #{path}" unless
        current&.include?("Latest verified proper-name batch: D-#{D} ")
      # Keep the detailed hash/backup/integrity data produced by the shared batch runner.
      current.sub!(/Next batch: D-#{D + 1};.*?\n/, "#{block.lines.to_a[2]}")
      current.sub!(/Full proper-name discovery\/residual validation remains incomplete; do not claim overall completion\./,
                   'Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.')
      text.sub!(marker, current)
      if path.end_with?('README.md') || path.end_with?('decision-register-20261009.md')
        text << hold_note
      end
      File.write(path, text)
    end
    puts "D-#{D}: registered 3 entities/17 matches, reviewed 2 holds/8 rows; next snapshot=#{candidates.length} groups."
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then LyriatDuneheadMinnD21694.dry_run
  when ['apply'] then LyriatDuneheadMinnD21694.run
  else abort 'usage: review-lyriat-dunehead-minn-D21694.rb dry-run|apply'
  end
end
