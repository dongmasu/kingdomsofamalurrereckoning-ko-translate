#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewPteryxD21647
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_647
  PTERYX = 'monster:pteryx'
  ALPHA = 'monster:alpha-pteryx'
  SOURCE_KEYS = {
    'base' => %w[703 1104 1945 2035 2283 3101 3337 3832 4400 4515],
    'default' => %w[
      1111 1285 2000 3712 5049 5158 8036 8047 10151 10213 11479 12667
      12812 13020 15241 15832 15992 16811 18921 20717 21914 22722 22791
      24742 24994 25146 25173 25641 26481 27264 28007 28596 28652 34225
      34636 42243 46762 46857 48078 51335 53257 54431 55033 55197 57699
      57849 58252 59163 60104 60137 61897 63114 64119
    ]
  }.freeze
  ALPHA_SOURCE = /\b(?:Alpha\s+Pteryx|Pteryx\s+Alphas?)\b/i
  PTERYX_SOURCE = /\bPteryx\b/i

  NOTE_PTERYX = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English identifies Pteryx as a named monster species: default:8036 calls
    it a unique creature, a predator with population, nests, eggs, and
    species-specific anatomy. Japanese プテリクス and Chinese 龙枭 corroborate
    the species name; Chinese 始祖龙枭 supports the Alpha Pteryx variant.
    Use 프테릭스(Pteryx) for the species, including lower-case English source
    mentions, while preserving grammar and particles. Treat Alpha Pteryx as a
    complete monster variant and do not nest the parent Pteryx annotation
    inside that phrase. The exact base label The Pteryx retains its article
    only in that source-local parenthetical. Pteryx Vanes, talons, eggs, armor,
    and other source compounds are not reclassified as unique items merely
    because they name the creature as a material or modifier. The official
    Korean manual files provide no direct Pteryx entry. Prior Anokatos,
    Wreath of Absolution, Naros, Troll, Kollossae, and other entity decisions
    remain unchanged and are not recounted.
  TEXT
  NOTE_ALPHA = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English names Alpha Pteryx as a distinct monster variant; the source also
    uses the inflected word-order form Pteryx Alphas. Japanese
    アルファ・プテリクス and Chinese 始祖龙枭 corroborate the variant.
    Standardize its Korean name as 알파 프테릭스(Alpha Pteryx). Keep the
    complete variant atomic and exclude its nested parent Pteryx match.
    This does not infer a unique individual or an item identity.
  TEXT

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def load_inventory
    rows = M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end
    raise 'incomplete or duplicate aligned inventory' unless
      rows.length == 73_430 && rows.map { |row| key(row) }.uniq.length == rows.length

    rows.to_h { |row| [key(row), row] }
  end

  def definitions(headers, keys, alpha_keys)
    specs = [
      [PTERYX, 'Pteryx', '프테릭스', 'Pteryxes|The Pteryx', NOTE_PTERYX, keys],
      [ALPHA, 'Alpha Pteryx', '알파 프테릭스', 'Pteryx Alpha|Pteryx Alphas', NOTE_ALPHA, alpha_keys]
    ]
    specs.map do |entity, english, korean, aliases, note, entity_keys|
      fields = {
        'entity_key' => entity,
        'english_canonical' => english,
        'category' => 'monster',
        'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => aliases,
        'korean_variants' => "#{korean}|#{korean}(#{english})",
        'evidence_ids' => (["D-#{D}"] + entity_keys.map { |k| k.reject(&:empty?).join(':') }).join('|'),
        'status' => 'confirmed',
        'notes' => note
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def normalize_alpha(text)
    revised = text.dup
    revised.gsub!(/프테릭스\s+알파\((?:Pteryx Alpha|Pteryx Alphas)\)/i,
                  '알파 프테릭스(Alpha Pteryx)')
    revised.gsub!(/알파\s+프테릭스\((?:Pteryx|Pteryx Alpha|Pteryx Alphas|Alpha Pteryx)\)/i,
                  '알파 프테릭스(Alpha Pteryx)')
    revised.gsub!(/알파\s+프테릭스(?!\()/, '알파 프테릭스(Alpha Pteryx)')
    revised
  end

  def normalize_species(text)
    revised = normalize_alpha(text)
    revised.gsub!(/익룡(?:\((?:pteryx|Pteryx)\))?/i, '프테릭스(Pteryx)')
    revised.gsub!(/프테릭스\s+\(The Pteryx\)/i, '프테릭스(The Pteryx)')
    revised.gsub!(/프테릭스\(pteryx\)/i, '프테릭스(Pteryx)')
    revised.gsub!(/프테릭스(?!\((?:Pteryx|Alpha Pteryx|The Pteryx)\))/,
                  '프테릭스(Pteryx)')
    revised.gsub!(/(프테릭스\((?:Pteryx|Alpha Pteryx|The Pteryx)\))(은|이|과|을|으로)/) do
      name = Regexp.last_match(1)
      particle = {
        '은' => '는', '이' => '가', '과' => '와', '을' => '를', '으로' => '로'
      }.fetch(Regexp.last_match(2))
      "#{name}#{particle}"
    end
    revised
  end

  def pteryx_only_nested?(english)
    english.gsub(ALPHA_SOURCE, '').match?(PTERYX_SOURCE) == false
  end

  def alpha_needs_edit?(old)
    old.match?(/프테릭스\s+알파\((?:Pteryx Alpha|Pteryx Alphas)\)/i) ||
      old.match?(/알파\s+프테릭스\((?:Pteryx|Pteryx Alpha|Pteryx Alphas)\)/i) ||
      old.match?(/알파\s+프테릭스(?!\()/)
  end

  def pteryx_needs_edit?(old, english)
    return false if pteryx_only_nested?(english)

    old.match?(/익룡(?:\((?:pteryx|Pteryx)\))?/i) ||
      old.match?(/프테릭스(?!\((?:Pteryx|Alpha Pteryx|The Pteryx)\))/)
  end

  def prepare
    inventory = load_inventory
    source_keys = inventory.each_with_object([]) do |(row_key, row), result|
      english = JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
      result << row_key if english.match?(PTERYX_SOURCE)
    end
    expected = SOURCE_KEYS.flat_map do |resource, ids|
      ids.map { |id| [resource, id, resource == 'base' ? '11' : ''] }
    end.sort
    raise "Pteryx source scope differs: #{source_keys.sort.inspect}" unless source_keys.sort == expected
    raise 'Pteryx source rows contain an affix hit' unless
      source_keys.none? { |row_key| row_key.first == 'affix' }

    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    alpha_keys = expected.select do |row_key|
      inventory.fetch(row_key).fetch('en_texts_json').match?(ALPHA_SOURCE)
    end
    entity_definitions = definitions(glossary.headers, expected, alpha_keys)
    generated = build_occurrences(inventory.values, entity_definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_by_key = generated.group_by { |row| key(row) }
    raise 'unexpected Alpha Pteryx source scope' unless
      generated.select { |row| row['entity_key'] == ALPHA }.map { |row| key(row) }.sort ==
        expected.select { |row_key| inventory.fetch(row_key).fetch('en_texts_json').match?(ALPHA_SOURCE) }.sort

    reviews = expected.map do |row_key|
      source = inventory.fetch(row_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      revised = normalize_species(old)
      matches = generated_by_key.fetch(row_key).to_h { |row| [row['entity_key'], row] }
      raise "missing Pteryx matcher #{row_key.inspect}" unless matches.key?(PTERYX)

      dispositions = {}
      dispositions[PTERYX] =
        if pteryx_only_nested?(english)
          'excluded'
        elsif pteryx_needs_edit?(old, english) && revised != old
          'accepted'
        else
          'not-an-issue'
        end
      if matches.key?(ALPHA)
        dispositions[ALPHA] =
          if alpha_needs_edit?(old) && revised != old
            'accepted'
          else
            'not-an-issue'
          end
      end
      matched_entities = matches.keys.sort
      raise "source matcher/entity scope mismatch #{row_key.inspect}" unless
        dispositions.keys.sort == matched_entities
      raise "unpaired Pteryx remains #{row_key.inspect}" if
        revised.match?(/(?:익룡|프테릭스)(?!\((?:Pteryx|Alpha Pteryx|The Pteryx)\))/i)
      raise "unexpected nested Alpha annotation #{row_key.inspect}" if
        revised.match?(/알파\s+프테릭스\(Pteryx\)/i)
      raise "unresolved Alpha Pteryx phrase #{row_key.inspect}" if
        english.match?(ALPHA_SOURCE) &&
        revised.match?(/(?:알파\s+프테릭스|프테릭스\s+알파)(?!\(Alpha Pteryx\))/i)
      raise "tokens or line breaks changed #{row_key.inspect}" unless
        old.scan(R::STRUCTURAL) == revised.scan(R::STRUCTURAL) &&
        old.scan(/\r\n|\r|\n/) == revised.scan(/\r\n|\r|\n/)

      status =
        if old != revised
          'accepted'
        elsif dispositions.values.all? { |value| value == 'excluded' }
          'excluded'
        else
          'not-an-issue'
        end
      {
        'resource' => row_key[0], 'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2],
        'entity_key' => matched_entities.join('|'),
        'status' => status, 'old' => old, 'new' => revised,
        'evidence' => "#{NOTE_PTERYX} #{NOTE_ALPHA}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    R.validate!(entity_definitions, reviews, generated,
                glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      changed = rows.select { |row| row['old'] != row['new'] }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), changed) unless changed.empty?
    end
    puts "D-#{D}: Pteryx and Alpha Pteryx; #{reviews.length} source keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits; " \
         "#{generated.length} new entity/key occurrences."
    reviews.each do |row|
      next if row['old'] == row['new']
      old_names = row['old'].scan(/.{0,10}(?:프테릭스|익룡).{0,24}/).uniq
      new_names = row['new'].scan(/.{0,10}(?:프테릭스|익룡).{0,30}/).uniq
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status')
                         .merge('old_names' => old_names, 'new_names' => new_names))
    end
    [entity_definitions, reviews]
  end

  def apply
    definitions_rows, reviews = prepare
    definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'D-21647 manifests already exist' if
      File.exist?(definitions_path) || File.exist?(review_path)
    M.write_table(definitions_path, M.table(R::GLOSSARY).headers, definitions_rows)
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    R.run([definitions_path, review_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewPteryxD21647.prepare
  when ['apply'] then ReviewPteryxD21647.apply
  else abort 'usage: review-pteryx-D21647.rb [prepare|apply]'
  end
end
