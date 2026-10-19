#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewChaosSightD21632
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_632
  ENTITY = 'skill:chaos-sight'
  SKILL_KEYS = %w[
    8830 15410 16239 29449 44531 48914 49108 57380 59182 63316 64450
  ].map { |id| ['default', id, ''].freeze }.freeze
  EXCLUDED_KEYS = %w[37000 63367].map do |id|
    ['default', id, ''].freeze
  end.freeze
  EXPECTED_KEYS = (SKILL_KEYS + EXCLUDED_KEYS).freeze
  EXCLUSIONS = {
    '37000' => 'English “A Chaos Sight” means a glimpse/view, not the named skill.',
    '63367' => 'Complete Skill Book (Chaos Sight) item title; preserve atomically.'
  }.freeze

  # Held for a dedicated existing-owner alias workflow. The standard
  # discovery gate rejects a second definition for person:jock-macnelly.
  JOCK_HELD_KEYS = %w[
    10371 17669 37175 38304 58470 63949 64870 63443
  ].map { |id| ['default', id, ''].freeze }.freeze
  JOCK_ALREADY_BILINGUAL_KEYS = %w[17669 63949].freeze
  JOCK_UNPAIRED_KEYS = %w[10371 37175 38304 58470 64870 63443].freeze
  JOCK_HOLD_NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Jock short-name rows are held for a dedicated existing-owner alias
    workflow, not registered here. person:jock-macnelly is already confirmed
    as Jock MacNelly / 조크 맥넬리(Jock MacNelly), has no English alias, and
    its D-21259 note expressly declines a bare Jock alias. The standard
    discovery gate rejects duplicate definitions for existing entity keys.
    Exact held rows: default:10371, 17669, 37175, 38304, 58470, 63949,
    64870, 63443. Rows 17669/63949 are already paired locally; 37175,
    64870, and marker-only 63443 explicitly identify Skald's apprentice.
    Existing decisions for other entities on mixed rows remain untouched.
  TEXT

  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English identifies Chaos Sight as a skill in the reviewed skill rows;
    aligned Japanese 混沌の視界 and Chinese 混乱视觉 support the referent.
    Use 혼돈의 시야(Chaos Sight), correcting observed 혼돈 시야 and
    혼돈 감지 variants only in these exact rows. Preserve all opaque marker
    bytes by appending English outside the marker, and preserve unrelated
    entities, particles, text, and line breaks. default:37000 is an ordinary
    glimpse/sight and default:63367 is the complete Skill Book (Chaos Sight)
    title; both are excluded unchanged. All affix/base/default sources were
    searched: 13 default lexical hits, 11 skill rows and 2 exclusions.
    The target skill entity has no prior terminal occurrence keys. Existing
    dispositions for other entities in shared cells are retained. Jock short
    forms are held for the dedicated existing-owner alias workflow described
    in this script; no duplicate Jock entity or alias is introduced here.
    No PAK evidence, global tally, source edit, or unrelated decision is used.
  TEXT

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Chaos Sight',
      'category' => 'skill',
      'korean_canonical' => '혼돈의 시야(Chaos Sight)',
      'english_aliases' => '',
      'korean_variants' => '혼돈의 시야|혼돈 시야|혼돈 감지',
      'evidence_ids' => "D-#{D}|#{EXPECTED_KEYS.map { |key| key.join(':') }.join('|')}",
      'status' => 'confirmed',
      'notes' => EVIDENCE
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def count_exact(text, value)
    text.scan(Regexp.new(Regexp.escape(value))).length
  end

  def replace_exact(text, from, to, expected: 1)
    count = count_exact(text, from)
    raise "expected #{expected} #{from.inspect} span(s), found #{count}" unless count == expected
    text.gsub(from, to)
  end

  def replace_outside_brace_tokens(text, from, to, expected:)
    segments = text.split(/(\{[^{}\r\n]*\})/, -1)
    count = segments.each_with_index.sum do |segment, index|
      index.even? ? count_exact(segment, from) : 0
    end
    raise "expected #{expected} unmarked #{from.inspect} span(s), found #{count}" unless count == expected
    segments.each_with_index do |segment, index|
      segments[index] = segment.gsub(from, to) if index.even?
    end
    segments.join
  end

  def annotate_marker(text, localized)
    marker = "{*1#{localized}}"
    raise "expected one exact marker #{marker.inspect}" unless count_exact(text, marker) == 1
    text.sub(marker, "#{marker}(Chaos Sight)")
  end

  def revised_text(source)
    id = source.fetch('ID_Linha')
    old = source.fetch('work_text')
    return old if EXCLUSIONS.key?(id)

    bilingual = '혼돈의 시야(Chaos Sight)'
    case id
    when '8830'
      replace_exact(old, '혼돈의 시야', bilingual)
    when '15410'
      replace_exact(old, '혼돈 감지', bilingual)
    when '16239'
      replace_exact(old, '혼돈 감지(Chaos Sight)', bilingual)
    when '29449', '48914', '49108', '59182'
      replace_exact(old, '혼돈의 시야', bilingual)
    when '44531'
      replace_exact(old, '혼돈 시야', bilingual)
    when '57380', '63316'
      annotate_marker(old, '혼돈 감지')
    when '64450'
      text = annotate_marker(old, '혼돈의 시야')
      replace_outside_brace_tokens(text, '혼돈의 시야', bilingual, expected: 2)
    else
      raise "unreviewed Chaos Sight source row #{id}"
    end
  end

  def prepare(inventory: nil, glossary: nil, index: nil)
    R.ensure_unused_batch!(D)
    inventory ||= M.refresh_inventory
    glossary ||= M.table(R::GLOSSARY)
    index ||= M.table(M::INDEX)
    glossary_rows = glossary.map(&:to_h)
    index_rows = index.map(&:to_h)

    raise 'Chaos Sight entity is already registered; do not reopen it' if
      glossary_rows.any? { |row| row['entity_key'] == ENTITY }
    prior_target = index_rows.select { |row| row['entity_key'] == ENTITY }
    raise "Chaos Sight already has target-entity rows: #{prior_target.map { |row| M.key(row).join(':') }.join(', ')}" unless
      prior_target.empty?

    definition = definition(glossary.headers)
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_keys = generated.map { |row| M.key(row) }
    raise 'Chaos Sight source coverage differs' unless
      generated_keys.sort == EXPECTED_KEYS.sort &&
      generated_keys.uniq.length == EXPECTED_KEYS.length &&
      generated.all? { |row| row['resource'] == 'default' }

    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      excluded = EXCLUSIONS.key?(key[1])
      text = excluded ? old : revised_text(source)
      status = if excluded
                 'excluded'
               elsif text == old
                 'not-an-issue'
               else
                 'accepted'
               end
      evidence = excluded ? "#{EVIDENCE} #{EXCLUSIONS.fetch(key[1])}" : EVIDENCE
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end.sort_by { |row| row['ID_Linha'].to_i }

    raise 'unexpected edit/exclusion counts' unless
      reviews.count { |row| row['old'] != row['new'] } == 11 &&
      reviews.count { |row| row['status'] == 'excluded' } == 2 &&
      reviews.length <= 50
    R.validate!([definition], reviews, generated, glossary_rows, index_rows)
    R.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), edits)
    puts "D-#{D}: 13 distinct source rows; 11 skill edits; 2 excluded unchanged."
    puts "Jock held for existing-owner alias workflow: #{JOCK_HELD_KEYS.map { |key| key.join(':') }.join(', ')}"
    [glossary.headers, definition, reviews]
  end

  def apply
    headers, definition_row, reviews = prepare
    paths = %w[proper-name-discovery-definitions proper-name-discovery].map do |stem|
      File.join(__dir__, "#{stem}-D#{D}.tsv")
    end
    raise 'D-21632 discovery artifacts exist' if paths.any? { |path| File.exist?(path) }
    M.write_table(paths[0], headers, [definition_row])
    M.write_table(paths[1], M::HEADERS.take(12), reviews)
    R.run([*paths, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewChaosSightD21632.prepare
  when ['apply'] then ReviewChaosSightD21632.apply
  else abort 'usage: review-chaos-sight-D21632.rb [prepare|apply]'
  end
end
