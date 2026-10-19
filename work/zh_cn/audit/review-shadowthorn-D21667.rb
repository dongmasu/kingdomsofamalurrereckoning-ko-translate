#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module ShadowthornD21667
  extend self

  D = 21_667
  CANONICAL = '섀도손(Shadowthorn)'
  HOLLOW = '섀도손 동굴(Shadowthorn Hollow)'
  ANCHOR_KEY = ['default', '14028', ''].freeze
  HOLLOW_KEY = ['default', '42510', ''].freeze
  EXCLUDED = {
    ['base', '1582', '11'] => '그림자 가시',
    ['default', '2357', ''] => '섀도스론(Shadowthorn)',
    ['default', '39881', ''] => '섀도쏜',
    ['default', '62125', ''] => '그림자가시'
  }.freeze
  EXPECTED_KEYS = (EXCLUDED.keys + [ANCHOR_KEY, HOLLOW_KEY]).freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:14028 explicitly locates Aurenda in the Fae hollow,
    Shadowthorn; default:42510 names Shadowthorn Hollow as the burial
    place of a Fae relic. Japanese シャドウソーン and シャドウソーン洞穴,
    with Chinese 暗影荆棘灵族洞穴 and 影刺谷, corroborate the place.
    Register only place:shadowthorn, with the explicit source alias
    Shadowthorn Hollow. Reuse the established 섀도손(Shadowthorn) at
    default:14028 and annotate the complete 섀도손 동굴(Shadowthorn Hollow)
    span at default:42510. Preserve the existing refuge wording at 14028.
    Exclude bare same-name labels base:1582:11 and default:2357/39881/62125
    from place ownership, unchanged: their referents are not established.
    In particular, do not infer that the base label is this place or that
    it is an identified item. D-383 was closed by D-19602 without identifying
    the bare 2357 label; D-4167 was closed by D-19651. Preserve those terminal
    histories, D-12654/D-19874 at 39881, and D-17984 at 62125.
    Preserve D-19925's hollow/cave correction at 42510 without resolving
    D-13030's separate wording questions. Existing D-20450 Aurenda exclusion
    and D-20691/D-20703 Fae dispositions remain untouched. These are new
    place-specific matches, not reclassifications or recounts of earlier
    terminal keys or global totals. All affix/base/default source rows were
    checked; there are six exact name-bearing keys and no affix hits.
    The official Korean manual extraction/reference has no direct entry.
  TEXT
  SPEC = {
    key: 'place:shadowthorn', english: 'Shadowthorn', category: 'place',
    korean: CANONICAL, aliases: 'Shadowthorn Hollow', variants: '섀도손',
    count: EXPECTED_KEYS.length, notes: NOTE
  }.freeze

  def transform(key, text, source)
    raise "unexpected Shadowthorn source #{key.inspect}" unless EXPECTED_KEYS.include?(key)

    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')

    if EXCLUDED.key?(key)
      expected_ja = key == ['default', '2357', ''] ? 'Shadowthorn' : 'シャドウソーン'
      expected_zh = case key
                    when ['base', '1582', '11'] then '暗影荆棘'
                    when ['default', '2357', ''] then 'Shadowthorn'
                    else '影棘'
                    end
      raise 'bare Shadowthorn locale evidence changed' unless
        english == 'Shadowthorn' && japanese == expected_ja && chinese == expected_zh
      raise 'excluded Shadowthorn Korean label changed' unless text == EXCLUDED.fetch(key)
      return [text, true]
    end

    if key == ANCHOR_KEY
      raise 'Shadowthorn hollow evidence missing' unless
        english.include?('in the Fae hollow, Shadowthorn.') &&
        japanese.include?('シャドウソーン') && chinese.include?('暗影荆棘灵族洞穴')
      raise 'established Shadowthorn Korean pair missing' unless text.scan(CANONICAL).length == 1
      return [text, false]
    end

    raise 'Shadowthorn Hollow locale evidence missing' unless
      english.include?('Fae relic buried in Shadowthorn Hollow.') &&
      japanese.include?('シャドウソーン洞穴') && chinese.include?('影刺谷')
    old = '섀도손 동굴'
    raise 'Shadowthorn Hollow Korean span count differs' unless text.scan(old).length == 1
    return [text, false] if text.include?(HOLLOW)

    raise 'unexpected Shadowthorn Hollow annotation' if text.include?("#{old}(")
    [text.sub(old, HOLLOW), false]
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Shadowthorn Hollow Place And Unclassified Homonyms', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) do |_spec, key, text, source|
      transform(key, text, source)
    end
  end

  def dry_run
    m = ReviewedNameBatches
    r = ReviewedProperNameDiscovery
    r.ensure_unused_batch!(D)
    inventory = m.table(m::INVENTORY).map(&:to_h).to_h do |row|
      [m.key(row), row]
    end
    raise 'incomplete aligned inventory' unless inventory.length == 73_430
    glossary = m.table(r::GLOSSARY)
    index = m.table(m::INDEX)
    definition = glossary.headers.zip([
      SPEC[:key], SPEC[:english], SPEC[:category], SPEC[:korean],
      SPEC[:aliases], SPEC[:variants], "D-#{D}", 'confirmed', SPEC[:notes]
    ]).to_h
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
      source = inventory.fetch(key)
      text = source.fetch('work_text')
      dispositions = {}
      matches.each do |_match|
        text, excluded = transform(key, text, source)
        dispositions[SPEC[:key]] = excluded ? 'excluded' : nil
      end
      status = if dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               elsif text == source.fetch('work_text')
                 'not-an-issue'
               else
                 'accepted'
               end
      dispositions.transform_values! { |value| value || status }
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => SPEC[:key], 'status' => status,
        'old' => source.fetch('work_text'), 'new' => text, 'evidence' => NOTE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    r.validate!([definition], reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    r.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    raise "unexpected Shadowthorn edit keys: #{edits.map { |row| m.key(row) }.inspect}" unless
      edits.map { |row| m.key(row) } == [HOLLOW_KEY]
    ProperNameCellEditor.prepare(File.binread(m.csv_path('default')), edits)
    puts "D-#{D} read-only dry run: #{generated.length} matches, " \
         "#{reviews.length} keys, #{edits.length} target edit; no files changed."
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then ShadowthornD21667.dry_run
  when ['apply'] then ShadowthornD21667.apply
  else abort 'usage: review-shadowthorn-D21667.rb dry-run|apply'
  end
end
