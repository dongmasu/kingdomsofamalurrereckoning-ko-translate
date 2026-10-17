#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module DocentRankD21546
  extend self

  M = ReviewedNameBatches
  D = 21_546
  DOCENT = 'title:docent-rank'
  EWA = 'person:ewa-teofring'
  NENA = 'person:nena-adolla'
  DEL = 'person:del-gadra'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  TITLE_KEYS = [
    ['base', '4021', '11'],
    *%w[
      2240 5152 8405 9559 9843 10459 14299 19997 21459 22699 23131
      23334 28622 31021 31977 45612 57055 57067 58499 59354 63054
    ].map { |id| ['default', id, ''] }
  ].freeze
  PERSON_KEYS = {
    EWA => [['default', '2240', '']],
    NENA => [['default', '31977', '']],
    DEL => [['default', '23131', ''], ['default', '27678', '']]
  }.freeze
  EXPECTED_PAIRS = [
    *TITLE_KEYS.map { |key| [DOCENT, *key] },
    *PERSON_KEYS.flat_map { |entity, keys| keys.map { |key| [entity, *key] } }
  ].freeze
  ALREADY_PAIRED_PERSON_IDS = %w[5152 8405 23131 57055].freeze
  EXCLUDED_ITEM_KEY = ['base', '4021', '11'].freeze

  TEXT_CHANGES = {
    ['default', '2240', ''] => ['강사 에와 테오프링(Ewa Teofring)',
                                '강사(Docent) 에와 테오프링(Ewa Teofring)'],
    ['default', '31977', ''] => ['강사 네나 아돌라',
                                 '강사(Docent) 네나 아돌라(Nena Adolla)'],
    ['default', '9559', ''] => ['강사', '강사(Docent)'],
    ['default', '9843', ''] => ['강사 직급', '강사(Docent) 직급'],
    ['default', '10459', ''] => ['강사님', '강사(Docent)님'],
    ['default', '14299', ''] => ['강사님', '강사(Docent)님'],
    ['default', '19997', ''] => ['도슨트로 승진', '강사(Docent)로 승진'],
    ['default', '21459', ''] => ['강사', '강사(Docent)'],
    ['default', '31021', ''] => ['강사야', '강사(Docent)야'],
    ['default', '45612', ''] => ['강사님께', '강사(Docent)님께'],
    ['default', '57067', ''] => ['강사 직급', '강사(Docent) 직급'],
    ['default', '58499', ''] => ['강사에게', '강사(Docent)에게'],
    ['default', '59354', ''] => ['도슨트 계급', '강사(Docent) 계급'],
    ['default', '63054', ''] => ['스승이군', '강사(Docent)로군']
  }.freeze

  TITLE_NOTE = 'English identifies Docent as a formal Scholia Arcana rank: sources explicitly say promotion to the rank, describe a Docent’s administrative duties, and explain the ring/band marking earned rank. Japanese 導師 and Chinese 讲师 corroborate an instructional office; the official Korean manual extraction has no direct Docent entry. Reuse the prior accepted Korean terminology 강사(Docent) from D-18475, not museum-guide 도슨트 or generic 스승. Keep complete person display labels atomic and exclude the nested rank inside Docent Augra Tenet, Docent Del Gadra, and Docent Deod Twillt; exclude Docent’s Ring as a separate item label. Preserve particles, honorifics, all unrelated names, tokens and line breaks.'
  PERSON_NOTES = {
    EWA => 'English default:2240 explicitly gives Ewa Teofring; Japanese 導師エワ・テオフリン and Chinese 埃娃·提奥弗林讲师 corroborate. Reuse the already paired Korean 에와 테오프링(Ewa Teofring); only the adjacent Docent rank receives its own annotation.',
    NENA => 'English default:31977 gives the complete name Docent Nena Adolla; Japanese 導師ネナ・アドラ and Chinese 尼那·阿多拉讲师 corroborate. Register Nena Adolla separately from the rank and use 네나 아돌라(Nena Adolla).',
    DEL => 'English default:23131/default:27678 gives Del Gadra; Japanese デル・ガドラ and Chinese 戴尔·加德拉 corroborate. Reuse the complete existing Korean pair 델 가드라(Del Gadra); the Docent rank at default:23131 remains an atomic full-person display label.'
  }.freeze

  def definitions(headers)
    fields = [
      {
        'entity_key' => DOCENT, 'english_canonical' => 'Docent',
        'category' => 'title', 'korean_canonical' => '강사(Docent)',
        'english_aliases' => '',
        'korean_variants' => '강사|도슨트|스승',
        'evidence_ids' => "D-#{D}|default:9843|default:22699|default:28622|default:31021|default:59354",
        'status' => 'confirmed', 'notes' => TITLE_NOTE
      },
      {
        'entity_key' => EWA, 'english_canonical' => 'Ewa Teofring',
        'category' => 'person', 'korean_canonical' => '에와 테오프링(Ewa Teofring)',
        'english_aliases' => '', 'korean_variants' => '에와 테오프링',
        'evidence_ids' => "D-#{D}|default:2240", 'status' => 'confirmed',
        'notes' => PERSON_NOTES.fetch(EWA)
      },
      {
        'entity_key' => NENA, 'english_canonical' => 'Nena Adolla',
        'category' => 'person', 'korean_canonical' => '네나 아돌라(Nena Adolla)',
        'english_aliases' => '', 'korean_variants' => '네나 아돌라',
        'evidence_ids' => "D-#{D}|default:31977", 'status' => 'confirmed',
        'notes' => PERSON_NOTES.fetch(NENA)
      },
      {
        'entity_key' => DEL, 'english_canonical' => 'Del Gadra',
        'category' => 'person', 'korean_canonical' => '델 가드라(Del Gadra)',
        'english_aliases' => '', 'korean_variants' => '델 가드라',
        'evidence_ids' => "D-#{D}|default:23131|default:27678", 'status' => 'confirmed',
        'notes' => PERSON_NOTES.fetch(DEL)
      }
    ]
    fields.map { |row| headers.to_h { |header| [header, row.fetch(header, '')] } }
  end

  def source_inventory
    M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end.to_h { |row| [M.key(row), row] }
  end

  def expected_pairs
    EXPECTED_PAIRS
  end

  def replacement(key, old)
    pair = TEXT_CHANGES[key]
    return old unless pair
    from, to = pair
    count = old.scan(Regexp.new(Regexp.escape(from))).length
    raise "Docent Korean source span differs #{key.inspect}" unless count == 1

    old.sub(from, to)
  end

  def review_rows(inventory, generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Docent/person exact source scope differs' unless actual.sort == expected_pairs.sort
    raise 'Docent/person generated entity matches differ' unless generated.length == 26
    raise 'Docent exact title-key scope differs' unless
      generated.count { |row| row.fetch('entity_key') == DOCENT } == 22

    by_key = generated.group_by { |row| M.key(row) }
    by_key.keys.sort_by do |key|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      new_text = replacement(key, old)
      dispositions = {}

      by_key.fetch(key).each do |occurrence|
        entity = occurrence.fetch('entity_key')
        if entity == DOCENT
          status = if key == EXCLUDED_ITEM_KEY || ALREADY_PAIRED_PERSON_IDS.include?(key[1])
                     'excluded'
                   elsif %w[22699 23334 28622].include?(key[1]) && key[0] == 'default'
                     'not-an-issue'
                   else
                     new_text == old ? 'not-an-issue' : 'accepted'
                   end
          if key == ['default', '2240', ''] || key == ['default', '31977', '']
            status = new_text == old ? 'not-an-issue' : 'accepted'
          end
        else
          status = new_text == old ? 'not-an-issue' : 'accepted'
        end
        dispositions[entity] = status
      end
      raise "Docent source translation support differs #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Docent(?![A-Za-z])/i) ||
        by_key.fetch(key).all? { |row| row.fetch('entity_key') != DOCENT }

      evidence = by_key.fetch(key).map do |occurrence|
        entity = occurrence.fetch('entity_key')
        note = entity == DOCENT ? TITLE_NOTE : PERSON_NOTES.fetch(entity)
        "#{entity}: #{note}"
      end.join(' ')
      raise "Docent token/line-break change #{key.inspect}" unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) ==
          new_text.scan(ReviewedProperNameDiscovery::OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
      aggregate = if old != new_text
                    'accepted'
                  elsif dispositions.values.all? { |status| status == 'excluded' }
                    'excluded'
                  elsif dispositions.value?('uncertain')
                    'uncertain'
                  else
                    'not-an-issue'
                  end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'), 'status' => aggregate,
        'old' => old, 'new' => new_text, 'evidence' => evidence,
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def prepare
    [D].each { |batch| ReviewedProperNameDiscovery.ensure_unused_batch!(batch) }
    raise 'Docent discovery proposal already exists' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    headers = glossary.headers
    defs = definitions(headers)
    inventory = source_inventory
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    rows = review_rows(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      defs, rows, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    edits = rows.select do |row|
      row.fetch('resource') == 'default' && row.fetch('old') != row.fetch('new')
    end
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), edits)
    raise 'Docent edit count differs' unless
      rows.count { |row| row.fetch('old') != row.fetch('new') } == 14
    puts 'D-21546: 23 distinct keys; 26 entity matches; 14 edits; prepare mode, no writes.'
    [headers, defs, rows]
  end

  def apply
    headers, defs, rows = prepare
    M.table(ReviewedProperNameDiscovery::DISCOVERY_CANDIDATES)
    M.write_table(DEFINITIONS, headers, defs)
    M.write_table(REVIEWS, M::HEADERS, rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then DocentRankD21546.prepare
  when ['apply'] then DocentRankD21546.apply
  else abort 'usage: review-docent-rank-D21546.rb [prepare|apply]'
  end
end
