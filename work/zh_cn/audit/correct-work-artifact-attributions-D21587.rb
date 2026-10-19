#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module CorrectWorkArtifactAttributionsD21587
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_587
  EXPERIMENT = 'lore term:abyss-experiment'
  CLOAK = 'unique item:abyss-cloak'
  KEY = ['default', '58825', ''].freeze
  CORRECTION = <<~TEXT.chomp
    D-21587 corrective attribution review, using the explicit distinction
    in English default:61754: the cloak is named Abyss to contain an
    experiment. Default:58825 instead labels the quoted "Abyss" experiment.
    Japanese 「アビス」実験 and Chinese “深渊”实验 confirm the experiment,
    not physical identity with the cloak. Register the exact source phrase
    "Abyss" experiment independently and pair the complete experiment name.
    The old cloak candidate at default:58825 remains indexed but is now
    excluded from the cloak identity; its previous accepted disposition
    and evidence are preserved in this corrective manifest. Do not merge
    experiment, cloak or equipment identities, or revise the long accounts.
    All other prior dispositions remain unchanged. This corrects one
    source-attribution error found by independent review, not a global
    translation-tally reconciliation or a completion claim.
  TEXT
  SIGBERT_CORRECTION = <<~TEXT.chomp
    D-21587 current-evidence notice: the historical D-21580 assertion above
    that Sigbert's Journal is a source-short form of Journal of Sigbert
    Sawerth is superseded by D-21585's metadata separation. Common ownership
    does not independently prove work identity. Retain the historical
    rationale for provenance only; use the independent source-label entries.
    No translation or terminal disposition on this row is changed.
  TEXT

  def apply
    R.ensure_unused_batch!(D)
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'experiment already registered' if glossary.any? { |row| row['entity_key'] == EXPERIMENT }
    old_cloak = index.select { |row| row['entity_key'] == CLOAK && M.key(row) == KEY }
    raise 'unexpected original cloak attribution' unless old_cloak.length == 1 &&
      old_cloak.first['status'] == 'accepted' && old_cloak.first['evidence'].start_with?('D-21584:')
    inventory = M.refresh_inventory
    source = inventory.fetch(KEY)
    old = "'어비스(Abyss)' 실험에 관한 기록."
    updated = "'어비스' 실험(\"Abyss\" experiment)에 관한 기록."
    raise 'unexpected current experiment text' unless source['work_text'] == old
    values = {
      'entity_key' => EXPERIMENT, 'english_canonical' => '"Abyss" experiment',
      'korean_canonical' => "'어비스' 실험(\"Abyss\" experiment)",
      'category' => 'lore term', 'english_aliases' => '',
      'korean_variants' => "'어비스' 실험", 'evidence_ids' => "D-#{D}|default:58825",
      'status' => 'confirmed', 'notes' => CORRECTION
    }
    definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    generated = build_occurrences(inventory.values, [definition]).map do |row|
      OCCURRENCE_HEADERS.zip(row).to_h
    end
    raise 'unexpected experiment source coverage' unless generated.length == 1 &&
      M.key(generated.first) == KEY
    review = {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => EXPERIMENT, 'status' => 'accepted', 'old' => old, 'new' => updated,
      'evidence' => CORRECTION,
      'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
      'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
      'chinese' => source['zh_text'],
      'entity_dispositions_json' => JSON.generate(EXPERIMENT => 'accepted')
    }
    R.validate!([definition], [review], generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!([review], inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), [review])
    superseded = index.select do |row|
      row['evidence'].match?(SeparateSigbertWorkLabelsD21585::OLD_ASSERTION)
    end
    raise "unexpected Sigbert rationale count #{superseded.length}" unless superseded.length == 26
    superseded.each do |row|
      row['evidence'] = "#{row['evidence']}\n\n#{SIGBERT_CORRECTION}"
    end
    glossary.each do |row|
      next unless [CLOAK, *ReviewAbyssArtifactEquipmentD21584::EQUIPMENT.map { |item| "item:#{item[0]}" }]
                    .include?(row['entity_key'])
      row['notes'] = "Historical D-21584 rationale; experiment-to-cloak attribution superseded by D-21587:\n#{row['notes']}\n\n#{CORRECTION}"
    end
    full_review = review.merge(
      'entity_key' => [EXPERIMENT, CLOAK].sort.join('|'),
      'entity_dispositions_json' => JSON.generate(EXPERIMENT => 'accepted', CLOAK => 'excluded')
    )
    definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-attribution-correction-D#{D}.tsv")
    M.write_table(definitions_path, glossary.headers, [definition])
    M.write_table(review_path, M::HEADERS.take(12), [full_review])
    M.write_table(R::GLOSSARY, glossary.headers, glossary.map(&:to_h) + [definition])
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    M.run(review_path, D, nil, review_states: %w[accepted needs-context])
    detail = <<~TEXT.chomp
      ### D-#{D}: Experiment/Cloak Attribution And Superseded Rationale

      #{CORRECTION}
      Corrected one default Texto cell to a complete experiment-name pair.
      The cloak match is excluded and the separate experiment match is
      accepted. Accepted index count is unchanged; the one new experiment
      occurrence adds one indexed match and one net exclusion. These are
      current entity/row states, not new global translation totals.
      Marked the obsolete Sigbert same-work claim superseded in 26 current
      index rationales, retaining the exact old rationale and every status.
      Also annotated the seven glossary notes sharing the original D-21584
      rationale (cloak, Shoes, Cowl, Handwraps, Robes, Ring and armor):
      their copied experiment-to-cloak assertion is historical/superseded.
      The original note text is retained; no equipment label, canonical,
      status or physical-identity decision is changed by those notices.
      D-21585's accepted/no-edit row is a metadata-only carried disposition,
      not a discovery manifest: the discovery-registration validator is
      intentionally not used for that specialized correction. The generic
      byte-chain verifier ignores unchanged cells; regression tests check
      unchanged CSV hashes and unchanged status counts for that stage.
      Full discovery remains incomplete; the D-21569 ZIP is unchanged.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.write(path, "#{File.read(path)}\n\n#{detail}\n")
    end
    puts "D-#{D}: one experiment pair, cloak attribution excluded; 26 superseded rationale notices."
  end
end

require_relative 'separate-sigbert-work-labels-D21585'
require_relative 'review-abyss-artifact-equipment-D21584'
CorrectWorkArtifactAttributionsD21587.apply if $PROGRAM_NAME == __FILE__
