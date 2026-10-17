#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module LordsOfValorD21423
  extend self

  M = ReviewedNameBatches
  D = 21_423
  ENTITY = 'organization:lords-of-valor'
  CANONICAL = '용맹의 군주들(Lords of Valor)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  def normalize(text)
    text.gsub(/(?:용맹|발러)의 군주(?:들|단)?(?:\(Lords of Valor\))?/i, CANONICAL)
        .gsub("#{CANONICAL}는", "#{CANONICAL}은")
        .gsub("#{CANONICAL}가", "#{CANONICAL}이")
        .gsub("#{CANONICAL}를", "#{CANONICAL}을")
        .gsub("#{CANONICAL}와", "#{CANONICAL}과")
  end

  def prepare
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise "#{ENTITY} already registered" if glossary.any? { |row| row['entity_key'] == ENTITY }
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'Lords of Valor',
      'category' => 'organization', 'korean_canonical' => CANONICAL,
      'english_aliases' => '',
      'korean_variants' => '용맹의 군주들|용맹의 군주단|용맹의 군주|발러의 군주들',
      'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
      'notes' => 'The named Arena championship team led by the Champion. English explicitly identifies the team; Japanese ローズ・オブ・バロー and Chinese 英勇领主 corroborate. Keep the established Korean meaning 용맹 and plural 군주들. No generic Valor, Lord, Champion, or Arena alias; do not merge this team with the Crows or the House of Valor.'
    }
    definitions = [glossary.headers.to_h { |header| [header, fields.fetch(header, '')] }]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'empty/oversized team scope' unless (1..50).cover?(generated.length)
    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "unaligned source #{key.inspect}" if [english, japanese, chinese].any?(&:empty?)
      raise "team source mismatch #{key.inspect}" unless
        english.match?(/\bLords of Valor\b/) &&
        japanese.include?('ローズ・オブ・バロー') && chinese.include?('英勇领主')
      old = source.fetch('work_text')
      new_text = normalize(old)
      raise "Korean team span absent #{key.inspect}" unless new_text.include?(CANONICAL)
      raise "annotation not idempotent #{key.inspect}" unless normalize(new_text) == new_text
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => 'English explicitly names the Arena team Lords of Valor, led by the Champion; aligned Japanese ローズ・オブ・バロー and Chinese 英勇领主 corroborate the same team. Normalize the team span and its immediately attached particle only to 용맹의 군주들(Lords of Valor), including every repeated mention. Preserve the separate Crows/House of Valor identities and their prior dispositions; no global translation tally is recounted.',
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    puts "Prepared D-#{D}: #{reviews.length} distinct keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers,
                  definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then LordsOfValorD21423.prepare
  when 'apply' then LordsOfValorD21423.apply
  else abort 'usage: review-lords-of-valor-D21423.rb [prepare|apply]'
  end
end
