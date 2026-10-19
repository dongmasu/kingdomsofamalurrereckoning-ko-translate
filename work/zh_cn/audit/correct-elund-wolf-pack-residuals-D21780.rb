#!/usr/bin/env ruby

require_relative 'apply-proper-name-text-corrections-20261018'

module ElundWolfPackResidualsD21780
  extend self
  M = ReviewedNameBatches
  SPECS = [
    ['17230', 'person:elund-carth', '엘룬드(Elund Carth)', '엘룬드 카스(Elund Carth)',
     'Elund Carth',
     'English names Rathir council mouthpiece Elund Carth twice in this exact row; Japanese エランド・カース and Chinese 埃朗德·卡尔斯 name the same person. The first Korean full-name pair and all other registered full-name pairs use 엘룬드 카스(Elund Carth). Restore the missing 카스 in the second pair without changing the sentence, the existing person identity, or any prior row disposition/evidence.'],
    ['60253', 'faction:wolf-pack', '늑대 무리(Wolf Pack)', '울프 팩(Wolf Pack)',
     'Wolf Pack',
     'English explicitly names Brogan Adair and his Wolf Pack as the arena team in this row; Japanese ウルフパック and Chinese 狼群队 corroborate. The faction dictionary and other team references use 울프 팩(Wolf Pack), so correct this overlooked literal rendering. This is not the lower-case generic animal pack excluded at default:5605/27731. Preserve all prior team/member findings, English pairings and cumulative totals.']
  ].freeze

  def corrections(inventory)
    SPECS.map do |id, entity, old_span, new_span, english_name, evidence|
      key = ['default', id, '']
      source = inventory.fetch(key)
      raise "English name missing at #{key}" unless
        JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.include?(english_name) }
      old = source.fetch('work_text')
      raise "expected one residual span #{key}" unless old.scan(old_span).length == 1
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'old' => old, 'new' => old.sub(old_span, new_span),
        'evidence' => evidence
      }
    end
  end

  def run
    ProperNameTextCorrections20261018.run(
      21_780, corrections(M.refresh_inventory),
      'Elund Carth Full-Name And Wolf Pack Team Residuals'
    )
  end
end

ElundWolfPackResidualsD21780.run if $PROGRAM_NAME == __FILE__
