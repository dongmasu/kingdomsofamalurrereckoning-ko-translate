#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ReviewBormBoneTownFollowupD21708
  extend self

  M = ReviewedNameBatches
  D = 21_708
  PROPOSALS = File.join(__dir__, "proper-name-review-proposals-D#{D}.tsv")

  REVIEWS = [
    {
      key: ['default', '25932', ''],
      status: 'accepted',
      old: '활시위의 보름(Borm)',
      new: '활시위의 보름(Borm of Bowstrings)',
      evidence: 'person:borm already owns this exact person reference. English names Borm of Bowstrings, Japanese 弓弦のボーム and Chinese 弓弦大师波尔姆 corroborate the epithet. Match the full English source in parentheses, preserving the established Korean rendering and existing entity owner.'
    },
    {
      key: ['default', '29681', ''],
      status: 'accepted',
      old: '활시위의 보름(Borm)',
      new: '활시위의 보름(Borm of Bowstrings)',
      evidence: 'person:borm already owns this exact person reference. English names Borm of Bowstrings, Japanese 弓弦のボーム and Chinese 弓弦大师波尔姆 corroborate the epithet. Match the full English source in parentheses, preserving the established Korean rendering and existing entity owner.'
    },
    {
      key: ['default', '53271', ''],
      status: 'not-an-issue',
      old: '활시위의 보름(Borm of Bowstrings)은 별로 대단한 일을 하진 않지만, 누구에게든 은신술을 가르쳐 준다고 들었어.',
      new: '활시위의 보름(Borm of Bowstrings)은 별로 대단한 일을 하진 않지만, 누구에게든 은신술을 가르쳐 준다고 들었어.',
      evidence: 'The existing person:borm owner and complete bilingual Borm of Bowstrings form are already correct. Preserve D-20140 and D-20803 history without recounting it.'
    },
    {
      key: ['default', '58643', ''],
      status: 'accepted',
      old: '모래밭 위로 솟은 창백한 바위와 높은 사망률 때문에 본 타운(Bone Town)이라고 불러.',
      new: '모래밭 위로 솟은 창백한 바위와 높은 사망률 때문에 뼈의 마을인 본 타운(Bone Town)이라고 불러.',
      evidence: 'Bone Town is the registered settlement at this key. English explains the name through bone-pale rocks and the death rate; Japanese ボーンタウン and Chinese 白骨镇 corroborate. Preserve the Korean etymological meaning while pairing the established place name.'
    }
  ].freeze

  def transform_rows(inventory)
    REVIEWS.map do |review|
      resource, id, variant = review.fetch(:key)
      source = inventory.fetch([resource, id, variant]) do
        raise "source key missing: #{review.fetch(:key).inspect}"
      end
      raise "stale Korean source at #{review.fetch(:key).inspect}" unless
        source.fetch('work_text') == review.fetch(:old)

      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      if %w[25932 29681].include?(id) && !english.include?('Borm of Bowstrings')
        raise 'Borm English evidence differs'
      end
      raise 'Bone Town English evidence differs' if id == '58643' &&
        !english.include?('Bone Town')

      {
        'resource' => resource,
        'ID_Linha' => id,
        'Tipo_Variante' => variant,
        'entity_key' => id == '58643' ? 'place:bone-town' : 'person:borm',
        'status' => review.fetch(:status),
        'old' => review.fetch(:old),
        'new' => review.fetch(:new),
        'evidence' => "D-#{D}: #{review.fetch(:evidence)}",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(
          (id == '58643' ? ['place:bone-town'] : ['person:borm'])
            .to_h { |entity| [entity, review.fetch(:status)] }
        )
      }
    end
  end

  def run
    inventory = M.refresh_inventory
    rows = transform_rows(inventory)
    raise 'duplicate proposal keys' unless rows.map { |row| M.key(row) }.uniq.length == rows.length
    raise 'batch exceeds 50 source keys' if rows.length > 50
    M.write_table(PROPOSALS, M::HEADERS, rows)
    M.run(PROPOSALS, D, nil, review_states: %w[accepted not-an-issue])

    note = <<~TEXT

      ## D-#{D}: Borm Full Epithet And Bone Town Etymology

      Reviewed four existing source keys. At `default:25932` and `default:29681`,
      preserve the `person:borm` owner and complete the English parenthetical
      from `(Borm)` to `(Borm of Bowstrings)`; `default:53271` already has the
      complete form and its prior D-20140/D-20803 judgments are preserved.
      At `default:58643`, retain the “town of bones” explanation while pairing
      the registered place as `뼈의 마을인 본 타운(Bone Town)`. No entity or
      occurrence key was added, and historical counts were not recounted.
    TEXT
    %W[
      named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
      named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md
      README.md decision-register-20261009.md
    ].each do |filename|
      path = File.join(__dir__, filename)
      File.open(path, 'a') { |file| file.write(note) }
    end
  end
end

ReviewBormBoneTownFollowupD21708.run if $PROGRAM_NAME == __FILE__
