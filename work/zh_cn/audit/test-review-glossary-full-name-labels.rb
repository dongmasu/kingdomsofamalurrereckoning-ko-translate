#!/usr/bin/env ruby
# encoding: UTF-8

require 'minitest/autorun'

# Load only definitions: the legacy script's CLI writes review manifests.
source = File.read(File.join(__dir__, 'review-proper-name-glossary-pending.rb'))
definitions = source.split("\nindex = CSV.read(INDEX,", 2).first
module_eval_context = Module.new
module_eval_context.module_eval(definitions, File.join(__dir__, 'review-proper-name-glossary-pending.rb'))

class GlossaryFullNameLabelTest < Minitest::Test
end

GlossaryFullNameLabelTest.const_set(:CONTEXT, module_eval_context)

class GlossaryFullNameLabelTest
  def normalize(id, text)
    korean, english, pattern = CONTEXT.const_get(:FULL_NAMES).fetch(['default', id, ''])
    CONTEXT.instance_method(:edit_full_name).bind(Object.new.extend(CONTEXT))
      .call(text, korean, english, pattern)
  end

  def test_existing_full_labels_are_consumed_not_appended_twice
    {
      '10434' => '캠든 울플랙(Camden Wulflac)이 돌아왔다.',
      '41963' => '캠든 울플랙(Camden Wulflac)이 돌아왔다.',
      '50208' => '캠든 울플랙(Camden Wulflac)',
      '10277' => '세페드라 윌(Sephedra Wyll)',
      '40856' => '흐린디 중가르(Hrindi Zungar)',
      '16702' => '재닉 자매(Janick Sisters)'
    }.each do |id, text|
      assert_equal text, normalize(id, text), id
    end
  end

  def test_legacy_surname_pair_is_replaced_by_one_full_label
    assert_equal '캠든 울플랙(Camden Wulflac)이 돌아왔다.',
      normalize('10434', '캠든 울플랙(Wulflac)이 돌아왔다.')
  end
end
