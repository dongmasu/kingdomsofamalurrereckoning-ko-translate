#!/usr/bin/env ruby

require 'csv'
require 'json'

module ProperNameD20410
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20410.tsv')
  GROUPS = {
    'unique_item:amrynthian-band' => 11,
    'person:anokatos' => 37,
    'person:anru' => 2
  }.freeze
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def canonicalize(text, entity_key, english)
    case entity_key
    when 'unique_item:amrynthian-band'
      text.gsub(/(?:암린시안 반지|아므린티안 반지|암린시안 관)(?:\(Amrynthian Band\))?/,
                '암린시안 관(Amrynthian Band)')
    when 'person:anokatos'
      text.gsub(/아노카토스(?!\(Anokatos\))/,
                '아노카토스(Anokatos)')
    when 'person:anru'
      if english.match?(/\bAnru Besin\b/i)
        text.gsub(/안루(?:\(Anru\))?\s+베신(?:\(Anru Besin\))?/,
                  '안루 베신(Anru Besin)')
      else
        text.gsub(/안루(?!\(Anru\))/, '안루(Anru)')
      end
    else
      raise "unexpected entity #{entity_key}"
    end
  end

  def evidence(entity_key)
    case entity_key
    when 'unique_item:amrynthian-band'
      'English identifies the named crown Amrynthian Band; Japanese and Chinese source rows corroborate the object and context. Reused the established canonical form 암린시안 관(Amrynthian Band), preserving its distinction from a ring.'
    when 'person:anokatos'
      'English identifies the Kollossae Primos Anokatos; Japanese アノカトス and Chinese 安诺卡托斯 corroborate the identity. Standardized every reviewed Korean mention as 아노카토스(Anokatos), including repeated mentions and attached particles.'
    when 'person:anru'
      'English identifies Anru or Anru Besin; Japanese and Chinese source evidence corroborates the personal name. Reused the established forms 안루(Anru) and 안루 베신(Anru Besin).'
    end
  end

  def build
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    pending = occurrences.select do |row|
      GROUPS.key?(row.fetch('entity_key')) && row.fetch('status') == 'needs-context'
    end
    grouped = pending.group_by { |row| row.fetch('entity_key') }
      .transform_values do |rows|
        rows.uniq { |row| key(row) }.sort_by do |row|
          resource, id, variant = key(row)
          [{ 'affix' => 0, 'base' => 1, 'default' => 2 }.fetch(resource),
           id.to_i, variant]
        end
      end
    selected = GROUPS.flat_map do |entity_key, count|
      rows = grouped.fetch(entity_key, [])
      raise "#{entity_key}: expected #{count}, found #{rows.length}" if rows.length < count
      rows.first(count).map { |row| [entity_key, row] }
    end
    raise "expected 50 unique keys, found #{selected.map { |_e, r| key(r) }.uniq.length}" unless
      selected.map { |_entity, row| key(row) }.uniq.length == 50

    rows = selected.map do |entity_key, occurrence|
      row_key = key(occurrence)
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      raise "stale occurrence at #{row_key.inspect}" unless
        occurrence.fetch('korean_current') == old
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      replacement = canonicalize(old, entity_key, english)
      status = replacement == old ? 'not-an-issue' : 'accepted'
      [
        *row_key, entity_key, status, old, replacement, evidence(entity_key),
        english,
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text')
      ]
    end
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "D-20410 manifest: #{rows.length} keys; " \
         "#{rows.group_by { |row| row[4] }.transform_values(&:length).inspect}"
  end

  def sync_index
    manifest = CSV.read(MANIFEST, headers: true, col_sep: "\t")
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    decisions = manifest.to_h { |row| [[row.fetch('entity_key'), *key(row)], row.to_h] }
    manifest.each do |review|
      source = inventory.fetch(key(review))
      raise "active text mismatch at #{key(review).inspect}" unless
        source.fetch('work_text') == review.fetch('new')
      review['english'] = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      review['japanese'] = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      review['chinese'] = source.fetch('zh_text')
    end
    occurrences.each do |row|
      row_key = key(row)
      row['korean_current'] = inventory.fetch(row_key).fetch('work_text')
      decision = decisions[[row.fetch('entity_key'), *row_key]]
      next unless decision
      row['status'] = decision.fetch('status')
      row['evidence'] = decision.fetch('evidence')
    end
    [[OCCURRENCES, occurrences, occurrences.headers],
     [MANIFEST, manifest, manifest.headers]].each do |path, rows, headers|
      CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
        csv << headers
        rows.each { |row| csv << headers.map { |header| row[header] } }
      end
    end
    puts "Updated #{decisions.length} exact entity/row dispositions."
  end
end

case ARGV
when ['build']
  ProperNameD20410.build
when ['sync-index']
  ProperNameD20410.sync_index
else
  abort 'usage: review-proper-name-D20410.rb build|sync-index'
end
