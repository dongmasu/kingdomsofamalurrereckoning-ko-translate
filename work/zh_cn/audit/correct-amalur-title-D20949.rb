#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module CorrectAmalurTitleD20949
  extend self

  M = ReviewedNameBatches
  ENTITY = 'game:kingdoms-of-amalur-re-reckoning'
  KOREAN = '킹덤 오브 아말러: 리레코닝(Kingdoms of Amalur: Re-Reckoning)'
  PRIOR_MANIFEST = File.join(__dir__, 'proper-name-edits-D20948.tsv')
  EVIDENCE = 'Corrective superseding edit for D-20948: its first pass replaced the English text inside already-bilingual title labels and duplicated the English title. Rebuild the target from the pre-D-20948 cell, collapse any existing Korean-English pair to one canonical label, then localize only bare title occurrences. English/Japanese/Chinese identity remains unchanged; this is not a new disposition or recount.'

  def corrected(text)
    paired =
      /(?:킹덤(?:스)?\s*오브\s*)?(?:아말루르|아말러)(?:\s*왕국)?\s*[:：]?\s*리-?레코닝\(Kingdoms of Amalur: Re-Reckoning\)/
    localized =
      /(?:킹덤(?:스)?\s*오브\s*)?(?:아말루르|아말러)(?:\s*왕국)?\s*[:：]?\s*리-?레코닝(?!\(Kingdoms of Amalur: Re-Reckoning\))/
    text.gsub(paired, KOREAN)
        .gsub(localized, KOREAN)
        .gsub(/(?<!\()Kingdoms of Amalur: Re-Reckoning/, KOREAN)
  end

  def run
    report = File.join(__dir__, 'named-scope-review-D20949-20261015.md')
    raise 'D-20949 already recorded' if File.exist?(report)
    prior = M.table(PRIOR_MANIFEST)
    inventory = M.refresh_inventory.to_h { |key, row| [key, row] }
    index = M.table(M::INDEX)
    reviews = prior.map do |row|
      next unless row['entity_key'] == ENTITY && row['status'] == 'accepted'
      key = M.key(row)
      baseline = row.fetch('old')
      new_text = corrected(baseline)
      current = inventory.fetch(key).fetch('work_text')
      next if current == new_text
      raise "active title does not match D-20948 at #{key.inspect}" unless
        current == row.fetch('new')
      indexed = index.find do |candidate|
        candidate['entity_key'] == ENTITY && M.key(candidate) == key
      end
      raise "missing terminal title key #{key.inspect}" unless indexed
      raise "unexpected prior status at #{key.inspect}" unless indexed['status'] == 'accepted'
      source = inventory.fetch(key)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => current, 'new' => new_text, 'evidence' => EVIDENCE,
        'english' => JSON.parse(source['en_texts_json'] || '[]').compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json'] || '[]').compact.join("\n---\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => JSON.generate(ENTITY => indexed['status']),
        'previous_evidence' => JSON.generate(ENTITY => indexed['evidence'])
      }
    end.compact.sort_by { |row| row['ID_Linha'].to_i }
    raise "expected 26 corrective cells, got #{reviews.length}" unless reviews.length == 26
    raise 'correction unexpectedly changes a formatting token' unless
      reviews.all? { |row| ProperNameCellEditor.tokens(row['old']) == ProperNameCellEditor.tokens(row['new']) }

    manifest = File.join(__dir__, 'proper-name-edits-D20949.tsv')
    M.write_table(manifest, M::HEADERS, reviews)
    before_hashes = M.hashes
    expected = {
      'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
      'base' => '851e01e95528ec088e4ce35b2a3adfb7a82d6ac91d78c611aad351c4828ee468',
      'default' => '097c6571555ab8ddc7698ba983ba8cd13e6ffcae5e969f964cff5be53f85a469'
    }
    raise "active CSV hashes changed before correction: #{before_hashes.inspect}" unless before_hashes == expected

    backup = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D20949'
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup, before_hashes)
    verify_output = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', manifest, '--backup-dir', backup
    )
    inventory = M.refresh_inventory
    reviews.each do |row|
      raise "corrective output mismatch at #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row['new']
    end
    M.checkpoint(
      20_949, reviews, checks, verify_output, inventory,
      review_states: ['accepted']
    )
    puts "D-20949: corrected #{reviews.length} D-20948 title cells without recount."
  end
end

CorrectAmalurTitleD20949.run if $PROGRAM_NAME == __FILE__
