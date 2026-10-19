#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'

module AncientVaultD21691
  extend self

  D = 21_691
  ENTITY = 'place:ancient-vault'
  ENGLISH = 'Ancient Vault'
  CANONICAL = '고대 금고(Ancient Vault)'
  KEYS = %w[
    7589 13031 13286 13639 15426 21922 29076 30644 32212 32736
    33785 36496 42993 43317 48866 53075 57053 58509 59022 60072
    60675 61787 62848 64278 64921 64978
  ].map { |id| ['default', id, ''] }.freeze
  OLD_SPANS = {
    '13031' => '고대 금고',
    '13286' => '고대 금고',
    '13639' => '고대 금고',
    '15426' => '고대 저장고',
    '21922' => '고대 금고',
    '29076' => '고대 금고',
    '30644' => '고대 보물창고',
    '32212' => '고대 금고',
    '32736' => '고대의 보물고',
    '33785' => '고대 보물창고',
    '36496' => '고대 보물고',
    '42993' => '고대 보물고',
    '43317' => '고대 보물고',
    '48866' => '고대 금고',
    '53075' => '고대 금고',
    '57053' => '고대 금고',
    '58509' => '고대 보관소',
    '59022' => '고대 보관소',
    '60072' => '고대 금고',
    '60675' => '고대 금고',
    '61787' => '고대 금고',
    '62848' => '고대 금고',
    '64278' => '고대 금고',
    '64921' => '고대 금고',
    '64978' => '고대 금고'
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English identifies Ancient Vault as the specific Warsworn location in
    the Heart of Sibun theft/recovery storyline. Default:59022 locates the
    Vault in Southern Tala-Rane on a pass leading to the Wolds; default:13031,
    13286, 15426, 32212, 32736, and 60675 independently identify the same
    inspected, visited, or explored site. Aligned Japanese 古代の宝物庫 and
    Chinese 远古金库 corroborate the location term. Standardize only these
    26 exact English source matches to 고대 금고(Ancient Vault), preserving
    surrounding text and particles. The already paired default:7589 remains
    unchanged. Do not extend this entity to generic vaults, the plural
    Ancient Vaults, or the separately reviewed Warsworn Vault wording at
    default:3481 (D-725). The official Korean manual PDF p.7 names Warsworn
    as a faction but does not name this site. Prior row-level translation
    findings, including D-3812 at default:13031, remain independent and
    are not reopened or recounted. No PAK-derived material was consulted.
  TEXT
  SPEC = {
    key: ENTITY,
    english: ENGLISH,
    category: 'place',
    korean: CANONICAL,
    aliases: '',
    variants: '고대 금고|고대 보관소|고대 저장고|고대 보물고|고대 보물창고|고대의 보물고',
    count: KEYS.length,
    notes: NOTE
  }.freeze
  KEY_SET = KEYS.to_set.freeze

  def transform(spec, key, text, source)
    raise 'wrong Ancient Vault entity' unless spec.fetch(:key) == ENTITY
    raise "unreviewed Ancient Vault source key #{key.inspect}" unless KEY_SET.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English source label differs at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Ancient Vault(?![A-Za-z])/i)
    raise "Japanese source corroboration differs at #{key.inspect}" unless
      japanese.include?('古代の宝物庫')
    raise "Chinese source corroboration differs at #{key.inspect}" unless
      chinese.include?('远古金库')

    if key == ['default', '7589', '']
      raise 'existing bilingual Ancient Vault label changed' unless
        text.include?(CANONICAL)
      return [text, false]
    end

    old = OLD_SPANS.fetch(key.fetch(1))
    raise "Korean target span count differs at #{key.inspect}" unless
      text.scan(old).length == 1
    [text.sub(old, CANONICAL), false]
  end

  def definition
    headers = ReviewedNameBatches.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    headers.zip([
      SPEC[:key], SPEC[:english], SPEC[:category], SPEC[:korean], SPEC[:aliases],
      SPEC[:variants], "D-#{D}", 'confirmed', SPEC[:notes]
    ]).to_h
  end

  def dry_run
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual_keys = generated.map { |row| m.key(row) }.sort
    raise "source key coverage differs: #{actual_keys.inspect}" unless actual_keys == KEYS.sort
    edits = generated.count do |row|
      key = m.key(row)
      source = inventory.fetch(key)
      revised, = transform(SPEC, key, source.fetch('work_text'), source)
      revised != source.fetch('work_text')
    end
    raise "expected 25 bilingual annotation edits, found #{edits}" unless edits == 25
    puts "D-#{D} read-only dry run: #{generated.length} exact source keys, " \
         "#{edits} target Texto edits, 1 existing bilingual row retained."
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Ancient Vault Named Warsworn Site', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then AncientVaultD21691.dry_run
  when ['apply'] then AncientVaultD21691.apply
  else abort 'usage: review-ancient-vault-D21691.rb dry-run|apply'
  end
end
