#!/usr/bin/env ruby

require 'csv'
require 'optparse'

def disposition_key(row)
  [row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
end

def reconcile_occurrences(occurrences, reviews)
  latest_text = {}
  dispositions = {}
  reviews.each do |review|
    resource_key = disposition_key(review)
    if latest_text.key?(resource_key) && latest_text[resource_key] != review.fetch('old')
      raise "review text chain mismatch #{resource_key.inspect}"
    end
    latest_text[resource_key] = review.fetch('new')
    review.fetch('entity_key').split('|').each do |entity_key|
      status = review.fetch('status')
      raise "invalid disposition #{status}" unless %w[accepted not-an-issue excluded uncertain].include?(status)
      dispositions[[entity_key, *resource_key]] = [
        status, review.fetch('evidence')
      ]
    end
  end
  matched = {}
  occurrences.each do |row|
    resource_key = disposition_key(row)
    if latest_text.key?(resource_key) && row.fetch('korean_current') != latest_text[resource_key]
      raise "stale review vs active text #{resource_key.inspect}"
    end
    key = [row['entity_key'], *resource_key]
    next unless dispositions.key?(key)
    status, evidence = dispositions.fetch(key)
    row['status'] = status
    row['evidence'] = evidence
    matched[key] = true
  end
  # An explicit false-positive review can be broader than the term matcher
  # (for example the Aidehs family versus the person-label Aideh).
  missing = (dispositions.keys - matched.keys).reject { |key| dispositions[key][0] == 'excluded' }
  raise "reviewed occurrence not indexed #{missing.first.inspect}" unless missing.empty?
  occurrences
end

def run_reconciliation(argv)
  options = { reviews: [] }
  OptionParser.new do |parser|
    parser.on('--occurrences PATH') { |path| options[:occurrences] = path }
    parser.on('--review PATH') { |path| options[:reviews] << path }
  end.parse!(argv)
  raise 'need --occurrences and --review' unless options[:occurrences] && !options[:reviews].empty? && argv.empty?
  root = File.expand_path('../../..', __dir__)
  path = File.expand_path(options[:occurrences])
  raise 'output must be the audit occurrence TSV' unless path == File.join(root, 'work/zh_cn/audit/proper-name-occurrences.tsv')
  rows = CSV.read(path, headers: true, col_sep: "\t")
  reviews = options[:reviews].flat_map { |review| CSV.read(review, headers: true, col_sep: "\t").map(&:to_h) }
  output = reconcile_occurrences(rows.map(&:to_h), reviews)
  CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << rows.headers
    output.each { |row| csv << rows.headers.map { |header| row[header] } }
  end
  puts output.group_by { |row| row['status'] }.transform_values(&:length).inspect
end

if $PROGRAM_NAME == __FILE__
  begin
    run_reconciliation(ARGV)
  rescue RuntimeError, KeyError, OptionParser::ParseError => error
    warn error.message
    exit 1
  end
end
