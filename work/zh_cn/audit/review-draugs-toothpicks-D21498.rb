#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module DraugsToothpicksD21498
  extend self

  M = ReviewedNameBatches
  D = 21_498
  ENTITY = 'unique_item:draugs-toothpicks'
  ENGLISH = "Draug's Toothpicks"
  SHORT = 'Toothpicks'
  KOREAN = "드라우그의 이쑤시개(#{ENGLISH})"
  SHORT_KOREAN = '이쑤시개들(Toothpicks)'
  EXPECTED_KEYS = [
    ['base', '4192'],
    %w[default 81], %w[default 12234], %w[default 14835],
    %w[default 16689], %w[default 16797], %w[default 17474],
    %w[default 17679], %w[default 17768], %w[default 19922], %w[default 2268],
    %w[default 23369], %w[default 23511], %w[default 24244],
    %w[default 28223], %w[default 32842], %w[default 34317],
    %w[default 36616], %w[default 38083], %w[default 40322],
    %w[default 47068], %w[default 47813], %w[default 55124],
    %w[default 56463], %w[default 5672], %w[default 5764],
    %w[default 6990]
  ].map { |resource, id| [ENTITY, resource, id, resource == 'base' ? '11' : ''] }.freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  SHARED = 'English is the identity and meaning anchor. Default:17679 explicitly calls the named item a pair of daggers owned by Gunnar Frode; default:17768 independently explains the toothpick joke as the legendary troll Draug’s ceremonial daggers. Default:40322 also identifies the item as a pair of daggers. Aligned Japanese ドラウグの爪楊枝 and Chinese 德拉格的剔牙刀 corroborate the named item. Existing historical translation decisions are not reopened or recounted; this adds a distinct unique-item identity scope only. No PAK-derived evidence.'

  NORMALIZATIONS = {
    ['base', '4192'] => ["드라우그(Draug)의 이쑤시개", KOREAN],
    ['default', '14835'] => ["드라우그의 이쑤시개", KOREAN],
    ['default', '16689'] => ["드라우그(Draug)의 이쑤시개", KOREAN],
    ['default', '16797'] => ["드라우그의 이빨쑤시개", KOREAN],
    ['default', '17474'] => ['이빨쑤시개들을', "#{SHORT_KOREAN}을"],
    ['default', '19922'] => ['이쑤시개들을', "#{SHORT_KOREAN}을"],
    ['default', '2268'] => ["드라우그(Draug)의 이쑤시개", KOREAN],
    ['default', '23369'] => ["드라우그(Draug)의 이쑤시개", KOREAN],
    ['default', '23511'] => ["드라우그(Draug)의 이쑤시개", KOREAN],
    ['default', '24244'] => ["드라우그의 이쑤시개", KOREAN],
    ['default', '32842'] => ["드라우그의 이쑤시개", KOREAN],
    ['default', '34317'] => ["드라우그의 이쑤시개", KOREAN],
    ['default', '36616'] => ["드라우그의 이쑤시개", KOREAN],
    ['default', '38083'] => ["드라우그의 이쑤시개", KOREAN],
    ['default', '40322'] => ['드라우그의 이쑤시개', KOREAN],
    ['default', '47813'] => ['투스픽스를', "#{SHORT_KOREAN}을"],
    ['default', '56463'] => ["드라우그의 이쑤시개", KOREAN],
    ['default', '5764'] => ["드라우그의 이쑤시개", KOREAN]
  }.freeze

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'unique item',
      'korean_canonical' => KOREAN,
      'english_aliases' => SHORT,
      'korean_variants' => [
        '드라우그(Draug)의 이쑤시개', '드라우그의 이빨쑤시개',
        '드라우그의 이쑤시개', '이쑤시개들', '투스픽스'
      ].join('|'),
      'evidence_ids' => "D-#{D}|base:4192:11|default:81|default:17679|default:17768|default:40322",
      'status' => 'confirmed',
      'notes' => "Register the named pair of ceremonial daggers as #{KOREAN}. English default:17679 explicitly identifies Draug's Toothpicks as a pair of daggers and names their owner; default:17768 explains the joke in the item description. Japanese and Chinese align on the same item name. Toothpicks is a row-scoped short alias of this unique item, not a global translation for ordinary toothpicks. #{SHARED}"
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def normalize(key, text)
    pair = NORMALIZATIONS[[key[0], key[1]]]
    return text unless pair

    old, replacement = pair
    raise "expected item label missing at #{key.inspect}" unless text.include?(old)
    raise "canonical item label already present at #{key.inspect}" if text.include?(replacement)

    text.sub(old, replacement)
  end

  def expected_pairs
    EXPECTED_KEYS
  end

  def reviews_for(inventory, generated)
    actual_pairs = generated.map do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end
    raise 'Draug’s Toothpicks exact source scope differs' unless
      actual_pairs.sort == expected_pairs.sort

    generated.sort_by do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i]
    end.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English item evidence differs #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Draug's Toothpicks(?![A-Za-z])/i) ||
        english.match?(/(?<![A-Za-z])Toothpicks(?![A-Za-z])/i)
      raise "Japanese item evidence missing #{key.inspect}" if japanese.empty?
      raise "Chinese item evidence missing #{key.inspect}" if chinese.empty?

      new_text = normalize(key, korean)
      status = new_text == korean ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => korean,
        'new' => new_text,
        'evidence' => "#{SHARED} Use #{KOREAN} for the complete item name and #{SHORT_KOREAN} only where English uses the short alias. Preserve all unrelated wording, entities, punctuation, tokens, and line breaks.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def prepare
    glossary_table = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    raise 'Draug’s Toothpicks entity already registered' if
      glossary.any? { |row| row.fetch('entity_key') == ENTITY }
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'discovery outputs already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    entry = definition(glossary_table.headers)
    generated = build_occurrences(inventory.values, [entry]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      [entry], reviews, generated, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)

    puts "Prepared D-#{D}: #{reviews.length} exact row keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Korean edits."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new'))
    end
    [entry, reviews]
  end

  def append_detail(path, section)
    text = File.read(path)
    return if text.include?('### D-21498: Draug’s Toothpicks')

    marker = '<!-- current-proper-name-batch:end -->'
    raise "missing current batch marker in #{path}" unless text.include?(marker)
    text.sub!(marker, "#{marker}\n\n#{section}")
    File.write(path, text)
  end

  def apply
    glossary_path = ReviewedProperNameDiscovery::GLOSSARY
    prior_glossary = M.table(glossary_path)
    prior_records = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    entry, reviews = prepare
    M.write_table(DEFINITIONS, prior_glossary.headers, [entry])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    final_index = M.table(M::INDEX).map(&:to_h)
    final_records = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    prior_records.each do |key, record|
      raise "prior occurrence changed #{key.inspect}" unless
        final_records[key] == record
    end
    raise 'unexpected occurrence additions' unless
      (final_records.keys - prior_records.keys).sort == expected_pairs.sort
    final_glossary = M.table(glossary_path).map(&:to_h)
    raise 'prior glossary records changed' unless
      final_glossary == prior_glossary.map(&:to_h) + [entry]

    detail = <<~TEXT.chomp
      ### D-21498: Draug’s Toothpicks

      Registered `unique_item:draugs-toothpicks` as
      `드라우그의 이쑤시개(Draug's Toothpicks)`, with `Toothpicks` as a
      short alias only in exact source-matched item references. Reviewed all
      #{expected_pairs.length} aligned source keys across `base` and `default`.
      English default:17679 identifies the item as a pair of daggers and names
      Gunnar Frode as their owner; default:17768 explains the joke as the
      legendary troll Draug's ceremonial daggers. Default:40322 independently
      confirms the pair-of-daggers description. Japanese ドラウグの爪楊枝 and
      Chinese 德拉格的剔牙刀 corroborate. Standardized incomplete, unpaired,
      and misspelled Korean labels only in these exact item rows; short
      references use `이쑤시개들(Toothpicks)`. Historical translation findings
      were not reopened or recounted, and ordinary toothpick wording was not
      assigned a global alias.
    TEXT
    [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].each do |path|
      File.open(path, 'a') { |file| file.write("\n\n#{detail}\n") }
    end
    M::DOCS.each { |path| append_detail(path, detail) }
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-draugs-toothpicks-D21498.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then DraugsToothpicksD21498.prepare
  when 'apply' then DraugsToothpicksD21498.apply
  else abort 'usage: review-draugs-toothpicks-D21498.rb [prepare|apply]'
  end
end
