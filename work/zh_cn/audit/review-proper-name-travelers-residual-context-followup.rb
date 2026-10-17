#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module TravelersResidualContextFollowup
  AUDIT = __dir__
  INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  OUTPUT = '/private/tmp/travelers-residual-context-reviewed.tsv'
  TRAVELERS = 'faction:travelers'
  SCHOLIA = 'faction:scholia-arcana'
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    pre_edit_text english japanese chinese changed_spans_json
  ].freeze

  # Each replacement is deliberately bounded to a reviewed Korean substring.
  # Unlisted text, including particles, spaces, punctuation, and line breaks,
  # is copied byte-for-byte from the current inventory cell.
  DECISIONS = {
    '399' => {
      'status' => 'accepted',
      'evidence' => "English distinguishes an ordinary 'wanderer' from the named Traveler's Camp. Japanese likewise distinguishes 旅人 from トラベラーズのキャンプ; Chinese supports arrival at that camp. Label only the camp compound and preserve the ordinary visitor.",
      'patches' => [["여행자 야영지", "트래블러 야영지(Traveler's Camp)"]]
    },
    '844' => {
      'status' => 'uncertain',
      'evidence' => 'English and Japanese explicitly mention Travelers in the camp, but the Korean cell contains no corresponding faction span. This is source omission, not a safe label replacement; do not insert omitted prose.'
    },
    '2011' => {
      'status' => 'accepted',
      'evidence' => "English explicitly identifies 'The Travelers of my camp' as a group; Japanese omits the name while Chinese says the camp's travelers. Label only the Korean group phrase, preserving its plural subject particle.",
      'patches' => [['여행자들은', '트래블러(Travelers)들은']]
    },
    '3328' => {
      'status' => 'excluded',
      'evidence' => "English uses 'Traveler' as direct address to the player ('and you too'); Japanese omits the term and Chinese also has a direct-address 旅行者. No faction membership is stated."
    },
    '8269' => {
      'status' => 'not-an-issue',
      'evidence' => 'The English phrase is “new to the Travelers”; the Korean already has the exact canonical bilingual label 트래블러(Travelers). The aligned Chinese supports the faction reading. Preserve the cell.'
    },
    '9429' => {
      'status' => 'excluded',
      'evidence' => "English 'Hello again, traveler' is a direct greeting, followed by ordinary shop business. Japanese has only a greeting and Chinese uses vocative 旅行者; no faction sense is present."
    },
    '11780' => {
      'status' => 'excluded',
      'evidence' => "English says Itran 'robs travelers' in Haxhi, an ordinary victim class rather than the Travelers faction. Japanese and Chinese likewise describe travelers being robbed."
    },
    '13458' => {
      'status' => 'not-an-issue',
      'evidence' => 'The full English name is “Travelers Star Camp”; Korean already preserves the complete atomic bilingual compound 트래블러의 별 야영지(Travelers Star Camp). Japanese and Chinese identify the same camp. Do not add a nested faction label.'
    },
    '13712' => {
      'status' => 'accepted',
      'evidence' => "English says the Travelers might 'take me in', an explicit faction-membership context. The source-matching plural label already appears in parentheses; standardize only the Korean faction span and preserve the subject particle.",
      'patches' => [['여행자들(Travelers)이', '트래블러(Travelers)들이']]
    },
    '14835' => {
      'status' => 'excluded',
      'evidence' => "English 'Hello again, Traveler' is a greeting to the player about Draug's Toothpicks. Japanese is a greeting and Chinese uses vocative 旅行者; this is not a faction reference."
    },
    '18247' => {
      'status' => 'excluded',
      'evidence' => "English lowercase 'travelers' are people being robbed, contrasted with kidnapped merchants. Japanese and Chinese preserve the ordinary-victim meaning."
    },
    '19474' => {
      'status' => 'uncertain',
      'evidence' => 'English capitalizes “Travelers” as the discoverers, but gives no faction-membership context; Japanese says 旅人 and Chinese says 旅行者. The source evidence permits either faction members or ordinary discoverers, so retain the Korean wording.'
    },
    '26652' => {
      'status' => 'accepted',
      'evidence' => 'English explicitly contrasts the Warsworn and Travelers as factions (“like oil and water”); Japanese names トラベラーズ, and Chinese supports the faction contrast. Label only the Korean Travelers span and preserve its plural particle.',
      'patches' => [['여행자들이 물과 기름', '트래블러(Travelers)들이 물과 기름']]
    },
    '27586' => {
      'status' => 'accepted',
      'evidence' => 'This is an explicit faction-quest definition listing the Travelers alongside other named factions. Japanese names トラベラーズ and Chinese lists 旅行者. Label only that list item; preserve all markup and neighboring text.',
      'patches' => [['여행자들, 워스원', '트래블러(Travelers), 워스원']]
    },
    '28499' => {
      'status' => 'excluded',
      'evidence' => "English lowercase 'traveler' is a standalone greeting; Japanese has only こんにちは and Chinese uses a generic 旅行者 greeting. No faction is implied."
    },
    '29119' => {
      'status' => 'accepted',
      'evidence' => 'English first names “The Travelers” as traders and treasure-hunters; Japanese explicitly describes トラベラーズ as a group. The later singular “a Traveler” is a generic member construction with no separate Korean name span, so label only the existing first Korean mention.',
      'patches' => [['트래블러들은', '트래블러(Travelers)들은']]
    },
    '30368' => {
      'status' => 'excluded',
      'evidence' => "English uses 'Traveler' as direct address while postponing a conversation about daggers. Japanese omits the address and Chinese uses vocative 旅行者; this is ordinary player address."
    },
    '31237' => {
      'status' => 'excluded',
      'evidence' => "English 'little traveler' is a direct greeting/tease. Japanese omits the term and Chinese uses ordinary 小旅行者; no faction relationship is stated."
    },
    '31919' => {
      'status' => 'accepted',
      'evidence' => 'English explicitly describes the Travelers as a known group of thieves and continues with “we”; Japanese identifies a thieves’ group and its members, and Chinese supports the group meaning. Label the existing Korean faction name and preserve its subject particle.',
      'patches' => [['트래블러가 도둑으로', '트래블러(Travelers)가 도둑으로']]
    },
    '34073' => {
      'status' => 'uncertain',
      'evidence' => 'English capitalizes “A good Traveler,” but describes a generally skilled person earning coin in ruins after training; Japanese says 腕のいい者 and Chinese says 一个好的旅行者. The context does not establish whether this is faction membership or a generic explorer, so preserve the current Korean.'
    },
    '34700' => {
      'status' => 'accepted',
      'evidence' => 'English says the speaker threatened to expose Argine’s identity to the Travelers, a direct reference to the faction audience. Japanese omits the name but Chinese supports that audience. Label only the existing Korean recipient phrase.',
      'patches' => [['트래블러들에게', '트래블러(Travelers)들에게']]
    },
    '36750' => {
      'status' => 'excluded',
      'evidence' => "English lowercase 'travelers passing through here every week' describes ordinary visitors; Japanese says people coming and going. Chinese uses 盗贼, but that isolated rendering does not outweigh the explicit English visitor context."
    },
    '37033' => {
      'status' => 'accepted',
      'evidence' => "English first says 'Another wanderer' (ordinary person), then names “This Travelers' camp”; Japanese explicitly contrasts トラベラーズのキャンプ with 旅人, and Chinese also separates the camp from the wanderer. Label only the full camp compound.",
      'patches' => [["트래블러 야영지", "트래블러 야영지(Travelers' Camp)"]]
    },
    '39632' => {
      'status' => 'excluded',
      'evidence' => "The final English phrase is lowercase 'a more worldly traveler' in a general travel description, not a faction member. Korean describes a worldly traveler; Japanese says 旅人. Preserve the ordinary-noun wording."
    },
    '41449' => {
      'status' => 'excluded',
      'evidence' => "English says ordinary travelers grow scarcer as visitors to a quiet place; Japanese says the number of visitors decreases and Chinese likewise says visitors. No faction reference is intended."
    },
    '42460' => {
      'status' => 'accepted',
      'evidence' => "The three English spans align distinctly: “A Traveler” identifies Grim as a member, “join the Travelers” names the faction, and “the Traveler's Camp” names its camp. Japanese and Chinese preserve the same member/faction/camp sequence. Apply those exact forms to the three existing Korean spans only.",
      'patches' => [
        ['트래블러 그림 온위그', '트래블러(Traveler) 그림 온위그'],
        ['트래블러에 들어갈', '트래블러(Travelers)에 들어갈'],
        ['트래블러 야영지를', "트래블러 야영지(Traveler's Camp)를"]
      ]
    },
    '43038' => {
      'status' => 'uncertain',
      'evidence' => 'English calls the Siren “A Traveler,” with capitalization that may signal faction membership, but supplies no explicit affiliation or membership context. Japanese says 旅の女 and Chinese says 无名无姓的旅行者, both compatible with an ordinary traveler. Preserve 여행자 and retain this material ambiguity.'
    },
    '43104' => {
      'status' => 'excluded',
      'evidence' => "English says the quiet place 'doesn't see many travelers'; Japanese says outsiders and Chinese says visitors. This is ordinary foot traffic, not the faction."
    },
    '50875' => {
      'status' => 'excluded',
      'evidence' => "English 'Greetings, traveler' is direct address. Japanese calls the addressee 冒険者 and Chinese uses a generic 旅行者 greeting; no faction context appears."
    },
    '51350' => {
      'status' => 'not-an-issue',
      'evidence' => 'The English speaker weighs joining the Warsworn or the Travelers; Korean already has the exact canonical bilingual form 트래블러(Travelers). Japanese and Chinese corroborate the faction choice. Preserve the cell.'
    },
    '51568' => {
      'status' => 'excluded',
      'evidence' => "English 'traveler' is a direct vocative before advice about Alserund's sands; Japanese gives only the warning and Chinese also uses a vocative. No Travelers faction is referenced."
    },
    '54294' => {
      'status' => 'accepted',
      'evidence' => 'English first has the compound “a Traveler ship” and then the separate plural faction reference “there’s Travelers”; Japanese has the faction form for both clauses. The first Korean singular label already matches exactly, while the second unlabeled span aligns with the plural clause. Label only the second span.',
      'patches' => [['트래블러가 있다면', '트래블러(Travelers)가 있다면']]
    },
    '55739' => {
      'status' => 'not-an-issue',
      'evidence' => 'The complete English name is “Travelers Moon Camp”; Korean already retains it as one full bilingual compound, 트래블러 달빛 야영지(Travelers Moon Camp). Japanese and Chinese support the same camp. Do not nest or duplicate the label.'
    },
    '55797' => {
      'status' => 'excluded',
      'evidence' => "English 'traveler' is a standalone greeting; Japanese omits it and Chinese renders a generic greeting. No faction is named."
    },
    '57136' => {
      'status' => 'excluded',
      'evidence' => "English 'traveler' is a direct address while identifying Didenhil Village; Japanese omits the address and Chinese uses vocative 旅行者. This is not faction membership."
    },
    '58755' => {
      'status' => 'excluded',
      'evidence' => "English 'Greetings traveler' is direct address to a visitor. Japanese says 旅のお方 and Chinese uses a generic greeting, with no faction reference."
    },
    '61208' => {
      'status' => 'accepted',
      'evidence' => 'English presents the Travelers as a distinctive way of life; Chinese explicitly paraphrases living “the Travelers’ life.” Japanese omits the name but does not conflict. Label only the existing Korean comparison phrase.',
      'patches' => [['트래블러처럼', '트래블러(Travelers)처럼']]
    },
    '61772' => {
      'status' => 'excluded',
      'evidence' => "English 'traveler' is a direct vocative in a statement about travel to Mel Senshir; Japanese omits the address and Chinese uses a generic vocative. No faction context is present."
    }
  }.freeze

  SCHOLIA_DECISION = {
    'status' => 'accepted',
    'evidence' => 'English has two explicit full-name spans: “the Scholia Arcana” in the opening sentence and “the Scholia Arcana Courtyard” at the end. Japanese and Chinese identify the Arcana Academy/奥术学院. Add the established Korean spelling only at those two full source spans; leave every shorthand “the Scholia” and ordinary 학술원 reference untouched.',
    'patches' => [
      ['아르카나 학술원의 이념', '스콜리아 아르카나(Scholia Arcana)의 이념'],
      ['아르카나 학술원 안뜰', '스콜리아 아르카나 안뜰(Scholia Arcana Courtyard)']
    ]
  }.freeze

  module_function

  def read_tsv(path)
    CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
  end

  def row_key(row)
    [row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
  end

  def source_texts(row)
    english = JSON.parse(row['en_texts_json'].to_s.empty? ? '[]' : row['en_texts_json']).compact.join("\n")
    japanese = JSON.parse(row['ja_texts_json'].to_s.empty? ? '[]' : row['ja_texts_json']).compact.join("\n")
    [english, japanese, row['zh_text'].to_s]
  end

  def apply_patches(old, patches)
    text = old.dup
    applied = []
    patches.each do |before, after|
      count = text.scan(Regexp.new(Regexp.escape(before))).length
      raise "expected one exact span #{before.inspect}, found #{count}" unless count == 1
      text = text.sub(before, after)
      applied << { 'old_span' => before, 'new_span' => after }
    end
    [text, applied]
  end

  def make_review(index_row, source_row, entity_key, decision)
    old = source_row.fetch('work_text')
    indexed = index_row.fetch('korean_current')
    raise "active index/inventory text mismatch #{row_key(index_row).inspect}" unless indexed == old

    patches = decision.fetch('patches', [])
    new_text, applied = apply_patches(old, patches)
    raise 'no-op disposition has patches' if %w[excluded not-an-issue uncertain].include?(decision.fetch('status')) && !patches.empty?

    english, japanese, chinese = source_texts(source_row)
    {
      'resource' => index_row['resource'],
      'ID_Linha' => index_row['ID_Linha'],
      'Tipo_Variante' => index_row['Tipo_Variante'],
      'entity_key' => entity_key,
      'status' => decision.fetch('status'),
      'old' => old,
      'new' => new_text,
      'evidence' => decision.fetch('evidence'),
      'pre_edit_text' => old,
      'english' => english,
      'japanese' => japanese,
      'chinese' => chinese,
      'changed_spans_json' => JSON.generate(applied)
    }
  end

  def coalesce_reviews(reviews)
    reviews.group_by { |review| row_key(review) }.values.map do |group|
      original = group.first.fetch('old')
      merged_text = original
      dispositions = {}
      group.each do |review|
        raise 'same-cell proposals have different source text' unless review.fetch('old') == original
        entity = review.fetch('entity_key')
        raise "duplicate entity proposal #{entity}" if dispositions.key?(entity)
        dispositions[entity] = review.fetch('status')
        merged_text = ReviewedNameBatches.rebase_review(
          original, review.fetch('new'), merged_text
        )
      end
      merged = group.first.dup
      merged['entity_key'] = dispositions.keys.join('|')
      merged['entity_dispositions_json'] = JSON.generate(dispositions)
      merged['new'] = merged_text
      merged['status'] = if merged_text != original
                           'accepted'
                         elsif dispositions.value?('uncertain')
                           'uncertain'
                         elsif dispositions.values.all? { |status| status == 'excluded' }
                           'excluded'
                         else
                           'not-an-issue'
                         end
      merged['evidence'] = group.map do |review|
        "#{review.fetch('entity_key')}: #{review.fetch('evidence')}"
      end.join(' ')
      merged
    end.sort_by { |review| [review['resource'], review['ID_Linha'].to_i] }
  end

  def run
    index_rows = read_tsv(INDEX).map(&:to_h)
    inventory_rows = read_tsv(INVENTORY).map(&:to_h)
    inventory = inventory_rows.to_h { |row| [row_key(row), row] }
    travelers = index_rows.select do |row|
      row['entity_key'] == TRAVELERS && row['status'] == 'uncertain'
    end
    raise "expected 38 current Travelers holds, found #{travelers.length}" unless travelers.length == 38
    raise 'duplicate current Travelers key' unless travelers.map { |row| row_key(row) }.uniq.length == travelers.length
    raise 'decision key set does not match current Travelers holds' unless travelers.map { |row| row['ID_Linha'] }.sort == DECISIONS.keys.sort

    reviews = travelers.map do |index_row|
      source_row = inventory.fetch(row_key(index_row)) { raise "inventory key missing #{row_key(index_row).inspect}" }
      make_review(index_row, source_row, TRAVELERS, DECISIONS.fetch(index_row['ID_Linha']))
    end

    scholia_row = index_rows.find do |row|
      row['entity_key'] == SCHOLIA && row['resource'] == 'default' && row['ID_Linha'] == '43038'
    end
    raise 'Scholia Arcana default:43038 occurrence missing' unless scholia_row
    raise 'Scholia Arcana default:43038 is no longer uncertain' unless scholia_row['status'] == 'uncertain'
    scholia_source = inventory.fetch(row_key(scholia_row)) { raise 'Scholia Arcana inventory key missing' }
    reviews << make_review(scholia_row, scholia_source, SCHOLIA, SCHOLIA_DECISION)

    reviews = coalesce_reviews(reviews)
    output_headers = (HEADERS + ['entity_dispositions_json']).uniq
    CSV.open(OUTPUT, 'wb', col_sep: "\t", write_headers: true, headers: output_headers, force_quotes: true) do |csv|
      reviews.each { |review| csv << output_headers.map { |header| review[header] } }
    end
    counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
    changed = reviews.count { |row| row['old'] != row['new'] }
    puts "reviewed=#{reviews.length} (Travelers=#{travelers.length}, Scholia=1); " \
         "dispositions=#{counts.sort.to_h}; proposed_changes=#{changed}; output=#{OUTPUT}"
  end
end

TravelersResidualContextFollowup.run if $PROGRAM_NAME == __FILE__
