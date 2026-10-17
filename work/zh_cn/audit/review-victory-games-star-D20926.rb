#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module VictoryGamesStarD20926
  extend self

  M = ReviewedNameBatches

  def run
    source = M.table(M::INVENTORY).find do |row|
      M.key(row) == ['base', '62', '11']
    end
    raise 'missing source title' unless source &&
      JSON.parse(source['en_texts_json']) == ['Victory Games Star']
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    key = 'title:victory-games-star'
    canonical = '승리의 경기 스타(Victory Games Star)'
    evidence = 'English Victory Games Star is an atomic title, not a standalone event label. Japanese ビクトリーゲームズスター and Chinese 胜利大赛明星 identify a star/famous competitor, not a literal celestial body or an award. Use 승리의 경기 스타(Victory Games Star), with the complete English title only once. D-20925 excluded this title from event-only normalization; that separate event disposition is preserved. Official Korean manual PDF p. 7 provides faction/quest context but does not name this title; no spelling is inferred from its omission. No PAK-derived evidence.'
    definition = {
      'entity_key' => key, 'english_canonical' => 'Victory Games Star',
      'category' => 'title', 'korean_canonical' => canonical,
      'english_aliases' => '', 'korean_variants' => '승리 게임의 별',
      'evidence_ids' => 'D-20926|base:62:11', 'status' => 'confirmed',
      'notes' => evidence
    }
    review = {
      'resource' => 'base', 'ID_Linha' => '62', 'Tipo_Variante' => '11',
      'entity_key' => key, 'status' => 'accepted',
      'old' => source.fetch('work_text'), 'new' => canonical,
      'evidence' => evidence,
      'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(key => 'accepted')
    }
    M.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D20926.tsv'), glossary.headers, [definition])
    M.write_table(File.join(__dir__, 'proper-name-discovery-D20926.tsv'), M::HEADERS, [review])
    puts 'Prepared 1 atomic title; no active CSV or glossary changed.'
  end
end

VictoryGamesStarD20926.run if $PROGRAM_NAME == __FILE__
