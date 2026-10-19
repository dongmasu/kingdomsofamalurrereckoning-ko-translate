#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewZungarFamilySitesD21611
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_611
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of three new non-person scopes across affix/base/default.
    Existing person:zungar and person:hrindi-zungar dispositions, including
    prior exclusions of collective and place references, remain untouched.
    They are not evidence that the family/place terminology itself was
    normalized. Register the explicit Zungar family collective, Zungar Shaft
    place and Windstone Vale place separately, without a colliding global
    Zungar alias. The plural Zungars is an attested collective alias, not a
    new individual. English 32149 explicitly identifies four mining families,
    so the collective is a family rather than a newly inferred race.
    Reuse established surname 중가르 from the existing
    Zungar/Hrindi labels; normalize 준가르/즈웅가르 only in the selected
    explicit collective scopes. Remove the misleading racial 족 suffix and
    adjust only particles attached to the reviewed family-name span.
    Keep Feld Zungar's full name and every other family's wording unchanged.
    Japanese ズンガー・ファミリー and Chinese 尊加尔家族 corroborate the
    collective. Zungar Shaft's base Japanese remains English; its default
    Japanese ズンガー・シャフト and Chinese 尊加尔竖井 support a mine shaft,
    not a mechanical axle. English 16039 separately locates the family mine
    north of Whitestone. Use the existing default 갱도 rather than base 축.
    English Windstone Vale, Japanese ウィンドストーン・ベイル and Chinese
    风石谷 support the named vale; retain existing 윈드스톤 계곡 and add
    its complete English name. Do not infer that generic Windstone objects
    are this place or extend the family alias to every surname occurrence.
    Chinese 44033 reverses English "aren't exactly kin"; Japanese 39329
    changes the English advice. Neither discrepancy changes the collective
    name identity; preserve existing English-led Korean clauses here.
    The official Korean manual extraction/reference supplies no direct
    entry for these names. Preserve all other names, actions, tokens and
    line endings. These are focused new entity/key events, not historical
    global translation totals. Full discovery/residual validation remains
    incomplete. Published release ZIP unchanged.
  TEXT
  SPECS = [
    {
      entity: 'family:zungar', english: 'Zungar family', korean: '중가르 가문',
      category: 'people', aliases: 'Zungars',
      variants: '중가르 가문|준가르 가문|즈웅가르 일가',
      edits: {
        ['default', '630', ''] => ['준가르(Zungar)족은', '중가르 가문(Zungars)은'],
        ['default', '1637', ''] => ['준가르(Zungars)', '중가르 가문(Zungars)'],
        ['default', '4047', ''] => ['중가르(Zungar)와', '중가르 가문(Zungars)과'],
        ['default', '5288', ''] => ['중가르족이', '중가르 가문(Zungars)이'],
        ['default', '5737', ''] => ['중가르족', '중가르 가문(Zungars)'],
        ['default', '7671', ''] => ['준가르(Zungars)', '중가르 가문(Zungars)'],
        ['default', '11267', ''] => ['중가르(Zungar) 가문', '중가르 가문(Zungar family)'],
        ['default', '11896', ''] => ['중가르(Zungar) 가문', '중가르 가문(Zungar family)'],
        ['default', '12135', ''] => ['중가르(Zungar)는', '중가르 가문(Zungars)은'],
        ['default', '15404', ''] => ['중가르(Zungars)는', '중가르 가문(Zungars)은'],
        ['default', '16039', ''] => ['중가르(Zungar) 가문', '중가르 가문(Zungar family)'],
        ['default', '16990', ''] => ['중가르 놈들', '중가르 가문(Zungars) 놈들'],
        ['default', '18874', ''] => ['중가르 가문', '중가르 가문(Zungar family)'],
        ['default', '23288', ''] => ['준가르(Zungar)와', '중가르 가문(Zungars)과'],
        ['default', '23446', ''] => ['중가르(Zungar)들이', '중가르 가문(Zungars)이'],
        ['default', '24213', ''] => ['중가르를', '중가르 가문(Zungars)을'],
        ['default', '24750', ''] => ['중가르가', '중가르 가문(Zungars)이'],
        ['default', '28800', ''] => ['중가르(Zungars)', '중가르 가문(Zungars)'],
        ['default', '32149', ''] => ['준가르,', '중가르 가문(Zungars),'],
        ['default', '32183', ''] => ['준가르 가문', '중가르 가문(Zungars)'],
        ['default', '33595', ''] => ['중가르는', '중가르 가문(Zungars)은'],
        ['default', '37686', ''] => ['중가르와', '중가르 가문(Zungars)과'],
        ['default', '39324', ''] => ['준가르족', '중가르 가문(Zungars)'],
        ['default', '39329', ''] => ['준가르족은', '중가르 가문(Zungars)은'],
        ['default', '43618', ''] => ['중가르족과', '중가르 가문(Zungars)과'],
        ['default', '44033', ''] => ['중가르와', '중가르 가문(Zungars)과'],
        ['default', '44584', ''] => ['중가르 놈들', '중가르 가문(Zungars) 놈들'],
        ['default', '50179', ''] => ['중가르...', '중가르 가문(Zungars)...'],
        ['default', '52757', ''] => ['중가르 일당', '중가르 가문(Zungars)'],
        ['default', '55350', ''] => ['준가르(Zungars)', '중가르 가문(Zungars)'],
        ['default', '57026', ''] => ['준가르와', '중가르 가문(Zungars)과'],
        ['default', '57200', ''] => ['준가르 가문', '중가르 가문(Zungar family)'],
        ['default', '57219', ''] => ['준가르 가문', '중가르 가문(Zungar family)'],
        ['default', '59807', ''] => ['중가르가', '중가르 가문(Zungars)이'],
        ['default', '59922', ''] => ['즈웅가르(Zungar) 일가', '중가르 가문(Zungar family)'],
        ['default', '64741', ''] => ['준가르 가문', '중가르 가문(Zungar Family)']
      }
    },
    {
      entity: 'place:zungar-shaft', english: 'Zungar Shaft', korean: '중가르 갱도',
      category: 'place', aliases: '', variants: '중가르 갱도|중가르의 축',
      edits: {
        ['base', '1230', '11'] => ['중가르(Zungar)의 축', '중가르 갱도(Zungar Shaft)'],
        ['default', '16136', ''] => ['중가르 갱도', '중가르 갱도(Zungar Shaft)']
      }
    },
    {
      entity: 'place:windstone-vale', english: 'Windstone Vale', korean: '윈드스톤 계곡',
      category: 'place', aliases: '', variants: '윈드스톤 계곡',
      edits: {
        ['default', '19931', ''] => ['윈드스톤 계곡', '윈드스톤 계곡(Windstone Vale)']
      }
    }
  ].freeze

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions, reviews, generated_all = [], [], []
    SPECS.each do |spec|
      english, korean, entity = spec.values_at(:english, :korean, :entity)
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => spec.fetch(:category), 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => spec.fetch(:aliases), 'korean_variants' => spec.fetch(:variants),
        'evidence_ids' => (["D-#{D}"] + spec.fetch(:edits).keys.map { |key| key.reject(&:empty?).join(':') }).join('|'),
        'status' => 'confirmed', 'notes' => CONTEXT
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected source scope #{entity}" unless
        generated.map { |row| M.key(row) }.sort == spec.fetch(:edits).keys.sort
      definitions << definition
      generated_all.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        old = source.fetch('work_text')
        from, to = spec.fetch(:edits).fetch(key)
        raise "expected one exact Korean span #{key.inspect}" unless old.scan(from).length == 1
        revised = old.sub(from, to)
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entity, 'status' => 'accepted', 'old' => old, 'new' => revised,
          'evidence' => CONTEXT,
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(entity => 'accepted')
        }
      end
    end
    raise 'expected 39 distinct keys' unless reviews.map { |row| M.key(row) }.uniq.length == 39
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    puts "D-#{D}: one family and two places, 39 keys, 39 Texto edits; prepare only."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new')) }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewZungarFamilySitesD21611.prepare
  when ['apply'] then ReviewZungarFamilySitesD21611.apply
  else abort 'usage: review-zungar-family-sites-D21611.rb [prepare|apply]'
  end
end
