#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module EldestD21459
  extend self

  M = ReviewedNameBatches
  D = 21_459
  ENTITY = 'people:the-eldest'
  CANONICAL = '엘더스트(The Eldest)'
  SHORT_PAIR = '엘더스트(Eldest)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  # Exact Korean spans include particles when removing a plural changes 받침.
  # id => [old span, new span, English name count]
  ROWS = {
    '2577' => ['장로(The Eldest)', CANONICAL, 1],
    '5491' => ['장로(Eldest)', CANONICAL, 1],
    '9374' => [CANONICAL, CANONICAL, 1],
    '11407' => [CANONICAL, CANONICAL, 1],
    '11580' => ['맏이들은', "#{CANONICAL}는", 1],
    '14741' => ['맏이들의', "#{CANONICAL}의", 1],
    '15316' => ['맏이들의', "#{CANONICAL}의", 1],
    '16729' => ['장로들만', "#{CANONICAL}만", 1],
    '16818' => [CANONICAL, CANONICAL, 1],
    '18493' => [CANONICAL, CANONICAL, 1],
    '21281' => [CANONICAL, CANONICAL, 1],
    '21818' => [CANONICAL, CANONICAL, 1],
    '22055' => ['장로들의', "#{CANONICAL}의", 1],
    '31140' => ['엘더스트를', "#{CANONICAL}를", 1],
    '31295' => ['엘더스트는', "#{CANONICAL}는", 1],
    '33316' => ['엘더스트가', "#{CANONICAL}가", 1],
    '34977' => ['엘더스트에게', "#{CANONICAL}에게", 1],
    '36727' => ['맏이에게', "#{CANONICAL}에게", 1],
    '39766' => ['맏이를', "#{CANONICAL}를", 1],
    '40115' => ['맏이들을', "#{CANONICAL}를", 1],
    '42431' => ['장로들은', "#{CANONICAL}는", 1],
    '42799' => ['엘더스트를', "#{CANONICAL}를", 1],
    '48551' => ['대장로에게', "#{CANONICAL}에게", 2],
    '55614' => [SHORT_PAIR, CANONICAL, 1],
    '56750' => [SHORT_PAIR, CANONICAL, 1],
    '57631' => ['장로를', "#{SHORT_PAIR}를", 1],
    '57807' => ['장로와', "#{CANONICAL}와", 1],
    '58712' => ['엘더스트를', "#{CANONICAL}를", 1],
    '58980' => ['엘더스트만', "#{CANONICAL}만", 1],
    '61089' => [CANONICAL, CANONICAL, 1],
    '63040' => ['엘더스트에게', "#{CANONICAL}에게", 1],
    '64218' => [CANONICAL, CANONICAL, 1],
    '64801' => ['엘디스트가', "#{CANONICAL}가", 1]
  }.transform_values(&:freeze).freeze
  EXCLUSIONS = {
    '3221' => ['最年長の門弟', '大信徒', 'Ordinary eldest disciple, referring to Phinne.'],
    '7764' => ['一族の最長老', '家族里的长者',
               'Descriptive lowercase eldest living, even though Caelrod and Alarane are named.'],
    '56468' => ['シールドリングの方が古い', '盾环的身价最高',
                'Ordinary comparative age of Shieldring, not the named Fae collective.']
  }.transform_values(&:freeze).freeze
  ENGLISH_SOURCES = {
    '2577' => 'I was sent by the Eldest to recover the key Bisarane will need to reach the Sorrows. I have returned the key Bisarane, who then revealed that he was Saturnyn. He has betrayed his House to the Tuatha.',
    '3221' => 'Speak to Phinne. She is my eldest disciple. Very powerful and wise. A true challenge awaits you!',
    '5491' => 'I have been told that Bisarane will need a key in order to find the Sorrows before Saturnyn and the Tuatha can. But I will need to learn more from the Eldest before I can perform this task.',
    '7764' => "Caelrod and Alarane are the eldest living in the House, but the Weeping King was the founder. He felt too strongly about the shadows in Winter's nature.",
    '9374' => 'Reach the Eldest',
    '11407' => 'The Eldest',
    '11580' => 'And... and so, the Eldest look upon each other once more. It has been... some time since I have seen Alarane, mortal. For that, I am thankful.',
    '14741' => 'I had to have the Sorrows, but they were lost. It took years before I even learned of the Eldest, much less their location.',
    '15316' => 'I am gladdened that Caelrod and I are united once again. But If Bisarane truly seeks the Sorrows, then he will need more than the knowledge of the Eldest.',
    '16729' => 'That will not stop the Tuatha. We must find the Sorrows. Only two Fae, the Eldest, who reside in Damalroc, know where they are.',
    '16818' => 'The Eldest',
    '18493' => 'The Eldest',
    '21281' => 'The Eldest',
    '21818' => 'It is a manifestation of magic that prevents intruders from disturbing the perpetual reverie of the Eldest.',
    '22055' => "If the Eldest are to be believed, it is interred in Sinsear, the tomb of the House's first leader, a Fae known only as the Weeping King.",
    '31140' => 'No! They are going to kill the Eldest!',
    '31295' => 'It is not only my own knowledge that Bisarane needs. The Eldest are two, but in many ways, Caelrod and I are one.',
    '33316' => 'Why do we need the Eldest?',
    '34977' => 'To reach the Eldest, I needed this House to die. To do that, I needed a rebellion. To do that, I needed an assassination. To do that... I needed you.',
    '36727' => 'The way to them is blocked by the Great Scale ‒ a mighty spell which you must bypass. That alone will open your path to the Eldest.',
    '39766' => 'I have opened one of the doors of the Great Scale. I should enter it and see if I can locate the Eldest. I will then learn the location of the Sorrows and be able to help Bisarane stop the Tuatha',
    '40115' => 'Now that I have reached the Eldest and woken them from their reverie, I need to confer with them. I can find them in the antechamber behind the Great Scale.',
    '42431' => 'You survived... For better or worse, I know not. The House is in ruins, the Eldest lie butchered, and Bisarane has betrayed us to the Tuatha.',
    '42799' => 'Follow the Eldest',
    '48551' => 'The way to the Eldest is blocked by the Great Scale, a mighty spell which you must bypass. That alone will open your path to the Eldest.',
    '55614' => 'I have spoken with the Eldest named Alarane; however, she will not leave until I speak with her counterpart, Caelrod. I should return to the Great Scale and open the path to Caelrod.',
    '56468' => 'By my count, that makes Shieldring eldest standing.',
    '56750' => 'I have spoken with the Eldest named Caelrod; however, he will not leave until I speak with his counterpart, Alarane. I should return to the Great Scale and open the path to Alarane.',
    '57631' => 'Reach the Remaining Eldest',
    '57807' => 'Speak with the Eldest',
    '58712' => 'There is no time for delay. You must go to Damalroc and contact the Eldest.',
    '58980' => 'Their location is an ancient secret. Only two Fae, the Eldest, know. They left the House centuries ago to reside in Damalroc.',
    '61089' => 'I have entered Damalroc, the dungeon where Bisarane told me I could find the Eldest. I should investigate the dungeon and uncover what I can of them.',
    '63040' => 'The only weight the pans of the Scale will acknowledge is death. When something dies on the Scale, it will shift you one step closer to the Eldest.',
    '64218' => 'I have been asked by Bisarane to travel to southern Klurikon. Within the dungeon Damalroc, I must find two former members of the House of Sorrows known as the Eldest. If I can convince them to return to the Midden, they will help Bisarane uncover the location of the Sorrows and protect them from the Tuatha.',
    '64801' => 'Where we must meet. Come, and the Eldest will be reunited before you.'
  }.freeze
  NOTE = 'English default:16729 and 58980 identify two Fae, the Eldest, living in Damalroc; 31295 explicitly says the Eldest are two. Default:64218 identifies two former members of the House of Sorrows, not the House of Ballads. Default:55614/56750 separately name Alarane and Caelrod as counterparts. Category people denotes this named two-member collective, not a race, a new Fae species, or a merge of the separately registered people. Japanese エルデスト and Chinese 长者/长老/元老 corroborate. Retain the established 엘더스트 spelling; normalize only the exact reviewed name spans and necessary attached particles. Use The Eldest where the source has the adjacent article and Eldest in Remaining Eldest at 57631. No global Eldest alias is registered: all three generic eldest source rows receive explicit unchanged exclusions. Preserve every unrelated name, pronoun, narrative clause, token, line break and previous entity/key disposition; do not reopen historical tallies.'

  def expected_keys
    ENGLISH_SOURCES.keys.map { |id| ['default', id, ''] }
  end

  def definitions_for(headers)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'The Eldest',
      'category' => 'people', 'korean_canonical' => CANONICAL, 'english_aliases' => '',
      'korean_variants' => '엘더스트|엘디스트|장로|장로들|대장로|맏이|맏이들',
      'evidence_ids' => "D-#{D}|default:16729|default:31295|default:64218|default:55614|default:56750",
      'status' => 'confirmed', 'notes' => NOTE
    }
    [headers.to_h { |header| [header, fields.fetch(header)] }]
  end

  def active_inventory
    rows = RESOURCES.flat_map do |resource|
      sources = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *sources).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    keyed = rows.to_h { |row| [M.key(row), row] }
    raise 'duplicate Eldest aligned inventory key' unless keyed.length == rows.length
    keyed
  end

  def assert_scope!(generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    expected = expected_keys.map { |key| [ENTITY, *key] }.sort
    raise 'Eldest batch exceeds fifty rows' if generated.length > 50
    raise 'Eldest exact all-resource source coverage differs' unless actual == expected
  end

  def source_occurrences(inventory, definitions)
    raise 'Eldest must not be a global alias' unless definitions.one? &&
      definitions.first.fetch('entity_key') == ENTITY &&
      definitions.first.fetch('english_canonical') == 'The Eldest' &&
      definitions.first.fetch('english_aliases').empty?

    # The search-only alias covers Remaining Eldest and all generic homonyms.
    search = definitions.map { |row| row.merge('english_aliases' => 'Eldest') }
    generated = build_occurrences(inventory.values, search).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    assert_scope!(generated)
    generated
  end

  def normalize(text, key)
    raise "unreviewed Eldest key #{key.inspect}" unless expected_keys.include?(key)
    return text if EXCLUSIONS.key?(key[1])

    old_span, new_span, count = ROWS.fetch(key[1])
    patterns = [new_span, old_span].uniq.map do |span|
      boundary = span.end_with?(')') ? '(?!\\s*\\()' : '(?![가-힣A-Za-z]|\\s*\\()'
      Regexp.new("(?<![가-힣A-Za-z])#{Regexp.escape(span)}#{boundary}")
    end
    names = Regexp.union(*patterns)
    protected = Regexp.union(ReviewedProperNameDiscovery::OPAQUE, names, /\([^()\r\n]*\)/)
    matches = text.scan(protected).select { |span| [old_span, new_span].include?(span) }
    raise "Eldest Korean span count differs #{key.inspect}" unless matches.length == count

    proposed = text.gsub(protected) { |span| span == old_span ? new_span : span }
    raise 'Eldest normalization changed opaque tokens or line breaks' unless
      text.scan(ReviewedProperNameDiscovery::OPAQUE) == proposed.scan(ReviewedProperNameDiscovery::OPAQUE) &&
      text.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
    proposed
  end

  def reviews_for(inventory, generated)
    assert_scope!(generated)
    generated.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english_parts = JSON.parse(source.fetch('en_texts_json')).compact
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Eldest exact English source differs #{key.inspect}" unless
        english_parts == [ENGLISH_SOURCES.fetch(key[1])]
      english = english_parts.first
      old = source.fetch('work_text')
      if EXCLUSIONS.key?(key[1])
        ja, zh, reason = EXCLUSIONS.fetch(key[1])
        raise "generic eldest corroboration differs #{key.inspect}" unless
          english.scan(/\beldest\b/).length == 1 && !english.match?(/\bEldest\b/) &&
          japanese.include?(ja) && !japanese.include?('エルデスト') && chinese.include?(zh)
        proposed = old
        status = 'excluded'
      else
        count = ROWS.fetch(key[1]).fetch(2)
        japanese_count = key[1] == '48551' ? 1 : count
        chinese_count = %w[36727 48551 58980].include?(key[1]) ? 2 : 1
        raise "Eldest named-collective corroboration differs #{key.inspect}" unless
          english.scan(/\bEldest\b/).length == count &&
          japanese.scan('エルデスト').length == japanese_count &&
          chinese.scan(/长者|长老|元老/).length == chinese_count
        article_count = key[1] == '57631' ? 0 : count
        raise "Eldest source-local article differs #{key.inspect}" unless
          english.scan(/\b[Tt]he Eldest\b/).length == article_count
        proposed = normalize(old, key)
        raise 'Eldest normalization is not idempotent' unless normalize(proposed, key) == proposed
        status = old == proposed ? 'not-an-issue' : 'accepted'
        reason = if key[1] == '61089'
                   'The second bare Korean 엘더스트 represents English them; preserve it without an extra name annotation.'
                 elsif key[1] == '48551'
                   'Both explicit English name mentions require their own complete pair; Japanese renders the first as a pronoun.'
                 else
                   'Only the guarded collective-name span and its necessary particle are changed.'
                 end
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => "#{NOTE} #{reason}", 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared Eldest outputs exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX).map(&:to_h)
    definitions = definitions_for(glossary.headers)
    inventory = active_inventory
    generated = source_occurrences(inventory, definitions)
    reviews = reviews_for(inventory, generated)
    expected_edits = ROWS.select { |_id, (old, proposed, _count)| old != proposed }.keys.sort
    raise 'Eldest edited-cell scope differs' unless
      reviews.select { |row| row['old'] != row['new'] }.map { |row| row.fetch('ID_Linha') }.sort == expected_edits
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, glossary.map(&:to_h), index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "Prepared D-#{D}: 33 collective keys, 34 named mentions, 25 edits, 8 unchanged, " \
         '3 generic exclusions; 36 reviewed keys; no files written or global Eldest alias.'
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
    [definitions, reviews, generated]
  end

  def prior_records(rows)
    rows.each_with_object({}) do |row, result|
      key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate prior occurrence #{key.inspect}" if result.key?(key)
      result[key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_records!(before, rows)
    after = prior_records(rows)
    before.each do |key, record|
      raise "prior Eldest-overlap disposition changed #{key.inspect}" unless after[key] == record
    end
    raise 'unexpected new Eldest occurrence keys' unless
      (after.keys - before.keys).sort == expected_keys.map { |key| [ENTITY, *key] }.sort
  end

  def verify_final_dispositions!(reviews, rows)
    expected = reviews.map do |row|
      [M.key(row), [row.fetch('status'), "D-#{D}: #{row.fetch('evidence')}"]]
    end.sort
    actual = rows.select { |row| row['entity_key'] == ENTITY }.map do |row|
      [M.key(row), row.values_at('status', 'evidence')]
    end.sort
    raise 'final Eldest dispositions differ' unless actual == expected
  end

  def apply
    definitions, reviews, generated = prepare
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    before = prior_records(index.map(&:to_h))
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    # Keep the alias-free definition and register only the gated, row-scoped hits.
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, glossary.map(&:to_h) + definitions)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    M.run(REVIEWS, D, 1)
    final = M.table(M::INDEX).map(&:to_h)
    verify_prior_records!(before, final)
    verify_final_dispositions!(reviews, final)
    raise 'prior Eldest-overlap glossary changed' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == glossary.map(&:to_h) + definitions
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-eldest-D21459.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then EldestD21459.prepare
  when 'apply' then EldestD21459.apply
  else abort 'usage: review-eldest-D21459.rb [prepare|apply]'
  end
end
