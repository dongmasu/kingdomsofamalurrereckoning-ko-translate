#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module QuartenionD21670
  extend self

  D = 21_670
  CANONICAL = '쿼터니언(The Quartenion)'
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:12357 explicitly introduces excerpts from The Quartenion
    by Benedict Ashman and a numbered chapter. Japanese names the work
    四元数 with the author and an excerpt, while Chinese gives the author
    and book title 四元. Default:42324 is the identical complete title.
    Reuse the already paired 쿼터니언(The Quartenion) in the excerpt and
    replace only the isolated unpaired 콰터니언 title. Register a named
    work, not a mathematical term or a lore-writing system. Default:45438
    instead says Quartenion hand, an Erathi script/writing style; exclude
    that match and preserve its existing translation and D-13905 hold.
    No relationship between the title and that script is inferred.
    D-3596's terminal chapter-heading/lineation judgment is preserved.
    The official Korean manual has no direct title entry. All affix/base/
    default exact Quartenion matches were checked; only these three default
    keys exist. Other names, the author's annotation and line breaks remain
    untouched, and no historical translation total is recounted.
  TEXT

  def transform(_spec, key, text, source)
    raise 'unreviewed Quartenion key' unless
      key[0] == 'default' && key[2].empty? && %w[12357 42324 45438].include?(key[1])
    en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    zh = source.fetch('zh_text')
    if key[1] == '45438'
      raise 'script evidence changed' unless en.include?('Quartenion hand') &&
        ja.include?('四次元の手') && zh.include?('四元文字')
      return [text, true]
    end
    raise 'book-title evidence changed' unless
      en.include?('The Quartenion') && ja.include?('四元数') && zh.include?('四元')
    if key[1] == '12357'
      raise 'paired excerpt title missing' unless text.include?(CANONICAL)
      [text, false]
    else
      raise 'title label changed' unless ['콰터니언', CANONICAL].include?(text)
      [CANONICAL, false]
    end
  end

  def apply
    specs = [{
      key: 'named-work:the-quartenion', english: 'The Quartenion', category: 'named work',
      korean: CANONICAL, aliases: 'Quartenion', variants: '쿼터니언|콰터니언',
      count: 3, notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'The Quartenion Book And Separate Script', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

QuartenionD21670.apply if $PROGRAM_NAME == __FILE__
