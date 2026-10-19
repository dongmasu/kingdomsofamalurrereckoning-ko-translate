#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ReviewTemperanceD21808
  extend self

  M = ReviewedNameBatches
  D = 21_808
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
  ENTITY = 'title:temperance'
  ENGLISH = 'Temperance'
  KOREAN = "절제(#{ENGLISH})"
  KEYS = [
    ['default', '10493', ''],
    ['default', '22684', ''],
    ['default', '37564', ''],
    ['default', '59722', ''],
    ['default', '8404', '']
  ].freeze
  NOTES = <<~TEXT.strip.freeze
    English default:8404 explicitly says this is a bestowed name: a Travelers
    tradition remembers heroes by pseudonyms, and the speaker christens the
    player “Temperance, the prudent one.” Default:22684 independently says the
    Hierophant names the player a new Travelers hero, alias Temperance.
    Japanese 節義ある者 and Chinese 节制 corroborate the honorific/pseudonym
    sense. Default:37564 addresses the same player as “Prudent Temperance”;
    its Japanese 節義ある者 and Chinese 谨慎节制 confirm the qualified
    reference, so register that source-attested form as a scoped alias and
    preserve its existing Korean pair. Default:59722 uses lowercase
    “temperance” for moderation in drinking; exclude that generic homonym.
    Register the bounded title/alias, not a separate person and not every
    generic use. Reuse 절제 and pair the standalone label at default:10493 as
    절제(Temperance); preserve the already paired dialogue references.
    English is the identity/meaning anchor; Japanese and Chinese are
    supporting evidence. No PAK-derived evidence.
  TEXT

  def definition
    {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'title',
      'korean_canonical' => KOREAN,
      'english_aliases' => 'Prudent Temperance',
      'korean_variants' => '절제|신중한 절제',
      'evidence_ids' => "D-#{D}|default:37564|default:8404|default:22684",
      'status' => 'confirmed',
      'notes' => NOTES
    }
  end

  def build_rows(inventory, index)
    phrase = /(?<![A-Za-z0-9])#{Regexp.escape(ENGLISH)}(?![A-Za-z0-9])/i
    hits = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(phrase) }
    end
    actual_keys = hits.map { |source| M.key(source) }.to_set
    raise "Temperance source-wide coverage differs: #{actual_keys.to_a.sort.inspect}" unless
      actual_keys == KEYS.to_set && hits.length == KEYS.length

    entity_definition = self.definition
    raise 'Temperance title is already registered' if
      M.table(GLOSSARY).any? { |row| row['entity_key'] == ENTITY }
    candidates = build_occurrences(hits, [entity_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'proper-name occurrence coverage differs' unless
      candidates.map { |row| M.key(row) }.to_set == KEYS.to_set

    prior_by_key = index.group_by { |row| M.key(row) }
    reviews = candidates.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |hit|
      key = M.key(hit)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      if key == ['default', '10493', '']
        raise 'standalone label is not the expected Korean form' unless old == '절제'
        new_text = KOREAN
      elsif key == ['default', '59722', '']
        new_text = old
      elsif key == ['default', '37564', '']
        raise 'qualified epithet is not already canonically paired' unless
          old.include?('신중한 절제(Prudent Temperance)')
        new_text = old
      else
        raise "dialogue label is not already canonical at #{key.join(':')}" unless
          old.scan(Regexp.new(Regexp.escape(KOREAN))).length == 1
        new_text = old
      end
      raise "English title evidence missing at #{key.join(':')}" unless english.match?(phrase)
      if key == ['default', '59722', '']
        raise 'generic temperance homonym must remain lowercase' unless
          english.include?('with the utmost temperance and moderation')
        raise 'generic temperance Korean wording changed' unless old.include?('절제하며')
        status = 'excluded'
      else
        raise "Japanese honorific evidence missing at #{key.join(':')}" unless
          japanese.include?('節義ある者')
        raise "Chinese name evidence missing at #{key.join(':')}" unless
          chinese.match?(/节制|谨慎节制/)
        status = old == new_text ? 'not-an-issue' : 'accepted'
      end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{NOTES} Exact source key: #{key.join(':')}.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'prior_index_dispositions_json' => JSON.generate(
          prior_by_key.fetch(key, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
    raise 'expected one edit, three canonical rows, and one generic exclusion' unless
      reviews.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
        { 'accepted' => 1, 'not-an-issue' => 3, 'excluded' => 1 }
    [entity_definition, reviews]
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    paths = [DEFINITIONS, REVIEWS, SHORT_DISPOSITIONS, SHORT_SNAPSHOT]
    raise 'D-21808 preparation artifacts already exist; preserve them' if
      paths.any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    entity_definition, reviews = build_rows(inventory, index)
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [entity_definition])
    M.write_table(REVIEWS, REVIEW_HEADERS, reviews)
    prior_by_key = index.group_by { |row| M.key(row) }
    M.write_table(
      SHORT_DISPOSITIONS, SHORT_HEADERS,
      reviews.map do |row|
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
    )
    puts "Prepared D-#{D}: #{reviews.length} exact source keys; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} edit."
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
    raise 'D-21808 checkpoint is not active' unless
      prior&.include?("Latest verified proper-name batch: D-#{D} ")
    M::DOCS.each do |path|
      text = File.read(path)
      raise "D-21808 checkpoints differ in #{path}" unless text[marker] == prior
      File.write(path, text.sub(marker, prior.sub(/^Next batch:.*$/, next_line)))
    end
    ["named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md",
     "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"].each do |name|
      File.open(File.join(AUDIT, name), 'a') do |file|
        file.write(
          "\n## Bounded Discovery Queue\n\n" \
          "Refreshed snapshot: `proper-name-short-label-discovery-D#{D}.tsv` " \
          "(#{snapshot.length} bounded groups; first `#{first || 'none'}`). " \
          "This queue is not exhaustive and is not a completion estimate.\n"
        )
      end
    end
    note = <<~TEXT

      ## D-#{D}: Temperance Bestowed Alias

      Reviewed all five exact case-insensitive English source keys across the
      aligned corpus. Four are the player's bestowed Travelers pseudonym:
      English explicitly says Temperance is the alias, and Japanese
      節義ある者 / Chinese 节制 support the reading. The qualified “Prudent
      Temperance” row is the same alias and remains fully paired. The fifth,
      lowercase `temperance` in a discussion of drinking moderation, is
      excluded as a generic homonym. Registered `title:temperance`, paired
      the standalone Korean label as `절제(Temperance)`, and preserved the
      three already-canonical name references. This is not a separate person
      identity or a global generic-word alias.
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
  when 'prepare' then ReviewTemperanceD21808.prepare
  when 'apply' then ReviewTemperanceD21808.apply
  else abort 'usage: review-temperance-D21808.rb [prepare|apply]'
  end
end
