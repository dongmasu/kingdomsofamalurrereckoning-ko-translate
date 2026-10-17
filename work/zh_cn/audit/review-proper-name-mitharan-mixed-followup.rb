#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module MitharanMixedFollowup
  M = ReviewedNameBatches
  OUT = '/private/tmp/mitharan-mixed-reviewed.tsv'
  ENTITY = 'people:mitharan'

  CASES = [
    {
      'id' => '13306',
      'old_span' => '나는 미사루(Mitharu)에서 나고 자랐지만 황야 출신이지',
      'new_span' => '나는 토박이 미타란(Mitharan)이지만 황야에서 태어났지',
      'evidence' => 'EN explicitly identifies a native Mitharan and separately invokes Mitharu as a deity. Aligned JA distinguishes ミサール人 for the native people from ミサール in the prayers; ZH similarly distinguishes 米萨鲁人 from 米萨鲁. Replaced only the native-identity clause with 토박이 미타란(Mitharan); all other existing 미사루(Mitharu) deity invocations remain unchanged.'
    },
    {
      'id' => '18300',
      'old_span' => '미사루(Mitharu) 성소들',
      'new_span' => '미타란(Mitharan) 성소들',
      'evidence' => 'EN distinguishes the creed of Mitharu from the Mitharan shrines. JA ミサール and ZH 米萨鲁 use the same stem for both senses, so EN supplies the decisive distinction. The official Korean manual identifies Mitharu as 질서의 신 미사루 (PDF p. 2); preserve the first 미사루(Mitharu) deity label and change only the shrine adjective to 미타란(Mitharan).'
    }
  ].freeze

  module_function

  def table(path)
    CSV.read(path, headers: true, col_sep: "\t")
  end

  def source_row(inventory, id)
    rows = inventory.select do |row|
      row['resource'] == 'default' && row['ID_Linha'] == id &&
        row['Tipo_Variante'].to_s.empty?
    end
    raise "expected one default row for #{id}, got #{rows.length}" unless rows.length == 1

    rows.first
  end

  def assert_source!(id, english, japanese, chinese)
    case id
    when '13306'
      raise 'native Mitharan source distinction missing' unless
        english.include?('I am a native Mitharan, but wilderness-born')
      raise 'JA people/deity evidence missing' unless
        japanese.include?('ミサール人') && japanese.include?('ミサールよ')
      raise 'ZH people/deity evidence missing' unless
        chinese.include?('米萨鲁人') && chinese.include?('米萨鲁，宽恕我')
    when '18300'
      raise 'Mitharu creed / Mitharan shrine contrast missing' unless
        english.include?('creed of Mitharu') && english.include?('Mitharan shrines')
      raise 'aligned JA shrine context missing' unless
        japanese.include?('ミサールの教義') && japanese.include?('聖堂')
      raise 'aligned ZH shrine context missing' unless
        chinese.include?('米萨鲁教令') && chinese.include?('米萨鲁神龛')
    end
  end

  def review(case_spec, inventory, index)
    id = case_spec.fetch('id')
    source = source_row(inventory, id)
    english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    chinese = source.fetch('zh_text').to_s
    assert_source!(id, english, japanese, chinese)

    matches = index.select do |row|
      row['entity_key'] == ENTITY && row['resource'] == 'default' &&
        row['ID_Linha'] == id && row['Tipo_Variante'].to_s.empty?
    end
    raise "expected one indexed hold for #{id}" unless matches.length == 1
    previous = matches.first
    raise "row #{id} is no longer an uncertain hold" unless previous['status'] == 'uncertain'
    raise "inventory/current text mismatch for #{id}" unless
      previous['korean_current'] == source.fetch('work_text')

    old = source.fetch('work_text')
    old_span = case_spec.fetch('old_span')
    raise "expected one exact Korean span for #{id}" unless old.scan(Regexp.new(Regexp.escape(old_span))).length == 1
    new = old.sub(old_span, case_spec.fetch('new_span'))

    deity_pair = '미사루(Mitharu)'
    old_deity_count = old.scan(deity_pair).length
    new_deity_count = new.scan(deity_pair).length
    expected_deity_count = old_deity_count - 1
    raise "deity label preservation check failed for #{id}" unless
      old_deity_count.positive? && new_deity_count == expected_deity_count

    {
      'resource' => 'default',
      'ID_Linha' => id,
      'Tipo_Variante' => '',
      'entity_key' => ENTITY,
      'status' => 'accepted',
      'old' => old,
      'new' => new,
      'evidence' => case_spec.fetch('evidence'),
      'english' => english,
      'japanese' => japanese,
      'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
      'previous_status' => previous.fetch('status'),
      'previous_evidence' => previous.fetch('evidence')
    }
  end

  def run
    raise "refusing to overwrite #{OUT}" if File.exist?(OUT)

    inventory = table(M::INVENTORY)
    index = table(M::INDEX)
    reviews = CASES.map { |case_spec| review(case_spec, inventory, index) }
    raise 'unexpected row coverage' unless reviews.map { |row| row['ID_Linha'] }.sort == %w[13306 18300]

    M.write_table(OUT, M::HEADERS, reviews)
    puts "Wrote #{reviews.length} proposal-only rows to #{OUT}; active index and CSVs untouched."
  end
end

MitharanMixedFollowup.run if $PROGRAM_NAME == __FILE__
