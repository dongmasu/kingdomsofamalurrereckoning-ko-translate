#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewExplorerInitiatesJournalsD21572
  extend self
  D = 21_572
  VOLUMES = {
    'I' => %w[972 2262], 'II' => %w[279 1372], 'III' => %w[1624],
    'IV' => %w[500 2336], 'V' => %w[128 2358], 'VI' => %w[3919],
    'VII' => %w[1773 3284], 'VIII' => %w[2490], 'IX' => %w[2966]
  }.freeze
  OWNED = [
    ['aloren', "Aloren's Journal", '알로렌', 'Aloren', '43'],
    ['bertran', "Bertran's Journal", '버트런', 'Bertran', '654'],
    ['cassera', "Cassera's Journal", '카세라', 'Cassera', '4030']
  ].freeze
  CONTEXT = <<~TEXT.chomp
    Review complete journal labels across all three resources. The nine
    numbered Explorer's Journal titles have 14 base rows; three named
    initiates' journal labels add three base rows. Japanese 探検家の日誌 and
    Chinese 探险家的日记 retain the corresponding volume numbers, while the
    aligned personal journal labels name Aloren, Bertran and Cassera.
    Reuse the established Korean nouns and name spellings; pair each complete
    title once. Repeated identical labels remain distinct CSV rows and do
    not prove one physical object. Default:3391/23748/25120/28821/30086/49126/
    49549/53696/54363 describe numbered parts of an explorer's journal found
    in Nerotelos, but do not contain the complete numbered titles: retain
    them without inventing a title alias or changing prior location holds.
    The journal-of-person descriptions at default:15996/22447/29200 retain
    the D-21570 person annotations and are not rewritten as full book titles.
    The official Korean manual describes books generically and supplies no
    exact journal title. This is a named-work registration, not a claim of
    author identity for the anonymous explorer or a new person decision.
  TEXT

  def specs
    volumes = VOLUMES.map do |number, ids|
      english = "Explorer's Journal, #{number}"
      {
        key: "named work:explorers-journal-#{number.downcase}",
        english: english, korean: "탐험가의 일지 #{number}(#{english})",
        category: 'named work', count: ids.length,
        variants: "탐험가의 일지 #{number}",
        notes: "English complete title at #{ids.map { |id| "base:#{id}:11" }.join(', ')}. Japanese and Chinese independently preserve volume #{number}; do not merge this volume with other numbered entries. Preserve the English comma and Roman numeral inside the annotation."
      }
    end
    volumes + OWNED.map do |key, english, korean, _person, id|
      {
        key: "named work:#{key}s-journal", english: english,
        korean: "#{korean}의 일지(#{english})", category: 'named work', count: 1,
        variants: "#{korean}의 일지",
        notes: "English base:#{id}:11 explicitly names this journal; its corresponding description identifies the Scholia Arcana initiate. Japanese and Chinese corroborate the journal owner. Use one complete-title annotation, not nested owner/title annotations. Keep prior person occurrences and dispositions unchanged."
      }
    end
  end

  def replacement(spec, key, old)
    english = spec.fetch(:english)
    if (owned = OWNED.find { |_name, title, _ko, _en, _id| title == english })
      _name, _title, korean, person, id = owned
      raise 'unexpected owned journal key' unless key == ['base', id, '11']
      expected = "#{korean}(#{person})의 일지"
      raise 'unexpected owned journal text' unless old == expected
    else
      number = VOLUMES.keys.find { |n| english == "Explorer's Journal, #{n}" }
      raise 'unexpected numbered journal key' unless number &&
        key[0] == 'base' && key[2] == '11' && VOLUMES.fetch(number).include?(key[1])
      raise 'unexpected numbered journal text' unless old == "탐험가의 일지 #{number}"
    end
    spec.fetch(:korean)
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Numbered Explorer And Initiate Journal Titles', specs, CONTEXT,
      '## D-21571: Five Named Headhunters'
    ) do |spec, key, text, source|
      raise 'journal title differs from source' unless
        JSON.parse(source.fetch('en_texts_json')).compact == [spec.fetch(:english)]
      [replacement(spec, key, text), false]
    end
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-explorer-initiates-journals-D21572.rb apply' unless ARGV == ['apply']
  ReviewExplorerInitiatesJournalsD21572.apply
end
