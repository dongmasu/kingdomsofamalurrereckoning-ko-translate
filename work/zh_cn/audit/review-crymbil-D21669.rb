#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module CrymbilD21669
  extend self

  D = 21_669
  CANONICAL = '크림빌(Crymbil)'
  LABEL = '크림빌(The Crymbil)'
  BASE_LABEL = ['base', '2447', '11'].freeze
  DEFAULT_LABEL = ['default', '20118', ''].freeze
  LORE = ['default', '8742', ''].freeze
  COUNTS = {
    BASE_LABEL => 1,
    LORE => 8,
    ['default', '12848', ''] => 1,
    DEFAULT_LABEL => 1,
    ['default', '54478', ''] => 1,
    ['default', '55479', ''] => 1
  }.freeze
  ENGLISH = {
    BASE_LABEL => 'The Crymbil',
    DEFAULT_LABEL => 'The Crymbil',
    ['default', '12848', ''] => 'A book about the mysterious race known as the Crymbil.',
    ['default', '54478', ''] => 'I once worked with a Crymbil. They make great librarians, very fastidious.',
    ['default', '55479', ''] => 'A stone bust of the Crymbil spirit of water, Odonata.'
  }.freeze
  RACE_INTRO = 'The goblin races we now call Crymbil and Skratta were once a single unified race.'
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:8742 explicitly identifies Crymbil and Skratta as goblin
    races; default:12848 independently describes the mysterious Crymbil race.
    Japanese クリンビル and Chinese 克伦比尔 corroborate the name, not any
    additional lore. Reuse the Korean stem 크림빌 from the already paired
    base:2447:11 label 크림빌 (The Crymbil) and the existing prose pairs.
    Register people:crymbil as the race, with canonical 크림빌(Crymbil).
    The attested article-bearing alias The Crymbil is used only for the
    complete base:2447:11/default:20118 source labels; preserve the existing
    base label, including its spacing. Do not infer a separate named work,
    unique item, individual, or equipment identity from those labels.
    All six source keys were checked across affix/base/default: one base
    and five default keys, with no affix or compound equipment-label hits.
    Equipment compounds require independent identity evidence; a species
    modifier alone is insufficient and must not produce a new item owner
    or nested parentheses. Unknown source compounds fail closed for a
    separate exclusion review, rather than receiving a species annotation.
    At default:55479 annotate only the independent race reference; preserve
    Odonata and the existing bust description without inventing an item name.
    Preserve D-18275's terminal not-an-issue decision at default:20118 and
    D-2452's sentence judgment at default:8742. This name-only registration
    and missing annotation do not reopen or recount those translation
    decisions, the separate D-16492/D-20164 holds, or historical global totals.
    Preserve all other names, wording, particles, tokens, and line breaks.
    The official Korean manual extraction/reference has no direct Crymbil
    entry. Source CSVs remain read-only; no PAK is consulted.
  TEXT
  SPEC = {
    key: 'people:crymbil', english: 'Crymbil', category: 'people',
    korean: CANONICAL, aliases: 'The Crymbil', variants: '크림빌',
    count: COUNTS.length, notes: NOTE
  }.freeze

  def transform(_spec, key, text, source)
    count = COUNTS.fetch(key) { raise "unexpected Crymbil source #{key.inspect}" }
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    if key == LORE
      raise 'Crymbil race evidence changed' unless english.start_with?(RACE_INTRO + "\n\n")
    else
      raise 'Crymbil source label or description changed' unless english == ENGLISH.fetch(key)
    end
    raise 'Crymbil English mention count differs' unless english.scan(/\bCrymbil\b/).length == count
    raise 'Crymbil Japanese evidence missing' unless japanese.include?('クリンビル')
    raise 'Crymbil Chinese evidence missing' unless source.fetch('zh_text').include?('克伦比尔')

    if [BASE_LABEL, DEFAULT_LABEL].include?(key)
      return [text, false] if [LABEL, '크림빌 (The Crymbil)'].include?(text)
      raise 'unexpected Crymbil Korean label' unless text == '크림빌'
      return [LABEL, false]
    end

    # A complete equipment/work pair is not an independent species mention.
    pairs = text.scan(/\(([^()\r\n]*Crymbil[^()\r\n]*)\)/).flatten
    raise 'unreviewed atomic Crymbil compound or alias' unless pairs.all? { |pair| pair == 'Crymbil' }
    pattern = /(?<![가-힣A-Za-z])크림빌(?:\(Crymbil\))?/
    raise 'Crymbil Korean mention count differs' unless text.scan(pattern).length == count
    revised = text.gsub(pattern, CANONICAL)
    raise 'unpaired Crymbil Korean span remains' unless
      revised.scan('크림빌').length == count && revised.scan(CANONICAL).length == count
    [revised, false]
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Crymbil Goblin Race And Source Labels', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

CrymbilD21669.apply if $PROGRAM_NAME == __FILE__
