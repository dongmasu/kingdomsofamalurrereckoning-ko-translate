#!/usr/bin/env ruby

require_relative 'apply-proper-name-text-corrections-20261018'

module HallamSpacingD21781
  extend self
  M = ReviewedNameBatches
  IDS = %w[
    1461 4321 8101 8552 14991 17206 18319 18993 22970 24246
    28317 28805 29492 29665 34081 35035 35742 37263 37475 37941
    39699 41079 42329 43875 45796 45876 49109 58224 59952 61307
  ].freeze
  BOUNDARY = /([가-힣.!?])(?=할람\(Hallam\))/
  NOTE = 'Corrective word-boundary residual audit of all 93 exact Hallam source keys across affix/base/default. The existing canonical is 할람(Hallam); English names Hallam at every target, Japanese ハラム and Chinese 哈拉姆/哈兰 corroborate. Thirty Korean cells contain 33 lost boundaries immediately before that complete name pair: 20 after a Korean word and 13 after sentence punctuation. Insert only the missing ASCII spaces. Preserve the entire non-space text, all line breaks, existing personal-name choices and every prior indexed status/evidence; no entity or cumulative decision is added or recounted.'.freeze

  def normalize(text)
    text.gsub(BOUNDARY, '\1 ')
  end

  def corrections(inventory)
    source_scope = inventory.select do |_key, row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(/\bHallam\b/i) }
    end
    raise 'Hallam complete source scope differs' unless source_scope.length == 93
    targets = source_scope.select { |_key, row| row.fetch('work_text').match?(BOUNDARY) }
    raise 'Hallam exact spacing keys differ' unless
      targets.keys.sort == IDS.map { |id| ['default', id, ''] }.sort
    raise 'Hallam spacing count differs' unless
      targets.values.sum { |row| row.fetch('work_text').scan(BOUNDARY).length } == 33
    targets.map do |key, source|
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      raise "Hallam Japanese/Chinese corroboration differs #{key}" unless
        japanese.include?('ハラム') && source.fetch('zh_text').match?(/哈拉姆|哈兰/)
      old = source.fetch('work_text')
      new_text = normalize(old)
      raise 'Hallam correction changed non-space text' unless old.delete(' ') == new_text.delete(' ')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => 'person:hallam', 'old' => old, 'new' => new_text,
        'evidence' => NOTE
      }
    end
  end

  def run
    ProperNameTextCorrections20261018.run(
      21_781, corrections(M.refresh_inventory),
      'Hallam Word And Sentence Boundary Corrections'
    )
  end
end

HallamSpacingD21781.run if $PROGRAM_NAME == __FILE__
