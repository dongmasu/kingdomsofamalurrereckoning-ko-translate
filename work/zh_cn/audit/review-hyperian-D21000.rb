#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module HyperianD21000
  extend self
  M = ReviewedNameBatches
  ARTIFACT = 'item:hyperian'
  TEMPLE = 'place:hyperian-temple'
  ANTECHAMBER = 'place:hyperian-antechamber'
  COMPLEX = 'place:hyperian-complex'
  DISCOVERY = 'title:discovery-of-the-hyperian'
  GUARD = 'monster:hyperian-guard'
  TRAGEDY = 'event:hyperian-tragedy'
  RISES = 'title:the-hyperian-rises'
  STEM = '(?:하이페리언|하이페리온|하이페리안|히페리온|히페리안)'
  NAME = "#{STEM}(?:\\s*\\(Hyperian\\))?"
  LABEL = '하이페리언(Hyperian)'
  SPECS = [
    [ARTIFACT, 'Hyperian', 'unique item', LABEL, '',
     'default:7190|default:11906|default:59450',
     'English explicitly identifies the ancient Titan artifact/edifice, built of unknown material, which amplifies magic and rises to Idylla. The unique-item category records the named artifact, not a claim that it is portable inventory. Place-like references to the same structure do not create a separate homonym.'],
    [TEMPLE, 'Hyperian Temple', 'place', '하이페리언 신전(Hyperian Temple)', '',
     'base:3085:11|default:14974|default:4616',
     'English names the temple beneath Idylla; Japanese ハイペリアン寺院 and Chinese 海伯利安神庙 corroborate the complete venue. Normalize 사원/신전 to 신전 for this one venue. The antechamber of this temple is a separate complete sublocation.'],
    [ANTECHAMBER, 'Hyperian Antechamber', 'place', '하이페리언 전실(Hyperian Antechamber)',
     'Antechamber of the Hyperian Temple',
     'default:63837|default:356|default:50004|default:8810',
     'English names the antechamber and describes the Antechamber of the Hyperian Temple; Japanese 控えの間 and Chinese 前厅 corroborate the room. Preserve the longer source-local temple qualifier at default 8810 rather than nesting two English place labels.'],
    [COMPLEX, 'Hyperian Complex', 'place', '하이페리언 복합 시설(Hyperian Complex)', '',
     'default:19230|default:59450|default:62094',
     'English calls the surrounding constructed complex Hyperian Complex and explicitly distinguishes it from the artifact at default 59450/62094. Japanese ハイペリアン・ダンジョン and Chinese 海伯利安建筑群 corroborate the facility; use 복합 시설 rather than alternating 단지.'],
    [DISCOVERY, 'Discovery of the Hyperian', 'title', '하이페리언의 발견(Discovery of the Hyperian)', '',
     'base:1421:11|default:18428|default:26734',
     'The exact standalone title is shared by base 1421 and default 18428; Japanese ハイペリアンの発見 and Chinese 发现海伯利安 agree. Ordinary narrative discovery wording is not the title and is excluded from this title entity. No narrower item/quest/book subtype is assumed.'],
    [GUARD, 'Hyperian Guard', 'monster', '하이페리언 경비병(Hyperian Guard)', '',
     'default:15462',
     'Exact standalone enemy-class label, corroborated by Japanese ハイペリアン衛兵 and Chinese 海伯利安守卫. Monster category covers the complete enemy class without claiming a distinct species or unique individual.'],
    [TRAGEDY, 'Hyperian Tragedy', 'named event', '하이페리언의 비극(Hyperian Tragedy)',
     'tragedy at the Hyperian|tragedy of the Hyperian',
     'default:25192|default:27674|default:29073|default:1467|default:3732|default:19763|default:34026|default:44258',
     'English names the historical catastrophe; contextual aliases describe the same failed ascent and deaths, not a different artifact. Japanese ハイペリアンの悲劇 and Chinese 海伯利安悲剧/海伯利安之灾 corroborate. Pair the full event label, preserving source-local phrase order in the English parenthesis. Generic calamity descriptions without this named span are not automatically event aliases.'],
    [RISES, 'The Hyperian Rises', 'title', '하이페리언의 부상(The Hyperian Rises)', '',
     'default:42441',
     'Exact standalone title describes the rising of the artifact, not merely the artifact name. Chinese 海伯利安崛起 and the ascent context support the existing Korean 부상; Japanese 増加 is a divergent literal rendering. Preserve the complete English title and do not infer a narrower quest/book subtype.']
  ].freeze
  COMPOUNDS = [
    /Antechamber of the Hyperian Temple/i,
    /Hyperian (?:Temple|Antechamber|Complex|Guard|Tragedy)/i,
    /tragedy (?:at|of) the Hyperian/i,
    /The Hyperian Rises/i
  ].freeze

  def definitions
    SPECS.map do |entity, english, category, korean, aliases, ids, note|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => aliases,
        'korean_variants' => '히페리온|히페리안|하이페리온|하이페리안|하이페리언',
        'evidence_ids' => "D-21000-D-21003|#{ids}", 'status' => 'confirmed',
        'notes' => "#{note} English is primary; aligned Japanese ハイペリアン and Chinese 海伯利安 support identity. Retain the established majority Korean 하이페리언 consistently, not an unverified audio pronunciation. The official Korean manual provides general world/quest context but does not establish this expansion name. Complete compounds remain atomic."
      }
    end
  end

  def direct_artifact?(english)
    return false if english == 'Discovery of the Hyperian'

    remainder = english.dup
    COMPOUNDS.each { |pattern| remainder.gsub!(pattern, '') }
    remainder.match?(/\bHyperian\b/i)
  end

  def transform(old, english, key)
    text = old.dup
    protected = []
    states = {}
    protect = lambda do |entity, pattern, replacement|
      count = 0
      changed = false
      text = text.gsub(pattern) do |span|
        count += 1
        changed ||= span != replacement
        ordinal = protected.length
        protected << replacement
        "__HYPERIAN_ATOMIC_#{ordinal}__"
      end
      raise "missing complete Korean compound #{entity} #{key.inspect}" if count.zero?
      states[entity] = changed ? 'accepted' : 'not-an-issue'
    end

    if english == 'Discovery of the Hyperian'
      protect.call(DISCOVERY, /#{NAME}의 발견(?:\s*\(Discovery of the Hyperian\))?/,
                   '하이페리언의 발견(Discovery of the Hyperian)')
    elsif english.match?(/Discovery of the Hyperian/i)
      states[DISCOVERY] = 'excluded'
    end
    if english == 'Hyperian Guard'
      protect.call(GUARD, /#{NAME}\s+경비병(?:\s*\(Hyperian Guard\))?/,
                   '하이페리언 경비병(Hyperian Guard)')
    end
    if english.match?(/Hyperian Tragedy|tragedy (?:at|of) the Hyperian/i)
      phrase = english[/Hyperian Tragedy|tragedy (?:at|of) the Hyperian/i]
      label = if phrase.downcase == 'hyperian tragedy'
                'Hyperian Tragedy'
              else
                phrase
              end
      protect.call(TRAGEDY, /#{NAME}의 (?:비극|참사)(?:\s*\((?:Hyperian Tragedy|tragedy (?:at|of) the Hyperian)\))?/i,
                   "하이페리언의 비극(#{label})")
    end
    if english == 'The Hyperian Rises'
      protect.call(RISES, /#{NAME}의 부상(?:\s*\(The Hyperian Rises\))?/,
                   '하이페리언의 부상(The Hyperian Rises)')
    end

    if english.match?(/Antechamber of the Hyperian Temple/i)
      protect.call(ANTECHAMBER, /#{NAME}\s+(?:신전|사원)의 전실(?:\s*\(Antechamber of the Hyperian Temple\))?/,
                   '하이페리언 신전의 전실(Antechamber of the Hyperian Temple)')
      states[TEMPLE] = 'excluded'
    elsif english.match?(/Hyperian Antechamber/i)
      protect.call(ANTECHAMBER, /#{NAME}(?:의)?\s+전실(?:\s*\(Hyperian Antechamber\))?/,
                   '하이페리언 전실(Hyperian Antechamber)')
    end

    if english.match?(/Hyperian Temple/i) && !states.key?(TEMPLE)
      protect.call(TEMPLE, /#{NAME}\s+(?:신전|사원)(?:\s*\(Hyperian Temple\))?/,
                   '하이페리언 신전(Hyperian Temple)')
    end
    if english.match?(/Hyperian Complex/i)
      protect.call(COMPLEX, /#{NAME}\s+(?:복합 시설|단지)(?:\s*\(Hyperian Complex\))?/,
                   '하이페리언 복합 시설(Hyperian Complex)')
    end

    if direct_artifact?(english)
      previous = text.dup
      text.gsub!(/#{NAME}/, LABEL)
      raise "missing direct Korean Hyperian #{key.inspect}" unless text.include?(LABEL)
      states[ARTIFACT] = text == previous ? 'not-an-issue' : 'accepted'
    else
      states[ARTIFACT] = 'excluded'
    end
    text.gsub!(/__HYPERIAN_ATOMIC_(\d+)__/) { protected.fetch(Regexp.last_match(1).to_i) }
    if key == ['default', '59450', '']
      text.sub!('하이페리언 복합 시설(Hyperian Complex)를',
                '하이페리언 복합 시설(Hyperian Complex)을')
    end
    [text, states]
  end

  def run(mode)
    inventory = M.refresh_inventory
    defs = definitions
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    grouped = generated.group_by { |row| M.key(row) }
    raise "Hyperian source rows changed #{grouped.length}" unless grouped.length == 174
    reviews = grouped.map do |key, matches|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      updated, states = transform(old, english, key)
      entities = matches.map { |row| row.fetch('entity_key') }
      dispositions = states.select { |entity, _status| entities.include?(entity) }
      raise "unreviewed entity #{key.inspect}" unless dispositions.keys.sort == entities.sort
      raise "source-unexpected Korean name left #{key.inspect}" if
        updated.match?(/히페리온|히페리안|하이페리온|하이페리안/)
      status = if updated != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      reason = 'English identifies the same named Titan artifact/edifice, not Idylla itself; aligned Japanese ハイペリアン and Chinese 海伯利安 corroborate identity. Standardize only reviewed Hyperian spans to established 하이페리언 and preserve Korean particles. Pair the full Temple, Antechamber, Complex, Guard, Tragedy and exact standalone titles atomically; component-only matches are excluded from the artifact entity unless an independent artifact reference remains. Generic narrative discovery wording is not the complete title. The Tragedy aliases describe the same historical event, with Japanese 悲劇 and Chinese 悲剧/之灾 supporting the shared identity.'
      reason += ' The source-local Antechamber of the Hyperian Temple is preserved as a complete longer sublocation label.' if key == ['default', '8810', '']
      reason += ' Hyperian Guard is retained as a complete guard/role label, without asserting a separate species or individual.' if key == ['default', '15462', '']
      reason += ' Chinese 崛起 and the ascent context support the existing title 부상; do not follow the divergent Japanese 増加 literally.' if key == ['default', '42441', '']
      reason += ' Change the object particle 를 to 을 after replacing vowel-final 단지 with consonant-final 복합 시설.' if key == ['default', '59450', '']
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => status,
        'old' => old, 'new' => updated, 'evidence' => reason,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

    definition_path = File.join(__dir__, 'proper-name-discovery-definitions-D21000.tsv')
    review_path = File.join(__dir__, 'proper-name-discovery-D21000.tsv')
    M.write_table(definition_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, defs)
    M.write_table(review_path, M::HEADERS, reviews)
    puts "Hyperian: #{reviews.length} distinct rows, #{generated.length} entity matches; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    puts generated.group_by { |row| row['entity_key'] }.transform_values(&:length).inspect
    if mode == 'apply'
      ReviewedProperNameDiscovery.run([definition_path, review_path, '21000'])
    elsif mode != 'prepare'
      abort 'usage: review-hyperian-D21000.rb [prepare|apply]'
    end
  end
end

HyperianD21000.run(ARGV.fetch(0, 'prepare')) if $PROGRAM_NAME == __FILE__
