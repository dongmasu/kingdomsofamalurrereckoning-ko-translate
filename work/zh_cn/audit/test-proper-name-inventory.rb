#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'tmpdir'
require_relative 'build-proper-name-inventory'

def assert(condition, message)
  raise message unless condition
end

def row(id, text, variant = nil)
  result = { 'ID_Linha' => id, 'Texto' => text }
  result['Tipo_Variante'] = variant unless variant.nil?
  result
end

def test_bom_quoted_fields_and_newlines
  Dir.mktmpdir do |dir|
    path = File.join(dir, 'fixture.csv')
    File.binwrite(path, "\xEF\xBB\xBFID_Linha;Texto\r\n1;\"A; \"\"quoted\"\"\nline\"\r\n")
    rows = read_rows(path)
    assert(rows.length == 1, 'BOM fixture should parse one record')
    assert(rows[0]['Texto'] == "A; \"quoted\"\nline", 'quoted text should round-trip')
  end
end

def test_work_path_uses_zh_cn_filename
  root = '/repo'
  expected = '/repo/work/zh_cn/locatexts_zh_cn.koalocatext_affix.csv'
  assert(inventory_paths(root, 'work', 'affix') == expected, 'active work path should retain zh_cn locale filename')
end

def test_affix_one_to_many_alignment_and_variant_rows
  en = [row('7', 'of "the" Ash')]
  ja = [row('7', 'アッシュ', '11')]
  zh = [row('7', '灰烬', '11'), row('7', '灰烬', '12')]
  work = [row('7', '잿더미', '11'), row('7', '잿더미', '12')]
  inventory = build_inventory('affix', en, ja, zh, work)

  assert(inventory.length == 2, 'both target variants must remain')
  assert(inventory.map { |item| item[2] } == %w[11 12], 'variant order must remain')
  assert(inventory.all? { |item| JSON.parse(item[3]) == ['of "the" Ash'] }, 'English row should map to every target variant')
  assert(inventory.map { |item| item[5] } == %w[灰烬 灰烬], 'Chinese rows should align by ID and variant')
  assert(inventory[1][4] == JSON.generate(['アッシュ']), 'Japanese exact variant should be preferred')
end

def test_base_duplicate_ids_with_distinct_variants
  en = [row('9', 'Named item')]
  ja = [row('9', '名前付きアイテム', '11'), row('9', '名前付きアイテム', '12')]
  zh = [row('9', '命名物品一', '11'), row('9', '命名物品二', '12')]
  work = [row('9', '고유 물품 1', '11'), row('9', '고유 물품 2', '12')]
  inventory = build_inventory('base', en, ja, zh, work)

  assert(inventory.map { |item| item[5] } == %w[命名物品一 命名物品二], 'base variants should not collapse')
end

def test_default_multiline_text_and_missing_mapping
  en = [row('12', "A title; with \"quotes\"\nand a second line")]
  ja = [row('12', '題名')]
  zh = [row('12', '标题')]
  work = [row('12', '제목')]
  inventory = build_inventory('default', en, ja, zh, work)

  assert(inventory[0][2].empty?, 'default has no variant value')
  assert(JSON.parse(inventory[0][3]) == [en[0]['Texto']], 'multiline source text should remain exact')

  begin
    build_inventory('default', en, ja, [], work)
    raise 'missing Chinese mapping should fail'
  rescue InventoryError => e
    assert(
      e.message.include?('zh_cn') && e.message.include?('12'),
      'missing mapping diagnostic should name the locale and key'
    )
  end
end

def test_duplicate_variant_multiplicity_is_preserved
  en = [row('15', 'Repeated label')]
  ja = [row('15', '反復ラベル', '11')]
  zh = [row('15', '重复标签', '11'), row('15', '重复标签', '11')]
  work = [row('15', '반복 표기', '11'), row('15', '반복 표기', '11')]
  inventory = build_inventory('affix', en, ja, zh, work)

  assert(inventory.length == 2, 'duplicate keyed rows must be preserved')
end

def test_ambiguous_english_mapping_rejected
  en = [row('12', 'A name'), row('12', 'Another name')]
  supporting = [row('12', 'Supporting')]
  begin
    build_inventory('default', en, supporting, supporting, supporting)
    raise 'ambiguous English mapping should fail'
  rescue InventoryError => error
    assert(error.message.include?('en_us') && error.message.include?('12'),
           'ambiguous mapping diagnostic should name locale/key')
  end
end

[
  method(:test_bom_quoted_fields_and_newlines),
  method(:test_work_path_uses_zh_cn_filename),
  method(:test_affix_one_to_many_alignment_and_variant_rows),
  method(:test_base_duplicate_ids_with_distinct_variants),
  method(:test_default_multiline_text_and_missing_mapping),
  method(:test_duplicate_variant_multiplicity_is_preserved),
  method(:test_ambiguous_english_mapping_rejected)
].each(&:call)

puts 'PASS: proper-name inventory fixtures'
