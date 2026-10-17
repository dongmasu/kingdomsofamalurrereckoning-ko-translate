#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

inventory = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY)
  .to_h { |r| [ReviewedNameBatches.key(r), r.to_h] }
forms = {
  'person:brun' => ['브룬(Brun)', /브룬|브런/],
  'person:bruten' => ['브루튼(Bruten)', /브루튼|브루텐|브루턴/]
}
missing = ReviewedNameBatches.table(File.join(__dir__, 'proper-name-residual-missing-bilingual-final.tsv'))
rows = missing.map do |row|
  next unless forms.key?(row['entity_key'])
  key = ReviewedNameBatches.key(row)
  source = inventory.fetch(key)
  canonical, pattern = forms.fetch(row['entity_key'])
  old = source['work_text']
  updated = old.gsub(pattern, canonical)
  raise "no reviewed correction #{key}" if old == updated
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => row['entity_key'], 'status' => 'accepted',
    'old' => old, 'new' => updated,
    'evidence' => 'Independent cross-resource residual audit found an actual bilingual omission despite the earlier disposition. EN names Brun the bard (JA ブラン, ZH 布朗) or Bruten the alleged Praetorian bodyguard (JA ブルテン, ZH 布鲁顿). Canonical glossary spelling applied to every mention in this cell; source title and surrounding particles retained. Corrective scope only: existing entity/row key reused, no historical/global recount.'
  }
end.compact
ReviewedNameBatches.write_table(File.join(__dir__, 'proper-name-reviewed-brun-bruten-residual-final.tsv'),
                               ReviewedNameBatches::HEADERS, rows)
puts "Reviewed residual corrections: #{rows.length}"
