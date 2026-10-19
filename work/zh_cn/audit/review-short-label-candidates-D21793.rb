#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21793
  extend self

  M = ReviewedNameBatches
  D = 21_793
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21792.tsv')
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  SPECS = [
    {
      key: 'item:shine-and-shadow', english: 'Shine and Shadow',
      category: 'item', korean: '빛과 그림자(Shine and Shadow)',
      notes: 'English identifies the paired daggers/artifacts as Shine and Shadow, explicitly naming the pair in several quest records. Japanese uses シャイン&シャドウ or the corresponding “shine and shadow” wording; Chinese uses 光与影/光影之刃 as supporting evidence. Standardize the complete item name to 빛과 그림자(Shine and Shadow), preserving each sentence, particle, and existing owner disposition.'
    },
    {
      key: 'title:siegebreaker', english: 'Siegebreaker',
      category: 'title', korean: '공성 파괴자(Siegebreaker)',
      notes: 'English uses Siegebreaker as a repeated personal epithet/title, including direct address and the prophecy pairing it with Deathbringer. Reuse the established Korean form 공성 파괴자(Siegebreaker); Japanese and Chinese renderings are corroborative only. Preserve all other titles, names, line breaks, and prior row dispositions.'
    },
    {
      key: 'place:sioran-crypt', english: 'Sioran Crypt',
      category: 'place', korean: '시오란 지하묘지(Sioran Crypt)',
      notes: 'English identifies Sioran Crypt as a named stronghold/site in the Drowned Forest. Japanese シオラン地下聖堂/シオランの墓所 and Chinese 赛欧澜地窖 corroborate the name but do not settle the exact architectural type. Standardize only the complete place name to 시오란 지하묘지(Sioran Crypt); retain the separate unresolved site-type/history findings.'
    }
  ].freeze

  # Each replacement is limited to a source-reviewed Korean name span.
  REPLACEMENTS = {
    ['item:shine-and-shadow', 'base', '241', '11'] =>
      ['빛과 그림자', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '1918', ''] =>
      ['빛과 그림자', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '3289', ''] =>
      ['샤인 앤 섀도(Shine and Shadow)', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '18328', ''] =>
      ['광휘와 그림자(Shine and Shadow)', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '23971', ''] =>
      ['샤인(Shine)과 섀도(Shadow)', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '31896', ''] =>
      ['샤인 앤드 섀도', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '41749', ''] =>
      ['샤인과 섀도', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '46157', ''] =>
      ['샤인과 섀도', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '50123', ''] =>
      ['샤인 앤 섀도', '빛과 그림자(Shine and Shadow)'],
    ['item:shine-and-shadow', 'default', '56562', ''] =>
      ['샤인(Shine)과 섀도(Shadow)', '빛과 그림자(Shine and Shadow)'],
    ['title:siegebreaker', 'default', '15325', ''] =>
      ['공성 파괴자', '공성 파괴자(Siegebreaker)'],
    ['title:siegebreaker', 'default', '24100', ''] =>
      ['성벽 파괴자(Siegebreaker)', '공성 파괴자(Siegebreaker)'],
    ['title:siegebreaker', 'default', '26452', ''] =>
      ['공성 파괴자', '공성 파괴자(Siegebreaker)'],
    ['title:siegebreaker', 'default', '29402', ''] =>
      ['공성파괴자', '공성 파괴자(Siegebreaker)'],
    ['title:siegebreaker', 'default', '57027', ''] =>
      ['공성전의 파괴자', '공성 파괴자(Siegebreaker)'],
    ['place:sioran-crypt', 'base', '3549', '11'] =>
      ['시오란(Sioran) 지하묘지', '시오란 지하묘지(Sioran Crypt)'],
    ['place:sioran-crypt', 'default', '9475', ''] =>
      ['시오란 지하 묘지', '시오란 지하묘지(Sioran Crypt)'],
    ['place:sioran-crypt', 'default', '30621', ''] =>
      ['시오란 지하묘지', '시오란 지하묘지(Sioran Crypt)'],
    ['place:sioran-crypt', 'default', '32717', ''] =>
      ['시오란 지하묘지', '시오란 지하묘지(Sioran Crypt)']
  }.freeze

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def definitions
    headers = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers
    SPECS.map do |spec|
      headers.zip([
        spec.fetch(:key), spec.fetch(:english), spec.fetch(:category),
        spec.fetch(:korean), '', '', "D-#{D}", 'confirmed',
        spec.fetch(:notes)
      ]).to_h
    end
  end

  def transformed_text(entity, key, old)
    replacement = REPLACEMENTS[[entity, *key]]
    return old unless replacement

    before, after = replacement
    raise "expected one reviewed span for #{entity}/#{key.join(':')}" unless
      old.scan(Regexp.new(Regexp.escape(before))).length == 1
    old.sub(before, after)
  end

  def discovery_reviews(inventory, specs)
    generated = build_occurrences(inventory.values, specs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected_counts = {
      'item:shine-and-shadow' => 11,
      'title:siegebreaker' => 8,
      'place:sioran-crypt' => 8
    }
    actual_counts = generated.group_by { |row| row.fetch('entity_key') }
                             .transform_values(&:length)
    raise "whole-source occurrence coverage differs: #{actual_counts.inspect}" unless
      actual_counts == expected_counts
    raise 'duplicate occurrence source key' unless
      generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == generated.length

    generated.map do |occurrence|
      entity = occurrence.fetch('entity_key')
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = transformed_text(entity, key, old)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      spec = SPECS.find { |entry| entry.fetch(:key) == entity }
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => spec.fetch(:notes),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
  end

  def prior_dispositions(index, key)
    index.select { |row| M.key(row) == key }.map do |row|
      [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
    end
  end

  def prior_index_for_candidate(index)
    new_entities = SPECS.map { |spec| spec.fetch(:key) }.to_set
    index.reject { |row| new_entities.include?(row.fetch('entity_key')) }
  end

  def candidate_reviews(candidates, inventory, index, discovery)
    discovery_by_key = discovery.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    rows = []
    candidates.each do |candidate|
      term = candidate.fetch('english_candidate')
      candidate_keys(candidate).each do |key|
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
        candidate_pattern = /(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i
        raise "candidate #{term} missing from #{key.inspect}" unless english.match?(candidate_pattern)

        disposition, evidence = case term
                               when 'Sceptre'
                                 if key == ['default', '14097', '']
                                   ['uncertain', 'D-4190 remains unresolved: the isolated Sceptre label does not establish a generic weapon-class label versus a named item. Preserve that uncertainty. This is a proper-name-scope disposition only; it makes no translation-quality finding.']
                                 else
                                   ['excluded', 'English uses Sceptre as the generic weapon class/ordinary weapon term; the official Korean manual PDF p. 7 calls the class 셉터. Exclude this candidate from proper-name scope only. Do not infer that the Korean translation is otherwise correct or reopen prior translation findings.']
                                 end
                               when 'Sceptres'
                                 ['excluded', 'English uses Sceptres as the generic weapon class/stat label; the official Korean manual PDF p. 7 calls the class 셉터. Exclude this candidate from proper-name scope only. Do not infer that the Korean translation is otherwise correct or reopen prior translation findings.']
                               when 'Shadow Walk'
                                 ['uncertain', 'The six exact English labels are not enough to determine whether Shadow Walk denotes a named ability, a route, or a source-local label. The quest sentence at default:54620 uses it as a way to Dannestar, while other rows are isolated labels; Japanese/Chinese/Korean forms vary. Preserve all text and the historical D-18389 translation disposition at default:22158; no identity/type is asserted.']
                               else
                                 entity = {
                                   'Shine and Shadow' => 'item:shine-and-shadow',
                                   'Siegebreaker' => 'title:siegebreaker',
                                   'Sioran Crypt' => 'place:sioran-crypt'
                                 }.fetch(term)
                                 review = discovery_by_key.fetch([entity, *key])
                                 [
                                   review.fetch('status'),
                                   "D-#{D}: #{SPECS.find { |spec| spec.fetch(:key) == entity }.fetch(:notes)}"
                                 ]
                               end
        rows << {
          'english_candidate' => term, 'disposition' => disposition,
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'english' => english, 'japanese' => japanese,
          'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
          'evidence' => evidence,
          'prior_index_dispositions_json' => JSON.generate(prior_dispositions(index, key))
        }
      end
    end
    raise 'duplicate candidate membership' unless
      rows.map { |row| [row.fetch('english_candidate'), *M.key(row)] }.uniq.length == rows.length
    rows
  end

  def repair_candidate_provenance
    current = M.table(M::INDEX).map(&:to_h)
    prior_index = prior_index_for_candidate(current)
    inventory = M.refresh_inventory
    candidates = M.table(INPUT).map(&:to_h)
    discovery = M.table(REVIEWS).map(&:to_h)
    rows = candidate_reviews(candidates.first(6), inventory, prior_index, discovery)
    M.write_table(CANDIDATES, HEADERS, rows)
    puts "D-#{D} candidate prior-index provenance repaired: #{rows.length} memberships."
  end

  def summary_addendum
    <<~TEXT

    Short-label review D-21793:
    - Registered and reviewed every exact English source occurrence of Shine and Shadow (11 rows), Siegebreaker (8 rows), and Sioran Crypt (8 rows) across affix/base/default. Canonical forms are 빛과 그림자(Shine and Shadow), 공성 파괴자(Siegebreaker), and 시오란 지하묘지(Sioran Crypt).
    - Shadow Walk remains an identity/type uncertainty across six rows; no CSV or index status was changed for that candidate. D-18389 at default:22158 remains untouched.
    - Sceptre/Sceptres are excluded from proper-name scope as ordinary weapon terminology, except the isolated default:14097 label, which remains uncertain under D-4190. These are not translation-quality dispositions.
    - Existing translation and entity decisions, including D-18769/23971, D-18389/22158, Siegebreaker closures, and Sioran site/context holds, were preserved and not recounted.
    - Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
    - Refreshed bounded candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
    TEXT
  end

  def update_checkpoint
    snippet = <<~TEXT
      Short-label candidate review: Sceptre/Sceptres are proper-name-scope exclusions except unresolved default:14097; Shadow Walk remains uncertain at six rows; Shine and Shadow (11), Siegebreaker (8), and Sioran Crypt (8) were fully source-scanned and registered.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Refreshed bounded candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
    TEXT
    marker = "Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`."
    M::DOCS.each do |path|
      text = File.read(path)
      raise "missing D-#{D} active checkpoint in #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{snippet.rstrip}\n#{marker}"))
    end
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      path = File.join(__dir__, name)
      File.open(path, 'a') { |file| file.write(summary_addendum) }
    end
  end

  def run
    active = File.read(M::DOCS.first)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    checkpoint = active[marker]
    raise 'D-21792 is not the active checkpoint' unless
      checkpoint&.include?('Latest verified proper-name batch: D-21792 ')
    raise 'checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == checkpoint }

    paths = [
      DEFINITIONS, REVIEWS, CANDIDATES, SNAPSHOT,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    ]
    raise 'D-21793 output already exists; inspect and resume without overwrite' if paths.any? { |path| File.exist?(path) }

    before = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidate_rows = M.table(INPUT).map(&:to_h)
    candidate_map = candidate_rows.to_h { |row| [row.fetch('english_candidate'), row] }
    expected_terms = [
      'Sceptre', 'Sceptres', 'Shadow Walk', 'Shine and Shadow',
      'Siegebreaker', 'Sioran Crypt'
    ]
    raise 'D-21792 candidate prefix changed' unless
      candidate_rows.first(6).map { |row| row.fetch('english_candidate') } == expected_terms

    defs = definitions
    reviews = discovery_reviews(inventory, defs)
    M.write_table(DEFINITIONS, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers, defs)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    disposition_rows = candidate_reviews(candidate_rows.first(6), inventory, index, reviews)
    raise 'expected 32 reviewed short-label memberships' unless disposition_rows.length == 32
    raise 'candidate-only review changed CSV beyond reviewed edits' unless
      M.hashes != before && M.hashes.fetch('affix') == before.fetch('affix')
    M.write_table(CANDIDATES, HEADERS, disposition_rows)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    all_dispositions = ShortLabelDiscovery20261018.reviewed_dispositions
    all_dispositions.merge(disposition_rows.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index,
      reviewed_dispositions: all_dispositions
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    update_checkpoint
    puts "D-#{D}: registered 3 entities / 27 source rows; #{REPLACEMENTS.length} text cells corrected; reviewed #{disposition_rows.length} short-label memberships; next candidates=#{snapshot.length}."
  end
end

if $PROGRAM_NAME == __FILE__
  if ARGV == ['--repair-candidate-provenance']
    ReviewShortLabelCandidatesD21793.repair_candidate_provenance
  else
    abort 'unexpected arguments' unless ARGV.empty?
    ReviewShortLabelCandidatesD21793.run
  end
end
