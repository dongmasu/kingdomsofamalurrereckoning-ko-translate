#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

def expect(old, proposed, current, result)
  actual = ReviewedNameBatches.rebase_review(old, proposed, current)
  raise "unexpected merged result #{actual.inspect}" unless actual == result
end

expect('안루와 말리온', '안루(Anru)와 말리온', '안루와 말리온(Mallion)',
       '안루(Anru)와 말리온(Mallion)')
expect('안루', '안루(Anru)', '안루(Anru)', '안루(Anru)')
expect('안루와 말리온', '안루와 말리온', '안루(Anru)와 말리온',
       '안루(Anru)와 말리온')
expect('안루와 말리온', '안루(Anru)와 말리온', '안루와 말리온',
       '안루(Anru)와 말리온')
begin
  ReviewedNameBatches.rebase_review('말리언', '말리온', '말리아')
  raise 'overlapping correction was allowed'
rescue RuntimeError => error
  raise unless error.message.include?('overlapping reviewed')
end
puts 'PASS: independent name-edit merge; overlapping corrections rejected'
