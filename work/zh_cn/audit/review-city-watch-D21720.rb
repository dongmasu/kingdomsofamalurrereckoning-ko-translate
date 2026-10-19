#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'

module CityWatchD21720
  extend self

  D = 21_720
  ENTITY = 'organization:city-watch'
  ENGLISH = 'City Watch'
  CANONICAL = '도시 경비대(City Watch)'
  RATHIR_COMPOUND = '라시르 시 경비대(Rathir City Watch)'

  DEFAULT_IDS = %w[
    968 2885 4365 4441 4640 5711 5949 6260 6516 7109 8622 9034
    11425 11950 12353 15823 15984 17195 17885 18597 19360 22296
    25688 28157 29092 30610 32535 35421 39724 42239 42812 42975
    44990 47921 49065 49154 51355 52214 53240 54514 54594 54691
    57563 57746 60519 60890 62627 64621 65061
  ].freeze
  KEYS = [
    ['base', '3801', '11'],
    *DEFAULT_IDS.map { |id| ['default', id, ''] }
  ].freeze

  ALREADY_PAIRED_IDS = %w[
    12353 29092 54514 54594 54691 60890 62627
  ].freeze
  SHORT_FORM_IDS = %w[968 4441 4640 17195 32535 53240].freeze
  COMPACT_FORM_ID = '51355'
  COMPOUND_KEY = ['default', '60519', ''].freeze

  ZH_EVIDENCE = {
    ['base', '3801', '11'] => '城市守备处',
    ['default', '968', ''] => '城市守备处',
    ['default', '2885', ''] => '城市守备处',
    ['default', '4365', ''] => '城市守卫',
    ['default', '4441', ''] => '城市守备处',
    ['default', '4640', ''] => '城市守备处',
    ['default', '5711', ''] => '城市守备队',
    ['default', '5949', ''] => '城市守备处',
    ['default', '6260', ''] => '城市守卫',
    ['default', '6516', ''] => '城市守备处',
    ['default', '7109', ''] => '城市守备处',
    ['default', '8622', ''] => '城市守备处',
    ['default', '9034', ''] => '城市守备处',
    ['default', '11425', ''] => '城市守备处',
    ['default', '11950', ''] => '瞭望城',
    ['default', '12353', ''] => '城市守备处',
    ['default', '15823', ''] => '城市守备队',
    ['default', '15984', ''] => '城市守备处',
    ['default', '17195', ''] => '瞭望城',
    ['default', '17885', ''] => '城市守备处',
    ['default', '18597', ''] => '瞭望城',
    ['default', '19360', ''] => '城市守备处',
    ['default', '22296', ''] => '城市守备处',
    ['default', '25688', ''] => '城市守卫',
    ['default', '28157', ''] => '城市守卫',
    ['default', '29092', ''] => '城市守备处',
    ['default', '30610', ''] => '城市守卫',
    ['default', '32535', ''] => '城市守卫',
    ['default', '35421', ''] => '城市守备处',
    ['default', '39724', ''] => '城市守备处',
    ['default', '42239', ''] => '城市守备处',
    ['default', '42812', ''] => '城市守卫',
    ['default', '42975', ''] => '城市守备处',
    ['default', '44990', ''] => '城市守卫',
    ['default', '47921', ''] => '城市守备处',
    ['default', '49065', ''] => '城市守备处',
    ['default', '49154', ''] => '城市守备处',
    ['default', '51355', ''] => '城市守备处',
    ['default', '52214', ''] => '城市守备处',
    ['default', '53240', ''] => '城市守备处',
    ['default', '54514', ''] => '城市守备处',
    ['default', '54594', ''] => '城市守备处',
    ['default', '54691', ''] => '城市守卫',
    ['default', '57563', ''] => '城市守备处',
    ['default', '57746', ''] => '城市守备处',
    ['default', '60519', ''] => '拉瑟里城市守备处',
    ['default', '60890', ''] => '瞭望城',
    ['default', '62627', ''] => '城市守备处',
    ['default', '64621', ''] => '城市守卫',
    ['default', '65061', ''] => '城市守备队'
  }.freeze

  SOURCE_SPANS = KEYS.to_h do |key|
    old = if key == COMPOUND_KEY
            RATHIR_COMPOUND
          elsif key[0] == 'default' && ALREADY_PAIRED_IDS.include?(key[1])
            CANONICAL
          elsif key[0] == 'default' && SHORT_FORM_IDS.include?(key[1])
            '시 경비대'
          elsif key == ['default', COMPACT_FORM_ID, '']
            '시경대'
          else
            '도시 경비대'
          end
    [key, old]
  end.freeze

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English identifies the City Watch as the organized law-enforcement body
    serving Rathir: speakers refer to its captain, home, public service,
    arrests, investigations, and requests for aid. Aligned Japanese
    警備隊 consistently corroborates the guard organization; Chinese uses
    source-local 城市守备处/城市守卫/城市守备队 forms and occasionally the
    city name where English and Japanese identify the Watch. The official
    Korean manual describes generic guards and bribery but does not name the
    City Watch, so it supplies no spelling or identity claim. Register only
    organization:city-watch with canonical 도시 경비대(City Watch). Review
    exactly the one base key and 49 default keys in this batch. Keep the full
    Rathir City Watch label at default:60519 atomic and unchanged; seven
    already-paired labels also remain unchanged. Normalize only the exact
    City Watch label spans at the other 42 keys. Preserve every particle,
    pronoun, generic follow-up reference, sentence, line break, and prior
    entity disposition. In particular, do not reopen the D-20056 wording
    amendment at default:49065, the D-15852 uncertainty at default:52214,
    or other indexed holds/findings. No generic guard/watch references
    outside these exact English source keys are included.
  TEXT

  SPEC = {
    key: ENTITY, english: ENGLISH, category: 'organization',
    korean: CANONICAL,
    variants: '도시 경비대|시 경비대|시경대|라시르 시 경비대',
    count: KEYS.length, notes: NOTE
  }.freeze

  def definition
    headers = ReviewedNameBatches.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    headers.zip([
      SPEC[:key], SPEC[:english], SPEC[:category], SPEC[:korean], '',
      SPEC[:variants], "D-#{D}", 'confirmed', SPEC[:notes]
    ]).to_h
  end

  def validate_source!(key, source)
    raise "unreviewed City Watch key #{key.inspect}" unless KEYS.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English City Watch source differs at #{key.inspect}" unless
      english.scan(/(?<![A-Za-z])City Watch(?![A-Za-z])/i).length == 1
    raise "Japanese guard evidence differs at #{key.inspect}" unless
      japanese.include?('警備隊')
    raise "Chinese aligned context differs at #{key.inspect}" unless
      chinese.include?(ZH_EVIDENCE.fetch(key))
    if key == COMPOUND_KEY
      raise 'default:60519 compound context changed' unless
        english == 'Rathir City Watch' &&
        japanese.include?('ラシーアの警備隊') &&
        chinese.include?('拉瑟里城市守备处')
    end
    true
  end

  def transform(spec, key, text, source)
    raise "wrong City Watch entity at #{key.inspect}" unless spec.fetch(:key) == ENTITY
    validate_source!(key, source)

    old = SOURCE_SPANS.fetch(key)
    if old == CANONICAL
      raise "paired City Watch label differs at #{key.inspect}" unless
        text.scan(CANONICAL) == [CANONICAL]
      return [text, false]
    end
    if old == RATHIR_COMPOUND
      raise "Rathir compound differs at #{key.inspect}" unless
        text.scan(RATHIR_COMPOUND) == [RATHIR_COMPOUND]
      return [text, false]
    end

    raise "expected one reviewed City Watch span at #{key.inspect}" unless
      text.scan(Regexp.new(Regexp.escape(old))) == [old]
    [text.sub(old, CANONICAL), false]
  end

  def dry_run
    m = ReviewedNameBatches
    r = ReviewedProperNameDiscovery
    inventory = m.table(m::INVENTORY).map(&:to_h).to_h do |row|
      [m.key(row), row]
    end
    raise 'incomplete aligned inventory' unless inventory.length == 73_430

    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_keys = generated.map { |row| m.key(row) }.sort
    raise "City Watch source scope differs: #{generated_keys.inspect}" unless
      generated_keys == KEYS.sort

    index = m.table(m::INDEX).map(&:to_h)
    raise 'City Watch entity already has indexed rows' if
      index.any? { |row| row['entity_key'] == ENTITY }
    reviews = generated.map do |occurrence|
      key = m.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      revised, excluded = transform(SPEC, key, old, source)
      status = excluded ? 'excluded' : (old == revised ? 'not-an-issue' : 'accepted')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => revised,
        'evidence' => NOTE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    glossary = m.table(r::GLOSSARY).map(&:to_h)
    definitions = [definition]
    r.validate!(definitions, reviews, generated, glossary, index)
    r.validate_sources!(reviews, inventory)

    edits = reviews.select { |row| row['old'] != row['new'] }
    edits.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(m.csv_path(resource)), rows)
    end
    prior_keys = index.select { |row| KEYS.include?(m.key(row)) }
      .map { |row| m.key(row) }.uniq.length
    puts "D-#{D} read-only dry run: #{generated.length} exact City Watch matches, " \
         "#{edits.length} Texto edits, #{prior_keys} keys with prior entity history; " \
         'trilingual-source and byte-preserving validation passed; no files changed.'
    reviews.each do |row|
      key = [row['resource'], row['ID_Linha'], row['Tipo_Variante']]
      span = SOURCE_SPANS.fetch(key)
      result = row['old'] == row['new'] ? "#{span} (unchanged)" :
        "#{span} => #{CANONICAL}"
      puts "#{key.join(':')} #{result}"
    end
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Rathir City Watch Organization', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then CityWatchD21720.dry_run
  when ['apply'] then CityWatchD21720.apply
  else abort 'usage: review-city-watch-D21720.rb dry-run|apply'
  end
end
