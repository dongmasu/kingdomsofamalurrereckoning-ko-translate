#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module WoldsAtollD21506
  extend self

  M = ReviewedNameBatches
  D = 21_506
  WOLDS = 'place:the-wolds'
  STONE = 'item:stone-of-the-wolds'
  ATOLL = 'named_work:the-black-atoll'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  WOLDS_IDS = %w[
    1295 2798 3197 5599 8052 9079 9804 9967 10792 12436 13249 14677
    16241 18586 21022 24531 26743 27133 28381 29227 29609 30658
    35163 38187 38262 38632 43527 44807 44835 50599 54242 54881
    55451 56977 58557 59022 61611 61637
  ].freeze
  WOLDS_NOTE = 'English default:58557 places the Wolds in the western Plains of Erathell; default:2798 identifies its farmlands, default:29227 places Tala-Rane to its east, and default:26743 identifies the same region’s bandit bounty. Japanese ウォルズ and Chinese 沃尔兹 corroborate. Reuse the dominant 월즈 spelling; correct 볼즈, 울즈 and the label’s generic 황야 only in exact Wolds source rows. Use The Wolds on complete standalone labels and the four explicit mid-sentence The Wolds references; ordinary grammatical or sentence-initial the uses Wolds. Keep the separately registered Adessa district The Walls distinct despite its historical Korean 월즈 variant. The source geography inconsistency at default:28381 is outside this naming review and is not silently repaired.'
  STONE_NOTE = 'English base:272 names Stone of the Wolds; Japanese ウォルズの石 and Chinese 沃尔兹之石 corroborate the complete label. Pair it atomically as 월즈의 돌(Stone of the Wolds), rather than embedding a standalone place annotation. This item-label registration does not infer stone mechanics or uniqueness.'
  ATOLL_NOTE = 'English default:52446 explicitly calls The Black Atoll a painting; default:11495 supplies its title and Mudhold Fasting retrieval context. Japanese 黒い環礁 and Chinese 黑环礁 corroborate the named artwork, not a physical atoll. Reuse 검은 환초(The Black Atoll) from default:11495, retaining already-valid complete base annotations and all title punctuation. Black Atoll is a source-attested short lexical alias; do not rewrite generic atoll words or register an island.'
  COMMON = 'English is the identity/meaning anchor, with aligned Japanese and Chinese cross-checks. Preserve unrelated entities, particles, wording, tokens and line breaks. No PAK-derived evidence, source changes, or historical global translation recount.'
  DETAIL = <<~TEXT.chomp
    ### D-21506: The Wolds And The Black Atoll

    Registered `place:the-wolds` as `월즈(The Wolds)` with the source
    short form `Wolds`. Reviewed all 40 exact Wolds keys (2 base,
    38 default), normalizing 볼즈, 울즈, the mistranslated 황야 label,
    missing annotations and repeated mentions. Source-local full/short
    English forms remain distinguishable; unrelated geography and prose
    are not rewritten.

    The complete base:272 label is separately registered as
    `월즈의 돌(Stone of the Wolds)` under `item:stone-of-the-wolds`;
    its parent place occurrence is excluded, without inferring mechanics.
    Also registered the painting `named_work:the-black-atoll` as
    `검은 환초(The Black Atoll)` across all 5 exact base/default keys.
    English explicitly calls it a painting; Japanese and Chinese corroborate.
    Existing valid complete base annotations remain unchanged.
    Total: 46 entity matches across 45 distinct row keys, not 46 edited
    rows. Prior findings and historical translation totals are not recounted.
  TEXT

  def definition(headers, entity, en, ko, category, aliases, variants, ids, note)
    fields = {
      'entity_key' => entity, 'english_canonical' => en, 'category' => category,
      'korean_canonical' => ko, 'english_aliases' => aliases,
      'korean_variants' => variants, 'evidence_ids' => "D-#{D}|#{ids}",
      'status' => 'confirmed', 'notes' => "#{note} #{COMMON}"
    }
    headers.to_h { |h| [h, fields.fetch(h, '')] }
  end

  def expected_pairs
    WOLDS_IDS.map { |id| [WOLDS, 'default', id, ''] } +
      [[WOLDS, 'base', '272', '11'], [WOLDS, 'base', '3272', '11'],
       [STONE, 'base', '272', '11']] +
      %w[2499 3690].map { |id| [ATOLL, 'base', id, '11'] } +
      %w[11495 45087 52446].map { |id| [ATOLL, 'default', id, ''] }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    headers = glossary.headers
    definitions = [
      definition(headers, WOLDS, 'The Wolds', '월즈(The Wolds)', 'place', 'Wolds',
                 '볼즈|울즈|황야', 'base:3272:11|default:2798|default:29227|default:58557', WOLDS_NOTE),
      definition(headers, STONE, 'Stone of the Wolds', '월즈의 돌(Stone of the Wolds)', 'item', '',
                 '월즈(Wolds)의 돌', 'base:272:11', STONE_NOTE),
      definition(headers, ATOLL, 'The Black Atoll', '검은 환초(The Black Atoll)', 'named work', 'Black Atoll',
                 '검은 환초', 'base:2499:11|base:3690:11|default:11495|default:52446', ATOLL_NOTE)
    ]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Wolds/Atoll source scope differs' unless
      generated.map { |r| [r.fetch('entity_key'), *M.key(r)] }.sort == expected_pairs.sort
    reviews = generated.group_by { |r| M.key(r) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, occurrences|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      entities = occurrences.map { |r| r.fetch('entity_key') }.sort
      dispositions = {}
      if entities.include?(STONE)
        raise 'unexpected Wolds stone text' unless old == '월즈(Wolds)의 돌'
        new_text = '월즈의 돌(Stone of the Wolds)'
        dispositions = { WOLDS => 'excluded', STONE => 'accepted' }
        note = "#{WOLDS_NOTE} #{STONE_NOTE}"
      elsif entities == [WOLDS]
        full = english == 'The Wolds' || %w[9967 27133 54242 61611].include?(key[1])
        label = full ? 'The Wolds' : 'Wolds'
        pattern = /(?:월즈|볼즈|울즈|황야)(?:\s*\((?:The )?Wolds\))?/
        raise "missing Wolds Korean span #{key.inspect}" unless old.match?(pattern)
        raise "Wolds mention multiplicity differs #{key.inspect}" unless
          old.scan(pattern).length == english.scan(/\bWolds\b/).length
        new_text = if key == ['base', '3272', '11']
                     old
                   else
                     old.gsub(pattern, "월즈(#{label})")
                   end
        dispositions[WOLDS] = new_text == old ? 'not-an-issue' : 'accepted'
        note = WOLDS_NOTE
      elsif entities == [ATOLL]
        pattern = /검은 환초(?:\s*\(The Black Atoll\))?/
        raise "missing Black Atoll Korean span #{key.inspect}" unless old.scan(pattern).length == 1
        new_text = key[0] == 'base' ? old : old.sub(pattern, '검은 환초(The Black Atoll)')
        dispositions[ATOLL] = new_text == old ? 'not-an-issue' : 'accepted'
        note = ATOLL_NOTE
      else
        raise "unexpected Wolds/Atoll overlap #{key.inspect}"
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => new_text == old ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => new_text, 'evidence' => "#{note} #{COMMON}",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} keys; #{generated.length} matches; #{reviews.count { |r| r['old'] != r['new'] }} edits."
    [headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    previous.each { |k, v| raise "prior occurrence changed #{k.inspect}" unless current[k] == v }
    raise 'unexpected occurrence additions' unless (current.keys - previous.keys).sort == expected_pairs.sort
    M::DOCS.each do |path|
      marker = '<!-- current-proper-name-batch:end -->'
      text = File.read(path)
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.open(path, 'a') { |f| f.write("\n\n#{DETAIL}\n") }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then WoldsAtollD21506.prepare
  when ['apply'] then WoldsAtollD21506.apply
  else abort 'usage: review-wolds-black-atoll-D21506.rb [prepare|apply]'
  end
end
