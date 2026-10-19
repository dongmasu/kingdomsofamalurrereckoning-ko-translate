#!/usr/bin/env ruby

require_relative 'apply-proper-name-text-corrections-20261018'

module ThreeSpellingResidualsD21778
  extend self
  M = ReviewedNameBatches
  SPECS = [
    ['55977', 'event:orison', '오라이슨(Orison)', '오리슨(Orison)', 'Orison',
     'The exact English row names the Orison rite, already registered as 오리슨(Orison) under D-21649. Japanese オライゾン and Chinese 祈祷 support the same rite; they do not require a second Korean spelling. Correct the overlooked 오라이슨 span only. Prior not-an-issue identity disposition/evidence remains unchanged; this is a newly observed spelling inconsistency, not a new occurrence.'],
    ['60476', 'person:dulstan', '둘스텐(Dulsten)', '덜스턴(Dulsten)', 'Dulsten',
     'English lists the author Dulsten among collected works, matching the source-local Dulsten alias registered for Dulstan in D-21575/D-21576. Japanese ダルステン and Chinese 杜尔斯腾 corroborate. Reuse established 덜스턴 while preserving the exact English Dulsten spelling and the separate Aewald reference. Prior occurrence decisions are retained.'],
    ['29296', 'person:enton-aster', '엔턴 아스터(Enton Aster)', '엔턴 애스터(Enton Aster)', 'Enton Aster',
     'English explicitly identifies the twins father as Enton Aster. Japanese エントン・アスター and Chinese 伊顿·阿斯特尔 corroborate that same person. Base:4018/default:9305 and the registered full-name canonical use 엔턴 애스터(Enton Aster); correct only the overlooked full-name surname here. Do not alter bare Aster family wording or infer a global surname alias. Prior Enton/Enton Aster/Heric Aster decisions and evidence are retained.']
  ].freeze

  def corrections(inventory)
    SPECS.map do |id, entity, old_span, new_span, english_name, evidence|
      key = ['default', id, '']
      source = inventory.fetch(key)
      raise "source name missing at #{key}" unless
        JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.include?(english_name) }
      old = source.fetch('work_text')
      raise "expected one spelling residual at #{key}" unless old.scan(old_span).length == 1
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'old' => old, 'new' => old.sub(old_span, new_span),
        'evidence' => evidence
      }
    end
  end

  def run
    ProperNameTextCorrections20261018.run(
      21_778, corrections(M.refresh_inventory),
      'Orison, Dulsten And Enton Aster Spelling Residuals'
    )
  end
end

ThreeSpellingResidualsD21778.run if $PROGRAM_NAME == __FILE__
