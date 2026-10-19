#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewOrisonD21649
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_649
  ENTITY = 'event:orison'
  IDS = %w[
    3930 5527 8374 9151 10002 10578 16247 17455 18881 19372 24958
    33668 35472 35761 38699 38941 39681 41872 41926 42009 42739
    44084 44707 47111 47677 52952 53514 54834 55977 57372 59709
    63129 64878
  ].freeze
  SOURCE = /\bOrison\b/i
  SPECIAL_REPLACEMENTS = {
    '9151' => ['기도문(Orison)', '오리슨(Orison)'],
    '17455' => ['기도회', '오리슨(The Orison)'],
    '24958' => ['기도를', '오리슨(Orison)을'],
    '33668' => ['기도를', '오리슨(Orison)을'],
    '35472' => ['오라이즌', '오리슨(The Orison)'],
    '38699' => ['기도', '오리슨(The Orison)'],
    '52952' => ['의식(Orison)', '오리슨(Orison)'],
    '53514' => ['의식(Orison)', '오리슨(Orison)'],
    '57372' => ['기도 의식(Orison)', '오리슨(Orison)'],
    '59709' => ['기도 의식', '오리슨(Orison)'],
    '64878' => ['기도회', '오리슨(Orison)']
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:5527 explicitly identifies the Orison as Lyria's gift;
    default:41926 calls it the sacred ritual known as the Orison, and the
    surrounding source rows describe its three devotional tasks. Japanese
    オライゾン consistently corroborates the named rite; Chinese 祈祷 is a
    semantic rendering only. Use 오리슨(Orison) for prose references and
    preserve The only on exact standalone source labels. Correct the literal
    prayer/ceremony translations and Korean spelling variants only where the
    English row names this rite. This does not register ordinary prayer as
    the Orison, nor does it infer a separate item or deity. The official
    Korean manual reference has no direct Orison entry. No prior entity
    decisions are reopened or recounted.
  TEXT

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Orison',
      'category' => 'named event',
      'korean_canonical' => '오리슨(Orison)',
      'english_aliases' => 'The Orison',
      'korean_variants' =>
        '오리슨|오리슨(Orison)|오리슨(The Orison)|오라이존|오라이즌|' \
        '오라이슨|오라이슨(Orison)|기도회|기도문(Orison)|기도 의식(Orison)|의식(Orison)',
      'evidence_ids' => "D-#{D}",
      'status' => 'confirmed',
      'notes' => NOTE
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def normalize(row, old)
    id = row.fetch('ID_Linha')
    english = JSON.parse(row.fetch('en_texts_json')).compact.join("\n").strip
    if (replacement = SPECIAL_REPLACEMENTS[id])
      source, target = replacement
      raise "expected Korean source span missing at #{key(row).inspect}" unless old.include?(source)
      raise "ambiguous Korean source span at #{key(row).inspect}" unless old.scan(source).length == 1
      revised = old.sub(source, target)
    else
      revised = old.gsub(/오라이존|오라이즌|오라이슨(?!\()/, '오리슨')
      revised.gsub!(/오리슨(?!\((?:Orison|The Orison)\))/, '오리슨(Orison)')
      if %w[17455 35472 38699].include?(id)
        revised.gsub!('오리슨(Orison)', '오리슨(The Orison)')
      end
    end

    if english == 'The Orison'
      raise "standalone title lost article pairing at #{key(row).inspect}" unless
        revised == '오리슨(The Orison)'
    else
      raise "Orison reference remains unpaired at #{key(row).inspect}" if
        revised.match?(/오리슨(?!\((?:Orison|The Orison)\))/)
    end
    revised
  end

  def prepare
    inventory = M.refresh_inventory
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    definition = definition(glossary.headers)
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = IDS.map { |id| ['default', id, ''] }.sort
    actual = generated.map { |row| key(row) }.sort
    raise "Orison source scope differs: #{actual.inspect}" unless actual == expected
    raise 'Orison source scope includes an unexpected non-default resource' unless
      generated.all? { |row| row['resource'] == 'default' }

    reviews = generated.map do |match|
      source = inventory.fetch(key(match))
      old = source.fetch('work_text')
      revised = normalize(source, old)
      disposition = revised == old ? 'not-an-issue' : 'accepted'
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      {
        'resource' => match.fetch('resource'),
        'ID_Linha' => match.fetch('ID_Linha'),
        'Tipo_Variante' => match.fetch('Tipo_Variante'),
        'entity_key' => ENTITY,
        'status' => disposition,
        'old' => old,
        'new' => revised,
        'evidence' => NOTE,
        'english' => english,
        'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => disposition)
      }
    end.sort_by { |row| row['ID_Linha'].to_i }

    R.validate!([definition], reviews, generated,
                glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      changed = rows.select { |row| row['old'] != row['new'] }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), changed) unless changed.empty?
    end
    puts "D-#{D}: Orison; #{reviews.length} source keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits; " \
         "#{generated.length} entity/key occurrences."
    reviews.each do |row|
      next if row['old'] == row['new']
      puts JSON.generate(row.slice('ID_Linha', 'old', 'new'))
    end
    [definition, reviews]
  end

  def apply
    definitions, reviews = prepare
    definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise "D-#{D} manifests already exist" if
      File.exist?(definitions_path) || File.exist?(review_path)
    M.write_table(definitions_path, M.table(R::GLOSSARY).headers, [definitions])
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    R.run([definitions_path, review_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewOrisonD21649.prepare
  when ['apply'] then ReviewOrisonD21649.apply
  else abort 'usage: review-orison-D21649.rb [prepare|apply]'
  end
end
