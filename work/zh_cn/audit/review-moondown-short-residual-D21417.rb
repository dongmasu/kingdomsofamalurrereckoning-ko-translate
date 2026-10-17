#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'apply-reviewed-proper-name-discovery'

module MoondownShortResidualD21417
  extend self

  M = ReviewedNameBatches
  D = 21_417
  ENTITY = 'place:camp-moondown'
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  TARGETS = {
    '18071' => {
      'status' => 'uncertain',
      'evidence' => 'The isolated “Off to Moondown” line has no camp, military, or Alfar context. Japanese 月入りの丘 and Chinese 月落 retain the place name but do not establish that this is specifically Camp Moondown. Preserve the already bilingual Korean form and do not infer a global alias.'
    },
    '22492' => {
      'status' => 'not-an-issue',
      'evidence' => 'English says Moondown has not fallen and links it to Canwen’s defenses; Japanese 月入りの丘 and Chinese 月落营地 corroborate the defended camp/location. Korean already has the source-matched bilingual short form 문다운(Moondown). This is a row-scoped reference, not a global alias.'
    },
    '2675' => {
      'status' => 'not-an-issue',
      'evidence' => 'English says Ansilla was ordered to reinforce Moondown with troops; Japanese 月入りの丘 and Chinese 月落营地 corroborate the defended location. Korean already has 문다운(Moondown). Preserve the correct bilingual form and do not add a global alias.'
    },
    '30989' => {
      'status' => 'accepted',
      'new' => '문다운(Moondown)이 도움을 원한다면 돈을 내든지 이 고개를 지나도록 도와야 해. 앞에 있는 알파르(Alfar)에게 일거리와 돈이 많을 것 같아.',
      'evidence' => 'English personifies Moondown as the party requesting help in the Alfar pass/camp context. Japanese 月入りの丘 and Chinese 月落 corroborate the same named location/community. Add only the missing source-matched short label 문다운(Moondown), preserving the subject particle and sentence. This exact occurrence is row-scoped; no global alias is registered.'
    },
    '33127' => {
      'status' => 'accepted',
      'new' => '그녀는 자신을 믿지 못하지만, 우리가 아직 살아 있는 건 그녀 덕분이야. 다른 누구라도 벌써 문다운(Moondown)을 떠났을 거야.',
      'evidence' => 'English refers to leaving Moondown in the ongoing defense/camp narrative; Japanese confirms the departure meaning and Chinese explicitly names 月落营地. Add only the missing source-matched short label 문다운(Moondown), preserving the object particle and line meaning. This exact occurrence is row-scoped; no global alias is registered.'
    },
    '41640' => {
      'status' => 'accepted',
      'new' => '문다운(Moondown)에서 철수하라고 명령한 고렘의 판단은 옳았어.',
      'evidence' => 'English describes an order to withdraw from Moondown; Japanese 月入りの丘 and Chinese 月落营地 corroborate the defended location. Add only the missing source-matched short label 문다운(Moondown), preserving the locative particle. This exact occurrence is row-scoped; no global alias is registered.'
    },
    '42542' => {
      'status' => 'uncertain',
      'evidence' => 'The active source cells contain only the isolated label “Moondown” in English, Japanese, and Chinese. The name spelling is aligned, but no source establishes whether the referent is Camp Moondown or another location/form. Preserve Korean 문다운 unchanged and do not infer a global alias.'
    },
    '4731' => {
      'status' => 'not-an-issue',
      'evidence' => 'English says Moondown was left vulnerable before Tuatha attacked “our camp”; Japanese 月入りの丘 and Chinese 月落营地 corroborate the place. Korean already has 문다운(Moondown). Preserve this correct row-scoped bilingual reference without adding a global alias.'
    },
    '4818' => {
      'status' => 'not-an-issue',
      'evidence' => 'English asks for more time in Moondown and offers remaining fire; Japanese 月入りの丘 and Chinese 月落 place the request in the camp/settlement context. Korean already has 문다운(Moondown). Preserve it without adding a global alias.'
    },
    '50654' => {
      'status' => 'not-an-issue',
      'evidence' => 'English identifies Moondown as the Alfar-held strategic position in the valley; Japanese 月入りの丘 and Chinese 月落营地 corroborate. Korean already has 문다운(Moondown). Preserve the existing bilingual form and do not add a global alias.'
    },
    '63558' => {
      'status' => 'not-an-issue',
      'evidence' => 'English says the group will go to Moondown and fight; Japanese 月入りの丘 and Chinese 月落 corroborate the named location. Korean already has 문다운(Moondown). Preserve this exact row-scoped form without adding a global alias.'
    }
  }.freeze

  def key(row)
    M.key(row)
  end

  def row_key(row)
    key(row).reject(&:empty?).join(':')
  end

  def prepare
    glossary_table = M.table(GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    entity_rows = glossary.select { |row| row['entity_key'] == ENTITY }
    raise 'expected one existing Camp Moondown entity' unless entity_rows.length == 1
    entity = entity_rows.first
    raise 'Camp Moondown glossary identity changed' unless
      entity['english_canonical'] == 'Camp Moondown' &&
      entity['korean_canonical'] == '문다운 야영지(Camp Moondown)' &&
      entity['status'] == 'confirmed'
    raise 'Moondown must remain a row-scoped, non-global alias' unless
      entity['english_aliases'].to_s.split('|').reject(&:empty?).none? do |term|
        term.casecmp?('Moondown')
      end

    inventory = M.refresh_inventory
    candidate = entity.merge('english_aliases' => 'Moondown')
    generated = build_occurrences(inventory.values, [candidate]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    selected = generated.select do |row|
      key(row) == ['default', row['ID_Linha'], ''] &&
        TARGETS.key?(row['ID_Linha']) &&
        row['matched_english'].to_s.split('|').include?('Moondown')
    end
    expected = TARGETS.keys.map { |id| ['default', id, ''] }
    actual = selected.map { |row| key(row) }.sort
    raise "Moondown residual scope changed: #{actual.inspect}" unless actual == expected.sort

    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    index_keys = index.map { |row| [row['entity_key'], *key(row)] }
    raise 'duplicate active occurrence keys' unless index_keys.uniq.length == index_keys.length
    raise 'target Moondown occurrence is already indexed' if
      expected.any? { |source_key| index_keys.include?([ENTITY, *source_key]) }

    history = Dir.glob(File.join(__dir__, 'proper-name-edits-D*.tsv')) +
      Dir.glob(File.join(__dir__, 'proper-name-discovery-D*.tsv'))
    historical_keys = history.flat_map do |path|
      M.table(path).map(&:to_h).each_with_object([]) do |row, result|
        result << key(row) if row['entity_key'].to_s.split('|').include?(ENTITY)
      end
    end
    raise 'a target Moondown row was already dispositioned' unless
      (historical_keys & expected).empty?

    reviews = selected.map do |occurrence|
      source = inventory.fetch(key(occurrence))
      id = source.fetch('ID_Linha')
      decision = TARGETS.fetch(id)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text').to_s
      old = source.fetch('work_text')
      raise "missing aligned source locale at #{row_key(source)}" if
        [english, japanese, chinese].any?(&:empty?)
      raise "unexpected English match at #{row_key(source)}" unless
        english.match?(/(?<![A-Za-z])Moondown(?![A-Za-z])/i)
      new_text = decision.fetch('new', old)
      if decision['status'] == 'accepted'
        raise "stale Korean target at #{row_key(source)}" if new_text == old
        raise "missing expected name in old text at #{row_key(source)}" unless
          old.match?(/문다운(?:을|이|에서)/)
      else
        raise "non-accepted edit at #{row_key(source)}" unless new_text == old
      end
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => ENTITY, 'status' => decision.fetch('status'),
        'old' => old, 'new' => new_text, 'evidence' => decision.fetch('evidence'),
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => decision.fetch('status'))
      }
    end

    dispositions = reviews.group_by { |row| row['status'] }.transform_values(&:length)
    {
      glossary_table: glossary_table, glossary: glossary, entity: entity,
      index_table: index_table, index: index, selected: selected,
      reviews: reviews, dispositions: dispositions
    }
  end

  def apply
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    result = prepare
    glossary = result.fetch(:glossary)
    entity = result.fetch(:entity)
    entity['evidence_ids'] = (
      entity.fetch('evidence_ids').to_s.split('|') +
      ["D-#{D}"] + TARGETS.keys.map { |id| "default:#{id}" }
    ).uniq.join('|')
    entity['notes'] = [
      entity['notes'],
      "D-#{D} reviewed #{TARGETS.length} exact short-form Moondown source keys as row-scoped Camp Moondown references or holds. The `Moondown` alias remains absent globally."
    ].join(' ')

    index = result.fetch(:index)
    additions = result.fetch(:selected)
    index.concat(additions)
    index.sort_by! do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i,
       row['Tipo_Variante'].to_s, row['entity_key']]
    end
    M.write_table(GLOSSARY, result.fetch(:glossary_table).headers, glossary)
    M.write_table(M::INDEX, result.fetch(:index_table).headers, index)

    proposal = "/private/tmp/proper-name-edits-D#{D}-proposal.tsv"
    raise 'proposal already exists' if File.exist?(proposal)
    M.write_table(proposal, M::HEADERS.take(12), result.fetch(:reviews))
    M.run(proposal, D, 1)

    note = <<~TEXT

      ## D-#{D}: Row-Scoped Moondown References

      Reviewed 11 exact English short-form `Moondown` keys under the existing
      `place:camp-moondown` entry: #{result.fetch(:dispositions).sort.to_h.inspect}.
      Corrected only the three missing Korean bilingual labels. Two isolated
      references remain uncertain; six contextual references already used the
      canonical bilingual short form. No global `Moondown` alias or historical
      translation recount was added. Existing dispositions for other entities
      on these rows remain unchanged.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [report, addendum].each do |path|
      File.write(path, File.read(path) + note)
    end
    [
      File.join(M::ROOT, 'NEXT-SESSION.md'),
      File.join(M::ROOT, 'work/zh_cn/TRANSLATION_PROGRESS.md'),
      File.join(__dir__, 'README.md'),
      File.join(__dir__, 'decision-register-20261009.md'),
      File.join(__dir__, 'proper-name-continuation-validation-20261015.md')
    ].each do |path|
      text = File.read(path)
      marker = '### Verified Run D-21391-D-21401'
      raise "missing historical insertion point in #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{note}\n#{marker}"))
    end
    puts "D-#{D}: #{result.fetch(:dispositions).inspect}; new index keys=#{additions.length}"
  end
end

case ARGV.fetch(0, 'prepare')
when 'prepare'
  result = MoondownShortResidualD21417.prepare
  puts "Prepared D-#{MoondownShortResidualD21417::D}: #{result.fetch(:reviews).length} keys; " \
       "#{result.fetch(:dispositions).inspect}; " \
       "Texto edits=#{result.fetch(:reviews).count { |row| row['old'] != row['new'] }}."
when 'apply'
  MoondownShortResidualD21417.apply
else
  abort 'usage: review-moondown-short-residual-D21417.rb [prepare|apply]'
end
