#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module WellOfSoulsD21510
  extend self

  M = ReviewedNameBatches
  START = 21_510
  ENTITY = 'construct:well-of-souls'
  ENGLISH = 'Well of Souls'
  CANONICAL = '영혼의 샘(Well of Souls)'
  SOURCE_NAME = /(?<![A-Za-z])Well of Souls(?![A-Za-z])/i
  KOREAN_NAME = /영혼의 (?:샘|우물)(?:\(Well of Souls\))?(?!\()/
  BATCH_SIZES = [50, 11].freeze
  SHORT_REFERENCES = {
    ['default', '57375', ''] => ['알레스타(Allestar)의 샘', '알레스타(Allestar)의 샘(Well)'],
    ['default', '61903', ''] => ['샘 꼭대기', '샘(Well) 꼭대기']
  }.freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{START}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{START}.tsv")
  IDS = %w[
    3404 4196 5100 5470 6771 8723 9205 9386 12439 14997 16075 16327
    17313 19170 19883 20054 20581 21598 24834 27725 28136 28261 28417
    28636 29368 29400 31334 31475 31593 31761 31872 33515 33757 34146
    35685 35924 36843 37212 39774 40735 41812 43795 45594 47152 51932
    52770 53057 54362 54490 54620 54715 55159 57375 57786 59985 61851
    61903 62068 62424 63905
  ].freeze
  NOTE = 'Named construct/research project: English default:52770 calls the Well of Souls our greatest invention, default:31593/55159 calls it Hugues life work, and default:6771/9205 describes its bodily resurrection function. Japanese 魂の泉 and Chinese 灵魂之井 corroborate; base:1478 retains literal English in Japanese. Reuse the established 영혼의 샘(Well of Souls), normalizing the two 영혼의 우물 spellings at default:52770/53057. The schema category lore term represents this named construct, not a generic well or a claim that the Allestar original, Ventrinio apparatus, and portable comparison are one physical instance.'
  COMMON = 'Only the exact full English name is scoped, with two explicitly linked same-row short references annotated locally. No global Well or Soul Well alias, no short-only occurrence keys, and no reopening of prior narrative, title, or other entity dispositions. Preserve particles, numbers, opaque tokens, line breaks and all unrelated wording. English is primary, Japanese/Chinese corroborate; no PAK evidence or historical tally recount.'
  ROW_NOTES = {
    '12439' => 'Retain the skip-prompt meaning without inferring what gameplay section is skipped.',
    '47152' => 'Retain original as written; do not infer a new physical-instance identity.',
    '51932' => 'Retain the tutorial-completion/skip wording and Allestar destination.',
    '54620' => 'The later ordinary a well is a hideout entrance; leave the Korean 우물 unannotated.',
    '57375' => 'The same-row English short reference Well in Allestar explicitly points to the Well of Souls; annotate only Korean 알레스타(Allestar)의 샘 as 알레스타(Allestar)의 샘(Well), without a separate occurrence key or global alias.',
    '57786' => 'A Well of Souls is a portable-revivifier comparison, not proof of the same physical object.',
    '61903' => 'The same-row English top of the Well explicitly refers to Ventrinio’s Well of Souls; annotate only Korean 샘 꼭대기 as 샘(Well) 꼭대기, without a separate occurrence key or global alias.'
  }.freeze
  DETAIL = <<~TEXT
    ### D-21510-D-21511: Well Of Souls

    Register `construct:well-of-souls` as `영혼의 샘(Well of Souls)`.
    Reviewed 61 exact entity/resource/ID/variant keys in 50/11-key batches:
    42 changed CSV cells and 19 unchanged. English identifies a named
    resurrection construct/research project; Japanese 魂の泉 and Chinese
    灵魂之井 corroborate. The schema category is `lore term`; this does not
    equate the Allestar original, Ventrinio apparatus, and portable comparison
    as one physical instance.

    Same-row short references at default:57375 (`Well in Allestar`) and
    default:61903 (`top of the Well`) receive only local Korean `샘(Well)`
    annotations. They add no occurrence keys and no global `Well` alias.
    The ordinary hideout `a well` at default:54620 remains unannotated.
    Existing row-level dispositions for other entities remain unchanged.
  TEXT

  def expected_pairs
    [[ENTITY, 'base', '1478', '11']] +
      IDS.map { |id| [ENTITY, 'default', id, ''] }
  end

  def definition(headers)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => ENGLISH,
      'category' => 'lore term', 'korean_canonical' => CANONICAL,
      'english_aliases' => '', 'korean_variants' => '영혼의 샘|영혼의 우물',
      'evidence_ids' => 'D-21510-D-21511|base:1478:11|default:31593|default:52770|default:55159',
      'status' => 'confirmed', 'notes' => "#{NOTE} #{COMMON}"
    }
    headers.to_h { |header| [header, fields.fetch(header, '')] }
  end

  def load_inventory
    # Use the existing aligner in memory; never refresh the shared TSV.
    rows = M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    raise 'incomplete aligned inventory' unless rows.length == 73_430
    raise 'duplicate aligned inventory key' unless rows.map { |row| M.key(row) }.uniq.length == rows.length

    rows.to_h { |row| [M.key(row), row] }
  end

  def validate_scope!(generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Well of Souls source scope differs' unless actual.sort == expected_pairs.sort
  end

  def review_source(source)
    key = M.key(source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    raise "Well of Souls English multiplicity differs #{key.inspect}" unless
      english.scan(SOURCE_NAME).length == 1
    japanese_supported = japanese.include?('魂の泉') ||
      (key == ['base', '1478', '11'] && japanese == ENGLISH)
    raise "Well of Souls Japanese support differs #{key.inspect}" unless japanese_supported
    raise "Well of Souls Chinese support differs #{key.inspect}" unless chinese.include?('灵魂之井')

    old = source.fetch('work_text')
    raise "Well of Souls Korean span differs #{key.inspect}" unless old.scan(KOREAN_NAME).length == 1
    new_text = old.sub(KOREAN_NAME, CANONICAL)
    if (short_reference = SHORT_REFERENCES[key])
      old_span, new_span = short_reference
      raise "Well of Souls short Korean span differs #{key.inspect}" unless
        old.scan(Regexp.new(Regexp.escape(old_span))).length == 1
      new_text = new_text.sub(old_span, new_span)
    end
    status = old == new_text ? 'not-an-issue' : 'accepted'
    row_note = key[0] == 'default' ? ROW_NOTES.fetch(key[1], '') : ''
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => ENTITY, 'status' => status,
      'old' => old, 'new' => new_text,
      'evidence' => [NOTE, row_note, COMMON].reject(&:empty?).join(' '),
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => status)
    }
  end

  def batches(reviews)
    reviews.each_slice(50).to_a
  end

  def prepare
    BATCH_SIZES.each_index { |n| ReviewedProperNameDiscovery.ensure_unused_batch!(START + n) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = [definition(glossary.headers)]
    inventory = load_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    validate_scope!(generated)
    reviews = generated.sort_by do |row|
      key = M.key(row)
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map { |row| review_source(inventory.fetch(M.key(row))) }
    raise 'Well of Souls expected 42 changed cells' unless
      reviews.count { |row| row.fetch('old') != row.fetch('new') } == 42
    raise 'Well of Souls batch sizes differ' unless batches(reviews).map(&:length) == BATCH_SIZES
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{START}-D-#{START + 1}: #{reviews.length} keys; #{generated.length} matches; " \
         '42 changed cells; 19 unchanged; batches 50/11; prepare mode, no writes.'
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |key, _| key == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, START.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |key, _| key == 'korean_current' }]
    end
    previous.each do |key, value|
      raise "prior occurrence changed #{key.inspect}" unless current[key] == value
    end
    raise 'unexpected occurrence additions' unless
      (current.keys - previous.keys).sort == expected_pairs.sort
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    BATCH_SIZES.each_index do |ordinal|
      d = START + ordinal
      %w[review edit-addendum].each do |kind|
        path = File.join(__dir__, "named-scope-#{kind}-D#{d}-#{M::RUN_DATE_COMPACT}.md")
        File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then WellOfSoulsD21510.prepare
  when ['apply'] then WellOfSoulsD21510.apply
  else abort 'usage: review-well-of-souls-D21510.rb [prepare|apply]'
  end
end
