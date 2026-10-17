#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module LongroadStorehouseD21401
  module_function

  def transform(text)
    pattern = /롱로드(?:\(Longroad\))? 창고(?:\(Longroad Storehouse\))?/
    raise 'missing complete storehouse label' unless text.match?(pattern)
    text.gsub(pattern, '롱로드 창고(Longroad Storehouse)')
  end

  def run
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      English base:3411 and default:50433 repeat the complete display label
      Longroad Storehouse; Japanese 長き道の倉庫 and Chinese 长路仓库
      corroborate the warehouse wording. Reuse the established Korean
      롱로드 창고 and pair the entire label, not just Longroad. Register
      only this complete display-title scope: the labels alone do not
      establish ownership, identity of a standalone Longroad, or the site's
      gameplay function. No global Longroad alias is added. All three
      active and aligned source resources were searched; only these two
      row keys match. Official Korean manual PDF pp. 4 and 9 supply general
      map/exploration context, not this exact label.
    TEXT
    spec = {
      key: 'title:longroad-storehouse', english: 'Longroad Storehouse',
      category: 'title', korean: '롱로드 창고(Longroad Storehouse)',
      variants: '롱로드 창고|롱로드(Longroad) 창고', count: 2, notes: context
    }
    ReviewedDiscoverySpecs.run(
      21_401, 'Longroad Storehouse Complete Display Label', [spec], context,
      '## D-21395: Charnok Quarry And Royal Seal Complete Labels'
    ) do |_spec, key, text, _source|
      raise "unexpected storehouse scope #{key.inspect}" unless
        [['base', '3411', '11'], ['default', '50433', '']].include?(key)
      [transform(text), false]
    end
  end
end

LongroadStorehouseD21401.run if $PROGRAM_NAME == __FILE__
