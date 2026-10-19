#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ProperNameDiscoveryD21756
  extend self
  M = ReviewedNameBatches
  D = 21_756
  DEFINITION_PATH = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  OUTPUT_PATH = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DISPOSITION_PATH = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT_PATH = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  ENTITY = 'title:grand-champion'
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  EXPECTED_KEYS = %w[
    3069 5070 6425 7394 8625 25047 30503 34288 40371 40966 43031 51097
    52121 62953 64714
  ].freeze
  LONGER_TITLE_KEYS = %w[5070 40966].to_set.freeze
  HEADER = %w[
    resource ID_Linha Tipo_Variante english_candidate disposition english
    japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  EDITS = {
    '3069' => ['그랜드 챔피언', '그랜드 챔피언(Grand Champion)'],
    '6425' => ['대챔피언', '그랜드 챔피언(Grand Champion)'],
    '7394' => ['그랜드 챔피언까지', '그랜드 챔피언(Grand Champion)까지'],
    '8625' => [
      '새 매그너스, 그러니까 투기장 최종 챔피언이 된 셈이야.',
      '새 매그너스, 그러니까 투기장 그랜드 챔피언(Grand Champion)이 된 셈이야.'
    ],
    '25047' => [
      '그랜드 챔피언의 칭호까지',
      '그랜드 챔피언(Grand Champion)이라는 칭호까지'
    ],
    '30503' => ['대투사로군.', '그랜드 챔피언(Grand Champion)이로군.'],
    '34288' => ['대투사구나.', '그랜드 챔피언(Grand Champion)이구나.'],
    '40371' => [
      '내가 이 투기장의 대장 챔피언이야.',
      '내가 이 투기장의 그랜드 챔피언(Grand Champion)이야.'
    ],
    '43031' => ['대챔피언이구나.', '그랜드 챔피언(Grand Champion)이구나.'],
    '51097' => ['그랜드 챔피언', '그랜드 챔피언(Grand Champion)'],
    '62953' => [
      '현 그랜드 챔피언이자',
      '현 그랜드 챔피언(Grand Champion)이자'
    ],
    '64714' => [
      '그랜드 챔피언이 되기를',
      '그랜드 챔피언(Grand Champion)이 되기를'
    ]
  }.freeze
  DISPOSITIONS = {
    '5070' => 'excluded',
    '40966' => 'excluded',
    '52121' => 'not-an-issue'
  }.freeze

  def evidence(id)
    base = 'English identifies the arena/tournament rank Grand Champion; aligned Japanese グランドチャンピオン corroborates the established Korean form 그랜드 챔피언, and Chinese 总冠军 is supplementary. Add or retain the complete bilingual title only at the exact English name span; preserve surrounding wording and particles.'
    if LONGER_TITLE_KEYS.include?(id)
      return "#{base} This is the distinct longer rank Grand Champion of Valor, not the standalone Grand Champion entity. Preserve the explicit D-21719 exclusion and current Korean text; its complete title and translation remain outside this batch."
    end
    if id == '52121'
      return "#{base} The existing exact form 그랜드 챔피언(Grand Champion) is already canonical; no cell change."
    end
    prior = {
      '3069' => 'D-591 already corrected the redundant 대그랜드 rendering to 그랜드 챔피언; this new finding registers and annotates the title without reopening or recounting that translation decision.',
      '51097' => 'D-20096 already corrected 대챔피언 to 그랜드 챔피언; this new finding adds the missing English title annotation without reopening or recounting that translation decision.',
      '8625' => 'D-2425 sentence-level uncertainty is not recounted; this finding resolves only the title-name span.',
      '30503' => 'D-9895 sentence-level uncertainty is not recounted; this finding resolves only the title-name span.',
      '40371' => "D-12779's broader dialogue/quest uncertainty is not recounted; this finding resolves only the title-name span.",
      '43031' => "D-13170's broader address/title uncertainty is not recounted; this finding resolves only the title-name span.",
      '62953' => "D-18043's broader dialogue uncertainty is not recounted; this finding resolves only the title-name span."
    }[id]
    [base, prior].compact.join(' ')
  end

  def build
    raise 'D-21756 post-review snapshot already exists; preserve it' if
      File.exist?(SNAPSHOT_PATH)

    definitions = M.table(DEFINITION_PATH).map(&:to_h)
    raise 'expected only the reviewed Grand Champion title definition' unless
      definitions.length == 1 &&
      definitions.first.fetch('entity_key') == ENTITY &&
      definitions.first.fetch('status') == 'confirmed'
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated.sort_by! { |row| [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i] }
    ids = generated.map { |row| row.fetch('ID_Linha') }
    raise "unexpected exact source keys: #{ids.inspect}" unless ids == EXPECTED_KEYS

    reviews = []
    dispositions = []
    generated.each do |hit|
      key = M.key(hit)
      id = key.fetch(1)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      korean = source.fetch('work_text')
      status = DISPOSITIONS.fetch(id, EDITS.key?(id) ? 'accepted' : 'not-an-issue')
      new_text = korean
      if EDITS.key?(id)
        old_span, new_span = EDITS.fetch(id)
        raise "expected one exact Korean span at #{key.inspect}" unless
          korean.scan(old_span).length == 1
        new_text = korean.sub(old_span, new_span)
      end
      raise "non-edit disposition changes text at #{key.inspect}" if
        status != 'accepted' && new_text != korean
      prior = M.table(M::INDEX).select { |row| M.key(row) == key }.map do |row|
        [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
      end
      review = {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => korean,
        'new' => new_text, 'evidence' => evidence(id), 'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
      reviews << review
      dispositions << {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'english_candidate' => 'Grand Champion', 'disposition' => status,
        'english' => english, 'japanese' => review.fetch('japanese'),
        'chinese' => source.fetch('zh_text'), 'korean' => korean,
        'evidence' => evidence(id),
        'prior_index_dispositions_json' => JSON.generate(prior)
      }
    end
    raise 'unexpected edited key count' unless reviews.count { |row| row['old'] != row['new'] } == 12
    if File.exist?(OUTPUT_PATH)
      raise 'D-21756 discovery draft differs; preserve and inspect it' unless
        M.table(OUTPUT_PATH).map(&:to_h) == reviews
    else
      M.write_table(OUTPUT_PATH, REVIEW_HEADERS, reviews)
    end
    if File.exist?(DISPOSITION_PATH)
      raise 'D-21756 disposition draft differs; preserve and inspect it' unless
        M.table(DISPOSITION_PATH).map(&:to_h) == dispositions
    else
      M.write_table(DISPOSITION_PATH, HEADER, dispositions)
    end
    puts "Prepared #{reviews.length} exact title keys: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    puts OUTPUT_PATH
  end

  def apply
    build
    ReviewedProperNameDiscovery.run([DEFINITION_PATH, OUTPUT_PATH, D.to_s])
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT_PATH, ShortLabelDiscovery20261018::HEADERS, candidates)
    append_batch_notes(candidates.length)
    puts "Next bounded short-label snapshot: #{candidates.length} groups at #{SNAPSHOT_PATH}"
  end

  def append_batch_notes(next_count)
    section = <<~TEXT


      ## D-#{D}: Grand Champion Title

      Registered `title:grand-champion` as `그랜드 챔피언(Grand Champion)`.
      Reviewed all 15 exact English title occurrences across the aligned
      sources and Korean cells: 12 title-span edits, one already-canonical
      occurrence, and two exclusions for the distinct longer title Grand
      Champion of Valor. Japanese `グランドチャンピオン` corroborates the
      established Korean form; Chinese `总冠军` is supporting evidence only.
      D-591 and D-20096 remain historical translation decisions and were not
      reopened or recounted. D-21719 exclusions at default:5070 and 40966
      remain unchanged. Older uncertainties at D-2425, D-9895, D-12779,
      D-13170, and D-18043 are narrowed only for this exact title-name scope;
      unrelated sentence-level findings remain historical.
      Next: D-#{D + 1}; review the #{next_count}-group bounded snapshot
      `proper-name-short-label-discovery-D#{D}.tsv`. It is not exhaustive and
      does not represent an overall remaining-item count.
      Full proper-name discovery/residual validation remains incomplete.
      Exact evidence and prior index dispositions are in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
    TEXT
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + section)
    end
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + section)
    end
    M::DOCS.each do |path|
      next unless path.end_with?('NEXT-SESSION.md', 'TRANSLATION_PROGRESS.md')
      text = File.read(path)
      text.sub!(
        /Next batch: D-#{D + 1};[^\n]*/,
        "Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{next_count} bounded groups; not exhaustive or a completion estimate)."
      )
      File.write(path, text)
    end
  end
end

ProperNameDiscoveryD21756.apply if $PROGRAM_NAME == __FILE__
