#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'review-person-A-F-continuation'

module BuildPersonAFSafeReady
  ROOT = File.expand_path('../../..', __dir__)
  AUDIT = __dir__
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INPUT = File.join(AUDIT, 'proper-name-reviewed-A-F-continuation.tsv')
  READY = File.join(AUDIT, 'proper-name-reviewed-A-F-ready-D20416.tsv')
  EXCEPTIONS = File.join(AUDIT, 'proper-name-reviewed-A-F-exceptions-D20416.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def aligned_text(source)
    [
      source.fetch('work_text'),
      JSON.parse(source['en_texts_json'] || '[]').compact.join("\n"),
      JSON.parse(source['ja_texts_json'] || '[]').compact.join("\n---\n"),
      source['zh_text']
    ]
  end

  def write(path, rows)
    CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << HEADERS.map { |header| row[header] } }
    end
  end

  def run
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    original = CSV.read(INPUT, headers: true, col_sep: "\t").map(&:to_h)
    ready = []
    exceptions = []
    corrected_exclusions = original.count do |row|
      row['status'] == 'excluded' && row['old'] != row['new']
    end

    original.each do |row|
      source = inventory.fetch(key(row)) { raise "missing inventory row #{key(row).inspect}" }
      expected = aligned_text(source)
      actual = [row['old'], row['english'], row['japanese'], row['chinese']]
      raise "stale reviewed source #{key(row).inspect}" unless actual == expected

      if row['status'] == 'accepted'
        raise "accepted no-op #{key(row).inspect}" if row['old'] == row['new']
        if key(row) == ['default', '55520', '']
          row['status'] = 'uncertain'
          row['new'] = row['old']
          row['evidence'] = 'Uncertain: the saved proposal replaces the full quest description with only “달탄 이임스(Daltan Eames),” deleting all surrounding source meaning; preserve the original until a complete sentence-level edit is reviewed.'
          exceptions << row
        else
          ready << row
        end
      else
        row['new'] = row['old']
        exceptions << row
      end
    end

    PersonAFContinuation::MANUAL_GROUPS.each do |row_key, decision|
      source = inventory.fetch(row_key) { raise "missing manual source #{row_key.inspect}" }
      status = decision[1]
      old = source.fetch('work_text')
      proposed = decision[2] || old
      status = 'not-an-issue' if status == 'accepted' && proposed == old
      raise "invalid manual disposition #{row_key.inspect}" unless
        %w[accepted not-an-issue excluded uncertain].include?(status)
      raise "non-accepted manual edit #{row_key.inspect}" if status != 'accepted' && proposed != old

      exceptions << {
        'resource' => row_key[0],
        'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2],
        'entity_key' => decision[0],
        'status' => status,
        'old' => old,
        'new' => proposed,
        'evidence' => decision[3],
        'english' => JSON.parse(source['en_texts_json'] || '[]').compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json'] || '[]').compact.join("\n---\n"),
        'chinese' => source['zh_text']
      }
    end

    [ready, exceptions].each do |rows|
      raise 'duplicate resource/ID/variant row' unless rows.map { |row| key(row) }.uniq.length == rows.length
    end
    overlap = ready.map { |row| key(row) } & exceptions.map { |row| key(row) }
    raise "ready/exceptions overlap: #{overlap.inspect}" unless overlap.empty?

    write(READY, ready)
    write(EXCEPTIONS, exceptions)
    puts "ready=#{ready.length} accepted"
    puts "exceptions=#{exceptions.length} dispositions (#{exceptions.count { |row| row['status'] == 'accepted' }} accepted manual rows)"
    puts "corrected exclusions=#{corrected_exclusions}"
  end
end

BuildPersonAFSafeReady.run if $PROGRAM_NAME == __FILE__
