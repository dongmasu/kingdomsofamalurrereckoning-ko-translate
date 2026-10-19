#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21765
  extend self

  M = ReviewedNameBatches
  D = 21_765
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21762.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  SPECS = [{
    key: 'title:love-again-another-day',
    english: 'Love Again Another Day',
    category: 'title',
    korean: '언젠가 다시 사랑하리(Love Again Another Day)',
    count: 3,
    notes: 'English presents the exact same capitalized title in base:4824:11 and default:60603. Japanese 我はまた、いつか愛する and Chinese 再爱一天 corroborate the sense of loving again at a later time. Reuse the base label 언젠가 다시 사랑하리 as the Korean title and standardize the default label to match; add the missing English pairing to the base label. A separate lower-case occurrence in default:1842 is a first-person lyric within a poem, not an explicit title reference; preserve its Korean verse and exclude that key from this title entity. Do not infer whether the title is a song, book, quest, or other work.'
  }].freeze

  GROUPS = {
    'Love Again Another Day' => {
      count: 2,
      status: 'candidate',
      evidence: 'The exact English title occurs as a base label and as a default display string. Japanese 我はまた、いつか愛する and Chinese 再爱一天 corroborate the same later-time/renewed-love sense. The Korean base label 언젠가 다시 사랑하리 is the stronger source-aligned rendering; use it consistently and pair the complete title with English. The similar lower-case phrase in default:1842 is an ordinary first-person lyric, not a title occurrence, and is excluded without edit. No work type is inferred.'
    }
  }.freeze

  TITLE_KOREAN = /언젠가 다시 사랑하리(?:\(Love Again Another Day\))?|또 다른 날의 사랑(?:\(Love Again Another Day\))?/.freeze

  def row_key(row)
    M.key(row)
  end

  def candidate_keys(candidate)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |key| key.map(&:to_s) }
    end.uniq.sort
  end

  def source_count(source, term)
    pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
    JSON.parse(source.fetch('en_texts_json')).compact.sum { |text| text.scan(pattern).length }
  end

  def transform(_spec, key, text, source)
    count = source_count(source, 'Love Again Another Day')
    raise "English title missing at #{key.inspect}" unless count.positive?
    if key == ['default', '1842', '']
      return [text, true]
    end
    found = 0
    result = text.gsub(TITLE_KOREAN) do
      found += 1
      SPECS.first.fetch(:korean)
    end
    raise "Korean/English title count differs at #{key.inspect}: #{found}/#{count}" unless found == count
    [result, false]
  end

  def build_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| row_key(row) }
    reviews = GROUPS.flat_map do |term, decision|
      candidate = candidates.fetch(term)
      keys = candidate_keys(candidate)
      raise "#{term} key count differs" unless keys.length == decision.fetch(:count)
      keys.map do |key|
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
        raise "English candidate absent at #{key.inspect}" unless english.include?(term)
        old = source.fetch('work_text')
        proposed = transform(SPECS.first, key, old, source).first
        status = proposed == old ? 'not-an-issue' : 'accepted'
        {
          'english_candidate' => term,
          'disposition' => status,
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => english,
          'japanese' => japanese,
          'chinese' => source.fetch('zh_text'),
          'korean' => old,
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(key, []).map do |row|
              [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
            end
          )
        }
      end
    end
    keys = reviews.map { |row| row_key(row) }
    raise 'candidate review exceeds 50 source keys' if keys.uniq.length > 50
    raise 'duplicate candidate/key disposition' unless
      reviews.map { |row| [row.fetch('english_candidate'), *row_key(row)] }.uniq.length == reviews.length
    raise 'candidate source-key overlap' unless keys.uniq.length == keys.length
    reviews
  end

  def finalize_existing
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'partial D-21765 outputs are incomplete' unless
      [report, addendum, manifest, OUTPUT,
       File.join(__dir__, "proper-name-discovery-D#{D}.tsv"),
       File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")].all? { |path| File.file?(path) }

    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    next_snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    raise 'D-21765 candidate snapshot unexpectedly exists' if File.exist?(SNAPSHOT)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    verify = M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                        '--review', manifest,
                        '--backup-dir', "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}")
    raise 'D-21765 data validation failed' unless validation.include?('PASS')
    raise 'D-21765 residual audit failed' unless residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    next_term = next_snapshot.first&.fetch('english_candidate', 'none')
    next_line = "Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; begins `#{next_term}`; not exhaustive or a completion estimate)."
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    candidate_note = <<~TEXT

      ## D-#{D}: Short-Label Candidate Review

      Reviewed two exact candidate keys for `Love Again Another Day`; both
      were accepted into the same title entity. Standardized the default
      label to the English-led Korean base rendering and added the English
      pairing to the base label. The separate lower-case phrase in
      default:1842 is a first-person lyric and was excluded without editing.
      Exact candidate evidence is in
      `proper-name-short-label-dispositions-D#{D}.tsv`; source-wide title
      matches and edits are in `proper-name-discovery-D#{D}.tsv` and
      `proper-name-edits-D#{D}.tsv`. Remaining bounded groups: #{next_snapshot.length},
      beginning `#{next_term}`; this is not an exhaustive completion estimate.
      Full proper-name discovery/residual validation remains incomplete.
    TEXT
    status_note = "\n\nValidation: #{validation.strip}\n#{verify.strip}\nResidual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}\n"

    (M::DOCS + [report, addendum]).each do |path|
      text = File.read(path)
      if M::DOCS.include?(path)
        checkpoint = text[marker] || raise("active checkpoint marker missing: #{path}")
        checkpoint.sub!(/^Next batch:.*$/, next_line)
        text.sub!(marker, checkpoint)
      else
        text.sub!(/^Next batch:.*$/, next_line) ||
          raise("next-batch line missing: #{path}")
      end
      unless text.include?('## D-21765: Short-Label Candidate Review')
        text << candidate_note
      end
      text << status_note unless text.include?('Residual bilingual/index audit: PASS;')
      File.write(path, text)
    end
    puts "D-#{D}: finalized existing edits; candidates remaining=#{next_snapshot.length}; data, inverse-byte, and residual checks PASS."
  end

  def run
    return finalize_existing if File.exist?(manifest_path = File.join(__dir__, "proper-name-edits-D#{D}.tsv"))
    raise "D-#{D} snapshot already exists" if File.exist?(SNAPSHOT)
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    current = 'Latest verified proper-name batch: D-21764 '
    raise 'D-21764 is not the current checkpoint in every active document' unless
      docs.values.all? { |text| text.include?(current) }

    before = M.hashes
    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    raise 'title already registered' if glossary.any? do |row|
      row['entity_key'] == SPECS.first.fetch(:key) ||
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .any? { |term| term.casecmp?(SPECS.first.fetch(:english)) }
    end
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    index = M.table(M::INDEX)
    reviews = build_reviews(inventory, index.map(&:to_h), candidates)
    M.write_table(OUTPUT, HEADERS, reviews)
    raise 'active CSV changed while preparing scope' unless M.hashes == before

    context = 'D-21765 reviews the exact bilingual title and aligns its two title keys. English determines meaning; Japanese and Chinese corroborate. The similar lower-case phrase in default:1842 is a first-person lyric, not a title, and is preserved as an explicit exclusion. Existing entity dispositions and historical global totals are not reopened or recounted.'
    ReviewedDiscoverySpecs.run(
      D, 'Love Again Another Day Title', SPECS, context,
      'Latest verified proper-name batch: D-21764 '
    ) do |_spec, key, text, source|
      transform(SPECS.first, key, text, source)
    end

    inventory = M.refresh_inventory
    glossary = M.table(glossary_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    next_snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    next_term = next_snapshot.first&.fetch('english_candidate', 'none')
    next_line = "Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; begins `#{next_term}`; not exhaustive or a completion estimate)."
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    (M::DOCS + [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ]).each do |path|
      text = File.read(path)
      active = text[marker] || raise("active checkpoint marker missing: #{path}")
      active.sub!(/^Next batch:.*$/, next_line)
      text.sub!(marker, active)
      File.write(path, text)
    end

    candidate_note = <<~TEXT

      ## D-#{D}: Short-Label Candidate Review

      Reviewed two exact candidate keys for `Love Again Another Day`; both
      were accepted into the same title entity. Standardized the default
      label to the English-led Korean base rendering and added the English
      pairing to the base label. Exact source-aligned candidate evidence is
      in `proper-name-short-label-dispositions-D#{D}.tsv`; source-wide title
      matches and edits are in `proper-name-discovery-D#{D}.tsv` and
      `proper-name-edits-D#{D}.tsv`. Remaining bounded groups: #{next_snapshot.length},
      beginning `#{next_term}`; this is not an exhaustive completion estimate.
      Full proper-name discovery/residual validation remains incomplete.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [report, addendum].each { |path| File.write(path, File.read(path) + candidate_note) }
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + candidate_note)
    end
    puts "D-#{D}: reviewed #{reviews.length} candidate keys; standardized one named title across base/default; #{next_snapshot.length} bounded groups remain."
  end
end

ReviewShortLabelCandidatesD21765.run if $PROGRAM_NAME == __FILE__
