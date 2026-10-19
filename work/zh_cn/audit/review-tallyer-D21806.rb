#!/usr/bin/env ruby

require 'json'
require_relative 'review-candidate-only-batches-20261018'

module ReviewTallyerD21806
  extend self

  M = ReviewedNameBatches
  C = CandidateOnlyBatches20261018
  D = 21_806
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21805.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  KEYS = [
    ['default', '21437', ''], ['default', '58878', ''], ['default', '61461', '']
  ].freeze
  CANDIDATE_KEYS = [['default', '58878', ''], ['default', '61461', '']].freeze
  EVIDENCE = 'English uses Tallyer as a grade-bearing occupational role at default:21437 (“Tallyer, first-class”) and default:61461 (“Tallyer second-class”), not as an individual, organization, or unique office name. Japanese 一等記録官/二等記録官 and Chinese 一等记录官/二等记录官 independently translate the same ranked record-keeping job. Default:58878 is its isolated UI label, translated as 기록관; Japanese and Chinese leave the English label unchanged. Exclude all three exact uses from proper-name registration. Preserve existing Korean, including the optional English title annotation at default:61461, and keep the separately registered Cennar Bruge and Domus Politica decisions unchanged.'

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior = File.read(M::DOCS.first)[marker]
    raise 'D-21805 is not the active checkpoint' unless
      prior&.include?('Latest verified proper-name batch: D-21805 ')
    raise 'active checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior }
    raise 'D-21806 output already exists' if
      [OUTPUT, SNAPSHOT,
       File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
       File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")].any? do |path|
        File.exist?(path)
      end

    before_csv = M.hashes
    protected = [M::INDEX, File.join(__dir__, 'proper-name-glossary.tsv')]
    protected_hashes = protected.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h)
    candidate = candidates.find { |row| row.fetch('english_candidate') == 'Tallyer' }
    raise 'Tallyer candidate group missing' unless candidate
    members = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    raise 'Tallyer candidate memberships differ' unless members.to_set == CANDIDATE_KEYS.to_set

    # Validate the bounded standalone-title memberships using the shared gate.
    prepared = C.prepare(
      { 'Tallyer' => { keys: CANDIDATE_KEYS, disposition: 'excluded', evidence: EVIDENCE } },
      inventory, index, candidates.to_h { |row| [row.fetch('english_candidate'), row] }
    )
    supplemental = KEYS - CANDIDATE_KEYS
    raise 'expected one supplemental source match outside the label group' unless supplemental == [['default', '21437', '']]
    extra_rows = supplemental.map do |parts|
      source = inventory.fetch(parts)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise 'supplemental Tallyer source match missing' unless
        english.match?(/(?<![A-Za-z0-9])Tallyer(?![A-Za-z0-9])/)
      {
        'english_candidate' => 'Tallyer', 'disposition' => 'excluded',
        'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
        'evidence' => "D-#{D}: #{EVIDENCE}",
        'prior_index_dispositions_json' => JSON.generate(
          index.select { |row| M.key(row) == parts }.map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
    rows = prepared + extra_rows
    raise 'Tallyer exact-source coverage differs' unless
      rows.map { |row| M.key(row) }.to_set == KEYS.to_set && rows.length == 3
    raise 'Tallyer source-wide search differs' unless
      inventory.values.select do |row|
        JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
          .match?(/(?<![A-Za-z0-9])Tallyer(?![A-Za-z0-9])/)
      end.map { |row| M.key(row) }.to_set == KEYS.to_set

    M.write_table(OUTPUT, C::HEADERS, rows)
    refreshed_index = M.table(M::INDEX).map(&:to_h)
    snapshot_rows = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, refreshed_index
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot_rows)
    raise 'Tallyer remains in candidate queue' if
      snapshot_rows.any? { |row| row.fetch('english_candidate') == 'Tallyer' }
    raise 'candidate-only review changed CSVs' unless M.hashes == before_csv
    raise 'candidate-only review changed the index/glossary' unless
      protected_hashes.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash }

    C.checkpoint(D, rows, inventory, snapshot_rows, 'Tallyer Occupational Role')
    note = <<~TEXT

      ## D-#{D}: Tallyer Role Candidate Review

      Reviewed all three exact English source matches, including the sentence
      at default:21437 outside the short-label candidate membership list.
      `Tallyer` is a ranked record-keeping occupation, not a person, group, or
      unique proper name. English ranks, Japanese 一等記録官/二等記録官, and
      Chinese 一等记录官/二等记录官 agree. All three keys are excluded from
      proper-name registration; Korean cells and prior Cennar Bruge/Domus
      Politica dispositions remain unchanged.
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      File.open(File.join(__dir__, name), 'a') { |file| file.write(note) }
    end
    %w[README.md decision-register-20261009.md].each do |name|
      File.open(File.join(__dir__, name), 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: classified all 3 Tallyer source matches as generic occupational role; no CSV/index/glossary edits."
  end
end

ReviewTallyerD21806.run if $PROGRAM_NAME == __FILE__
