#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module TineShortFormD21055
  M = ReviewedNameBatches
  ENTITY = 'person:tine-delfric'
  ROWS = {
    '10279' => 'uncertain',
    '12341' => 'not-an-issue',
    '24859' => 'uncertain',
    '26441' => 'not-an-issue',
    '43286' => 'not-an-issue',
    '9244' => 'not-an-issue'
  }.freeze
  TRIAGE = File.join(M::AUDIT, 'proper-name-discovery-scout-D21055.tsv')
  REVIEWS = '/private/tmp/proper-name-reviewed-tine-D21055.tsv'

  module_function

  def evidence(id, status)
    if status == 'uncertain'
      reason = id == '10279' ?
        'The epitaph names only Tine; the corpus separately identifies Tine Grastar, but does not establish that this memorial belongs to that person or to Tine Delfric.' :
        'The short objective names only Tine and supplies no faction, role, surname, or linked dialogue that identifies which person is intended.'
      "D-21055 row-scoped short form: English, Japanese, and Chinese confirm the name Tine, but #{reason} Kept the existing bilingual Korean unchanged and did not register a global Tine alias."
    else
      context = case id
                when '12341'
                  'The speaker explicitly directs the player to old Tine in Shieldring Keep, where he will assign Warsworn work; this is the established Warsworn Ancient Tine Delfric.'
                when '26441', '9244'
                  'The Heart of Sibun quest update attributes the investigation order to Tine and places it with Castellan Grian Shane at Helmgard Keep, identifying the established Warsworn Ancient Tine Delfric.'
                when '43286'
                  'The aligned letter addresses Tine about Warsworn Pledgeshields and the ongoing Klurikon campaign, identifying the established Warsworn Ancient Tine Delfric.'
                end
      "D-21055 row-scoped short form: English uses Tine without the surname in this exact row. #{context} Japanese and Chinese corroborate the same direct name reference. The Korean already pairs Tine; retained it without adding a global alias, which would conflate Tine Delfric with Tine Grastar."
    end
  end

  def run
    batch_paths = [
      File.join(M::AUDIT, 'named-scope-review-D21055-20261015.md'),
      File.join(M::AUDIT, 'named-scope-edit-addendum-D21055-20261015.md'),
      File.join(M::AUDIT, 'proper-name-edits-D21055.tsv'),
      '/private/tmp/ko-translate-backups/20261015/before-proper-name-D21055'
    ]
    raise 'D-21055 artifacts already exist' if batch_paths.any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'missing confirmed Tine Delfric glossary entity' unless
      glossary.any? { |row| row['entity_key'] == ENTITY && row['status'] == 'confirmed' }
    index = M.table(M::INDEX)

    reviews = ROWS.map do |id, status|
      key = ['default', id, '']
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text').to_s
      raise "English candidate mismatch #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Tine(?![A-Za-z])/i)
      raise "missing aligned source evidence #{key.inspect}" if japanese.empty? || chinese.empty?
      raise "already indexed Tine Delfric key #{key.inspect}" if
        index.any? { |row| row['entity_key'] == ENTITY && M.key(row) == key }
      korean = source.fetch('work_text')
      raise "Tine is not paired in Korean #{key.inspect}" unless
        korean.match?(/(?<![A-Za-z])Tine(?![A-Za-z])/i)

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => korean, 'new' => korean,
        'evidence' => evidence(id, status), 'english' => english,
        'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end

    new_occurrences = reviews.map do |review|
      key = M.key(review)
      {
        'entity_key' => ENTITY, 'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'matched_english' => 'Tine [row-scoped short form; identity checked in context]',
        'english_source' => review.fetch('english'),
        'korean_current' => review.fetch('old'), 'status' => 'needs-context',
        'evidence' => "D-21055 candidate: review row-scoped Tine reference; source inventory key #{key.join(':')}."
      }
    end
    sort_key = lambda do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']]
    end
    M.write_table(
      M::INDEX, index.headers, (index.map(&:to_h) + new_occurrences).sort_by(&sort_key)
    )
    M.write_table(REVIEWS, M::HEADERS, reviews)

    headers = %w[
      english_candidate source_rows already_indexed_rows new_rows
      not_an_issue uncertain disposition evidence_ids evidence
    ]
    triage = {
      'english_candidate' => 'Tine',
      'source_rows' => '49',
      'already_indexed_rows' => '43',
      'new_rows' => reviews.length.to_s,
      'not_an_issue' => reviews.count { |row| row['status'] == 'not-an-issue' }.to_s,
      'uncertain' => reviews.count { |row| row['status'] == 'uncertain' }.to_s,
      'disposition' => 'Four row-scoped references confirmed as Tine Delfric; two short references held without a global Tine alias.',
      'evidence_ids' => ROWS.keys.map { |id| "default:#{id}" }.join('|'),
      'evidence' => 'Tine Grastar is a separate person. Existing Grastar dispositions were not reopened; the two ambiguous rows retain their current bilingual Korean unchanged.'
    }
    CSV.open(TRIAGE, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << headers
      csv << headers.map { |header| triage.fetch(header) }
    end
    puts "Prepared D-21055: #{reviews.length} keys; #{triage['not_an_issue']} not-an-issue, #{triage['uncertain']} uncertain; no CSV edits."
    puts "Review input: #{REVIEWS}"
    puts "Candidate triage: #{TRIAGE}"
  end
end

TineShortFormD21055.run if $PROGRAM_NAME == __FILE__
