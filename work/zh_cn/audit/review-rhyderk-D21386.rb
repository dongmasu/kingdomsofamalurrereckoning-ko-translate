#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

module RhyderkD21386
  module_function

  def transform(text, english)
    protected = []
    hold = lambda do |label|
      token = "\uE000RHYDERK#{protected.length}\uE001"
      protected << [token, label]
      token
    end
    root = '(?:라이더크|라이데크|리더크)(?:\\(Rhyderk\\))?'
    if english.match?(/the Flame of Rhyderk/i)
      pattern = /#{root}의 불꽃(?: ?\((?:The |the )?Flame of Rhyderk\))?/
      raise 'missing named ballad span' unless text.match?(pattern)
      text = text.gsub(pattern) { hold.call('라이더크의 불꽃(The Flame of Rhyderk)') }
    end
    if english.include?('Flaming Sword of Rhyderk')
      pattern = /#{root}의 불타는 검/
      raise 'missing flaming sword span' unless text.match?(pattern)
      text = text.gsub(pattern) { hold.call('라이더크의 불타는 검(Flaming Sword of Rhyderk)') }
    elsif english.include?('Sword of Rhyderk')
      pattern = /#{root}의 검(?:\(Sword of Rhyderk\))?/
      raise 'missing sword span' unless text.match?(pattern)
      text = text.gsub(pattern) { hold.call('라이더크의 검(Sword of Rhyderk)') }
    end
    component = english[/\b(?:Blade of Rhyderk|Rhyderk's Blade)\b/i]
    if component
      pattern = /#{root}의 (?:칼날|검)(?:\((?:Blade of Rhyderk|Rhyderk's Blade)\))?/i
      raise 'missing blade component span' unless text.match?(pattern)
      text = text.gsub(pattern) { hold.call("라이더크의 칼날(#{component})") }
    end
    text = text.gsub(/#{root}/, '라이더크(Rhyderk)')
    protected.each { |token, label| text = text.gsub(token, label) }
    text
  end
end

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English default:17832 explicitly calls Rhyderk an ancient sword and The
  Flame of Rhyderk the ballad of Sir Creth/Sir Airmer; default:48185 calls the
  blade a core component of the legendary greatsword, and default:39661
  distinguishes finding that component from forging the completed weapon.
  Japanese ライデック/ライデルク and Chinese 莱德克/瑞德克 corroborate.
  Reuse the dominant Korean 라이더크, replacing 라이데크 and 리더크.
  Register the weapon, the complete ballad title, and the blade-component
  labels separately; Blade of Rhyderk and Rhyderk's Blade are attested local
  component labels. Sword of Rhyderk and Flaming Sword of Rhyderk references
  describe the completed weapon, not a second person or a new sword entity.
  Full compound annotations are protected before pairing the remaining bare
  weapon names, preventing nested parentheses. The official Korean manual
  PDF p. 7 distinguishes greatswords and faction quests, including the House
  of Ballads, but does not list this particular sword or ballad. All three
  resources were searched; 22 distinct rows occur in base/default.
TEXT
specs = [
  {
    key: 'unique-item:rhyderk', english: 'Rhyderk', category: 'unique item',
    korean: '라이더크(Rhyderk)', variants: '라이더크|라이데크|리더크',
    count: 22, notes: context
  },
  {
    key: 'named-work:flame-of-rhyderk', english: 'The Flame of Rhyderk',
    category: 'named work', korean: '라이더크의 불꽃(The Flame of Rhyderk)',
    variants: '라이더크의 불꽃', count: 7, notes: context
  },
  {
    key: 'unique-item:blade-of-rhyderk', english: 'Blade of Rhyderk',
    aliases: "Rhyderk's Blade", category: 'unique item',
    korean: '라이더크의 칼날(Blade of Rhyderk)',
    variants: '라이더크의 칼날|라이더크의 검', count: 5, notes: context
  }
]
ReviewedDiscoverySpecs.run(
  21_386, 'Rhyderk Weapon, Component And Ballad', specs, context,
  '## D-21385: Virki And Upstairs'
) do |spec, _key, text, source|
  if spec[:key] == 'unique-item:rhyderk'
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    [RhyderkD21386.transform(text, english), false]
  else
    raise "missing complete #{spec[:key]} label" unless
      text.include?(spec[:english]) ||
      text.downcase.include?(spec[:english].downcase) ||
      text.include?("Rhyderk's Blade") || text.include?("Rhyderk's blade")
    [text, false]
  end
end
