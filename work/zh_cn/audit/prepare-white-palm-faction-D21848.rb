#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'

module PrepareWhitePalmFactionD21848
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_848
  ENTITY = 'faction:white-palm'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21848.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21848.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  KEYS = {
    'base' => %w[590 1762 3614 3788 4676],
    'default' => %w[1596 4203 7348 7831 31270 38239 45421 48615 50953 54620 56230 60126]
  }.freeze
  CHANGES = {
    ['default', '4203', ''] => ['화이트 팜 명사수', '화이트 팜 명사수(White Palm Marksman)'],
    ['default', '7348', ''] => ['백색 종려 암살단(White Palm Assassins)', '화이트 팜 암살단(White Palm Assassins)'],
    ['default', '7831', ''] => [
      '화이트 팜(White Palm)의 우두머리',
      '화이트 팜(White Palm)의 우두머리'
    ],
    ['default', '31270', ''] => ['그 화이트 팜 쓰레기들', '그 화이트 팜(White Palm) 쓰레기들'],
    ['default', '38239', ''] => ['화이트 팜 암살자', '화이트 팜 암살자(White Palm Assassin)'],
    ['default', '45421', ''] => ['화이트 팜이 날 찾으려', '화이트 팜(White Palm)이 날 찾으려'],
    ['default', '48615', ''] => ['백장 암살단', '화이트 팜 암살단(Assassins of the White Palm)']
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English uses White Palm as the named faction; default:7831 explicitly
    identifies its leader and members, and the aligned quest/dialogue rows
    identify its assassins, marksman, and stalker. Japanese ホワイトパーム団
    and Chinese 白掌 corroborate the group. Register faction:white-palm
    separately from its members and equipment: do not infer a family,
    character identity, or equipment-set relationship. Standardize the
    faction display as 화이트 팜(White Palm), retaining exact full source
    labels when a row names a specific member or object. The official Korean
    manual has no direct White Palm entry. Existing dispositions for Alyn,
    places, Well of Souls, Shadow Walk, and the prior narrative questions are
    preserved; this is a new faction/entity scope, not a re-review of them.
  TEXT

  def definition
    {
      'entity_key' => ENTITY,
      'english_canonical' => 'White Palm',
      'category' => 'faction',
      'korean_canonical' => '화이트 팜(White Palm)',
      'english_aliases' => '',
      'korean_variants' => '백색 종려|백장',
      'evidence_ids' => 'D-21848|default:7831|default:56230',
      'status' => 'confirmed',
      'notes' => NOTE
    }
  end

  def run(apply: false)
    [DEFINITIONS, REVIEWS, File.join(__dir__, 'proper-name-edits-D21848.tsv'),
     File.join(__dir__, 'named-scope-review-D21848-20261019.md'),
     File.join(__dir__, 'named-scope-edit-addendum-D21848-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end
    R.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary_table = M.table(R::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    definition = definition()
    raise 'White Palm faction already registered' if glossary.any? do |row|
      row['entity_key'] == ENTITY ||
        [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
          .any? { |term| term.casecmp?('White Palm') }
    end
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected_keys = KEYS.each.flat_map do |resource, ids|
      ids.map { |id| [resource, id, resource == 'base' ? '11' : ''] }
    end
    raise "source scope differs: #{generated.map { |row| M.key(row) }.inspect}" unless
      generated.map { |row| M.key(row) }.sort == expected_keys.sort
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    existing = index.map { |row| [row['entity_key'], M.key(row)] }.to_set
    raise 'White Palm match already indexed' if
      generated.any? { |row| existing.include?([ENTITY, M.key(row)]) }

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English faction evidence missing at #{key}" unless english.match?(/\bWhite Palm\b/i)
      raise "Japanese faction evidence missing at #{key}" unless japanese.include?('ホワイトパーム')
      raise "Chinese faction evidence missing at #{key}" unless chinese.match?(/白掌|白色棕榈/)
      old = source.fetch('work_text')
      target = CHANGES[key]
      new_text = old
      if target
        before, after = target
        if key == ['default', '7831', '']
          raise 'default:7831 leader phrase changed' unless old.include?(before)
          new_text = old.sub(before, after).sub(
            '화이트 팜의 멍청이들', '화이트 팜(White Palm)의 멍청이들'
          )
        else
          raise "Korean target span differs at #{key}" unless old.scan(before).length == 1
          new_text = old.sub(before, after)
        end
      end
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => NOTE, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    raise 'expected seven approved faction-name text normalizations' unless
      reviews.count { |row| row['old'] != row['new'] } == 7
    R.validate_sources!(reviews, inventory)
    R.validate!([definition], reviews, generated, glossary, index)
    if apply
      M.write_table(R::GLOSSARY, glossary_table.headers, glossary + [definition])
      generated.each { |row| row['status'] = 'needs-context'; row['evidence'] = "New faction match reviewed in D-#{D}." }
      M.write_table(M::INDEX, index_table.headers, index + generated)
      M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
      M.write_table(REVIEWS, M::HEADERS, reviews)
      M.run(REVIEWS, D, 1)
    else
      reviews.group_by { |row| row['resource'] }.each do |resource, rows|
        changed = rows.select { |row| row['old'] != row['new'] }
        ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), changed) unless changed.empty?
      end
    end
    puts "D-#{D} #{apply ? 'applied' : 'prepared'}: one faction, #{reviews.length} source keys, " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PrepareWhitePalmFactionD21848.run
  when ['apply'] then PrepareWhitePalmFactionD21848.run(apply: true)
  else abort 'usage: prepare-white-palm-faction-D21848.rb [prepare|apply]'
  end
end
