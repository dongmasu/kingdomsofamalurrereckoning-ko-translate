#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module RootsOfAkaraD20999
  extend self
  M = ReviewedNameBatches
  ENTITY = 'title:the-roots-of-akara'
  LABEL = '아카라의 뿌리(The Roots of Akara)'
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'The Roots of Akara',
    'category' => 'title',
    'korean_canonical' => LABEL,
    'english_aliases' => '',
    'korean_variants' => '아카라의 뿌리',
    'evidence_ids' => 'D-20999|base:4543:11|default:54578',
    'status' => 'confirmed',
    'notes' => 'Complete source title shared by base and default; Japanese アカラの根 and Chinese 阿卡拉之根 corroborate the Korean wording. Preserve The in its full English label. Title category records the exact standalone named label without claiming an unproven item/quest/book subtype. Keep the title atomic rather than inserting a deity-name pair within it. The manual does not establish this expansion title.'
  }.freeze

  def run(mode)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = [['base', '4543', '11'], ['default', '54578', '']]
    raise 'title source scope changed' unless generated.map { |row| M.key(row) }.sort == expected.sort
    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact
      raise "not an exact standalone title #{key.inspect}" unless english == ['The Roots of Akara']
      old = source.fetch('work_text')
      raise "unexpected title Korean #{key.inspect}" unless
        [LABEL, '아카라의 뿌리 (The Roots of Akara)', '아카라의 뿌리(Roots of Akara)'].include?(old)
      status = old == LABEL ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => LABEL,
        'evidence' => 'English is exactly The Roots of Akara in both resources; Japanese アカラの根 and Chinese 阿卡拉之根 agree on the title identity. Unify the complete title as 아카라의 뿌리(The Roots of Akara), retaining the source The and standard pair spacing. Do not infer an item/quest/book subtype or split the title into a deity-name occurrence.',
        'english' => english.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions = File.join(__dir__, 'proper-name-discovery-definitions-D20999.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D20999.tsv')
    M.write_table(definitions, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, [DEFINITION])
    M.write_table(proposals, M::HEADERS, reviews)
    puts "Complete Roots of Akara title: #{reviews.length} source keys, #{reviews.count { |row| row['old'] != row['new'] }} edited cells"
    if mode == 'apply'
      ReviewedProperNameDiscovery.run([definitions, proposals, '20999'])
    elsif mode != 'prepare'
      abort 'usage: review-roots-of-akara-D20999.rb [prepare|apply]'
    end
  end
end

RootsOfAkaraD20999.run(ARGV.fetch(0, 'prepare')) if $PROGRAM_NAME == __FILE__
