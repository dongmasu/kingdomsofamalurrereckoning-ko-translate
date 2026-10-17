#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'optparse'
require_relative 'build-proper-name-candidates'

class InventoryError < StandardError; end

RESOURCES = %w[affix base default].freeze
RESOURCE_OPTIONS = %w[all affix base default].freeze
LOCALES = %w[en_us ja_jp zh_cn].freeze
OUTPUT_HEADERS = %w[
  resource ID_Linha Tipo_Variante en_texts_json ja_texts_json zh_text work_text
].freeze

def read_rows(path)
  rows = CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
  headers = rows.headers
  required = %w[ID_Linha Texto]
  missing = required - headers
  raise InventoryError, "#{path}: missing columns: #{missing.join(', ')}" unless missing.empty?

  rows.map(&:to_h)
rescue CSV::MalformedCSVError => e
  raise InventoryError, "#{path}: malformed CSV: #{e.message}"
end

def index_by_id(rows)
  rows.group_by { |row| row.fetch('ID_Linha') }
end

def index_by_id_and_variant(rows)
  raise InventoryError, 'variant index requires Tipo_Variante column' unless rows.empty? || rows.first.key?('Tipo_Variante')

  rows.group_by { |row| [row.fetch('ID_Linha'), row.fetch('Tipo_Variante')] }
end

def rows_for_key!(index, key, path)
  rows = index[key]
  raise InventoryError, "#{path}: missing required mapping for #{key.inspect}" if rows.nil? || rows.empty?

  rows
end

def build_inventory(resource, en_rows, ja_rows, zh_rows, work_rows)
  raise InventoryError, "unknown resource: #{resource}" unless RESOURCES.include?(resource)

  keyed = %w[affix base].include?(resource)
  en_by_id = index_by_id(en_rows)
  ambiguous = en_by_id.find { |_id, rows| rows.length != 1 }
  raise InventoryError, "en_us: ambiguous ID mapping for #{ambiguous.first.inspect}" if ambiguous
  ja_by_id = index_by_id(ja_rows)
  ja_by_id_and_variant = keyed ? index_by_id_and_variant(ja_rows) : {}
  zh_index = keyed ? index_by_id_and_variant(zh_rows) : index_by_id(zh_rows)
  key_for = lambda do |row|
    keyed ? [row.fetch('ID_Linha'), row.fetch('Tipo_Variante')] : row.fetch('ID_Linha')
  end

  work_counts = Hash.new(0)
  zh_counts = Hash.new(0)
  work_rows.each { |row| work_counts[key_for.call(row)] += 1 }
  zh_rows.each { |row| zh_counts[key_for.call(row)] += 1 }
  unless work_counts == zh_counts
    key = (work_counts.keys | zh_counts.keys).find { |candidate| work_counts[candidate] != zh_counts[candidate] }
    raise InventoryError,
          "zh_cn: key multiplicity mismatch for #{key.inspect} " \
          "(work=#{work_counts[key]}, source=#{zh_counts[key]})"
  end

  seen = Hash.new(0)
  work_rows.map do |work|
    key = key_for.call(work)
    english = rows_for_key!(en_by_id, work.fetch('ID_Linha'), 'en_us')
    chinese_rows = rows_for_key!(zh_index, key, 'zh_cn')
    occurrence = seen[key]
    seen[key] += 1
    chinese = chinese_rows[occurrence]
    raise InventoryError, "zh_cn: ambiguous mapping for #{key.inspect}" unless chinese

    japanese_for_id = ja_by_id.fetch(work.fetch('ID_Linha'), [])
    japanese_variant_rows =
      if keyed && work.key?('Tipo_Variante') && ja_rows.first&.key?('Tipo_Variante')
        ja_by_id_and_variant[key]
      end
    japanese = japanese_variant_rows.nil? || japanese_variant_rows.empty? ? japanese_for_id : japanese_variant_rows

    [
      resource,
      work.fetch('ID_Linha'),
      work['Tipo_Variante'].to_s,
      JSON.generate(english.map { |row| row['Texto'] }),
      JSON.generate(japanese.map { |row| row['Texto'] }),
      chinese.fetch('Texto'),
      work.fetch('Texto')
    ]
  end
end

def inventory_paths(root, locale, resource)
  if locale == 'work'
    filename = "locatexts_zh_cn.koalocatext_#{resource}.csv"
    File.join(root, 'work', 'zh_cn', filename)
  else
    filename = "locatexts_#{locale}.koalocatext_#{resource}.csv"
    File.join(root, 'src', 'csv', locale, filename)
  end
end

def run_cli(argv)
  options = { resource: 'all' }
  parser = OptionParser.new do |opts|
    opts.banner = 'Usage: build-proper-name-inventory.rb --resource all|affix|base|default --out PATH'
    opts.on('--resource RESOURCE', RESOURCE_OPTIONS) { |value| options[:resource] = value }
    opts.on('--out PATH') { |value| options[:out] = value }
  end
  parser.parse!(argv)
  raise InventoryError, 'missing --out PATH' unless options[:out]
  raise InventoryError, "unexpected arguments: #{argv.join(' ')}" unless argv.empty?

  root = File.expand_path('../../..', __dir__)
  resources = options[:resource] == 'all' ? RESOURCES : [options[:resource]]
  source_paths = resources.flat_map do |resource|
    (LOCALES + ['work']).map { |locale| inventory_paths(root, locale, resource) }
  end
  output_path = ProperNameCandidates.safe_output(options[:out], source_paths)
  unless output_path.start_with?(File.realpath('/private/tmp') + '/')
    raise InventoryError, 'full corpus inventory output must be under /private/tmp'
  end
  output_rows = []
  resources.each do |resource|
    en = read_rows(inventory_paths(root, 'en_us', resource))
    ja = read_rows(inventory_paths(root, 'ja_jp', resource))
    zh = read_rows(inventory_paths(root, 'zh_cn', resource))
    work = read_rows(inventory_paths(root, 'work', resource))
    output_rows.concat(build_inventory(resource, en, ja, zh, work))
  end

  File.open(output_path, 'w:UTF-8') do |file|
    csv = CSV.new(file, col_sep: "\t", row_sep: "\r\n", force_quotes: true)
    csv << OUTPUT_HEADERS
    output_rows.each { |row| csv << row }
  end
  warn "Wrote #{output_rows.length} aligned rows to #{options[:out]}"
end

if $PROGRAM_NAME == __FILE__
  begin
    run_cli(ARGV)
  rescue InventoryError, ProperNameCandidates::Error, OptionParser::ParseError, SystemCallError => e
    warn e.message
    exit 1
  end
end
