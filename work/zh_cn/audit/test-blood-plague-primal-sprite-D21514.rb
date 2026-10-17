#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'minitest/autorun'
require_relative 'review-blood-plague-primal-sprite-D21514'

class BloodPlaguePrimalSpriteD21514Test < Minitest::Test
  W = BloodPlaguePrimalSpriteD21514
  GLOSSARY_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def definitions
    W.definitions_for(GLOSSARY_HEADERS)
  end

  def fixture_inventory
    W::BLOOD_IDS.map do |id|
      old = case id
            when '3060', '11835', '17879', '21556'
              W::BLOOD_KOREAN
            when '10354', '53442'
              '혈액 역병'
            when '34', '26992', '55171'
              '피의 역병'
            else
              '혈역병'
            end
      old = "앞\r\n#{old}은 {TOKEN} 뒤" unless id == '131'
      row = {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'en_texts_json' => JSON.generate(['The Blood Plague spreads.']),
        'ja_texts_json' => JSON.generate(['ブラッドプラーグが広がっている。']),
        'zh_text' => '血疫正在扩散。',
        'work_text' => old
      }
      [W::M.key(row), row]
    end.concat(
      W::SPRITE_IDS.map do |id|
        english, japanese, chinese, old =
          case id
          when '354'
            ['Some Primal Sprites built a sewer nest.',
             'プライマル・スプライトが巣を作った。',
             '原初妖精开始筑巢。', "앞\r\n일부 원초의 정령들이 {TOKEN} 뒤"]
          when '18626'
            ['The nest of primal sprites and their thralls is gone.',
             'プライマル・スプライトの巣と手下は片付いた。',
             '原初妖精的巢穴和奴仆已被清除。',
             '앞 원초 스프라이트의 둥지와 종복 {TOKEN} 뒤']
          when '60650'
            ['A Primal Sprite showed up.',
             'プライマル・スプライトが現れた。',
             '一只原初妖精出现了。',
             '앞 원시 정령(Primal Sprite)이 나타났다. {TOKEN}']
          when '62308'
            ['Several Primal Sprites lead the nest.',
             '何体かのプライマル・スプライトが巣を率いる。',
             '几个原初妖精领导着巢穴。',
             '앞 여러 원초 스프라이트(Primal Sprite)가 {TOKEN} 뒤']
          end
        row = {
          'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
          'en_texts_json' => JSON.generate([english]),
          'ja_texts_json' => JSON.generate([japanese]),
          'zh_text' => chinese, 'work_text' => old
        }
        [W::M.key(row), row]
      end
    ).to_h
  end

  def generated_for(inventory)
    W.generated_for(inventory, definitions)
  end

  def reviews_for(inventory = fixture_inventory)
    W.reviews_for(inventory, generated_for(inventory))
  end

  def test_definitions_are_disease_and_creature_without_generic_aliases
    blood, sprite = definitions
    assert_equal W::BLOOD, blood.fetch('entity_key')
    assert_equal 'lore term', blood.fetch('category')
    assert_equal W::BLOOD_KOREAN, blood.fetch('korean_canonical')
    assert_empty blood.fetch('english_aliases')
    assert_includes blood.fetch('notes'), 'not a resource'
    assert_equal W::SPRITE, sprite.fetch('entity_key')
    assert_equal 'monster', sprite.fetch('category')
    assert_equal W::SPRITE_KOREAN, sprite.fetch('korean_canonical')
    assert_equal 'Primal Sprites', sprite.fetch('english_aliases')
    refute_includes sprite.fetch('english_aliases'), 'Sprite|'
    assert_includes sprite.fetch('notes'), 'not a person or faction'
    assert_includes sprite.fetch('notes'), 'At default:60650 only'
    assert_includes sprite.fetch('notes'), 'particle 이->가'
    assert_includes sprite.fetch('notes'), 'preserve unrelated particles'
  end

  def test_exact_42_source_keys_and_no_affix_or_base_matches
    inventory = fixture_inventory
    generated = generated_for(inventory)
    reviews = W.reviews_for(inventory, generated)
    assert_equal 42, W.expected_pairs.length
    assert_equal W.expected_pairs.sort,
                 generated.map { |row| [row.fetch('entity_key'), *W::M.key(row)] }.sort
    assert_equal 42, reviews.length
    assert reviews.all? { |row| row.fetch('resource') == 'default' }
    assert_equal W::BLOOD_IDS.sort,
                 reviews.select { |row| row.fetch('entity_key') == W::BLOOD }
                       .map { |row| row.fetch('ID_Linha') }.sort
    assert_equal W::SPRITE_IDS.sort,
                 reviews.select { |row| row.fetch('entity_key') == W::SPRITE }
                       .map { |row| row.fetch('ID_Linha') }.sort
    assert_equal 42, reviews.map { |row| W::M.key(row) }.uniq.length
  end

  def test_exact_change_count_normalizes_disease_and_retains_four_canonical_rows
    reviews = reviews_for
    blood = reviews.select { |row| row.fetch('entity_key') == W::BLOOD }
    assert_equal 34, blood.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal 4, blood.count { |row| row.fetch('status') == 'not-an-issue' }
    assert_equal 38, reviews.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal 4, reviews.count { |row| row.fetch('status') == 'not-an-issue' }
    assert_equal({ 'accepted' => 38, 'not-an-issue' => 4 },
                 reviews.group_by { |row| row.fetch('status') }.transform_values(&:length))
    blood.each do |row|
      assert_equal 1, row.fetch('new').scan(W::BLOOD_KOREAN).length
    end
  end

  def test_sprite_labels_keep_source_singular_and_plural
    rows = reviews_for.select { |row| row.fetch('entity_key') == W::SPRITE }
                      .to_h { |row| [row.fetch('ID_Linha'), row] }
    assert_includes rows.fetch('354').fetch('new'), '원초 스프라이트(Primal Sprites)들이'
    assert_includes rows.fetch('18626').fetch('new'), '원초 스프라이트(Primal Sprites)의 둥지'
    assert_includes rows.fetch('60650').fetch('new'), '원초 스프라이트(Primal Sprite)가'
    assert_includes rows.fetch('60650').fetch('evidence'), 'attached 이->가 particle correction'
    assert_includes rows.fetch('60650').fetch('evidence'), 'preserve unrelated'
    assert_includes rows.fetch('62308').fetch('new'), '원초 스프라이트(Primal Sprites)가'
    assert_equal 3, rows.values.count { |row| row.fetch('new').include?('(Primal Sprites)') }
    assert_equal 1, rows.values.count { |row| row.fetch('new').include?('(Primal Sprite)') &&
                                               !row.fetch('new').include?('(Primal Sprites)') }
  end

  def test_sentence_markup_particles_and_line_breaks_are_preserved
    rows = reviews_for.to_h { |row| [[row.fetch('entity_key'), row.fetch('ID_Linha')], row] }
    assert_equal "앞\r\n#{W::BLOOD_KOREAN}은 {TOKEN} 뒤",
                 rows.fetch([W::BLOOD, '34']).fetch('new')
    assert_equal "앞\r\n일부 원초 스프라이트(Primal Sprites)들이 {TOKEN} 뒤",
                 rows.fetch([W::SPRITE, '354']).fetch('new')
    assert_equal '앞 원초 스프라이트(Primal Sprite)가 나타났다. {TOKEN}',
                 rows.fetch([W::SPRITE, '60650']).fetch('new')
    assert reviews_for.all? do |row|
      row.fetch('old').scan(/\r\n|\r|\n/) == row.fetch('new').scan(/\r\n|\r|\n/)
    end
    assert reviews_for.all? do |row|
      row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE) ==
        row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
    end
  end

  def test_every_row_contains_full_aligned_evidence_and_explicit_disposition
    inventory = fixture_inventory
    generated = generated_for(inventory)
    reviews = W.reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, [], [])
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.each do |row|
      spec = W::SPECS.fetch(row.fetch('entity_key'))
      assert_includes row.fetch('english').downcase, spec.fetch(:english).downcase
      assert_includes row.fetch('japanese'), spec.fetch(:japanese)
      assert_includes row.fetch('chinese'), spec.fetch(:chinese)
      assert_includes row.fetch('evidence'), "#{row.fetch('resource')}:#{row.fetch('ID_Linha')}:"
      assert_equal({ row.fetch('entity_key') => row.fetch('status') },
                   JSON.parse(row.fetch('entity_dispositions_json')))
    end
  end

  def test_unexpected_key_or_locale_drift_fails_closed
    inventory = fixture_inventory
    generated = generated_for(inventory)
    assert_raises(RuntimeError) { W.reviews_for(inventory, generated.drop(1)) }
    assert_raises(RuntimeError) { W.reviews_for(inventory, generated + [generated.first]) }
    changed = fixture_inventory
    changed.fetch(['default', '354', ''])['ja_texts_json'] = JSON.generate(['unrelated'])
    assert_raises(RuntimeError) { W.reviews_for(changed, generated) }
    changed = fixture_inventory
    changed.fetch(['default', '34', ''])['zh_text'] = 'unrelated'
    assert_raises(RuntimeError) { W.reviews_for(changed, generated) }
    changed = fixture_inventory
    changed.fetch(['default', '62308', ''])['work_text'] += ' 원초 스프라이트(Primal Sprite)'
    assert_raises(RuntimeError) { W.reviews_for(changed, generated) }
  end

  def test_other_entity_records_and_holds_are_not_overwritten
    prior = {
      'entity_key' => 'resource:plagueshield', 'resource' => 'default',
      'ID_Linha' => '3060', 'Tipo_Variante' => '',
      'matched_english' => 'Plagueshield', 'english_source' => 'Blood Plague',
      'korean_current' => '역병 방호제', 'status' => 'accepted',
      'evidence' => 'existing resource disposition'
    }
    before = W.prior_records([prior])
    generated = generated_for(fixture_inventory)
    reviews = W.reviews_for(fixture_inventory, generated)
    additions = generated.map do |row|
      review = reviews.find { |candidate| W::M.key(candidate) == W::M.key(row) &&
                                          candidate.fetch('entity_key') == row.fetch('entity_key') }
      row.merge('status' => review.fetch('status'),
                'evidence' => "D-#{W::D}: #{review.fetch('evidence')}")
    end
    W.verify_prior_records!(before, [prior.merge('korean_current' => 'refreshed'), *additions])
    corrupted_prior = prior.merge('evidence' => 'changed')
    assert_raises(RuntimeError) do
      W.verify_prior_records!(before, [corrupted_prior, *additions])
    end
    assert_raises(RuntimeError) { W.prior_records([prior, prior.dup]) }
  end

  def test_edit_snapshot_requires_own_initial_candidate_record_and_preserves_other_keys
    row = {
      'entity_key' => W::BLOOD, 'resource' => 'default', 'ID_Linha' => '34',
      'Tipo_Variante' => '',
      'previous_status' => JSON.generate(
        W::BLOOD => 'needs-context', 'person:existing' => 'accepted'
      ),
      'previous_evidence' => JSON.generate(
        W::BLOOD => 'Candidate hit from the English source; verify this occurrence in context.',
        'person:existing' => 'existing reviewed disposition'
      )
    }
    assert W.verify_prior_snapshot!(row)

    corrupt = row.merge(
      'previous_status' => JSON.generate(
        W::BLOOD => 'accepted', 'person:existing' => 'accepted'
      )
    )
    assert_raises(RuntimeError) { W.verify_prior_snapshot!(corrupt) }

    corrupt = row.merge(
      'previous_evidence' => JSON.generate(
        W::BLOOD => 'different candidate evidence',
        'person:existing' => 'existing reviewed disposition'
      )
    )
    assert_raises(RuntimeError) { W.verify_prior_snapshot!(corrupt) }

    corrupt = row.merge(
      'previous_status' => JSON.generate('person:existing' => 'accepted'),
      'previous_evidence' => JSON.generate('person:existing' => 'existing reviewed disposition')
    )
    assert_raises(RuntimeError) { W.verify_prior_snapshot!(corrupt) }

    corrupt = row.merge(
      'previous_evidence' => JSON.generate(
        W::BLOOD => 'Candidate hit from the English source; verify this occurrence in context.'
      )
    )
    assert_raises(RuntimeError) { W.verify_prior_snapshot!(corrupt) }
  end

  def test_live_validation_allows_later_unrelated_name_but_rejects_reverted_pairing
    source = W.source_inventory.fetch(['default', '35645', ''])
    current = W.normalize_korean(
      W::BLOOD, source.fetch('work_text'),
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    )
    current = "#{current} 루미니차(Luminitsa)"
    later_source = source.merge('work_text' => current)
    assert W.verify_live_name_cell!(W::BLOOD, later_source)

    reverted = current.sub(W::BLOOD_KOREAN, '혈역병')
    assert_raises(RuntimeError) do
      W.verify_live_name_cell!(W::BLOOD, source.merge('work_text' => reverted))
    end
  end

  def test_live_source_and_saved_manifest_read_only_verification
    inventory = W.source_inventory
    glossary = W::M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    if File.file?(W::REVIEWS)
      if glossary.any? { |row| W::SPECS.key?(row.fetch('entity_key')) }
        assert W.validate_saved_manifest!
      else
        definitions_table = W::M.table(W::DEFINITIONS)
        saved_definitions = definitions_table.map(&:to_h)
        saved_reviews = W::M.table(W::REVIEWS).map(&:to_h)
        generated = W.generated_for(inventory, saved_definitions)
        assert_equal W.expected_pairs.sort,
                     saved_reviews.map { |row| [row.fetch('entity_key'), *W::M.key(row)] }.sort
        assert_equal W.reviews_for(inventory, generated), saved_reviews
      end
      return
    end

    index = W::M.table(W::M::INDEX).map(&:to_h)
    generated = W.generated_for(inventory, definitions)
    reviews = W.reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, glossary, index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    assert_equal 42, reviews.length
    assert_equal 38, reviews.count { |row| row.fetch('old') != row.fetch('new') }
    reviews.select { |row| row.fetch('old') != row.fetch('new') }
           .group_by { |row| row.fetch('resource') }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(W::M.csv_path(resource)), targets)
    end
  end
end
