require 'minitest/autorun'
require_relative 'review-enconeg-short-references-D21391'

class EnconegShortReferencesD21391Test < Minitest::Test
  def test_normalizes_short_spelling_variants_and_repeated_mentions
    old = '엔코네그가 나타났다. 엔코니그가 죽기 전에 구해야 한다.'
    english = 'Enconeg appeared. We must save Enconeg before he dies.'

    assert_equal(
      '엔코네그(Enconeg)가 나타났다. 엔코네그(Enconeg)가 죽기 전에 구해야 한다.',
      EnconegShortReferencesD21391.transform(old, english)
    )
  end

  def test_uses_the_source_short_name_instead_of_an_unmatched_full_name
    old = '엔코네그 홀(Enconeg Holn)이 인어를 발견했다. 엔코네그에게 돌아가자.'
    english = 'Enconeg found his mermaid. Return to Enconeg.'

    assert_equal(
      '엔코네그(Enconeg)가 인어를 발견했다. 엔코네그(Enconeg)에게 돌아가자.',
      EnconegShortReferencesD21391.transform(old, english)
    )
  end

  def test_preserves_an_already_canonical_short_pair
    text = '보상을 받으려면 엔코네그(Enconeg)에게 가져가야 한다.'

    assert_equal text, EnconegShortReferencesD21391.transform(text, 'Bring it to Enconeg.')
  end

  def test_updates_consonant_final_particles_for_the_canonical_vowel_final_name
    assert_equal(
      '엔코네그(Enconeg)를 구했다. 엔코네그(Enconeg)가 보상했다.',
      EnconegShortReferencesD21391.transform(
        '엔코넥을 구했다. 엔코넥(Enconeg)이 보상했다.',
        'I saved Enconeg. Enconeg rewarded me.'
      )
    )
  end

  def test_requires_one_korean_span_for_each_source_name
    assert_raises(RuntimeError) do
      EnconegShortReferencesD21391.transform('엔코넥에게 돌아가자.', 'Return to Enconeg. Enconeg will pay.')
    end
  end

  def test_exact_new_scope_has_no_duplicate_person_or_alias
    manifest = File.join(__dir__, 'proper-name-edits-D21391.tsv')
    if File.file?(manifest)
      m = ReviewedNameBatches
      rows = m.table(manifest)
      assert_equal EnconegShortReferencesD21391::TARGET_KEYS.sort,
                   rows.map { |row| m.key(row) }.sort
      assert_equal 20, rows.count { |row| row['status'] == 'accepted' }
      assert_equal 2, rows.count { |row| row['status'] == 'not-an-issue' }
      entity = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).find do |row|
        row['entity_key'] == EnconegShortReferencesD21391::ENTITY
      end
      assert_empty entity.fetch('english_aliases')
      return
    end

    result = EnconegShortReferencesD21391.plan

    assert_equal 22, result.fetch(:reviews).length
    assert_equal 20, result.fetch(:reviews).count { |row| row['status'] == 'accepted' }
    assert_equal 2, result.fetch(:reviews).count { |row| row['status'] == 'not-an-issue' }
    assert_equal 9, result.fetch(:old_keys).length
    assert_empty result.fetch(:canonical).fetch('english_aliases')
  end
end
