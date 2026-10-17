#!/usr/bin/env ruby

require_relative 'build-deity-proposals'

def deity(english)
  DeityProposals::ENTITIES.find { |entity| entity[:english] == english }
end

def check(english, before, expected)
  actual = DeityProposals.transform_entity(before, deity(english))
  raise "#{before.inspect}: #{actual.inspect} != #{expected.inspect}" unless actual == expected
end

check('Lyria', '리리아이자 우리의 수호신', '리리아(Lyria)이자 우리의 수호신')
check('Lyria', '리리아(Lyria)이지만', '리리아(Lyria)이지만')
check('Lyria', '리리아(Lyria)는 리리아 신전(Temple of Lyria)에 있다.',
      '리리아(Lyria)는 리리아 신전(Temple of Lyria)에 있다.')
check('Ethene', '에센의 눈(Eye of Ethene)', '에테네의 눈(Eye of Ethene)')
check('Ethene', '에센이 답했다.', '에테네(Ethene)가 답했다.')
check('Ethene', '에센이므로', '에테네(Ethene)이므로')
check('Ethene', '에센(Ethene)의 눈(Eye of Ethene)', '에테네의 눈(Eye of Ethene)')
check('Lopoku', '로포쿠(Lupoku)의 눈', '로포쿠(Lopoku)의 눈')
check('Mitharu', '*미사루*', '*미사루(Mitharu)*')
raise 'Mitharan should not match deity' unless DeityProposals.english_hits(['Mitharan']).empty?
puts 'PASS: deity proposal compound/copula/particle/alias fixtures'
