#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module HewenIverVarikDunbertD21464
  extend self

  M = ReviewedNameBatches
  D = 21_464
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  HEWEN = 'person:hewen-iver'
  VARIK = 'person:varik-dunbert'
  HEWEN_KO = '휴언 아이버(Hewen Iver)'
  VARIK_KO = '바릭 던버트(Varik Dunbert)'
  NOTE = 'English is the identity anchor; aligned Japanese and Chinese provide corroborating context. ' \
         'Hewen Iver and Varik Dunbert are separate people with independent exact full-name source matches. ' \
         'Keep the established Korean forms 휴언 아이버 and 바릭 던버트; correct the isolated 배릭 spelling. ' \
         'Do not infer a shared person, family relationship, or global Iver/Dunbert surname alias. ' \
         'Preserve all other names, wording, particles, tokens, line breaks, and previous entity decisions.'

  SPECS = {
    ['base', '1411', '11'] => [
      HEWEN, 'Grave of Hewen Iver',
      '휴언 아이버(Hewen Iver)', '휴언 아이버(Hewen Iver)'
    ],
    ['default', '47321', ''] => [
      HEWEN, 'Grave of Hewen Iver', '휴언 아이버', '휴언 아이버(Hewen Iver)'
    ],
    ['default', '4706', ''] => [
      VARIK, 'Varik Dunbert', VARIK_KO, VARIK_KO
    ],
    ['default', '43455', ''] => [
      VARIK, 'My name\'s Varik Dunbert', '배릭 던버트', VARIK_KO
    ],
    ['default', '64201', ''] => [
      VARIK, 'Varik Dunbert the merchant', '바릭 던버트', VARIK_KO
    ]
  }.freeze

  DEFINITIONS_DATA = {
    HEWEN => {
      'english_canonical' => 'Hewen Iver', 'category' => 'person',
      'korean_canonical' => HEWEN_KO, 'korean_variants' => '휴언 아이버|휴언 아이버(Hewen Iver)',
      'evidence_ids' => 'D-21464|base:1411:11|default:47321'
    },
    VARIK => {
      'english_canonical' => 'Varik Dunbert', 'category' => 'person',
      'korean_canonical' => VARIK_KO,
      'korean_variants' => '바릭 던버트|배릭 던버트|바릭 던버트(Varik Dunbert)',
      'evidence_ids' => 'D-21464|default:4706|default:43455|default:64201'
    }
  }.freeze

  def definitions_for(headers)
    DEFINITIONS_DATA.map do |entity, fields|
      values = fields.merge(
        'entity_key' => entity, 'english_aliases' => '',
        'status' => 'confirmed', 'notes' => NOTE
      )
      headers.to_h { |header| [header, values.fetch(header, '')] }
    end
  end

  def inventory
    M.refresh_inventory
  end

  def normalize(old, key)
    _entity, english, old_span, new_span = SPECS.fetch(key) do
      raise "unreviewed key #{key.inspect}"
    end
    old_count = old.scan(Regexp.new(Regexp.escape(old_span))).length
    new_count = old.scan(Regexp.new(Regexp.escape(new_span))).length
    return old if new_count == 1
    return old.sub(old_span, new_span) if old_count == 1 && new_count.zero?

    raise "unexpected Korean source for #{key.inspect}: #{old.inspect} (#{english})"
  end

  def source_texts(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      source.fetch('zh_text')
    ]
  end

  def reviews_for(aligned, generated)
    expected = SPECS.map { |key, (entity, _english, _new)| [entity, *key] }.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise "exact full-name source scope differs: #{actual.inspect}" unless actual == expected

    generated.map do |occurrence|
      key = M.key(occurrence)
      entity, anchor, old_span, new_span = SPECS.fetch(key)
      source = aligned.fetch(key)
      english, japanese, chinese = source_texts(source)
      raise "English identity anchor missing #{key.inspect}" unless english.include?(anchor)
      raise "full-name English count differs #{key.inspect}" unless
        english.scan(/(?<![A-Za-z])#{Regexp.escape(DEFINITIONS_DATA.fetch(entity).fetch('english_canonical'))}(?![A-Za-z])/).length == 1

      if entity == HEWEN
        raise "Hewen Japanese/Chinese evidence differs #{key.inspect}" unless
          japanese.include?('ヒューエン・アイヴァー') && chinese.include?('赫文·艾维尔')
      else
        raise "Varik Japanese/Chinese evidence differs #{key.inspect}" unless
          japanese.include?('ヴァリク・ダンバート') && chinese.include?('瓦里克')
      end

      old = source.fetch('work_text')
      expected_korean = old_span == new_span ? new_span : old.sub(old_span, new_span)
      raise "Korean source span differs #{key.inspect}" unless
        old.scan(Regexp.new(Regexp.escape(old_span))).length == 1
      proposed = normalize(old, key)
      if key == ['base', '1411', '11']
        raise 'Hewen base label differs' unless old == '휴언 아이버(Hewen Iver)의 무덤'
      elsif key == ['default', '47321', '']
        raise 'Hewen grave text differs' unless old == '휴언 아이버의 무덤'
      elsif key == ['default', '4706', '']
        raise 'Varik established label differs' unless old == VARIK_KO && proposed == old
      else
        raise "Varik Korean source differs #{key.inspect}" unless
          proposed == expected_korean && proposed.include?(VARIK_KO)
      end
      raise "normalization is not idempotent #{key.inspect}" unless normalize(proposed, key) == proposed
      raise "opaque tokens changed #{key.inspect}" unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) ==
          proposed.scan(ReviewedProperNameDiscovery::OPAQUE)
      raise "line breaks changed #{key.inspect}" unless
        old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
      status = old == proposed ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => "#{NOTE} Exact English: #{english}. The complete name is paired only in this entity's exact reviewed rows.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'D-21464 outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    aligned = inventory
    definitions = definitions_for(M.table(ReviewedProperNameDiscovery::GLOSSARY).headers)
    generated = build_occurrences(aligned.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = reviews_for(aligned, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary, M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, aligned)
    reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "Prepared D-#{D}: two separate people, five exact full-name keys; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} edits and " \
         "#{reviews.count { |row| row['status'] == 'not-an-issue' }} unchanged."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'entity_key', 'status', 'old', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then HewenIverVarikDunbertD21464.prepare
  when 'apply' then HewenIverVarikDunbertD21464.apply
  else abort 'usage: review-hewen-iver-varik-dunbert-D21464.rb [prepare|apply]'
  end
end
