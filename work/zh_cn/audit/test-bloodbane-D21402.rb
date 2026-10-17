require 'minitest/autorun'
require_relative 'review-bloodbane-D21402'

class BloodbaneD21402Test < Minitest::Test
  def test_preserves_existing_canonical_and_suffix
    assert_equal '블러드베인(Bloodbane)이 나타났다.',
      BloodbaneD21402.transform('블러드베인(Bloodbane)이 나타났다.')
  end

  def test_normalizes_unpaired_name_semantic_rendering_and_typo
    assert_equal '블러드베인(Bloodbane)을 추적한다.',
      BloodbaneD21402.transform('블러드베인을 추적한다.')
    assert_equal '블러드베인(Bloodbane)이 죽었다.',
      BloodbaneD21402.transform('피의 재앙(Bloodbane)이 죽었다.')
    assert_equal '블러드베인(Bloodbane)이 곧 나타날 거야.',
      BloodbaneD21402.transform('브래드베인이 곧 나타날 거야.')
  end

  def test_pairs_species_and_named_monster_separately
    assert_equal '크루독(Crudok) 블러드베인(Bloodbane)이 나타났다.',
      BloodbaneD21402.transform('크루독 블러드베인(Crudok Bloodbane)이 나타났다.')
  end

  def test_rejects_text_without_a_reviewed_name_span
    assert_raises(RuntimeError) { BloodbaneD21402.transform('크루독(Crudok)이 나타났다.') }
  end

  def test_source_scope_is_exactly_38_default_rows
    rows = BloodbaneD21402.plan
    assert_equal 38, rows.length
    assert rows.all? { |row| row['resource'] == 'default' }
  end
end
