#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module SeparateSigbertWorkLabelsD21585
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_585
  LONG = 'named work:journal-of-sigbert-sawerth'
  SHORT = 'named work:sigbert-journal'
  KEY = ['base', '3322', '11'].freeze
  OLD_ASSERTION = /Sigbert's Journal is the source-short label.*?base:3322\./m
  CORRECTION = <<~TEXT.chomp
    D-21585 metadata correction after independent review: English base:3322
    says Sigbert's Journal, Japanese シグバートの日誌 and Chinese
    西格伯特的日记; default:8927 says Journal of Sigbert Sawerth, Japanese
    シグバート・サワースの日誌 and Chinese 西格伯特·萨维尔斯的日记.
    The owner-person evidence does not independently establish that these
    are the same physical journal or work. Remove the unsupported title
    alias and retain two independent source-label entries, without asserting
    they are different physical objects either. Preserve the existing
    local short/full Korean title pairs. Rekey the single base occurrence,
    retaining its D-21580 accepted disposition rather than creating a new
    acceptance. Preserve the long-label occurrence and all other entity
    statuses/evidence. No CSV edit, new translation decision, reopened hold
    or change to occurrence-status counts; no new backup is necessary.
    This corrects registry metadata only, not the earlier person identity.
  TEXT

  def apply
    R.ensure_unused_batch!(D)
    glossary = M.table(R::GLOSSARY)
    long = glossary.find { |row| row['entity_key'] == LONG }
    raise 'missing/changed original title alias' unless long &&
      long['english_aliases'] == "Sigbert's Journal"
    raise 'short work label already exists' if glossary.any? { |row| row['entity_key'] == SHORT }
    index = M.table(M::INDEX)
    old_match = index.select { |row| row['entity_key'] == LONG && M.key(row) == KEY }
    raise 'ambiguous original title occurrence' unless old_match.length == 1
    old = old_match.first.to_h
    raise 'unexpected prior short-title disposition' unless old['status'] == 'accepted' &&
      old['evidence'].start_with?('D-21580:') &&
      old['matched_english'] == "Sigbert's Journal"
    inventory = M.refresh_inventory
    source = inventory.fetch(KEY)
    raise 'unexpected active title' unless
      source['work_text'] == "시그버트의 일지(Sigbert's Journal)" &&
      JSON.parse(source['en_texts_json']) == ["Sigbert's Journal"]
    original_hashes = M.hashes
    original_counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    long['english_aliases'] = ''
    glossary.each do |entry|
      entry['notes'] = entry['notes'].gsub(OLD_ASSERTION, CORRECTION)
    end
    values = {
      'entity_key' => SHORT, 'english_canonical' => "Sigbert's Journal",
      'korean_canonical' => "시그버트의 일지(Sigbert's Journal)",
      'category' => 'named work', 'english_aliases' => '',
      'korean_variants' => '시그버트의 일지', 'evidence_ids' => "D-21580|D-#{D}",
      'status' => 'confirmed', 'notes' => CORRECTION
    }
    short = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    new_glossary = glossary.map(&:to_h) + [short]
    old_match.first['entity_key'] = SHORT
    generated = build_occurrences(inventory.values, [long.to_h, short]).map do |row|
      OCCURRENCE_HEADERS.zip(row).to_h
    end
    expected = index.select { |row| [LONG, SHORT].include?(row['entity_key']) }
                    .map { |row| [row['entity_key'], *M.key(row)] }.sort
    raise 'split source coverage differs' unless
      generated.map { |row| [row['entity_key'], *M.key(row)] }.sort == expected
    raise 'split changes occurrence counts' unless index.length == M.table(M::INDEX).length &&
      original_counts == index.group_by { |row| row['status'] }.transform_values(&:length)
    review = {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => SHORT, 'status' => old['status'],
      'old' => source['work_text'], 'new' => source['work_text'],
      'evidence' => CORRECTION,
      'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
      'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
      'chinese' => source['zh_text'],
      'entity_dispositions_json' => JSON.generate(SHORT => old['status']),
      'previous_status' => JSON.generate(LONG => old['status']),
      'previous_evidence' => JSON.generate(LONG => old['evidence'])
    }
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    M.write_table(manifest, M::HEADERS, [review])
    M.write_table(R::GLOSSARY, glossary.headers, new_glossary)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h))
    raise 'unexpected CSV change' unless M.hashes == original_hashes
    M.checkpoint(D, [review], [], 'No CSV edits; metadata-only rekey, original acceptance and status counts retained.',
                 inventory, review_states: ['accepted'])
    detail = <<~TEXT.chomp
      ### D-#{D}: Metadata-Only Sigbert Work-Label Separation

      #{CORRECTION}
      The checkpoint's one accepted row is a carried-forward D-21580
      disposition, not an additional accepted translation. Index length
      and all status counts remain unchanged; glossary length increases
      by one because the unsupported work-title alias is split.
      Full discovery remains incomplete; D-21569 release ZIP is unchanged.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.write(path, "#{File.read(path)}\n\n#{detail}\n")
    end
    puts "D-#{D}: one metadata rekey, zero CSV edits; status counts unchanged."
  end
end

SeparateSigbertWorkLabelsD21585.apply if $PROGRAM_NAME == __FILE__
