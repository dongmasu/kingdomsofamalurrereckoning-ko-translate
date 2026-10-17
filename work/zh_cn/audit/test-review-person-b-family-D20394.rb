#!/usr/bin/env ruby

require_relative 'review-person-b-family-D20394'

def assert(value, message)
  raise message unless value
end

bronwen = {
  'entity_key' => 'person:bronwen',
  'english_canonical' => 'Bronwen',
  'korean_canonical' => '브론웬(Bronwen)',
  'korean_variants' => '브론웬'
}

complete = '브론웬 센(Bronwen Senn)에게 돌아가기'
result, unresolved, holds = PersonBReview.canonicalize(
  complete, [bronwen], ['Return to Bronwen Senn']
)
assert(result == complete && unresolved.empty? && holds.empty?,
       'complete Korean/English full name must remain intact')

unannotated = '브론웬 센에게 돌아가기'
result, unresolved, holds = PersonBReview.canonicalize(
  unannotated, [bronwen], ['Return to Bronwen Senn']
)
assert(result == unannotated && holds == ['person:bronwen:Bronwen Senn'],
       'unannotated multiword source name must be held, not partially annotated')

result, unresolved, holds = PersonBReview.canonicalize(
  '브론웬', [bronwen], ['Speak with Bronwen']
)
assert(result == '브론웬(Bronwen)' && unresolved.empty? && holds.empty?,
       'unambiguous single-word name should be annotated')

result, unresolved, holds = PersonBReview.canonicalize(
  '바튼(Barten) 찾기',
  [{
    'entity_key' => 'person:barten',
    'english_canonical' => 'Barten',
    'korean_canonical' => '바튼(Barten)',
    'korean_variants' => '바튼'
  }],
  ['Find Barten']
)
assert(result == '바튼(Barten) 찾기' && unresolved.empty? && holds.empty?,
       'capitalized UI verbs must not be mistaken for a compound name')

%w[Unlike Why Apparently].each do |prefix|
  result, unresolved, holds = PersonBReview.canonicalize(
    '바튼(Barten)',
    [{
      'entity_key' => 'person:barten',
      'english_canonical' => 'Barten',
      'korean_canonical' => '바튼(Barten)',
      'korean_variants' => '바튼'
    }],
    ["#{prefix} Barten"]
  )
  assert(result == '바튼(Barten)' && unresolved.empty? && holds.empty?,
         "sentence starter #{prefix} must not be mistaken for a compound name")
end

bedlym = {
  'entity_key' => 'person:bedlym',
  'english_canonical' => 'Bedlym',
  'korean_canonical' => '베들림(Bedlym)',
  'korean_variants' => 'Bedlym'
}
assert(PersonBReview.korean_forms(bedlym) == ['베들림'],
       'Latin glossary variants must not be treated as Korean text')
full_bedlym = '누어 베들림(Nuer Bedlym)'
result, unresolved, holds = PersonBReview.canonicalize(
  full_bedlym, [bedlym], ['Nuer Bedlym was disgraced.']
)
assert(result == full_bedlym && unresolved.empty? && holds.empty?,
       'a complete full-name annotation must not receive nested parentheses')

brun = {
  'entity_key' => 'person:brun',
  'english_canonical' => 'Brun',
  'english_aliases' => 'Brun the Bard',
  'korean_canonical' => '브룬(Brun)',
  'korean_variants' => '브룬|브런'
}
result, unresolved, holds = PersonBReview.canonicalize(
  '음유시인 브룬', [brun], ['Brun the Bard is not so bad.']
)
assert(result == '음유시인 브룬(Brun the Bard)' && unresolved.empty? && holds.empty?,
       'known epithet annotation must remain supported')

bayala = {
  'entity_key' => 'person:bayala',
  'english_canonical' => 'Bayala',
  'korean_canonical' => '바얄라(Bayala)',
  'korean_variants' => '바야라'
}
bayala_tirin = {
  'entity_key' => 'person:bayala-tirin',
  'english_canonical' => 'Bayala Tirin',
  'korean_canonical' => '바얄라 티린(Bayala Tirin)',
  'korean_variants' => '바야라 티린'
}
result, unresolved, holds = PersonBReview.canonicalize(
  '바얄라 티린(Bayala Tirin)',
  [bayala, bayala_tirin],
  ['Words of the Prophetess Bayala Tirin']
)
assert(result == '바얄라 티린(Bayala Tirin)' && unresolved.empty? && holds.empty?,
       'a full-name glossary entity must suppress its overlapping short-name hold')

bardan = {
  'entity_key' => 'person:bardan',
  'english_canonical' => 'Bardan',
  'korean_canonical' => '바르단(Bardan)',
  'korean_variants' => '바르단'
}
bardan_tam = {
  'entity_key' => 'person:bardan-tam',
  'english_canonical' => 'Bardan Tam',
  'korean_canonical' => '바르단 탐(Bardan Tam)',
  'korean_variants' => '바르단 탐'
}
result, unresolved, holds = PersonBReview.canonicalize(
  '바르단 탐에게 돌아가기',
  [bardan, bardan_tam],
  ['Return to Bardan Tam']
)
assert(result == '바르단 탐(Bardan Tam)에게 돌아가기' &&
       unresolved.empty? && holds.empty?,
       'a curated full-name form must annotate as a complete English name')

puts 'PASS: D-20394 whole-name preservation and Korean-form fixtures'
