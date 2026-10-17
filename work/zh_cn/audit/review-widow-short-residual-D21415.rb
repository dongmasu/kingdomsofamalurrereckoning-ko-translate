#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module WidowShortResidualD21415
  extend self

  M = ReviewedNameBatches
  ENTITY = 'person:the-widow'
  CANDIDATES = '/private/tmp/proper-name-candidates-residual-D21412.tsv'
  MANIFEST = File.join(__dir__, 'proper-name-short-residual-D21415.tsv')
  EXPECTED_RESIDUAL_KEYS = %w[
    base:1545:11
    default:12257
    default:15771
    default:19078
    default:3671
    default:47894
    default:60996
  ].freeze

  def row_key_string(row)
    M.key(row).reject(&:empty?).join(':')
  end

  def disposition(row, key)
    case key
    when ['default', '12257', '']
      [
        'accepted',
        row.fetch('work_text').sub(
          '과부여, 맙소사',
          '위도우(The Widow)여, 맙소사'
        ),
        'The Canneroc/Webwood spider context identifies the named Widow. Japanese ウィドウめ and Chinese 寡妇 corroborate the character reference. Add the established bilingual name while preserving the existing vocative and sentence.'
      ]
    when ['default', '15771', '']
      [
        'accepted',
        row.fetch('work_text').sub(
          '과부(Widow)',
          '위도우(The Widow)'
        ),
        'The torn spider webs and Canneroc warning identify the Webwood Fae, not an ordinary bereaved spouse. Japanese あのウィドウ and Chinese 那个该死的寡妇 support this referent. Normalize only the named character span.'
      ]
    when ['default', '19078', '']
      [
        'uncertain',
        row.fetch('work_text'),
        'The isolated English invocation “Widow spare you” may invoke the named Webwood figure, but Japanese omits the Widow reference while Chinese retains 寡妇. Without scene context, do not assign a person identity or alter Korean.'
      ]
    when ['default', '3671', ''], ['default', '47894', '']
      [
        'excluded',
        row.fetch('work_text'),
        'English describes an ordinary bereaved speaker: “Although I am a Widow” is a marital status, not the Webwood Fae. Japanese 未亡人 and Chinese 寡妇 corroborate the generic sense. Exclude from person:the-widow and preserve Korean.'
      ]
    when ['base', '1545', '11'], ['default', '60996', '']
      [
        'excluded',
        row.fetch('work_text'),
        'This is the complete named place Seven Widow Mine, already registered and reviewed as place:seven-widow-mine. Japanese セブン・ウィドウ鉱山 and Chinese 七寡妇矿场/矿区 corroborate the mine. Exclude its Widow substring from the person entity; do not reopen or recount the existing place decision.'
      ]
    else
      raise "unclassified short Widow key #{key.inspect}"
    end
  end

  def prepare!
    abort "missing residual candidate list: #{CANDIDATES}" unless File.file?(CANDIDATES)
    candidate = M.table(CANDIDATES).find do |row|
      row['candidate_key'] == 'candidate:widow'
    end
    abort 'short Widow residual candidate is missing' unless candidate
    candidate_keys = candidate.fetch('source_context_keys').split('|')
    raise 'unexpected short Widow candidate count' unless candidate_keys.length == 89

    inventory = M.refresh_inventory
    indexed_person_keys = M.table(M::INDEX).select do |row|
      row['entity_key'] == ENTITY
    end.map { |row| row_key_string(row) }
    residual_keys = candidate_keys - indexed_person_keys
    raise 'short Widow residual key set changed' unless
      residual_keys.sort == EXPECTED_RESIDUAL_KEYS.sort
    raise 'expected 82 overlapping The Widow keys' unless
      (candidate_keys & indexed_person_keys).length == 82

    rows = residual_keys.sort_by do |key|
      resource, id, variant = key.split(':', 3)
      [M::RESOURCES.index(resource), id.to_i, variant.to_s]
    end.map do |key_string|
      resource, id, variant = key_string.split(':', 3)
      key = [resource, id, variant.to_s]
      source = inventory.fetch(key)
      status, new_text, evidence = disposition(source, key)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "missing aligned locale for #{key_string}" if
        [english, japanese, chinese].any?(&:empty?)
      {
        'resource' => resource,
        'ID_Linha' => id,
        'Tipo_Variante' => variant,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => source.fetch('work_text'),
        'new' => new_text,
        'evidence' => evidence,
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    M.write_table(MANIFEST, M::HEADERS, rows)
    puts "Prepared D-21415: #{rows.length} short-form residual keys; #{rows.group_by { |row| row['status'] }.transform_values(&:length).inspect}."
    puts "Texto edits: #{rows.count { |row| row['old'] != row['new'] }}; no global Widow alias."
  end

  def apply!
    abort "missing prepared manifest: #{MANIFEST}" unless File.file?(MANIFEST)
    backup = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D21415"
    reviews = M.table(MANIFEST).map(&:to_h)
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup, M.hashes)
    verify_output = M.command!(
      'ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup
    )
    summary = <<~TEXT
      Reviewed 7 distinct short-form residual keys for the established `person:the-widow` scope: accepted=2, excluded=4, uncertain=1. The global English alias `Widow` remains unregistered because it also matches ordinary widow references and Seven Widow Mine. Eighty-two of the 89 candidate keys overlap the already reviewed `The Widow` source scope and were not reopened.
      Corrected two Korean `Texto` cells to the established `위도우(The Widow)` form. The generic widow couplets, the two already-reviewed mine labels, and the ambiguous invocation at default:19078 were not changed. No occurrence-index key or historical translation total was added.
      CSV backup: `#{backup}/locatexts_zh_cn.koalocatext_default.csv`.
      Verification: #{verify_output.strip}
    TEXT
    date = M::RUN_DATE_ISO
    File.write(File.join(M::AUDIT, "named-scope-review-D21415-#{M::RUN_DATE_COMPACT}.md"), <<~TEXT)
      # D-21415: Short Widow Residual Screen

      Date: #{date}

      ## Scope

      #{summary}

      ## Evidence

      English is the meaning anchor. Aligned Japanese and Chinese are recorded
      for each of the seven distinct source keys in
      `proper-name-short-residual-D21415.tsv`. This is a contextual residual
      screen, not a global `Widow` alias registration. Existing place and
      translation decisions were preserved; no PAK-derived source was used.
    TEXT
    File.write(File.join(M::AUDIT, "named-scope-edit-addendum-D21415-#{M::RUN_DATE_COMPACT}.md"), <<~TEXT)
      # D-21415 Edit Addendum

      #{summary}

      The byte-preserving editor and verifier checked the backup, BOM, mixed
      line endings, row count/order, target `Texto` values, unchanged
      non-target bytes, and inverse reconstruction.
    TEXT
    puts "D-21415: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}; #{checks.map { |check| check[:validation] }.join('; ')}"
  end
end

case ARGV.fetch(0, 'prepare')
when 'prepare'
  WidowShortResidualD21415.prepare!
when 'apply'
  WidowShortResidualD21415.apply!
else
  abort 'usage: review-widow-short-residual-D21415.rb [prepare|apply]'
end
