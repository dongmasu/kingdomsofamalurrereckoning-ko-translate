#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'place:acathan-wetlands',
    english: 'Acathan wetlands',
    aliases: 'Acathan swamps',
    category: 'place',
    korean: '아카사 습지대(Acathan wetlands)',
    variants: '아카산 습지대|아카탄 늪지|아카사 늪지',
    count: 2,
    notes: 'English default:21210 names the Acathan wetlands as the search location; default:52524 places the army in the Acathan swamps. Japanese アカサ湿地帯 and アカサンの沼地 support the same Acatha-region wetland, with Chinese 阿卡撒沼泽 corroborating the first row. Reuse the confirmed regional reading 아카사(Acatha) from D-21256 while keeping the complete local compound bilingual and atomic. Standardize only these two source-local forms; do not infer a global Acathan=Acatha alias. The official Korean manual provides regional context but does not name these wetlands.'
  },
  {
    key: 'event:acathan-dance',
    english: 'Acathan Dance',
    category: 'named event',
    korean: '아카탄의 춤(Acathan Dance)',
    count: 1,
    notes: 'English default:52524 explicitly calls the military setback the Acathan Dance. Japanese アカサンの舞い and Chinese 阿卡撒之舞 corroborate the titled event. The Korean cell already has the complete bilingual title; retain it. This is a named historical maneuver/event, distinct from the Acathan wetlands/swamps mentioned in the same passage. The official Korean manual supplies historical setting context but does not name this event.'
  }
]

context = 'English-led review of the Acathan regional wetland name and the distinct historical Acathan Dance title across their exact default rows. The official Korean manual was checked for relevant regional/history context but does not supply these names. The standalone Acathan label at default:8301 is separately retained as contextually uncertain; it is not globally equated with Acatha or registered as an alias.'

ReviewedDiscoverySpecs.run(
  21_263,
  'Acathan Wetlands And Acathan Dance',
  specs,
  context,
  '## D-21262: Coordinated Artifact Ellipses'
) do |spec, key, text, source|
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  case spec[:key]
  when 'place:acathan-wetlands'
    if english.match?(/(?<![A-Za-z])Acathan wetlands(?![A-Za-z])/i)
      old = '아카산 습지대'
      raise "expected one Acathan wetlands span at #{key.inspect}" unless text.scan(old).length == 1
      text.sub!(old, '아카사 습지대(Acathan wetlands)')
    else
      old = '아카탄 늪지'
      raise "expected one Acathan swamps span at #{key.inspect}" unless text.scan(old).length == 1
      text.sub!(old, '아카사 늪지(Acathan swamps)')
    end
  when 'event:acathan-dance'
    expected = '아카탄의 춤(Acathan Dance)'
    raise "complete Acathan Dance label missing at #{key.inspect}" unless text.include?(expected)
  end
  [text, false]
end

module AcathanCandidateTriageD21263
  M = ReviewedNameBatches
  HEADERS = %w[candidate resource ID_Linha status english japanese chinese korean evidence].freeze
  module_function

  def write
    inventory = M.refresh_inventory
    source = inventory.fetch(['default', '8301', ''])
    texts = JSON.parse(source.fetch('en_texts_json')).compact
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact
    raise 'standalone Acathan source changed' unless texts == ['Acathan'] && japanese == ['Acathan'] &&
      source.fetch('zh_text') == 'Acathan' && source.fetch('work_text') == 'Acathan'
    path = File.join(M::AUDIT, 'proper-name-discovery-scout-D21263.tsv')
    rows = [{
      'candidate' => 'Acathan',
      'resource' => 'default',
      'ID_Linha' => '8301',
      'status' => 'uncertain',
      'english' => 'Acathan',
      'japanese' => 'Acathan',
      'chinese' => 'Acathan',
      'korean' => 'Acathan',
      'evidence' => 'All aligned locales contain only the isolated label Acathan. D-21256 established Acatha as a land but did not establish whether this derivative label denotes that region, its people, another proper name, or something else. No class or referent is recoverable from this row; preserve it unchanged and do not register a global alias or occurrence.'
    }]
    M.write_table(path, HEADERS, rows)

    note = <<~TEXT

      ## Unresolved Candidate: Acathan (default:8301)

      The English, Japanese, Chinese, and Korean cells contain only `Acathan`.
      With no noun or contextual referent, the label cannot safely be assigned
      to the Acatha region, its people, or another entity. It remains unchanged
      and unregistered; evidence is recorded in
      `proper-name-discovery-scout-D21263.tsv`.
    TEXT
    %W[named-scope-review-D21263-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D21263-#{M::RUN_DATE_COMPACT}.md].each do |name|
      target = File.join(M::AUDIT, name)
      File.write(target, File.read(target) + note)
    end
    %w[README.md decision-register-20261009.md].each do |name|
      target = File.join(M::AUDIT, name)
      File.write(target, File.read(target) + note)
    end
  end
end

AcathanCandidateTriageD21263.write
