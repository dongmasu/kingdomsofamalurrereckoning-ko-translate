#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module MixedShortLabelsD21449
  extend self
  M = ReviewedNameBatches
  D = 21_449
  CONFIG = {
    '22343' => {
      'person:marus-torix' => ['Marus Torix', 'Torix', '마루스 토릭스(Marus Torix)', '토릭스', 2, 'not-an-issue'],
      'person:elodan-bloodgood' => ['Elodan Bloodgood', 'Bloodgood', '엘로단 블러드굿(Elodan Bloodgood)', '블러드굿', 2, 'not-an-issue'],
      'person:eleanor-brea' => ['Eleanor Brea', 'Brea', '엘리너 브레아(Eleanor Brea)', '브레아', 1, 'accepted']
    },
    '26414' => {
      'person:medgar-krast' => ['Medgar Krast', 'Medgar', '메드가르 크라스트(Medgar Krast)', '메드가르', 1, 'accepted']
    }
  }.freeze
  NOTE = 'Focused existing-key annotation follow-up, not a new occurrence or identity decision. English explicitly gives the full name and later short references to the same person in this row; aligned Japanese and Chinese corroborate the founder narrative or Red Legion brothers. The previous full-name disposition missed these later short-name annotations. Supersede only that concrete omission, preserve previous status/evidence in the manifest, and retain complete full-name pairs, unrelated text, other entity dispositions, tokens and paragraphs. No global short alias or historical global tally is added.'

  def transform(text, full_pair, korean, english, count)
    marker = '__D21449_FULL_PAIR__'
    raise 'reserved marker already present' if text.include?(marker)
    raise 'missing full-name pair' unless text.include?(full_pair)
    protected = text.gsub(full_pair, marker)
    pattern = /#{Regexp.escape(korean)}(?!\()/
    raise 'short-label count changed' unless protected.scan(pattern).length == count
    protected.gsub(pattern, "#{korean}(#{english})").gsub(marker, full_pair)
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    reviews = CONFIG.map do |id, entities|
      key = ['default', id, '']
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      proposed = old.dup
      entities.each do |entity, (full, short, pair, korean, count, previous_status)|
        prior = index.find { |row| row['entity_key'] == entity && M.key(row) == key }
        raise "prior disposition changed #{entity}/#{id}" unless prior && prior['status'] == previous_status
        raise 'source no longer has mixed full/short references' unless
          english.include?(full) && english.gsub(full, '').scan(/\b#{Regexp.escape(short)}\b/).length == count
        proposed = transform(proposed, pair, korean, short, count)
      end
      dispositions = entities.keys.to_h { |entity| [entity, 'accepted'] }
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => entities.keys.sort.join('|'), 'status' => 'accepted',
        'old' => old, 'new' => proposed, 'evidence' => NOTE,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    source = inventory.fetch(['default', '59973', ''])
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    old = source.fetch('work_text')
    prior = index.find { |row| row['entity_key'] == 'person:lina-ardeen' && M.key(row) == ['default', '59973', ''] }
    raise 'Lina short-reference evidence changed' unless
      prior && prior['status'] == 'accepted' &&
      english.include?('Lina Ardeen') && english.include?("With Lina's help") &&
      japanese.include?('リナの助け') && chinese.include?('在莉娜的帮助下') &&
      old.scan('리나(Lina Ardeen)').length == 1 && old.include?('리나 아딘(Lina Ardeen)')
    reviews << {
      'resource' => 'default', 'ID_Linha' => '59973', 'Tipo_Variante' => '',
      'entity_key' => 'person:lina-ardeen', 'status' => 'accepted',
      'old' => old, 'new' => old.sub('리나(Lina Ardeen)', '리나(Lina)'),
      'evidence' => "#{NOTE} For Lina, correct only the later short Korean label's mismatched full-English annotation: source With Lina's help, Japanese リナの助け and Chinese 在莉娜的帮助下 all use the short given name. Keep the preceding complete Lina Ardeen name unchanged.",
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate('person:lina-ardeen' => 'accepted')
    }
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} cells, five existing entity/row keys, seven short-name spans"
    reviews
  end

  def apply
    reviews = prepare
    proposal = File.join(__dir__, "proper-name-reviewed-mixed-short-D#{D}.tsv")
    raise 'proposal exists' if File.exist?(proposal)
    M.write_table(proposal, M::HEADERS.take(12), reviews)
    before = M.table(M::INDEX).map(&:to_h)
    M.run(proposal, D, 1, review_states: %w[accepted not-an-issue])
    after = M.table(M::INDEX).map(&:to_h)
    raise 'existing-key follow-up changed occurrence count' unless before.length == after.length
    targeted = reviews.flat_map { |row| row['entity_key'].split('|').map { |e| [e, *M.key(row)] } }
    old_records = before.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    after.each do |row|
      key = [row['entity_key'], *M.key(row)]
      next if targeted.include?(key)
      raise 'unrelated decision changed' unless
        row.reject { |field, _| field == 'korean_current' } ==
          old_records.fetch(key).reject { |field, _| field == 'korean_current' }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then MixedShortLabelsD21449.prepare
  when 'apply' then MixedShortLabelsD21449.apply
  else abort 'usage: review-mixed-short-labels-D21449.rb [prepare|apply]'
  end
end
