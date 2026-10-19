#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewScholiaInitiatesD21570
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_570
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  SPECS = {
    'person:aloren' => {
      'english_canonical' => 'Aloren', 'korean_canonical' => '알로렌(Aloren)',
      'english_aliases' => '', 'korean_variants' => '알로렌|아로렌',
      'notes' => 'English default:15996 identifies the journal owner as Aloren, a Scholia Arcana initiate who fled the Ysa Chapter House. The same three initiates are explicitly named together at default:33498/58090. Japanese アロレン and Chinese 阿洛伦 corroborate; retain the repeated 알로렌 and correct the isolated 아로렌. Pair every explicit Korean mention, including repeated mentions inside one cell. Do not invent a surname.'
    },
    'person:bertran-nest' => {
      'english_canonical' => 'Bertran Nest', 'korean_canonical' => '버트런 네스트(Bertran Nest)',
      'english_aliases' => 'Bertran', 'korean_variants' => '베르트란 네스트|버트런|버트란|베르트란',
      'notes' => 'English default:29200 explicitly names Bertran Nest as a Scholia Arcana initiate and journal owner; default:33498/58090 identify the same three missing initiates by short names. Japanese バートラン・ネスト and Chinese 贝尔特兰·奈斯塔 corroborate. Reuse 버트런 from base:654 and multiple dialogue lines; retain 네스트. Full names are paired once, short names as 버트런(Bertran). Exclude base:2 and default:51529 because those explicitly name the separate Bertran Lot. Do not link this person to Bertrand Seznec or infer a Nest family.'
    },
    'person:cassera-vonn' => {
      'english_canonical' => 'Cassera Vonn', 'korean_canonical' => '카세라 본(Cassera Vonn)',
      'english_aliases' => 'Cassera', 'korean_variants' => '카세라 본|카세라',
      'notes' => 'English default:22447 explicitly names Cassera Vonn as a Scholia Arcana initiate and journal owner; default:33498/58090 identify the same missing trio by short names. Japanese カッセラ・ヴォン and Chinese 卡塞拉·冯恩 corroborate. Retain the established 카세라 본(Cassera Vonn); short references use 카세라(Cassera). Do not register Vonn as an alias or infer a relationship with Calder Vonn.'
    }
  }.freeze
  CONTEXT = <<~TEXT.chomp
    Review the three explicitly identified missing Scholia Arcana initiates
    across affix/base/default. The source contains 41 distinct keys and 54
    entity-row matches, including two excluded Bertran Lot keys. All other
    references belong to the same source-described trio, journals, corpses,
    quest objectives, or their dialogue. English anchors identity; Japanese
    and Chinese corroborate names and context. The official Korean manual
    supplies the Scholia Arcana setting but no entry for these three names.
    Preserve every other name, token, line break, sentence and prior
    entity disposition. This does not register the journals as separate
    named works or infer that the three people share a family.
  TEXT

  def transform(entity, key, text)
    if entity == 'person:bertran-nest' &&
       [%w[base 2 11], ['default', '51529', '']].include?(key)
      return [text, 'excluded']
    end

    changed = case entity
              when 'person:aloren'
                text.gsub(/(?:알로렌|아로렌)(?:\(Aloren\))?/, '알로렌(Aloren)')
              when 'person:bertran-nest'
                if key == ['default', '29200', '']
                  text.gsub(/(?:베르트란|버트란|버트런) 네스트(?:\(Bertran Nest\))?/, '버트런 네스트(Bertran Nest)')
                else
                  text.gsub(/(?:베르트란|버트란|버트런)(?:\(Bertran\))?/, '버트런(Bertran)')
                end
              when 'person:cassera-vonn'
                if key == ['default', '22447', '']
                  text.gsub(/카세라 본(?:\(Cassera Vonn\))?/, '카세라 본(Cassera Vonn)')
                else
                  text.gsub(/카세라(?:\(Cassera\))?/, '카세라(Cassera)')
                end
              else
                raise "unknown entity #{entity}"
              end
    [changed, changed == text ? 'not-an-issue' : 'accepted']
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    definitions = SPECS.map do |entity, spec|
      values = spec.merge('entity_key' => entity, 'category' => 'person',
                          'status' => 'confirmed', 'evidence_ids' => "D-#{D}")
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source coverage differs: #{counts.inspect}" unless counts == SPECS.keys.to_h { |entity| [entity, 18] }
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      updated = old.dup
      dispositions = matches.to_h do |match|
        entity = match.fetch('entity_key')
        updated, disposition = transform(entity, key, updated)
        [entity, disposition]
      end
      status = if updated != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
        'old' => old, 'new' => updated,
        'evidence' => "#{CONTEXT} #{dispositions.keys.map { |entity| SPECS.fetch(entity).fetch('notes') }.join(' ')}",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise "expected 41 rows, got #{reviews.length}" unless reviews.length == 41
    R.validate!(definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D} preparation: #{reviews.length} keys, #{generated.length} entity matches; #{reviews.count { |row| row['old'] != row['new'] }} edits; prepare only."
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Three Missing Scholia Arcana Initiates

      #{CONTEXT}
      Registered 알로렌(Aloren), 버트런 네스트(Bertran Nest), and
      카세라 본(Cassera Vonn), using source-local short names where appropriate.
      The two explicit Bertran Lot grave labels remain unchanged and excluded
      from this new person scope. No affix source hits. Full proper-name
      discovery remains incomplete. The 2026-10-17 release ZIP remains the
      earlier D-21569 snapshot; these subsequent edits are not in that ZIP.
    TEXT
    paths = M::DOCS + %w[review edit-addendum].map do |kind|
      File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    end
    paths.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      text = text.include?(marker) ? text.sub(marker, "#{marker}\n\n#{detail}") : "#{text}\n\n#{detail}\n"
      File.write(path, text)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewScholiaInitiatesD21570.prepare
  when ['apply'] then ReviewScholiaInitiatesD21570.apply
  else abort 'usage: review-scholia-initiates-D21570.rb [prepare|apply]'
  end
end
