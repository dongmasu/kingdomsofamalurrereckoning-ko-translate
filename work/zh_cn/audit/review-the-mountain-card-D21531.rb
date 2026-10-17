#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module TheMountainCardD21531
  extend self

  M = ReviewedNameBatches
  D = 21_531
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY_KEY = 'title:the-mountain-fate-card'
  CANONICAL = 'The Mountain'
  KOREAN = '산(The Mountain)'
  CARD_KEY = ['default', '20997', ''].freeze
  AMBIGUOUS_KEY = ['base', '1875', '11'].freeze

  ENTITY = {
    'entity_key' => ENTITY_KEY,
    'english_canonical' => CANONICAL,
    'category' => 'title',
    'korean_canonical' => KOREAN,
    'english_aliases' => '',
    'korean_variants' => '산 카드|산(The Mountain) 카드',
    'evidence_ids' => 'D-21531|default:20997',
    'status' => 'confirmed',
    'notes' => 'English default:20997 explicitly identifies The Mountain as a Fate card explained by the Fateweavers. Japanese ザ・マウンテン and Chinese 山脉卡牌 corroborate the named card. Use 산(The Mountain) 카드 for both card-name mentions in this row. The isolated base:1875 label The Mountain lacks context to determine whether it names this card or a separate item, so keep that identity link uncertain. Other case-insensitive phrase hits are ordinary mountain/location wording or different complete titles and are excluded from this card scope.'
  }.freeze

  EXPECTED_MATCHES = 79
  REPLACEMENT = '산 카드'
  REPLACEMENT_WITH_ENGLISH = '산(The Mountain) 카드'
  EVIDENCE = 'English default:20997 identifies The Mountain as a Fate card; aligned Japanese and Chinese corroborate. This occurrence screen treats the title atomically and does not infer that generic mountain wording or another complete label names the card.'

  def source_inventory
    M.refresh_inventory
  end

  def definitions(headers)
    [headers.to_h { |header| [header, ENTITY.fetch(header, '')] }]
  end

  def reviews(inventory, glossary_headers)
    rows = build_occurrences(inventory.values, [ENTITY]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "expected #{EXPECTED_MATCHES} lexical matches, found #{rows.length}" unless
      rows.length == EXPECTED_MATCHES
    raise 'expected one standalone-label ambiguity' unless
      rows.count { |row| M.key(row) == AMBIGUOUS_KEY } == 1
    raise 'expected one Fate-card context' unless
      rows.count { |row| M.key(row) == CARD_KEY } == 1

    rows.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      status = 'excluded'
      proposed = old.dup
      evidence = 'The English phrase match is a generic mountain/location reference or belongs to a different complete title, not the Fate card The Mountain. Preserve the Korean text and screen this lexical collision without adding a card disposition.'

      if key == CARD_KEY
        status = 'accepted'
        count = proposed.scan(REPLACEMENT).length
        raise "expected two card-name spans at #{key.inspect}" unless count == 2
        proposed.gsub!(REPLACEMENT, REPLACEMENT_WITH_ENGLISH)
        evidence = EVIDENCE
      elsif key == AMBIGUOUS_KEY
        status = 'uncertain'
        evidence = 'The standalone base label The Mountain has no local context. It could be the Fate card or a separate item label; do not merge the identity or change the already bilingual Korean cell.'
      end

      occurrence.merge(
        'status' => status,
        'old' => old,
        'new' => proposed,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY_KEY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      )
    end
  end

  def write_inputs
    inventory = source_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    generated_definitions = definitions(glossary.headers)
    reviewed = reviews(inventory, glossary.headers)
    M.write_table(DEFINITIONS, glossary.headers, generated_definitions)
    M.write_table(REVIEWS, M::HEADERS, reviewed)
    [generated_definitions, reviewed]
  end

  def apply
    write_inputs
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

TheMountainCardD21531.apply if $PROGRAM_NAME == __FILE__
