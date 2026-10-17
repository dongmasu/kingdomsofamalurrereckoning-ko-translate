#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'person:red-idward',
    english: 'Red Idward',
    category: 'person',
    korean: '레드 이드워드(Red Idward)',
    count: 19,
    notes: 'English default:3913/40592 identifies Red Idward as the Red Legion bandit captain and Brother Delf’s enemy; default:24027 states the player’s target, and default:24099 reports his death. The remaining dialogue, journal and standalone-label rows refer to the same person. Japanese レッド・イドワード and Chinese 雷德·伊德瓦尔德 corroborate the person and source spelling. Standardize only full-name spans to 레드 이드워드(Red Idward); do not register bare Red as a personal alias or merge him with faction:red-legion. The official Korean manual has no direct character entry; its faction/history context is background only.'
  }
]

context = 'English-led discovery and review of the previously unregistered bandit captain Red Idward across 19 exact default rows. Japanese レッド・イドワード and Chinese 雷德·伊德瓦尔德 corroborate. Keep the person distinct from the Red Legion faction; bare Red is not added as an alias. Existing entity decisions and historical global totals are not reopened or recounted.'

ReviewedDiscoverySpecs.run(
  21_264,
  'Red Idward',
  specs,
  context,
  '## Unresolved Candidate: Acathan (default:8301)'
) do |spec, key, text, _source|
  pattern = /레드 이드워드(?:\(Red Idward\))?/
  count = text.scan(pattern).length
  raise "Red Idward Korean span missing at #{key.inspect}" unless count.positive?
  text.gsub!(pattern, spec.fetch(:korean))
  [text, false]
end
