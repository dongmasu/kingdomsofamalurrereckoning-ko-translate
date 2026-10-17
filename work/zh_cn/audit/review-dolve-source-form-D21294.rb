#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module DolveSourceFormD21294
  M = ReviewedNameBatches
  FORM = 'source-form:dolve'
  TARGET = ['default', '4738', ''].freeze
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  PROPOSAL = File.join(M::AUDIT, 'proper-name-scoped-review-D21294.tsv')
  DEFINITION = {
    'entity_key' => FORM,
    'english_canonical' => '',
    'category' => 'place',
    'korean_canonical' => '돌브(Dolve)',
    'english_aliases' => '',
    'korean_variants' => '돌브',
    'evidence_ids' => 'D-21294|default:4738',
    'status' => 'unresolved',
    'notes' => 'Provisional source-form Dolve, scoped only to default:4738. The English corpus identifies Dolve Arne and Dolve Wayle as distinct Alfar strongholds (base:2220, base:3508, and default:34706); Japanese renders their shared Dolve component as ドルブ/ドルベ, and the active Korean glossary already uses 돌브. At default:4738, English, Japanese, Chinese, and Korean all contain only Dolve, so the exact place cannot be identified. The row-local accepted decision pairs the source form as 돌브(Dolve) only; it does not link, merge, or distinguish either place. Blank canonical and aliases prevent generic matching; no other occurrence is included.'
  }.freeze

  EXPECTED_CSV = {
    'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
    'base' => '70de5056bb0e7929b8ea24e4020965fb6f349198820d56b4b2a85984237dfa85',
    'default' => '1539c6d3795727b711ed5ec70c8b108a696b0a3dc28d422402a9ffb315d2ba22'
  }.freeze
  EXPECTED_INDEX = 'd5b8cd7057a15d94ba654147d0bc918c451b2cab209c28486f6f15c54618ab89'
  EXPECTED_GLOSSARY = '8a898d96905743ec8b62bafb2f3e9ca250ac4c473bc8b1f1f5c83709781c789f'
  EXPECTED_INVENTORY = '2e879d28584872f6a62e60d2fb1b5846ef80415ac7bdd78055ef20c85553c54a'
  EVIDENCE = 'D-21294: English establishes Dolve Arne and Dolve Wayle as distinct Alfar strongholds at base:2220, base:3508, and together at default:34706. Japanese renders both Dolve components as ドルブ/ドルベ; the Korean glossary already establishes 돌브 for both. At default:4738, English, Japanese, Chinese, and the active Korean cell contain only the literal Dolve. Its exact referent remains unresolved. Annotate this one source-form as 돌브(Dolve), without assigning it to, merging, or distinguishing either place; no global Dolve alias or entity-level canonical is registered. The official Korean manual extracted text and reference contain no Dolve entry; their absence is not identity evidence. Preserve all other text, tokens, and line breaks.'

  module_function

  def sha(path)
    Digest::SHA256.file(path).hexdigest
  end

  def verify_checkpoint!
    actual_csv = M.hashes
    raise "CSV checkpoint mismatch: #{actual_csv.inspect}" unless actual_csv == EXPECTED_CSV
    raise "occurrence-index checkpoint mismatch: #{sha(M::INDEX)}" unless
      sha(M::INDEX) == EXPECTED_INDEX
    raise "glossary checkpoint mismatch: #{sha(GLOSSARY)}" unless
      sha(GLOSSARY) == EXPECTED_GLOSSARY
  end

  def source_text(row, field)
    case field
    when 'en_texts_json', 'ja_texts_json'
      JSON.parse(row.fetch(field)).compact.join("\n")
    else
      row.fetch(field)
    end
  end

  def assert_source!(inventory, key, expected)
    row = inventory.fetch(key)
    expected.each do |field, value|
      actual = source_text(row, field)
      raise "source mismatch #{key.inspect} #{field}: #{actual.inspect}" unless actual == value
    end
    row
  end

  def run
    verify_checkpoint!
    raise 'D-21294 already recorded' if
      Dir.glob(File.join(M::AUDIT, 'named-scope-review-D21294-*.md')).any? ||
      File.exist?(File.join(M::AUDIT, 'proper-name-edits-D21294.tsv')) ||
      File.exist?(PROPOSAL)

    inventory = M.refresh_inventory
    raise "inventory hash mismatch: #{sha(M::INVENTORY)}" unless
      inventory.length == 73_430 && sha(M::INVENTORY) == EXPECTED_INVENTORY

    target = assert_source!(inventory, TARGET, {
      'en_texts_json' => 'Dolve',
      'ja_texts_json' => 'Dolve',
      'zh_text' => 'Dolve',
      'work_text' => 'Dolve'
    })
    assert_source!(inventory, ['base', '2220', '11'], {
      'en_texts_json' => 'Dolve Arne',
      'ja_texts_json' => 'ドルブ・アーネ',
      'zh_text' => '阿恩城堡',
      'work_text' => '돌브 아르네(Dolve Arne)'
    })
    assert_source!(inventory, ['base', '3508', '11'], {
      'en_texts_json' => 'Dolve Wayle',
      'ja_texts_json' => 'ドルブ・ウェイル',
      'zh_text' => '韦勒城堡',
      'work_text' => '돌브 웨일(Dolve Wayle)'
    })
    broader = inventory.fetch(['default', '34706', ''])
    raise 'Dolve stronghold context changed' unless
      source_text(broader, 'en_texts_json').include?('Dolve Arne') &&
      source_text(broader, 'en_texts_json').include?('Dolve Wayle') &&
      source_text(broader, 'ja_texts_json').include?('ドルベ・アーン') &&
      source_text(broader, 'ja_texts_json').include?('ドルベ・ウェイル') &&
      broader.fetch('zh_text').include?('阿恩城堡') &&
      broader.fetch('zh_text').include?('韦勒城堡')

    glossary = M.table(GLOSSARY)
    raise 'provisional Dolve form already registered' if
      glossary.any? { |row| row['entity_key'] == FORM }
    raise 'one of the confirmed Dolve places is missing' unless
      %w[place:dolve-arne place:dolve-wayle].all? do |key|
        glossary.any? { |row| row['entity_key'] == key && row['korean_canonical'].start_with?('돌브') }
      end

    index = M.table(M::INDEX)
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    raise 'source-form Dolve row already indexed' if existing.include?([FORM, *TARGET])

    review = {
      'resource' => TARGET[0], 'ID_Linha' => TARGET[1], 'Tipo_Variante' => TARGET[2],
      'entity_key' => FORM, 'status' => 'accepted',
      'old' => target.fetch('work_text'), 'new' => '돌브(Dolve)',
      'evidence' => EVIDENCE,
      'english' => source_text(target, 'en_texts_json'),
      'japanese' => source_text(target, 'ja_texts_json'),
      'chinese' => target.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(FORM => 'accepted'),
      'previous_status' => '', 'previous_evidence' => ''
    }
    occurrence = [
      FORM, *TARGET, 'Dolve', source_text(target, 'en_texts_json'),
      target.fetch('work_text'), 'needs-context', EVIDENCE
    ]
    rows = index.map(&:to_h) +
      [OCCURRENCE_HEADERS.zip(occurrence).to_h]
    raise 'duplicate source-form occurrence key' unless
      rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == rows.length

    definition = glossary.headers.zip(DEFINITION.values_at(*glossary.headers)).to_h
    M.write_table(PROPOSAL, M::HEADERS, [review])
    M.write_table(File.join(M::AUDIT, 'proper-name-scoped-definitions-D21294.tsv'),
                  glossary.headers, [definition])
    M.write_table(GLOSSARY, glossary.headers, glossary.map(&:to_h) + [definition])
    M.write_table(M::INDEX, index.headers, rows.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)

    puts 'Prepared one explicitly scoped Dolve source-form key; referent identity remains unresolved.'
  end
end

DolveSourceFormD21294.run if $PROGRAM_NAME == __FILE__
