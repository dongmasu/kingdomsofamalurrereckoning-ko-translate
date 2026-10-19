#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewSpecialAttacksD21623
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_623
  SPECS = {
    'Phantom Edge' => ['환영의 칼날', 'Phantom Edge|환영의 칼날'],
    'Guillotine' => ['단두대', 'Guillotine|단두대'],
    'Spine Bender' => ['척추 꺾기', 'Spine Bender|척추 꺾기|스파인 벤더'],
    'Orbital Blades' => ['궤도 칼날', '궤도 칼날'],
    'Crossfire' => ['크로스파이어', '크로스파이어'],
    'Talon Strikes' => ['발톱 강타', '탈론 스트라이크|발톱 강타'],
    'Shadow Strike' => ['그림자 강타', '그림자 강타'],
    'Twisted Claw' => ['뒤틀린 발톱', '뒤틀린 발톱'],
    'Horizon Edge' => ['지평선의 칼날', 'Horizon Edge|지평선의 칼날|지평선 끝|호라이즌 엣지'],
    'Gravedigger' => ['무덤 파는 자', 'Gravedigger|무덤 파는 자'],
    'Punishment' => ['응징', '징벌|응징'],
    'Savage Wing' => ['야만의 날개', '야만의 날개'],
    'Charged Entropy' => ['충전된 엔트로피', '충전된 엔트로피|Charged Entropy|충전 엔트로피'],
    'Maelstrom' => ['메일스트롬', '대격류|대격변|Maelstrom|메일스트롬'],
    'Shield Bash' => ['방패 강타', '방패 강타'],
    'Cross Slash' => ['십자 베기', '교차 베기|Cross Slash|십자 베기'],
    'Cyclone' => ['회오리바람', '회오리|Cyclone|회오리바람']
  }.freeze
  EXCLUSIONS = {
    'Guillotine' => %w[7129],
    'Gravedigger' => %w[24902 52067 61514],
    'Punishment' => %w[4912 5714 12069 13011 17167 21832 24515 25548
                       33036 34220 37287 42748 46941 47010 49792 52129
                       54490 59744 59775 61383],
    'Maelstrom' => %w[54495],
    'Cyclone' => %w[35572]
  }.freeze
  EVIDENCE = <<~TEXT.chomp
    English special-attack descriptions explicitly identify these weapon
    moves, their weapons and activation. Aligned Japanese and Chinese
    confirm the name spans and effects; exact cells are retained here.
    Normalize only the reviewed skill-name displays, including translated
    contents of {*1...}, preserving marker prefixes, braces, all embedded
    variables/tags, their order and line endings. Append the exact English
    name outside emphasis, avoiding duplicate/nested name annotations.
    Reuse established Korean translations; resolve literal/transliterated
    alternatives consistently within the confirmed move, not globally.
    Unrelated sentences, damage values, weapons and timing remain intact.
    Ordinary punishment, the execution device, the gravedigger occupation,
    the two explicitly drawn cards and enemy Cyclone Ammo are NOT these
    skills and are excluded unchanged. Maelstrom Gem is a separate item
    compound; base:2306 Maelstrom has no demonstrated move identity and
    remains uncertain unchanged. No bare generic word is made a skill by
    capitalization alone. Standalone move labels are corroborated by the
    explicit named move descriptions; base-item ambiguity is kept separate.
    All affix/base/default sources were searched. No direct official Korean
    manual entry fixes these selected names; no PAK evidence is used.
    New entity/row registrations do not recount earlier translation totals
    or modify pre-existing terminal entity dispositions. Full residual
    discovery/validation continues after these bounded batches.
  TEXT

  def entity(english)
    "skill:#{english.downcase.gsub(/[^a-z0-9]+/, '-').sub(/-\z/, '')}"
  end

  def revised(source, names)
    old = source.fetch('work_text')
    english = JSON.parse(source['en_texts_json']).compact.first.to_s
    return "#{SPECS.fetch(english)[0]}(#{english})" if names.include?(english)
    en_markers = english.scan(/\{\*1([^{}]+)\}/).flatten
    ko_markers = old.to_enum(:scan, /\{\*1([^{}]+)\}/).map { Regexp.last_match.dup }
    raise 'localized marker alignment differs' unless en_markers.length == ko_markers.length
    patches = []
    names.each do |name|
      canonical, variants = SPECS.fetch(name)
      ordinal = en_markers.index(name)
      if ordinal
        raise 'repeated source skill marker' unless en_markers.count(name) == 1
        marker = ko_markers.fetch(ordinal)
        inner = marker[1].sub(/\(#{Regexp.escape(name)}\)\z/, '')
        raise "unreviewed Korean display #{name}: #{inner}" unless variants.split('|').include?(inner)
        finish = marker.end(0)
        finish += "(#{name})".length if old[finish..].start_with?("(#{name})")
        patches << [marker.begin(0)...finish, "{*1#{canonical}}(#{name})"]
      elsif name == 'Shield Bash' && %w[41891 52395 64327].include?(source['ID_Linha'])
        from = source['ID_Linha'] == '41891' ? '방패로 후려칠' : '방패 강타'
        to = source['ID_Linha'] == '41891' ? "방패 강타(Shield Bash)를 가할" : "#{canonical}(#{name})"
        raise 'missing reviewed prose skill span' unless old.scan(from).length == 1
        start = old.index(from)
        patches << [start...(start + from.length), to]
      else
        raise "unexpected named-skill context #{name}/#{source['ID_Linha']}"
      end
    end
    text = patches.sort_by { |span, _text| -span.begin }.reduce(old.dup) do |result, (span, replacement)|
      result[span] = replacement
      result
    end
    text.sub!('}(Horizon Edge)와', '}(Horizon Edge)과') if source['ID_Linha'] == '9430'
    text
  end

  def prepare
    R.ensure_unused_batch!(D)
    R.ensure_unused_batch!(D + 1)
    inventory = M.refresh_inventory
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    definitions = SPECS.map do |english, (korean, variants)|
      values = {
        'entity_key' => entity(english), 'english_canonical' => english,
        'category' => 'skill', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}|D-#{D + 1}", 'status' => 'confirmed', 'notes' => EVIDENCE
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    generated = build_occurrences(inventory.values, definitions).map { |row| OCCURRENCE_HEADERS.zip(row).to_h }
    by_entity = definitions.to_h { |row| [row['entity_key'], row['english_canonical']] }
    reviews = generated.group_by { |r| M.key(r) }.map do |key, matches|
      source = inventory.fetch(key)
      dispositions = {}
      named = []
      matches.each do |match|
        name = by_entity.fetch(match['entity_key'])
        if key == ['base', '2306', '11'] && name == 'Maelstrom'
          dispositions[match['entity_key']] = 'uncertain'
        elsif (key == ['base', '4806', '11'] && name == 'Maelstrom') ||
              (key[0] == 'default' && EXCLUSIONS.fetch(name, []).include?(key[1]))
          dispositions[match['entity_key']] = 'excluded'
        else
          named << name
        end
      end
      text = named.empty? ? source['work_text'] : revised(source, named)
      named.each { |name| dispositions[entity(name)] = text == source['work_text'] ? 'not-an-issue' : 'accepted' }
      status = if text != source['work_text'] then 'accepted'
               elsif dispositions.value?('uncertain') then 'uncertain'
               elsif dispositions.values.all? { |s| s == 'excluded' } then 'excluded'
               else 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => source['work_text'], 'new' => text, 'evidence' => EVIDENCE,
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
        'chinese' => source['zh_text'], 'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |r| [M::RESOURCES.index(r['resource']), r['ID_Linha'].to_i] }
    raise 'unexpected source-row count' unless reviews.length == 75
    R.validate!(definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |r| r['resource'] }.each do |resource, rows|
      edits = rows.select { |r| r['old'] != r['new'] }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits) unless edits.empty?
    end
    puts "D-#{D}-D-#{D + 1}: #{definitions.length} skills; #{generated.length} occurrences; #{reviews.length} distinct rows; #{reviews.count { |r| r['old'] != r['new'] }} edits."
    reviews.select { |r| r['old'] != r['new'] }.each { |r| puts JSON.generate(r.slice('resource', 'ID_Linha', 'old', 'new')) }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    paths = %w[proper-name-discovery-definitions proper-name-discovery].map { |stem| File.join(__dir__, "#{stem}-D#{D}.tsv") }
    raise 'discovery artifacts exist' if paths.any? { |path| File.exist?(path) }
    M.write_table(paths[0], headers, definitions)
    M.write_table(paths[1], M::HEADERS.take(12), reviews)
    R.run([*paths, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewSpecialAttacksD21623.prepare
  when ['apply'] then ReviewSpecialAttacksD21623.apply
  else abort 'usage: review-special-attacks-D21623.rb [prepare|apply]'
  end
end
