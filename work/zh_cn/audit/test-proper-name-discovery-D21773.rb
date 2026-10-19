#!/usr/bin/env ruby

require_relative 'build-proper-name-discovery-D21773'

module TestProperNameDiscoveryD21773
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ProperNameDiscoveryD21773
    inventory = m::M.refresh_inventory
    index = m::M.table(m::M::INDEX).map(&:to_h)
    definitions, reviews = m.build_rows(inventory, index)

    assert(definitions.length == 3, 'expected three entity definitions')
    assert(reviews.length == 44, 'expected 44 exact source keys')
    assert(reviews.group_by { |row| row['entity_key'] }.transform_values(&:length) ==
           m::EXPECTED_KEYS.transform_values(&:length), 'unexpected entity occurrence counts')
    assert(reviews.group_by { |row| row['status'] }.transform_values(&:length) ==
           { 'accepted' => 38, 'not-an-issue' => 5, 'excluded' => 1 },
           'unexpected disposition counts')
    generic = reviews.find { |row| row['entity_key'] == 'people:master-makers' && row['ID_Linha'] == '2701' }
    assert(generic && generic['status'] == 'excluded' && generic['old'] == generic['new'],
           'generic lowercase master makers must remain excluded and unchanged')
    maker_particle = reviews.find { |row| row['entity_key'] == 'people:master-makers' && row['ID_Linha'] == '10010' }
    assert(maker_particle['new'].include?('Master Makers)을'),
           'Master Makers must retain the Korean object-particle allomorph')
    tome_particle = reviews.find { |row| row['entity_key'] == 'unique_item:ordination-tome' && row['ID_Linha'] == '44436' }
    assert(tome_particle['new'].include?('Ordination Tome)를') &&
           !tome_particle['new'].include?('Ordination Tome)을'),
           'Ordination Tome must retain the Korean object-particle allomorph')
    assert(reviews.all? { |row| row['english'].match?(/Master Makers|Order of Fateweavers|Ordination Tome/i) },
           'every reviewed row must retain its exact English source')
    assert(reviews.all? { |row| row['japanese'] && !row['japanese'].empty? },
           'every reviewed row must retain aligned Japanese')
    assert(reviews.all? do |row|
      row['status'] == 'excluded' ||
        row['new'].include?("(#{definitions.find { |definition| definition['entity_key'] == row['entity_key'] }['english_canonical']})")
    end, 'every in-scope occurrence must use its complete bilingual canonical label')
    puts 'D-21773 exact-coverage, exclusion, bilingual-label, and disposition tests: PASS'
  end
end

TestProperNameDiscoveryD21773.run if $PROGRAM_NAME == __FILE__
