#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'

module ArtifactEllipsesD21262
  M = ReviewedNameBatches
  D = 21_262
  SUN = 'unique item:sun-stone'
  FROST = 'item:frost-stone'
  ROWS = {
    '7472' => { SUN => ['Sun', '태양석'] },
    '27929' => { SUN => ['Sun', '태양석'] },
    '37217' => {
      SUN => ['Sun', '태양석'],
      FROST => ['Frost', '서리석']
    }
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English identifies Sun and Frost in a coordinated list of the three named elemental artifacts; these are row-scoped ellipses of the already registered Sun Stone and Frost Stone, not global aliases. Japanese 太陽/霜氷 and Chinese 太阳/冰霜 corroborate the coordinated artifact list. The Korean manual supplies general magic context only. Pair only the short source forms in these exact rows; preserve the explicitly named Storm Stone and all other prose, names, tokens, and punctuation.
  TEXT

  module_function

  def source_text(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json")).compact.join("\n---\n")
  end

  def run
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    sun = glossary.find { |row| row.fetch('entity_key') == SUN }
    frost = glossary.find { |row| row.fetch('entity_key') == FROST }
    raise 'existing Sun Stone entity missing' unless sun
    raise 'existing Frost Stone entity missing' unless frost
    raise 'row-scoped aliases must not be global aliases' if
      sun['english_aliases'].to_s.split('|').include?('Sun') ||
      frost['english_aliases'].to_s.split('|').include?('Frost')

    index = M.table(M::INDEX).map(&:to_h)
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    occurrences = []
    reviews = []
    ROWS.each do |id, entities|
      key = ['default', id, '']
      source = inventory.fetch(key)
      english = source_text(source, 'en')
      japanese = source_text(source, 'ja')
      raise "missing aligned Japanese context at #{key.inspect}" if japanese.empty?
      raise "missing aligned Chinese context at #{key.inspect}" if source.fetch('zh_text').to_s.empty?
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      entities.each do |entity, (term, korean)|
        occurrence_key = [entity, *key]
        raise "duplicate indexed occurrence #{occurrence_key.inspect}" if existing.include?(occurrence_key)
        raise "English short form missing at #{key.inspect}" unless
          english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/)
        raise "full artifact form unexpectedly present at #{key.inspect}" if
          english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}\s+Stone(?![A-Za-z])/i)
        raise "Korean target missing or repeated at #{key.inspect}" unless
          new_text.scan(korean).length == 1

        occurrences << [
          entity, key[0], key[1], key[2], term, english, old,
          'needs-context',
          "D-#{D}: row-scoped short artifact form; #{EVIDENCE}"
        ]
        new_text.sub!(korean, "#{korean}(#{term})")
        dispositions[entity] = 'accepted'
      end
      reviews << {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => 'accepted',
        'old' => old,
        'new' => new_text,
        'evidence' => "row-scoped short artifact form. #{EVIDENCE}",
        'english' => source_text(source, 'en').sub("\n---\n", "\n"),
        'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end

    expected = [
      [SUN, 'default', '7472', ''],
      [SUN, 'default', '27929', ''],
      [SUN, 'default', '37217', ''],
      [FROST, 'default', '37217', '']
    ].sort
    actual = occurrences.map { |row| [row[0], row[1], row[2], row[3]] }.sort
    raise "scoped occurrence coverage differs: #{actual.inspect}" unless actual == expected
    raise 'unexpected reviewed row count' unless reviews.length == 3
    raise 'batch exceeds 50 rows' unless reviews.length <= 50

    index.concat(occurrences.map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end)
    M.write_table(M::INDEX, M.table(M::INDEX).headers, index)
    review_path = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
    M.write_table(review_path, M::HEADERS, reviews)
    M.run(review_path, D, nil)

    note = <<~TEXT

      ## D-#{D}: Coordinated Artifact Ellipses

      Reviewed three default rows and four row-scoped short-name occurrences:
      `Sun` at 7472, 27929, and 37217; `Frost` at 37217. These refer to the
      existing Sun Stone and Frost Stone entities in coordinated artifact
      lists. No global aliases were added; the explicit Storm Stone forms
      and all other cell content were preserved. Full source and aligned
      Japanese/Chinese evidence are recorded in the discovery manifest.
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      path = File.join(M::AUDIT, name)
      File.write(path, File.read(path) + note)
    end
    %w[README.md decision-register-20261009.md].each do |name|
      path = File.join(M::AUDIT, name)
      text = File.read(path)
      marker = "## D-21261: Frost Stone And Storm Stone Artifacts"
      raise "missing summary marker #{marker}" unless text.include?(marker)
      File.write(path, text.sub(marker, note + "\n" + marker))
    end
  end
end

ArtifactEllipsesD21262.run if $PROGRAM_NAME == __FILE__
