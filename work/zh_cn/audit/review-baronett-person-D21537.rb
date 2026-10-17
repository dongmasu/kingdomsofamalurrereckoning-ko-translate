#!/usr/bin/env ruby

require 'digest'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module BaronettPersonD21537
  extend self

  M = ReviewedNameBatches
  D = 21_537
  ENTITY_KEY = 'person:the-baronett'
  SHORT = '바로넷(Baronett)'
  FULL = '바로넷(The Baronett)'
  ITEM_KEY = ['base', '174', '11'].freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  EDITS = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  INITIAL_EVIDENCE =
    'Candidate hit from the English source; verify this occurrence in context.'
  NOTE = 'English default:8462 identifies Baronett/The Baronett as a male pirate in ' \
         "Dead Kel's Hanged Men and explicitly says his true name and origin are unknown. " \
         'Default:38334 independently identifies the survey target as that pirate. ' \
         'Register the attested epithet, not a known birth name or the generic noble title. ' \
         'Japanese バロネット and Chinese 巴罗内特/巴若内特 corroborate; Chinese 准男爵 ' \
         'in default:32516/49919/60622 is a translated epithet in the same pirate context. ' \
         'Use 바로넷(Baronett) for the bare vocative and 바로넷(The Baronett) for the ' \
         'article-bearing epithet, retaining the conventional capitalized title in labels. ' \
         'Exclude the complete item title at base:174:11; do not nest a person annotation ' \
         'inside its atomic item annotation. Preserve prose, other names, tokens, exact ' \
         'line breaks, particles, and every prior entity/key disposition.'

  ENTITY = {
    'entity_key' => ENTITY_KEY, 'english_canonical' => 'Baronett',
    'english_aliases' => 'The Baronett', 'category' => 'person',
    'korean_canonical' => SHORT,
    'korean_variants' => '바로넷|남작네트|배러넷|바러넷|바론넷|바로네트|남작',
    'evidence_ids' => 'D-21537|default:8462|default:38334|default:44530',
    'status' => 'confirmed', 'notes' => NOTE
  }.freeze

  # Exact reviewed fragments, keyed by source row. Never replace generic 남작 globally.
  PATCHES = {
    '8074' => [['바로넷(Baronett) 처치', "#{FULL} 처치", 1]],
    '8462' => [
      ['바로넷(Baronett)은', "#{FULL}은", 1],
      ['바로넷은', "#{FULL}은", 2],
      ['바로넷이', "#{FULL}이", 1]
    ],
    '8909' => [['배러넷.', "#{SHORT}.", 1]],
    '20921' => [['바러넷은', "#{FULL}은", 1]],
    '21179' => [['바러넷이', "#{FULL}이", 1]],
    '24124' => [
      ['바로넷(Baronett)이라', "#{FULL}이라", 1],
      ['바로넷의', "#{FULL}의", 1]
    ],
    '25676' => [['바로넷이', "#{FULL}이", 1]],
    '31464' => [['바론넷?', "#{FULL}?", 1]],
    '32516' => [['바로네트 아니었나?', "#{FULL} 아니었나?", 1]],
    '34680' => [['바러넷을', "#{FULL}을", 1]],
    '38334' => [['남작네트(The Baronett)다.', "#{FULL}다.", 1]],
    '39004' => [['바러넷도', "#{FULL}도", 1]],
    '41055' => [['바론넷을', "#{FULL}을", 1]],
    '44530' => [['바로네트', FULL, 1]],
    '46528' => [['남작이 널', "#{FULL}이 널", 1]],
    '49919' => [['바로넷...', "#{FULL}...", 1]],
    '53343' => [['바로넷(Baronett)?', "#{FULL}?", 1]],
    '55975' => [['바로네트 사건', "#{FULL} 사건", 1]],
    '60622' => [['바로넷(Baronett)은', "#{FULL}은", 1]],
    '64592' => []
  }.freeze

  CONTEXTS = {
    '8074' => 'Kill objective naming the pirate epithet.',
    '8462' => 'Survey biography: four explicit mentions of one pirate; true name unknown.',
    '8909' => 'Bare Baronett vocative; do not add the English article.',
    '20921' => 'Defeated pirate no longer threatens the shores.',
    '21179' => 'Last Hanged Men member attacks after the Blessing of Akara.',
    '24124' => 'Chakram description mentions the sailor twice, not an atomic item title.',
    '25676' => 'Pirate awaits the player after the fate of his friends.',
    '31464' => 'Hanged Men enumeration alongside Bloodgrin and the Whispering Witch.',
    '32516' => 'Explicit Hanged Men member; Chinese translates the epithet as 准男爵.',
    '34680' => 'Defeated last Hanged Men member; preserve Dead Kell and Quay labels.',
    '38334' => 'Alfar Navy survey explicitly identifies the pirate target.',
    '39004' => 'Post-combat statement that the pirate met his match.',
    '41055' => "Explicitly the cruelest of Dead Kel's Hanged Men.",
    '44530' => 'Standalone The Baronett label matching the attested pirate epithet.',
    '46528' => 'Same English/Japanese/Chinese as default:25676; Korean 남작 is this person.',
    '49919' => 'Pirate enumeration; Chinese translates the epithet as 准男爵.',
    '53343' => 'The Baronett question label; retain the full source epithet.',
    '55975' => 'The Baronett encounter reference; retain the Korean 사건 wording.',
    '60622' => 'Northern mountain pirate contrasted with Bloodgrin; Chinese 准男爵.',
    '64592' => 'Already correct complete Quarry: The Baronett survey label.'
  }.freeze

  # SHA256 of JSON([full English, aligned Japanese, Chinese]), not Korean cells.
  SOURCE_DIGESTS = {
    'base:174:11' => '7ad431b994f42bc328a2fd119741291b7cd1db750647d47c578b6192e151e86a',
    'default:8074:' => '82f218421301de3bf992891ceafb5c071640404bda1918f722baca7dc14baa5d',
    'default:8462:' => '199e21c39d7e67f92215c77ab8aaa0af940c27ddc518c3b87ff659b595887bdd',
    'default:8909:' => 'd7ec33e86d154c6946cb343b6b8c66c806b34c3463a3aef8134dbb2c3d09b05f',
    'default:20921:' => '7c7b26086301051e1c78f38a4148731ab06662dfd2b80c4a182645af5c381d8b',
    'default:21179:' => '0a424f4c83a2266679ac7a631d9d63bc56bf219e9d1acf1caa6bb67bea602a06',
    'default:24124:' => 'd877a6fa0de3f8e9c7e6f1ea47543e32ddd66de5e020ead3f57a1e8f59964ac0',
    'default:25676:' => '90b1fdd048ecc545912e61eb6f4b302ebb14f504b35628c5813da4347aa956b0',
    'default:31464:' => '7eafcd5976c6c3d26eab92afdb34b56eeb64046bf5bcec5dacc4f66e58bba326',
    'default:32516:' => '58af6df1cd724e0b7e688756dc2e0779fd7777b514d3531df6f42fcf0d1c7e09',
    'default:34680:' => 'd49f57bc1717e56c89a77b1808a063d3fdd3999035723f18a0a571bff8d5cde1',
    'default:38334:' => '9c87922f18f0435062552b6dd58439b80a10f7a974fe92d2469e0c261390302c',
    'default:39004:' => '8494bb4619b68f0f1bc393d36f25a7b878e3c64a0ad87b80a4283d74c7a8144b',
    'default:41055:' => 'acb7538528adac485b1f34db33331b34a157de939a3964904cfa9b43c77d5c9c',
    'default:44530:' => '36d95364354078c6447593c6eefb4088f33cd9b9f1390e1400a03b19dc261fe3',
    'default:46528:' => '90b1fdd048ecc545912e61eb6f4b302ebb14f504b35628c5813da4347aa956b0',
    'default:49919:' => '3810c131bfc0f9f6ad4d1ba2f0206b36be652b37b5b6374fbe99d3ee7d7be87f',
    'default:53343:' => '12efaad7859650d53d2f985df205f617a2f223cbe38f6f3460970afbdc2c3b55',
    'default:55975:' => '17b78b39a650041ae41f33dfe073f254e36e9618c435b08a370575502ad5d99a',
    'default:60622:' => 'bb6fc048c7be2dbf404a6cfdc5c80998b5450d7b2b4a78a3342f3113879162bf',
    'default:64592:' => '1c4514392893a120abd89fe3b19f685c09db1b1df8e93cbf066f68fc79ea7b11'
  }.freeze

  def expected_keys
    [ITEM_KEY] + PATCHES.keys.map { |id| ['default', id, ''] }
  end

  def definitions_for(headers)
    [headers.to_h { |field| [field, ENTITY.fetch(field, '')] }]
  end

  def source_inventory
    M::RESOURCES.flat_map do |resource|
      rows = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *rows).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end.each_with_object({}) do |row, inventory|
      key = M.key(row)
      raise "duplicate source key #{key.inspect}" if inventory.key?(key)

      inventory[key] = row
    end
  end

  def source_texts(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      source.fetch('zh_text')
    ]
  end

  def generated_for(inventory, definitions = [ENTITY])
    build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def normalize(key, text)
    return text.dup if key == ITEM_KEY
    raise "unreviewed Baronett key #{key.inspect}" unless
      key[0] == 'default' && key[2] == '' && PATCHES.key?(key[1])

    result = text.dup
    PATCHES.fetch(key[1]).each do |old, replacement, maximum|
      count = result.scan(old).length
      raise "unexpected repeated Baronett span #{key.inspect}: #{old}" if count > maximum

      result.gsub!(old, replacement)
    end
    label = key[1] == '8909' ? SHORT : FULL
    count = key[1] == '8462' ? 4 : (key[1] == '24124' ? 2 : 1)
    raise "missing normalized Baronett mentions #{key.inspect}" unless
      result.scan(label).length == count
    stripped = result.gsub(label, '')
    raise "unreviewed Baronett variant #{key.inspect}" if
      stripped.match?(/바로넷|남작네트|배러넷|바러넷|바론넷|바로네트/)
    raise "changed markup or line breaks #{key.inspect}" unless
      text.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        result.scan(ReviewedProperNameDiscovery::OPAQUE) &&
      text.scan(/\r\n|\r|\n/) == result.scan(/\r\n|\r|\n/)

    result
  end

  def reviews_for(inventory, generated = generated_for(inventory))
    raise 'Baronett full-source coverage differs from the reviewed 21 keys' unless
      generated.map { |row| M.key(row) }.sort == expected_keys.sort &&
      generated.all? { |row| row.fetch('entity_key') == ENTITY_KEY }

    generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english, japanese, chinese = source_texts(source)
      raise "EN/JA/ZH source alignment changed #{key.inspect}" unless
        Digest::SHA256.hexdigest(JSON.generate([english, japanese, chinese])) ==
          SOURCE_DIGESTS.fetch(key.join(':'))
      old = source.fetch('work_text')
      new_text = normalize(key, old)
      status = key == ITEM_KEY ? 'excluded' : (old == new_text ? 'not-an-issue' : 'accepted')
      context = if key == ITEM_KEY
                  "Baronett's Blades is a complete item title, separately owned by D21536. " \
                    'Preserve its current Korean cell byte-for-byte, including any atomic item pair.'
                else
                  CONTEXTS.fetch(key[1])
                end
      occurrence.merge(
        'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{key.join(':')}: #{context} #{NOTE}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY_KEY => status),
        'previous_status' => '', 'previous_evidence' => ''
      )
    end
  end

  def prior_records(rows)
    rows.each_with_object({}) do |row, records|
      key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate prior index key #{key.inspect}" if records.key?(key)

      records[key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_records!(before, rows)
    after = prior_records(rows)
    raise 'prior occurrence dispositions/evidence changed' unless
      before.all? { |key, record| after[key] == record }
    raise 'unexpected added occurrence keys' unless
      (after.keys - before.keys).sort == expected_keys.map { |key| [ENTITY_KEY, *key] }.sort
    true
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'D21537 discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS, EDITS].any? { |path| File.exist?(path) }
    inventory = source_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX).map(&:to_h)
    definitions = definitions_for(glossary.headers)
    generated = generated_for(inventory, definitions)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'D21537 expected 19 edits, one retained person label, one item exclusion' unless
      reviews.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
        { 'excluded' => 1, 'accepted' => 19, 'not-an-issue' => 1 }
    reviews.select { |row| row.fetch('old') != row.fetch('new') }
           .group_by { |row| row.fetch('resource') }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
    end
    puts 'Prepared D-21537: 21 keys; 20 person references; 19 edits; 1 retained; 1 item exclusion.'
    [definitions, reviews, generated]
  end

  def validate_saved_manifest!
    definitions = M.table(DEFINITIONS)
    reviews = M.table(REVIEWS).map(&:to_h)
    inventory = source_inventory
    raise 'saved definitions differ' unless
      definitions.map(&:to_h) == definitions_for(definitions.headers)
    raise 'saved source scope differs' unless
      generated_for(inventory, definitions.map(&:to_h)).map { |row| M.key(row) }.sort ==
        expected_keys.sort &&
      reviews.map { |row| M.key(row) }.sort == expected_keys.sort
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    index_rows = M.table(M::INDEX).map(&:to_h)
    index = prior_records(index_rows)
    raise 'saved entity occurrence scope differs' unless
      index.keys.select { |key| key.first == ENTITY_KEY }.sort ==
        expected_keys.map { |key| [ENTITY_KEY, *key] }.sort
    raise 'saved glossary definition differs' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).select do |row|
        row.fetch('entity_key') == ENTITY_KEY
      end.map(&:to_h) == definitions.map(&:to_h)
    raise 'saved edit count differs' unless
      reviews.count { |row| row.fetch('old') != row.fetch('new') } == 19
    reviews.each do |row|
      key = M.key(row)
      expected_status = key == ITEM_KEY ? 'excluded' :
        (row.fetch('old') == row.fetch('new') ? 'not-an-issue' : 'accepted')
      raise "saved historical transformation/status differs #{key.inspect}" unless
        row.fetch('entity_key') == ENTITY_KEY &&
        normalize(key, row.fetch('old')) == row.fetch('new') &&
        row.fetch('status') == expected_status &&
        JSON.parse(row.fetch('entity_dispositions_json')) == { ENTITY_KEY => expected_status }
      live = inventory.fetch(key).fetch('work_text')
      raise "live Baronett normalization reverted #{key.inspect}" unless normalize(key, live) == live
      indexed = index_rows.find { |r| r.fetch('entity_key') == ENTITY_KEY && M.key(r) == key }
      raise "saved index disposition differs #{key.inspect}" unless
        indexed.fetch('status') == expected_status &&
        indexed.fetch('evidence') == "D-#{D}: #{row.fetch('evidence')}" &&
        indexed.fetch('korean_current') == live
    end
    if File.file?(EDITS)
      edits = M.table(EDITS).map(&:to_h)
      raise 'saved edit manifest coverage differs' unless
        edits.map { |row| M.key(row) }.sort == expected_keys.sort
      edits.each do |row|
        review = reviews.find { |r| M.key(r) == M.key(row) }
        raise 'historical edit manifest differs' unless
          %w[entity_key status old new evidence english japanese chinese].all? do |field|
            row.fetch(field) == review.fetch(field)
          end
        previous_status = JSON.parse(row.fetch('previous_status'))
        previous_evidence = JSON.parse(row.fetch('previous_evidence'))
        raise 'initial own-entity disposition differs' unless
          previous_status.keys.sort == previous_evidence.keys.sort &&
          previous_status[ENTITY_KEY] == 'needs-context' &&
          previous_evidence[ENTITY_KEY] == INITIAL_EVIDENCE
      end
    end
    true
  end

  def apply
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    before = prior_records(index.map(&:to_h))
    definitions, reviews, = prepare
    raise 'shared registry changed during preparation' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == glossary.map(&:to_h) &&
      M.table(M::INDEX).map(&:to_h) == index.map(&:to_h)
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    verify_prior_records!(before, M.table(M::INDEX).map(&:to_h))
    raise 'prior glossary records changed' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) ==
        glossary.map(&:to_h) + definitions
    validate_saved_manifest!
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-baronett-person-D21537.rb [prepare|apply|validate]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then BaronettPersonD21537.prepare
  when 'apply' then BaronettPersonD21537.apply
  when 'validate' then BaronettPersonD21537.validate_saved_manifest!
  else abort 'usage: review-baronett-person-D21537.rb [prepare|apply|validate]'
  end
end
