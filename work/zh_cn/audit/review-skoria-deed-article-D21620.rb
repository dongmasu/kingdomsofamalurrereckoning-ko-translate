#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewSkoriaDeedArticleD21620
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_620
  ENTITY = 'item:deed-to-skoria-mine'
  TERM = 'deed to the Skoria Mine'
  IDS = %w[38817 50221].freeze
  PATH = File.join(__dir__, "proper-name-source-alias-D#{D}.tsv")
  EVIDENCE = <<~TEXT.chomp
    English-led article-variant continuation of existing item:deed-to-skoria-mine.
    English 38817 says the deed was obtained as Eswin instructed; 50221
    says Eswin now has it. Both spell the same item phrase with the
    intervening article "the". Japanese スコーリア鉱山の権利書 and Chinese
    斯考瑞亚矿井的地契 corroborate this ownership document and quest state.
    Register only the full phrase deed to the Skoria Mine as an alias of
    the existing item, not a new deed, place, person or family. Normalize
    소유 증서/소유권 증서 to the existing complete item label and preserve
    the English article and capitalization in its pair. Preserve the
    D-21619 Cynric Quarry annotation and all earlier place/person decisions.
    Search affix/base/default: exactly two new item/entity keys, no affix
    or base additions. The descriptive 11678 family-mine paragraph does
    not contain this named phrase and is not forced into a label scope.
    The official Korean manual extraction/reference has no direct entry
    for this title. Preserve other wording, tokens and line endings.
    No PAK material is used. Full discovery/residual validation remains
    incomplete; published release ZIP unchanged.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'alias manifest already exists' if File.exist?(PATH)
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    owner = glossary.find { |row| row['entity_key'] == ENTITY }&.to_h
    raise 'missing existing deed owner' unless owner && owner['status'] == 'confirmed'
    raise 'alias collision' if glossary.any? do |row|
      [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
        .any? { |term| term.casecmp?(TERM) }
    end
    owner['english_aliases'] = (owner['english_aliases'].to_s.split('|') + [TERM]).reject(&:empty?).join('|')
    owner['evidence_ids'] = (owner['evidence_ids'].to_s.split('|') +
      ["D-#{D}"] + IDS.map { |id| "default:#{id}" }).uniq.join('|')
    owner['notes'] = [owner['notes'], EVIDENCE].join("\n")
    inventory = M.refresh_inventory
    known = index.map { |row| [row['entity_key'], *M.key(row)] }.to_set
    generated = build_occurrences(inventory.values, [owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    fresh = generated.reject { |row| known.include?([ENTITY, *M.key(row)]) }
    raise 'unexpected article-alias scope' unless
      fresh.map { |row| M.key(row) }.sort == IDS.map { |id| ['default', id, ''] }.sort
    reviews = fresh.map do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      pattern = /스코리아 광산\(Skoria Mine\)의 소유(?:권)? 증서/
      raise "unexpected Korean deed span #{key.inspect}" unless old.scan(pattern).length == 1
      revised = old.sub(pattern, "스코리아 광산 소유권 증서(#{TERM})")
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => revised, 'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews)
    puts "D-#{D}: existing deed owner, two article-variant keys, two Texto edits."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    [glossary, index, owner, fresh, reviews]
  end

  def apply
    glossary, index, owner, fresh, reviews = prepare
    M.write_table(R::GLOSSARY, glossary.headers,
                  glossary.map { |row| row['entity_key'] == ENTITY ? owner : row.to_h })
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + fresh)
    M.write_table(PATH, M::HEADERS.take(12), reviews)
    M.run(PATH, D, 1)
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewSkoriaDeedArticleD21620.prepare
  when ['apply'] then ReviewSkoriaDeedArticleD21620.apply
  else abort 'usage: review-skoria-deed-article-D21620.rb [prepare|apply]'
  end
end
