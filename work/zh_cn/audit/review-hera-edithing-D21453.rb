#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module HeraEdithingD21453
  extend self
  M = ReviewedNameBatches
  D = 21_453
  ENTITY = 'person:hera-edithing'
  NOTE = 'English default:29222 explicitly identifies the deceased Hera Edithing, daughter of Odwald Bynothas and wife of Eolfric Edithing, with the grave date 1490. Japanese ヘラ・エディシング and Chinese 赫拉·伊迪辛 corroborate the same full name, including both grave labels. Register this full-name identity separately from living Whitestone bounty-board keeper Hera Orhelm. Existing Korean full-name annotations are already complete and unchanged. No global Hera/Edithing alias, biography beyond the epitaph, or historical translation recount is inferred.'

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'Hera Edithing',
      'category' => 'person', 'korean_canonical' => '헤라 에디싱(Hera Edithing)',
      'english_aliases' => '', 'korean_variants' => '',
      'evidence_ids' => "D-#{D}|default:29222|base:2430:11|default:60355",
      'status' => 'confirmed', 'notes' => NOTE
    }
    definitions = [glossary.headers.to_h { |header| [header, fields.fetch(header)] }]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    expected = [['base', '2430', '11'], ['default', '29222', ''], ['default', '60355', '']]
    raise 'Hera Edithing full-name source scope differs' unless generated.map { |row| M.key(row) }.sort == expected.sort
    reviews = generated.map do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      raise 'Hera Edithing locale evidence differs' unless english.include?('Hera Edithing') &&
        japanese.include?('ヘラ・エディシング') && chinese.include?('赫拉·伊迪辛') &&
        old.include?(fields['korean_canonical'])
      if key[1] == '29222'
        raise 'Hera Edithing identity evidence differs' unless english.include?('remains of Hera Edithing') &&
          english.include?('daughter of Odwald Bynothas, wife of Eolfric Edithing') && english.include?('1490')
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'not-an-issue', 'old' => old, 'new' => old,
        'evidence' => NOTE, 'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'not-an-issue')
      }
    end
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: three confirmed full-name keys, no Texto edits"
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    reviews_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'prepared outputs exist' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
    M.write_table(definitions_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, definitions)
    M.write_table(reviews_path, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([definitions_path, reviews_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then HeraEdithingD21453.prepare
  when 'apply' then HeraEdithingD21453.apply
  else abort 'usage: review-hera-edithing-D21453.rb [prepare|apply]'
  end
end
