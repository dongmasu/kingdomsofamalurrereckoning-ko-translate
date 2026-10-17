#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'apply-reviewed-proper-name-discovery'

module VonnLocalScopeD21106
  M = ReviewedNameBatches
  D = 21_106
  ENTITY = 'person:calder-vonn'
  PATH = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CASES = {
    '19818' => ['accepted', 'Rasp concerns the growth of magical aptitude in the Scholia correspondence, matching the Telemachus Rasp findings at 18611 and 33273. Japanese ラスプ and Chinese 拉斯普 corroborate this source-local surname. Pair only this explicit surname span; no global Rasp alias.'],
    '14524' => ['not-an-issue', 'Vonn brings Niskaru against Cape Solace; Japanese ヴォン and Chinese 冯恩 corroborate the invader. The existing source-short 본(Vonn) is correct.'],
    '56743' => ['not-an-issue', 'The offshore ship and island-escape context identifies the invading Vonn; Japanese ヴォンの船 and Chinese 冯恩停泊在岸边的船 agree. Retain source-short 본(Vonn).'],
    '22447' => ['excluded', 'English explicitly names Cassera Vonn, not Calder; Japanese カッセラ・ヴォン and Chinese 卡塞拉·冯恩 agree. Preserve the already bilingual journal description.'],
    '41621' => ['excluded', 'The battle cry For Vonn Freeman has no evidence identifying Calder. Japanese refers to the Freeman group while Chinese retains the source phrase. Do not merge this into the island nobleman or rewrite it.'],
    '51766' => ['excluded', 'Vonn Mercenary is a generic subordinate label, not Calder himself; Japanese ヴォン家の傭兵 and Chinese 冯家佣兵 identify a family mercenary. Preserve the complete existing label.']
  }.freeze

  def self.entity_for(id)
    id == '19818' ? 'person:telemachus-rasp' : ENTITY
  end

  def self.reviews(inventory)
    CASES.map do |id, (status, evidence)|
      source = inventory.fetch(['default', id, ''])
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      term = id == '19818' ? 'Rasp' : 'Vonn'
      raise "missing #{term} in #{id}" unless english.match?(/\b#{term}\b/)
      text = source.fetch('work_text')
      raise "lost source-short pairing #{id}" if status == 'not-an-issue' && !text.include?('본(Vonn)')
      replacement = text
      if id == '19818'
        raise 'unexpected Rasp target span' unless text.scan('라스프의').length == 1
        replacement = text.sub('라스프의', '라스프(Rasp)의')
      end
      entity = entity_for(id)
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => entity, 'status' => status, 'old' => text, 'new' => replacement,
        'evidence' => evidence + ' Exact row-local scope only; no unrestricted Vonn or Rasp alias. Prior other-entity judgments are preserved. English anchors identity, with aligned Japanese and Chinese supporting context.',
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end.sort_by { |r| r['ID_Linha'].to_i }
  end

  def self.prepare
    inventory = M.refresh_inventory
    rows = reviews(inventory)
    M.write_table(PATH, rows.first.keys, rows)
    puts "Prepared #{rows.length} row-local Vonn/Rasp decisions; one approved Rasp pairing."
    rows
  end

  def self.apply
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    rows = prepare
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    [[ENTITY, 'Vonn'], ['person:telemachus-rasp', 'Rasp']].each do |entity, term|
      definition = glossary.find { |r| r['entity_key'] == entity }
      raise "#{entity} must be registered first" unless definition
      raise "unrestricted #{term} alias" if definition['english_aliases'].to_s.split('|').include?(term)
    end
    index = M.table(M::INDEX)
    known = index.map { |r| [r['entity_key'], *M.key(r)] }
    extra = rows.map do |r|
      entity = r.fetch('entity_key')
      term = r['ID_Linha'] == '19818' ? 'Rasp' : 'Vonn'
      key = [entity, *M.key(r)]
      raise "already indexed #{key.inspect}" if known.include?(key)
      {
        'entity_key' => entity, 'resource' => r['resource'],
        'ID_Linha' => r['ID_Linha'], 'Tipo_Variante' => r['Tipo_Variante'],
        'matched_english' => term, 'english_source' => r['english'],
        'korean_current' => r['old'], 'status' => 'needs-context',
        'evidence' => "Exact row-local #{term} candidate; no global surname alias."
      }
    end
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + extra)
    M.run(PATH, D, nil)
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: prepare-vonn-local-scope-D21106.rb [--apply]' unless ARGV.empty? || ARGV == ['--apply']
  ARGV.empty? ? VonnLocalScopeD21106.prepare : VonnLocalScopeD21106.apply
end
