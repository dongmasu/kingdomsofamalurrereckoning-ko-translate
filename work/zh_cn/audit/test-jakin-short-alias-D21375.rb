require 'minitest/autorun'
require_relative 'prepare-jakin-short-alias-D21375'

class JakinShortAliasHistoryTest < Minitest::Test
  def setup
    @before = {
      'resource' => 'default', 'ID_Linha' => '9438', 'Tipo_Variante' => '',
      'status' => 'accepted', 'evidence' => 'Existing scoped decision',
      'korean_current' => '자킨에게'
    }
    @inventory = { ['default', '9438', ''] => { 'work_text' => '제이킨(Jakin)에게' } }
    @after = @before.merge('korean_current' => '제이킨(Jakin)에게')
  end

  def test_updated_row_snapshot_does_not_reopen_history
    assert JakinShortAliasD21375.preserved_history?(@before, @after, @inventory)
  end

  def test_rejects_history_mutations_and_stale_snapshots
    refute JakinShortAliasD21375.preserved_history?(@before, @after.merge('status' => 'excluded'), @inventory)
    refute JakinShortAliasD21375.preserved_history?(@before, @after.merge('evidence' => 'Changed'), @inventory)
    refute JakinShortAliasD21375.preserved_history?(@before, @before, @inventory)
  end
end
