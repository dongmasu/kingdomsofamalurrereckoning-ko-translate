#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ReviewTearOfMitharuD21807
  extend self

  M = ReviewedNameBatches
  D = 21_807
  AUDIT = __dir__
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  DEFINITIONS = File.join(AUDIT, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(AUDIT, "proper-name-discovery-D#{D}.tsv")
  SHORT_DISPOSITIONS =
    File.join(AUDIT, "proper-name-short-label-dispositions-D#{D}.tsv")
  SHORT_SNAPSHOT = File.join(AUDIT, "proper-name-short-label-discovery-D#{D}.tsv")

  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  SHORT_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  CHECKPOINT_MARKER =
    /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
  ENTITY = 'unique_item:tear-of-mitharu'
  ENGLISH = 'Tear of Mitharu'
  KOREAN = '미사루의 눈물'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  KEYS = (
    %w[11 12 14 21 22 24].map { |variant| ['affix', '343', variant] } +
    [['base', '3792', '11']] +
    %w[13271 30179 43776 54405].map { |id| ['default', id, ''] }
  ).freeze
  EDIT_SPANS = {
    ['affix', '343', '11'] => ['미사루(Mitharu)의 눈물', CANONICAL],
    ['affix', '343', '12'] => ['미사루(Mitharu)의 눈물', CANONICAL],
    ['affix', '343', '14'] => ['미사루(Mitharu)의 눈물', CANONICAL],
    ['affix', '343', '21'] => ['미사루(Mitharu)의 눈물', CANONICAL],
    ['affix', '343', '22'] => ['미사루(Mitharu)의 눈물', CANONICAL],
    ['affix', '343', '24'] => ['미사루(Mitharu)의 눈물', CANONICAL],
    ['base', '3792', '11'] => ['미사루(Mitharu)의 눈물', CANONICAL],
    ['default', '30179', ''] => ['미사루(Mitharu)의 눈물', CANONICAL],
    ['default', '43776', ''] => ['미사루(Mitharu)의 눈물', CANONICAL]
  }.freeze

  NOTES = <<~TEXT.strip.freeze
    English-led source-wide review identifies the named relic Tear of Mitharu:
    the base label and payment record name the same item, and dialogue describes
    its use in relation to the cursed amulet. Japanese consistently uses
    ミサールの涙, including the quoted objective phrase. Chinese supports the
    item at the label and payment record; default:43776 instead mistranslates
    Tear as 撕裂, so that cell is not treated as corroborating the meaning.
    Reuse the established Korean deity spelling 미사루 and render the complete
    item atomically as 미사루의 눈물(Tear of Mitharu), avoiding nested
    parentheses. Annotate only exact item-name spans, including the six
    grammatical affix variants; preserve the action label, particles, dialogue,
    line breaks, and all surrounding wording. The record's “one missing gem,”
    listed quantity, and “family heirloom” context support a named object, not
    a gameplay rarity or a claim that every mention proves one physical item's
    continuity. Preserve all prior deity:mitharu dispositions. This resolves
    the exact named-item identity/display question left by D-13450 at
    default:43776 and only the Tear component of D-3897 at default:13271;
    their broader sentence and other-entity questions remain held. English is
    authoritative; Japanese and Chinese are supplementary. No PAK-derived
    evidence.
  TEXT

  def definition
    {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'unique item',
      'korean_canonical' => CANONICAL,
      'english_aliases' => '',
      'korean_variants' => '미사루(Mitharu)의 눈물|미사루의 눈물',
      'evidence_ids' => "D-#{D}|base:3792:11|default:54405",
      'status' => 'confirmed',
      'notes' => NOTES
    }
  end

  def assert_source_coverage!(inventory)
    phrase = /(?<![A-Za-z0-9])#{Regexp.escape(ENGLISH)}(?![A-Za-z0-9])/i
    actual = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(phrase) }
    end.map { |source| M.key(source) }.to_set
    raise "source-wide exact-name coverage differs: #{actual.to_a.sort.inspect}" unless
      actual == KEYS.to_set

    KEYS.each do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English exact name missing at #{key.join(':')}" unless english.match?(phrase)
      raise "aligned Japanese item term missing at #{key.join(':')}" unless
        japanese.include?('ミサールの涙')
      raise "aligned Chinese Mitharu reference missing at #{key.join(':')}" unless
        chinese.include?('米萨鲁')
    end
  end

  def build_rows(inventory, index)
    assert_source_coverage!(inventory)
    entity_definition = self.definition
    existing = M.table(GLOSSARY).map(&:to_h)
    raise 'Tear of Mitharu is already registered' if
      existing.any? { |row| row.fetch('entity_key') == ENTITY }

    hits = build_occurrences(inventory.values, [entity_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'expected 11 exact Tear of Mitharu source keys' unless
      hits.map { |row| M.key(row) }.to_set == KEYS.to_set && hits.length == KEYS.length

    prior_by_key = index.group_by { |row| M.key(row) }
    reviews = hits.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante')]
    end.map do |hit|
      key = M.key(hit)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      span = EDIT_SPANS[key]
      new_text = if span
                   from, to = span
                   raise "expected one Korean item span at #{key.join(':')}" unless
                     old.scan(Regexp.new(Regexp.escape(from))).length == 1
                   old.sub(from, to)
                 else
                   raise "expected an already canonical item label at #{key.join(':')}" unless
                     old.scan(Regexp.new(Regexp.escape(CANONICAL))).length == 1
                   old
                 end
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      evidence = "#{NOTES} Exact source key: #{key.join(':')}."
      disposition = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => disposition,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => disposition),
        'prior_index_dispositions_json' => JSON.generate(
          prior_by_key.fetch(key, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
    counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise "unexpected item-review dispositions: #{counts.inspect}" unless
      counts == { 'accepted' => 9, 'not-an-issue' => 2 }
    [entity_definition, reviews]
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    paths = [DEFINITIONS, REVIEWS, SHORT_DISPOSITIONS, SHORT_SNAPSHOT]
    raise 'D-21807 preparation artifacts already exist; preserve them' if
      paths.any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    definition, reviews = build_rows(inventory, index)
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
    M.write_table(REVIEWS, REVIEW_HEADERS, reviews)
    prior_by_key = index.group_by { |row| M.key(row) }
    short_rows = reviews.map do |row|
      {
        'english_candidate' => ENGLISH,
        'disposition' => row.fetch('status'),
        'resource' => row.fetch('resource'),
        'ID_Linha' => row.fetch('ID_Linha'),
        'Tipo_Variante' => row.fetch('Tipo_Variante'),
        'english' => row.fetch('english'),
        'japanese' => row.fetch('japanese'),
        'chinese' => row.fetch('chinese'),
        'korean' => row.fetch('old'),
        'evidence' => row.fetch('evidence'),
        'prior_index_dispositions_json' => JSON.generate(
          prior_by_key.fetch(M.key(row), []).map do |prior|
            [prior.fetch('entity_key'), prior.fetch('status'), prior.fetch('evidence')]
          end
        )
      }
    end
    M.write_table(SHORT_DISPOSITIONS, SHORT_HEADERS, short_rows)
    puts "Prepared D-#{D}: #{reviews.length} exact source keys; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} edits."
  end

  def refresh_checkpoint
    inventory = M.refresh_inventory
    glossary = M.table(GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(
      SHORT_SNAPSHOT,
      ShortLabelDiscovery20261018::HEADERS,
      snapshot
    )
    first = snapshot.first&.fetch('english_candidate')
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot " \
                "`proper-name-short-label-discovery-D#{D}.tsv` " \
                "(#{snapshot.length} bounded groups; first `#{first || 'none'}`; " \
                'not exhaustive or a completion estimate).'
    marker = CHECKPOINT_MARKER
    prior = File.read(M::DOCS.first)[marker]
    raise 'D-21807 checkpoint is not active' unless
      prior&.include?("Latest verified proper-name batch: D-#{D} ")
    M::DOCS.each do |path|
      text = File.read(path)
      raise "D-21807 checkpoints differ in #{path}" unless text[marker] == prior
      block = prior.sub(/^Next batch:.*$/, next_line)
      File.write(path, text.sub(marker, block))
    end

    ["named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md",
     "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"].each do |name|
      path = File.join(AUDIT, name)
      File.open(path, 'a') do |file|
        file.write(
          "\n## Bounded Discovery Queue\n\n" \
          "Refreshed snapshot: `proper-name-short-label-discovery-D#{D}.tsv` " \
          "(#{snapshot.length} bounded groups; first `#{first || 'none'}`). " \
          "This queue is not exhaustive and is not a completion estimate.\n"
        )
      end
    end
    note = <<~TEXT

      ## D-#{D}: Tear of Mitharu Named Relic

      Reviewed every exact English source match across affix/base/default:
      11 source keys, including six grammatical affix variants. Registered
      `unique_item:tear-of-mitharu` and standardized nine Korean spans to
      `미사루의 눈물(Tear of Mitharu)`; two existing canonical mentions were
      retained. English identifies the same named relic in the base label,
      dialogue, and payment record. Japanese ミサールの涙 corroborates;
      Chinese `default:43776` mistranslates “Tear” as 撕裂 and was not used as
      semantic authority. Existing deity-index statuses and broader D-3897 /
      D-13450 translation questions remain unchanged. No rarity or physical
      item-continuity claim is inferred.
    TEXT
    %w[README.md decision-register-20261009.md].each do |name|
      File.open(File.join(AUDIT, name), 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: refreshed bounded candidate snapshot (#{snapshot.length} groups); " \
         "first=#{first.inspect}; overall discovery remains incomplete."
  end

  def apply
    prepare
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    refresh_checkpoint
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then ReviewTearOfMitharuD21807.prepare
  when 'apply' then ReviewTearOfMitharuD21807.apply
  else abort 'usage: review-tear-of-mitharu-D21807.rb [prepare|apply]'
  end
end
