#!/usr/bin/env ruby

require_relative "build-proper-name-occurrences"

def assert(condition, message)
  raise message unless condition
end

entities = [
  {
    "entity_key" => "person:alleia",
    "english_canonical" => "Alleia",
    "english_aliases" => ""
  },
  {
    "entity_key" => "faction:house-of-ballads",
    "english_canonical" => "House of Ballads",
    "english_aliases" => "Ballads"
  },
  {
    "entity_key" => "faction:house-of-seasons",
    "english_canonical" => "House of Seasons",
    "english_aliases" => "Seasons"
  }
]

matches = candidate_matches(
  ["Place Alleia's Ring beside the House of Ballads, not the House of Seasons."],
  build_matchers(entities)
)

assert(matches["person:alleia"].include?("Alleia"), "possessive names must match their glossary entry")
assert(matches["faction:house-of-ballads"].include?("House of Ballads"), "multiword names must match as a phrase")
assert(matches["faction:house-of-seasons"].include?("House of Seasons"), "distinct factions must remain separate")
assert(!matches["faction:house-of-seasons"].include?("House of Ballads"), "phrases must not bleed across entries")

puts "PASS: proper-name occurrence fixtures"
