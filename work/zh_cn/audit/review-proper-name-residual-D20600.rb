#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
index = m.table(m::INDEX)
repairs = {
  '15442' => [['세칸드라', '세칸드라(Secandra)']],
  '17517' => [['세칸드라', '세칸드라(Secandra)'], ['카헝크', '카룽크(Kahrunk)']],
  '20251' => [['그리안 셰인', '그리안 셰인(Grian Shane)'], ['타리온', '타리온(Tarion)']],
  '32891' => [['그리안 셰인', '그리안 셰인(Grian Shane)'],
              ['스베리 쿠라', '스베리 쿠라(Sverri Kura)']],
  '42252' => [['그리안 셰인', '그리안 셰인(Grian Shane)']],
  '58290' => [['그리안 셰인', '그리안 셰인(Grian Shane)']],
  '59022' => [['그리안 셰인', '그리안 셰인(Grian Shane)']]
}.freeze
targets = {
  '15442' => %w[person:secandra],
  '17517' => %w[person:kahrunk person:secandra],
  '20251' => %w[person:grian person:tarion],
  '32891' => %w[person:grian person:kura person:sverri],
  '42252' => %w[person:grian],
  '58290' => %w[person:grian],
  '59022' => %w[person:grian]
}.freeze

reviews = repairs.map do |id, pairs|
  key = ['default', id, '']
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  text = old.dup
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  pairs.each do |before, after|
    label = after[/\(([^()]+)\)/, 1]
    raise "unmatched English identity #{id}: #{label}" unless english.include?(label)
    raise "missing Korean span #{id}: #{before}" unless text.include?(before)
    text = text.gsub(/#{Regexp.escape(before)}(?!\()/, after)
  end
  entities = targets.fetch(id)
  entities.each do |entity|
    raise "missing indexed entity #{id}: #{entity}" unless index.any? do |row|
      m.key(row) == key && row['entity_key'] == entity &&
        %w[accepted not-an-issue].include?(row['status'])
    end
  end
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => entities.join('|'), 'status' => 'accepted',
    'old' => old, 'new' => text,
    'evidence' => 'Final active-CSV residual correction, not a new global disposition. English explicitly names the individual; the aligned Japanese and Chinese rows were read together. Secandra is corroborated by セカンドラ / 斯坎德拉, Kahrunk by カールンク / 卡朗克, Grian Shane by グリアン・シェイン / 格里安·谢恩, Tarion by タリオン / 塔瑞昂, and Sverri Kura by スヴェリ・クーラ / 斯维里·库那 where applicable. Restore the missing complete bilingual labels and the confirmed Kahrunk spelling without changing surrounding prose, titles, line breaks, or other existing names. The official manual provides faction/setting context but does not enumerate these individuals.',
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, 'accepted'] })
  }
end
out = File.join(__dir__, 'proper-name-reviewed-residual-D20600.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20600, nil, review_states: %w[accepted not-an-issue])
