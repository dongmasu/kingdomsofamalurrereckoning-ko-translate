#!/usr/bin/env ruby

require_relative 'review-four-short-person-names-D21396'

module MixedFullShortReferencesD21399
  module_function

  TARGETS = {
    '18039' => 'person:pepin-jamane',
    '35537' => 'person:angharad-glyndowr',
    '50452' => 'person:alder-malloi',
    '58690' => 'person:alder-malloi'
  }.freeze

  def transform(entity, text, full_name)
    token = '__D21399_PROTECTED_FULL_NAME__'
    raise 'unexpected protected token' if text.include?(token)
    raise 'expected exactly one full-name pair' unless text.scan(full_name).length == 1
    protected = text.sub(full_name, token)
    result = FourShortPersonNamesD21396.transform(entity, protected).sub(token, full_name)
    raise 'short annotation was already complete' if result == text
    raise 'full name changed' unless result.scan(full_name).length == 1
    result
  end

  def run
    m = ReviewedNameBatches
    d = 21_399
    ReviewedProperNameDiscovery.ensure_unused_batch!(d)
    raise 'finish preceding new-key batches first' unless
      File.file?(File.join(__dir__, 'proper-name-edits-D21398.tsv'))
    inventory = m.refresh_inventory
    glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    index = m.table(m::INDEX)
    reviews = TARGETS.map do |id, entity|
      key = ['default', id, '']
      old_index = index.find { |row| row['entity_key'] == entity && m.key(row) == key }
      expected_status = id == '18039' ? 'not-an-issue' : 'accepted'
      raise "unexpected prior decision #{id}" unless old_index && old_index['status'] == expected_status
      canonical = glossary.find { |row| row['entity_key'] == entity }
      source = inventory.fetch(key)
      english = JSON.parse(source['en_texts_json']).compact.join("\n")
      short = FourShortPersonNamesD21396::CONFIG.fetch(entity).fetch(:short)
      raise "missing mixed English source #{id}" unless
        english.include?(canonical['english_canonical']) &&
        english.gsub(canonical['english_canonical'], '').match?(/\b#{Regexp.escape(short)}\b/)
      old = source.fetch('work_text')
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => entity, 'status' => 'accepted', 'old' => old,
        'new' => transform(entity, old, canonical['korean_canonical']),
        'evidence' => "Focused follow-up of an existing entity/key, not a new occurrence. English explicitly uses #{canonical['english_canonical']} and then #{short} for the same person. The earlier full-name judgment missed the later short-name bilingual omission; supersede only that annotation aspect. Protect the complete existing full-name pair byte-for-byte and annotate only the later short reference. Prior status/evidence are preserved in this manifest. " +
          FourShortPersonNamesD21396::CONFIG.fetch(entity).fetch(:evidence),
        'english' => english,
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(entity => 'accepted')
      }
    end
    proposal = '/private/tmp/proper-name-edits-D21399-proposal.tsv'
    raise 'proposal already exists' if File.exist?(proposal)
    m.write_table(proposal, m::HEADERS.take(12), reviews)
    before_count = index.length
    m.run(proposal, d, 1, review_states: %w[accepted not-an-issue])
    raise 'follow-up created duplicate occurrence records' unless m.table(m::INDEX).length == before_count
    detail = <<~TEXT

      ## D-21399: Existing Mixed Full/Short Annotation Follow-Up

      Corrected four existing occurrence keys, not four new indexed records:
      default:18039 (Pepin), 35537 (Angharad), 50452 and 58690 (Alder).
      English explicitly uses both the full and short names in each row.
      The complete full-name pairs and other text are protected unchanged;
      only the later missing short-name annotations are added. This
      supersedes only the earlier annotation omission, not the established
      identities or full-name spelling. The manifest retains exact previous
      dispositions and evidence. Pepin's earlier not-an-issue becomes
      accepted for this concrete omission; the other three remain accepted.
      No new glossary or occurrence entry, global alias or historical
      translation total is added. Existing reviewed holds are untouched.
    TEXT
    %W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + detail)
    end
    m::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint marker #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, marker + "\n" + detail))
    end
    puts detail
  end
end

MixedFullShortReferencesD21399.run if $PROGRAM_NAME == __FILE__
