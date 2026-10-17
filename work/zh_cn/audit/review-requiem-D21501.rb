#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module RequiemD21501
  extend self

  M = ReviewedNameBatches
  D = 21_501
  ENTITY = 'item:the-requiem'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  EXCLUDED = %w[9763 59459 62559].freeze
  IDS = %w[
    2689 5129 9763 9985 10232 12280 14883 19019 20208 22725 25269
    26616 27604 34841 35102 35832 38723 48791 51133 55715 57453
    59459 62559 63840 63909 64333
  ].freeze
  NOTE = 'English default:10232 and default:14883 explicitly identify The Requiem as Dead Kel’s ship/pirate ship; default:27604 identifies the same war galley, and default:63840 confirms the short form Requiem. Japanese レクイエム号 and Chinese 安魂曲号/安魂号 corroborate. Reuse the established Korean 레퀴엠호, with source-local (The Requiem) or (Requiem). Exclude lowercase poetic requiem at default:9763/59459 and the separate title Singer’s Requiem at default:62559. No ordinary requiem translation or historical translation tally is changed.'
  DETAIL = <<~TEXT.chomp
    ### D-21501: The Requiem

    Registered the named pirate ship `item:the-requiem` as
    `레퀴엠호(The Requiem)`, with the source-attested short form `Requiem`.
    Reviewed all 27 matching keys across `base` and `default`, including
    three excluded lexical collisions: poetic lowercase `requiem` at
    default:9763/59459 and the separate `Singer's Requiem` title at
    default:62559. The latter is not classified as an ordinary word or
    silently merged into the ship. English explicitly identifies the ship
    and its owner; Japanese レクイエム号 and Chinese 安魂曲号 corroborate.
    Standardized the ship-name span only, retaining source-local full/short
    English annotation, unrelated entities, and prior decisions. Adjusted
    only the name-adjacent particles required by final-vowel `호`.
    No PAK evidence or historical global translation recount was used.
  TEXT

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'The Requiem',
      'category' => 'item', 'korean_canonical' => '레퀴엠호(The Requiem)',
      'english_aliases' => 'Requiem', 'korean_variants' => '레퀴엠|레퀴엠 호',
      'evidence_ids' => "D-#{D}|base:2585:11|default:10232|default:14883|default:27604|default:63840",
      'status' => 'confirmed', 'notes' => NOTE
    }
    definition = glossary.headers.to_h { |h| [h, fields.fetch(h, '')] }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = [['base', '2585', '11']] + IDS.map { |id| ['default', id, ''] }
    raise 'Requiem exact source scope differs' unless
      generated.map { |row| M.key(row) }.sort == expected.sort

    reviews = generated.sort_by do |r|
      [M::RESOURCES.index(r['resource']), r['ID_Linha'].to_i, r['Tipo_Variante']]
    end.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      excluded = key[0] == 'default' && EXCLUDED.include?(key[1])
      new_text = old
      unless excluded
        label = english.include?('The Requiem') ? 'The Requiem' : 'Requiem'
        pattern = /레퀴엠(?:\s*\((?:The )?Requiem\))?(?:\s*호)?(?:\((?:The )?Requiem\))?/
        raise "ship Korean span differs #{key.inspect}" unless old.scan(pattern).length == 1
        new_text = old.sub(pattern, "레퀴엠호(#{label})")
        new_text = new_text.sub(/(레퀴엠호\((?:The )?Requiem\))(을|은|이)/) do
          "#{Regexp.last_match(1)}#{{ '을' => '를', '은' => '는', '이' => '가' }.fetch(Regexp.last_match(2))}"
        end
      end
      status = excluded ? 'excluded' : (old == new_text ? 'not-an-issue' : 'accepted')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{NOTE} Exact row decision: #{excluded ? 'non-ship lexical collision; retain text' : 'same named ship; canonical bilingual name span only'}.",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      [definition], reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} keys; #{reviews.count { |r| r['old'] != r['new'] }} edits."
    reviews.each { |r| puts JSON.generate(r.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
    [glossary.headers, definition, reviews]
  end

  def apply
    headers, definition, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    previous.each { |k, v| raise "unrelated occurrence changed #{k.inspect}" unless current[k] == v }
    raise 'unexpected occurrence additions' unless
      (current.keys - previous.keys).sort == reviews.map { |r| [ENTITY, *M.key(r)] }.sort
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.open(path, 'a') { |f| f.write("\n\n#{DETAIL}\n") }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then RequiemD21501.prepare
  when ['apply'] then RequiemD21501.apply
  else abort 'usage: review-requiem-D21501.rb [prepare|apply]'
  end
end
