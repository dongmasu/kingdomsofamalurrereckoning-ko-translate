#!/usr/bin/env ruby

require 'minitest/autorun'
require 'tmpdir'
require_relative 'apply-reviewed-proper-name-discovery'

class ReviewedProperNameDiscoveryTest < Minitest::Test
  def setup
    @definitions = [{
      'entity_key' => 'skill:example', 'english_canonical' => 'Example',
      'english_aliases' => '', 'korean_canonical' => '예시(Example)',
      'category' => 'skill', 'status' => 'confirmed'
    }]
    @reviews = [{
      'resource' => 'default', 'ID_Linha' => '1', 'Tipo_Variante' => '',
      'entity_key' => 'skill:example', 'status' => 'accepted',
      'old' => '예시', 'new' => '예시(Example)',
      'evidence' => 'Exact menu name corroborated by all source locales.',
      'english' => 'Example', 'japanese' => '例', 'chinese' => '例',
      'entity_dispositions_json' => '{"skill:example":"accepted"}'
    }]
    @generated = [{
      'entity_key' => 'skill:example', 'resource' => 'default',
      'ID_Linha' => '1', 'Tipo_Variante' => ''
    }]
  end

  def validate(glossary = [], index = [])
    ReviewedProperNameDiscovery.validate!(@definitions, @reviews, @generated, glossary, index)
  end

  def test_exact_review_scope_passes
    validate
  end

  def test_quest_is_a_supported_discovery_category
    @definitions.first['category'] = 'quest'
    validate
  end

  def test_named_event_matches_existing_glossary_schema
    @definitions.first['category'] = 'named event'
    validate
  end

  def test_resource_matches_existing_glossary_schema
    @definitions.first['category'] = 'resource'
    validate
  end

  def test_gameplay_mechanic_matches_existing_glossary_schema
    entity_key = 'gameplay mechanic:example'
    @definitions.first['entity_key'] = entity_key
    @definitions.first['category'] = 'gameplay mechanic'
    @reviews.first['entity_key'] = entity_key
    @reviews.first['entity_dispositions_json'] = JSON.generate(entity_key => 'accepted')
    @generated.first['entity_key'] = entity_key
    validate
  end

  def test_lore_term_matches_existing_glossary_schema
    @definitions.first['category'] = 'lore term'
    validate
  end

  def test_unknown_category_is_rejected
    @definitions.first['category'] = 'unsupported'
    assert_raises(RuntimeError) { validate }
  end

  def test_missing_source_match_is_rejected
    @generated << @generated.first.merge('ID_Linha' => '2')
    assert_raises(RuntimeError) { validate }
  end

  def test_nonaccepted_edit_is_rejected
    @reviews.first['status'] = 'uncertain'
    assert_raises(RuntimeError) { validate }
  end

  def test_already_registered_entity_is_not_recounted
    assert_raises(RuntimeError) { validate(@definitions) }
  end

  def test_already_registered_occurrence_is_not_recounted
    assert_raises(RuntimeError) { validate([], @generated) }
  end

  def test_new_english_collision_is_rejected
    other = @definitions.first.merge('entity_key' => 'other:example')
    assert_raises(RuntimeError) { validate([other]) }
  end

  def test_unrelated_existing_homonyms_do_not_block_discovery
    other = @definitions.first.merge('entity_key' => 'person:other', 'english_canonical' => 'Other')
    validate([other, other.merge('entity_key' => 'unique-item:other')])
  end

  def test_duplicate_existing_entity_is_rejected
    other = @definitions.first.merge('entity_key' => 'person:other', 'english_canonical' => 'Other')
    assert_raises(RuntimeError) { validate([other, other]) }
  end

  def test_row_edit_requires_an_accepted_entity
    @reviews.first['entity_dispositions_json'] = '{"skill:example":"uncertain"}'
    assert_raises(RuntimeError) { validate }
  end

  def test_opaque_token_change_is_rejected
    @reviews.first['new'] += '$changed$'
    assert_raises(RuntimeError) { validate }
  end

  def test_localized_display_content_can_be_reviewed
    @reviews.first['old'] = '{*1Example} {1} <b>$target$</b>'
    @reviews.first['new'] = '{*1예시(Example)} {1} <b>$target$</b>'
    validate
  end

  def test_localized_marker_and_inner_opaque_tokens_remain_protected
    @reviews.first['old'] = '{*1Example <b>$target$</b>} {1}'
    [
      '{*2예시(Example) <b>$target$</b>} {1}',
      '{*1예시(Example) <i>$target$</i>} {1}',
      '{*1예시(Example) <b>$other$</b>} {1}',
      '{*1예시(Example) <b>$target$</b>} {2}',
      '{1} {*1예시(Example) <b>$target$</b>}',
      '{*1예시(Example) <b>$target$</b>} {1} {1}'
    ].each do |text|
      @reviews.first['new'] = text
      assert_raises(RuntimeError, text) { validate }
    end
  end

  def test_missing_evidence_is_rejected
    @reviews.first.delete('evidence')
    assert_raises(RuntimeError) { validate }
  end

  def test_blank_chinese_is_allowed_when_source_locale_has_no_text
    @reviews.first['chinese'] = ''
    validate
    inventory = {
      ['default', '1', ''] => {
        'en_texts_json' => '["Example"]',
        'ja_texts_json' => '["例"]',
        'zh_text' => ''
      }
    }
    ReviewedProperNameDiscovery.validate_sources!(@reviews, inventory)
  end

  def test_orphaned_backup_directory_blocks_registration
    Dir.mktmpdir('proper-name-discovery-test') do |directory|
      Dir.mkdir(File.join(directory, 'before-proper-name-D1'))
      assert_raises(RuntimeError) do
        ReviewedProperNameDiscovery.ensure_unused_batch!(1, directory, directory)
      end
    end
  end

  def test_byte_identical_existing_backup_allows_safe_resume
    Dir.mktmpdir('proper-name-discovery-test') do |directory|
      backup = File.join(directory, 'before-proper-name-D1')
      Dir.mkdir(backup)
      FileUtils.copy_file(
        ReviewedNameBatches.csv_path('default'),
        File.join(backup, 'locatexts_zh_cn.koalocatext_default.csv')
      )
      assert_nil ReviewedProperNameDiscovery.ensure_unused_batch!(1, directory, directory)
    end
  end

  def test_conflicting_existing_backup_blocks_resume
    Dir.mktmpdir('proper-name-discovery-test') do |directory|
      backup = File.join(directory, 'before-proper-name-D1')
      Dir.mkdir(backup)
      path = File.join(backup, 'locatexts_zh_cn.koalocatext_default.csv')
      File.write(path, 'not the active CSV')
      assert_raises(RuntimeError) do
        ReviewedProperNameDiscovery.ensure_unused_batch!(1, directory, directory)
      end
    end
  end

  def test_orphaned_manifest_blocks_registration
    Dir.mktmpdir('proper-name-discovery-test') do |directory|
      File.write(File.join(directory, 'proper-name-edits-D1.tsv'), 'fixture')
      assert_raises(RuntimeError) do
        ReviewedProperNameDiscovery.ensure_unused_batch!(1, directory, directory)
      end
    end
  end

  def test_report_from_another_date_blocks_registration
    Dir.mktmpdir('proper-name-discovery-test') do |directory|
      File.write(File.join(directory, 'named-scope-review-D1-19990101.md'), 'fixture')
      assert_raises(RuntimeError) do
        ReviewedProperNameDiscovery.ensure_unused_batch!(1, directory, directory)
      end
    end
  end

  def test_blank_english_canonical_is_rejected
    @definitions.first['english_canonical'] = ''
    assert_raises(RuntimeError) { validate }
  end

  def test_swapped_source_context_is_rejected
    inventory = {
      ['default', '1', ''] => {
        'en_texts_json' => '["Different"]',
        'ja_texts_json' => '["例"]', 'zh_text' => '例'
      }
    }
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate_sources!(@reviews, inventory)
    end
  end
end
