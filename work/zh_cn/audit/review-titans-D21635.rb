#!/usr/bin/env ruby

require 'tempfile'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module TitansD21635
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_635
  ENTITY = 'lore_term:titan'
  ENGLISH = 'Titan'
  PLURAL = 'Titans'
  KOREAN = '타이탄'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"

  def key(resource, id, variant = '')
    [resource, id, variant]
  end

  EXPECTED_WORDS = {
    key('base', '35', '11') => %w[Titan],
    key('base', '561', '11') => %w[Titan],
    key('base', '655', '11') => %w[Titans],
    key('base', '2148', '11') => %w[Titans],
    key('base', '2366', '11') => %w[Titan],
    key('base', '2419', '11') => %w[Titans],
    key('base', '3733', '11') => %w[Titans],
    key('base', '3913', '11') => %w[Titans],
    key('base', '4116', '11') => %w[Titan],
    key('base', '4229', '11') => %w[Titans],
    key('base', '4378', '11') => %w[Titan],
    key('base', '4427', '11') => %w[Titans],
    key('base', '4680', '11') => %w[Titans],
    key('base', '4784', '11') => %w[Titans],
    key('default', '1496') => %w[Titans],
    key('default', '7190') => %w[Titan],
    key('default', '8816') => %w[titan],
    key('default', '17188') => %w[Titans],
    key('default', '17745') => %w[Titan Titan],
    key('default', '18166') => %w[Titan Titans],
    key('default', '18694') => %w[titans],
    key('default', '21535') => %w[Titans Titans Titans],
    key('default', '28172') => %w[Titan],
    key('default', '30676') => %w[Titans],
    key('default', '32494') => %w[Titans],
    key('default', '33479') => %w[titan],
    key('default', '36276') => %w[Titans Titan],
    key('default', '37998') => %w[Titans],
    key('default', '38409') => %w[Titans],
    key('default', '40472') => %w[Titans],
    key('default', '51241') => %w[Titan Titans],
    key('default', '52494') => %w[Titans],
    key('default', '52937') => %w[Titans],
    key('default', '58934') => %w[Titans],
    key('default', '59979') => %w[Titans],
    key('default', '60395') => %w[Titans]
  }.freeze
  SOURCE_KEYS = EXPECTED_WORDS.keys.freeze

  LORE_KEYS = %w[
    1496 7190 17188 17745 18166 18694 21535 28172 30676 32494
    36276 37998 38409 40472 51241 52494 52937 58934 59979 60395
  ].map { |id| key('default', id) }.freeze
  NORMALIZED_KEYS = %w[
    1496 17188 28172 30676 32494 36276 37998 38409 51241 52937 58934
  ].map { |id| key('default', id) }.freeze
  TITLE_SPECS = {
    key('base', '561', '11') => [
      'title:titan-shield', 'Titan Shield', '타이탄의 방패', '타이탄의 방패(Titan Shield)'
    ],
    key('base', '4116', '11') => [
      "title:titan's-cuff", "Titan's Cuff", '타이탄의 팔 보호대',
      "타이탄의 팔 보호대(Titan's Cuff)"
    ],
    key('base', '4378', '11') => [
      'title:bound-titan', 'Bound Titan', '속박된 타이탄', '속박된 타이탄(Bound Titan)'
    ],
    key('base', '3913', '11') => [
      'title:titans-i', 'Titans I', '타이탄 I', '타이탄 I(Titans I)'
    ],
    key('base', '4680', '11') => [
      'title:titans-ii', 'Titans II', '타이탄 II', '타이탄 II(Titans II)'
    ],
    key('base', '4229', '11') => [
      'title:titans-iii', 'Titans III', '타이탄 III', '타이탄 III(Titans III)'
    ],
    key('base', '3733', '11') => [
      'title:titans-iv', 'Titans IV', '타이탄 IV', '타이탄 IV(Titans IV)'
    ],
    key('base', '4784', '11') => [
      'title:titans-v', 'Titans V', '타이탄 V', '타이탄 V(Titans V)'
    ],
    key('base', '2148', '11') => [
      'title:titans-vi', 'Titans VI', '타이탄 VI', '타이탄 VI(Titans VI)'
    ],
    key('base', '4427', '11') => [
      'title:titans-vii', 'Titans VII', '타이탄 VII', '타이탄 VII(Titans VII)'
    ],
    key('base', '2419', '11') => [
      'title:titans-viii', 'Titans VIII', '타이탄 VIII', '타이탄 VIII(Titans VIII)'
    ],
    key('base', '655', '11') => [
      'title:titans-ix', 'Titans IX', '타이탄 IX', '타이탄 IX(Titans IX)'
    ]
  }.freeze
  ATOMIC_ITEM_KEYS = %w[561 4116 4378].map { |id| key('base', id, '11') }.freeze
  NUMBERED_TITLE_KEYS = %w[3913 4680 4229 3733 4784 2148 4427 2419 655]
    .map { |id| key('base', id, '11') }.freeze
  EXISTING_TITLE_KEYS = %w[35 2366].map { |id| key('base', id, '11') }.freeze
  GENERIC_KEYS = [key('default', '33479')].freeze
  UNCERTAIN_KEYS = [key('default', '8816')].freeze
  ATOMIC_TITLE_KEYS = (ATOMIC_ITEM_KEYS + NUMBERED_TITLE_KEYS).freeze
  EXCLUDED_KEYS = (ATOMIC_TITLE_KEYS + EXISTING_TITLE_KEYS + GENERIC_KEYS).freeze

  # Each pair replaces one exact Korean source span, retaining its grammar.
  REWRITES = {
    key('default', '1496') => [
      ['티탄들에게', '타이탄들(Titans)에게']
    ],
    key('default', '7190') => [
      ['고대 타이탄의 유물', '고대 타이탄(Titan)의 유물']
    ],
    key('default', '17188') => [
      ['티탄들이 노래', '타이탄들(Titans)이 노래']
    ],
    key('default', '17745') => [
      ['타이탄 셀리니아', '타이탄(Titan) 셀리니아'],
      ['타이탄이 그 임무', '타이탄(Titan)이 그 임무']
    ],
    # English is "a Titan of Titans"; Korean puts the plural complement first.
    key('default', '18166') => [
      ['타이탄 중의 타이탄', '타이탄(Titans) 중의 타이탄(Titan)']
    ],
    key('default', '18694') => [
      ['타이탄들의', '타이탄(titans)들의']
    ],
    key('default', '21535') => [
      ['모든 타이탄 중', '모든 타이탄(Titans) 중'],
      ['타이탄은 아홉', '타이탄(Titans)은 아홉'],
      ['타이탄을 파괴', '타이탄(Titans)을 파괴']
    ],
    key('default', '28172') => [
      ['티탄이었던', '타이탄(Titan)이었던']
    ],
    key('default', '30676') => [
      ['티탄 신화', '타이탄(Titans) 신화']
    ],
    key('default', '32494') => [
      ['티탄 중 가장', '타이탄(Titans) 중 가장']
    ],
    key('default', '36276') => [
      ['티탄 신화', '타이탄(Titans) 신화'],
      ['티탄의 이름', '타이탄(Titan)의 이름']
    ],
    key('default', '37998') => [
      ['티탄의 자손', '타이탄(Titans)의 자손']
    ],
    key('default', '38409') => [
      ['티탄들이', '타이탄들(Titans)이']
    ],
    key('default', '40472') => [
      ['신인 타이탄이 한때', '신인 타이탄(Titans)이 한때']
    ],
    key('default', '51241') => [
      ['용융의 티탄이었다', '용융의 타이탄(Titan)이었다'],
      ['다른 티탄들은', '다른 타이탄들(Titans)은']
    ],
    key('default', '52494') => [
      ['타이탄', '타이탄(Titans)']
    ],
    key('default', '52937') => [
      ['티탄들이 쓰던', '타이탄들(Titans)이 쓰던']
    ],
    key('default', '58934') => [
      ['모든 티탄 가운데', '모든 타이탄(Titans) 가운데']
    ],
    key('default', '59979') => [
      ['모든 타이탄을', '모든 타이탄(Titans)을']
    ],
    key('default', '60395') => [
      ['타이탄들에게', '타이탄들(Titans)에게']
    ]
  }.freeze

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English Titan/Titans names the Kollossae divine lore class in the reviewed
    mythic and historical contexts; it does not make every generic titan,
    metaphor, or atomic compound the same entity. The aligned English source
    determines singular/plural labels and mention order; exact Japanese and
    Chinese source text is retained per row as corroboration. Normalize only
    the 20 reviewed lore-class rows, pairing Titan or Titans as written and
    changing the 11 listed 티탄 spellings to 타이탄. At default:18166 English
    says "a Titan of Titans", while Korean orders the phrase as "타이탄 중의
    타이탄"; map the Korean plural complement first, then the singular head.
    Pair each of the three complete base item labels and nine numbered
    Titans titles under its own scoped title entity. Exclude their parent
    Titan component so no nested annotation is produced. These exact labels
    do not assert unique-item rarity or ownership. Preserve
    base:35/2366 under the existing title:the-titan-spear terminal decisions.
    Default:33479 is the chicken metaphor and remains generic. Default:8816
    says "slumbering titan" with conflicting Japanese 巨人 and Chinese 泰坦;
    retain the Korean 거인 and hold the class identity uncertain. No Fatesworn
    identity is inferred. The official Korean manual is non-exhaustive and
    does not settle these source-specific labels. No PAK evidence or history
    recount.
  TEXT

  def literal_count(text, span)
    text.scan(Regexp.new(Regexp.escape(span))).length
  end

  def unannotated_count(text, span)
    pattern = Regexp.new("#{Regexp.escape(span)}(?!\\((?:Titan|Titans|titans)\\))")
    text.scan(pattern).length
  end

  def source_words(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n").scan(/\bTitans?\b/i)
  end

  def assert_exact_source_scope!(inventory)
    actual = inventory.values.each_with_object([]) do |source, matches|
      matches << M.key(source) unless source_words(source).empty?
    end.sort
    expected = SOURCE_KEYS.sort
    return if actual == expected

    raise "Titan/Titans source scope differs: missing=#{(expected - actual).inspect}; " \
          "extra=#{(actual - expected).inspect}"
  end

  def definitions_for(headers)
    class_fields = {
      'entity_key' => ENTITY, 'english_canonical' => ENGLISH,
      'category' => 'lore term', 'korean_canonical' => CANONICAL,
      'english_aliases' => PLURAL,
      'korean_variants' => '타이탄(Titan)|타이탄(Titans)|타이탄들(Titans)|티탄',
      'evidence_ids' => "D-#{D}|" + SOURCE_KEYS.map { |row_key| row_key.reject(&:empty?).join(':') }.join('|'),
      'status' => 'confirmed', 'notes' => NOTE
    }
    class_definition = headers.to_h { |header| [header, class_fields.fetch(header, '')] }
    title_definitions = TITLE_SPECS.values.map do |entity, english, korean, canonical|
      fields = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => 'title', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => "#{korean}|#{canonical}",
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => "Exact base label #{english.inspect}, corroborated by aligned Japanese and Chinese. " \
                   'Annotate this complete source-local title atomically; exclude the generic Titan ' \
                   'parent component. This label does not infer rarity, ownership, or a unique-item category.'
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
    [class_definition, *title_definitions]
  end

  def normalize_title(text, row_key)
    entity, english, korean, replacement = TITLE_SPECS.fetch(row_key)
    return text if literal_count(text, replacement) == 1

    old_count = literal_count(text, korean)
    raise "atomic Titan title span mismatch #{row_key.inspect}" unless
      old_count == 1 && literal_count(text, replacement).zero?

    proposed = text.sub(korean, replacement)
    raise "atomic Titan title normalization is not idempotent #{row_key.inspect}" unless
      literal_count(proposed, replacement) == 1
    raise "atomic title does not pair its full source label #{row_key.inspect}" unless
      replacement.end_with?("(#{english})") && !replacement.match?(/\((?:Titan|Titans)\)\z/)
    raise "atomic title changed line breaks #{row_key.inspect}" unless
      text.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
    raise "atomic title changed structural tokens #{row_key.inspect}" unless
      text.scan(R::STRUCTURAL) == proposed.scan(R::STRUCTURAL)

    proposed
  end

  def normalize(text, row_key)
    return text unless LORE_KEYS.include?(row_key)

    rewritten = text.dup
    REWRITES.fetch(row_key).each do |old_span, replacement|
      old_count = unannotated_count(rewritten, old_span)
      new_count = literal_count(rewritten, replacement)
      if old_count == 1 && new_count.zero?
        rewritten.sub!(old_span, replacement)
      elsif old_count.zero? && new_count == 1
        next
      else
        raise "Titan Korean span mismatch #{row_key.inspect}: " \
              "#{old_span.inspect}=#{old_count}, #{replacement.inspect}=#{new_count}"
      end
    end

    english_words = EXPECTED_WORDS.fetch(row_key)
    expected_korean_words = row_key == key('default', '18166') ?
      %w[Titans Titan] : english_words
    korean_words = rewritten.scan(/\((Titans?|titans?)\)/)
                             .flatten
    raise "Titan singular/plural annotation order differs #{row_key.inspect}" unless
      korean_words == expected_korean_words
    raise "Titan normalization is not idempotent #{row_key.inspect}" unless
      normalize_done?(rewritten, row_key)
    raise "Titan rewrite changed line breaks #{row_key.inspect}" unless
      text.scan(/\r\n|\r|\n/) == rewritten.scan(/\r\n|\r|\n/)
    raise "Titan rewrite changed structural tokens #{row_key.inspect}" unless
      text.scan(R::STRUCTURAL) == rewritten.scan(R::STRUCTURAL)

    rewritten
  end

  def normalize_done?(text, row_key)
    REWRITES.fetch(row_key).all? do |_old_span, replacement|
      literal_count(text, replacement) == 1
    end
  end

  def reviews_for(inventory, generated)
    assert_exact_source_scope!(inventory)
    expected_generated = SOURCE_KEYS.map { |row_key| [ENTITY, *row_key] }
    expected_generated.concat(TITLE_SPECS.map { |row_key, (entity, *_rest)| [entity, *row_key] })
    expected_generated = expected_generated.sort
    actual_generated = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise 'Titan generated source coverage differs' unless actual_generated == expected_generated

    generated.group_by { |occurrence| M.key(occurrence) }.map do |row_key, matches|
      source = inventory.fetch(row_key)
      words = source_words(source)
      expected_words = EXPECTED_WORDS.fetch(row_key)
      raise "Titan source mention order differs #{row_key.inspect}" unless
        words == expected_words

      english_parts = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_parts = JSON.parse(source.fetch('ja_texts_json')).compact
      english = english_parts.join("\n")
      japanese = japanese_parts.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "empty aligned source evidence #{row_key.inspect}" if
        english.empty? || japanese.empty? || chinese.to_s.empty?

      old = source.fetch('work_text')
      proposed = old.dup
      dispositions = {}
      matches.each do |match|
        entity = match.fetch('entity_key')
        if entity == ENTITY
          if LORE_KEYS.include?(row_key)
            proposed = normalize(proposed, row_key)
            dispositions[entity] = 'accepted'
          elsif UNCERTAIN_KEYS.include?(row_key)
            raise 'default:8816 is no longer the conflicting titan context' unless
              english.include?('slumbering titan') &&
              japanese.include?('まどろむ巨人') &&
              chinese.include?('沉睡的泰坦') &&
              old.include?('잠든 거인')
            dispositions[entity] = 'uncertain'
          else
            raise "unclassified Titan source key #{row_key.inspect}" unless
              EXCLUDED_KEYS.include?(row_key)
            dispositions[entity] = 'excluded'
          end
        else
          title_entity, title_english, _korean, = TITLE_SPECS.fetch(row_key)
          raise "unexpected atomic Titan title match #{row_key.inspect}" unless
            entity == title_entity && english.include?(title_english) &&
            literal_count(english, title_english) == 1
          raise "atomic title locale evidence missing #{row_key.inspect}" if
            japanese.empty? || chinese.empty?
          proposed = normalize_title(proposed, row_key)
          dispositions[entity] = 'accepted'
        end
      end

      status = if old != proposed then 'accepted'
               elsif dispositions.value?('uncertain') then 'uncertain'
               elsif dispositions.values.all? { |value| value == 'excluded' } then 'excluded'
               else 'not-an-issue'
               end
      evidence = "#{NOTE} Exact English mention sequence: #{words.join(', ')}. " \
                 "Aligned Japanese: #{japanese}. Aligned Chinese: #{chinese}. " \
                 'Only the scoped Korean name span is changed; all remaining text, ' \
                 'particles, markup, and line breaks are preserved.'
      if EXISTING_TITLE_KEYS.include?(row_key)
        evidence += ' The existing title:the-titan-spear disposition and complete bilingual label remain unchanged.'
      elsif ATOMIC_TITLE_KEYS.include?(row_key)
        evidence += ' The full label has its own title disposition; the parent Titan component is excluded to prevent nesting.'
      elsif GENERIC_KEYS.include?(row_key)
        evidence += ' The English use is a chicken metaphor, so it is excluded as a generic common noun.'
      elsif UNCERTAIN_KEYS.include?(row_key)
        evidence += ' Japanese calls this a giant while Chinese calls it a Titan; the existing Korean 거인 is retained as an uncertainty hold.'
      end

      {
        'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => proposed,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
  end

  # Build a current aligned view directly from source CSVs and the active Korean CSVs.
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
    raise 'duplicate aligned inventory key' unless inventory.length == rows.length
    inventory
  end

  def prepare(inventory: nil, glossary_rows: nil, index_rows: nil, csv_bytes: {})
    R.ensure_unused_batch!(D)
    glossary_table = M.table(R::GLOSSARY)
    glossary = glossary_rows || glossary_table.map(&:to_h)
    definitions = definitions_for(glossary_table.headers)
    inventory ||= active_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = reviews_for(inventory, generated)
    index = index_rows || M.table(M::INDEX).map(&:to_h)
    R.validate!(definitions, reviews, generated, glossary, index)
    R.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    normalized_keys = edits.select { |row| row['old'].include?('티탄') }
                           .map { |row| M.key(row) }.sort
    edits.group_by { |row| row['resource'] }.each do |resource, group|
      bytes = csv_bytes.fetch(resource) { File.binread(M.csv_path(resource)) }
      ProperNameCellEditor.prepare(bytes, group)
    end
    raise 'unexpected Titan batch counts' unless
      definitions.length == 13 && reviews.length == 36 && edits.length == 32 &&
      reviews.count { |row| row['status'] == 'accepted' } == 32 &&
      reviews.count { |row| row['status'] == 'excluded' } == 3 &&
      reviews.count { |row| row['status'] == 'uncertain' } == 1 &&
      TITLE_SPECS.length == 12 &&
      normalized_keys == NORMALIZED_KEYS.sort

    puts "Prepared D-#{D}: #{definitions.length} definitions; #{reviews.length} exact keys; " \
         "#{edits.length} edits; 3 excluded; 1 uncertain."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'status', 'old', 'new'))
    end
    [definitions, reviews]
  end

  def append_decision_register!(reviews)
    path = M::DOCS[3]
    register = File.read(path)
    heading = "## D-#{D}: Titan Lore And Atomic Titles"
    raise 'D-21635 decision-register section already exists' if register.include?(heading)

    rows = reviews.map do |row|
      entity_statuses = JSON.parse(row.fetch('entity_dispositions_json'))
      dispositions = entity_statuses.map do |entity, status|
        "`#{entity}`: #{status}"
      end.join('; ')
      "| `#{row['resource']}` `#{row['ID_Linha']}` `#{row['Tipo_Variante']}` | " \
        "#{dispositions} |"
    end.join("\n")
    register << <<~TEXT

      #{heading}

      Registered the Kollossae lore-class term `Titan` and twelve complete
      source-local base titles. The English source defines identity and
      singular/plural form; aligned Japanese and Chinese corroborate the
      labels. The twenty lore rows normalize `티탄` to `타이탄` and pair each
      English `Titan`/`Titans` mention without changing the surrounding
      translation. Three atomic equipment labels and nine numbered
      `Titans I-IX` titles receive their own bilingual title entries, so
      the parent `Titan` component is excluded rather than nested. Preserve
      the established `The Titan Spear` disposition, the generic chicken
      metaphor, and the uncertain `slumbering titan` identity. Exact source
      evidence and old/new cells are in `proper-name-edits-D#{D}.tsv`.

      | Key | Entity disposition(s) |
      | --- | --- |
      #{rows}
    TEXT
    File.write(path, register)
  end

  def run
    applying = ARGV == ['--apply']
    raise "usage: #{File.basename(__FILE__)} [prepare|--apply]" unless
      ARGV.empty? || ARGV == ['prepare'] || applying

    definitions, reviews = prepare
    return unless applying

    Tempfile.create(['proper-name-definitions-D21635-', '.tsv'], '/private/tmp') do |definition_file|
      Tempfile.create(['proper-name-reviews-D21635-', '.tsv'], '/private/tmp') do |review_file|
        definition_file.close
        review_file.close
        M.write_table(definition_file.path, definitions.first.keys, definitions)
        M.write_table(review_file.path, M::HEADERS, reviews)
        R.run([definition_file.path, review_file.path, D.to_s])
      end
    end
    append_decision_register!(reviews)
  end
end

if $PROGRAM_NAME == __FILE__
  TitansD21635.run
end
