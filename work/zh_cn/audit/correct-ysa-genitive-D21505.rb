#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_505
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
index = m.table(m::INDEX)
counts = index.group_by { |r| r['status'] }.transform_values(&:length)
keys = index.map { |r| [r.fetch('entity_key'), *m.key(r)] }
source = inventory.fetch(['default', '53537', ''])
prior = index.find { |r| r['entity_key'] == 'place:ysa' && m.key(r) == ['default', '53537', ''] }
raise 'existing Ysa disposition differs' unless prior && prior['status'] == 'not-an-issue'
old = source.fetch('work_text')
from = '이사 정원(Gardens of Ysa)'
to = '이사의 정원(Gardens of Ysa)'
raise 'expected one missing-genitive span' unless old.scan(from).length == 1
review = {
  'resource' => 'default', 'ID_Linha' => '53537', 'Tipo_Variante' => '',
  'entity_key' => 'place:ysa', 'status' => 'not-an-issue',
  'old' => old, 'new' => old.sub(from, to),
  'evidence' => 'Corrective particle-only residual audit. Default:53537 has a missing Korean genitive 의 in the existing complete Gardens of Ysa label. English identifies the Gardens residents; Japanese イーサの庭園 and Chinese 伊萨花园 corroborate the same location. Restore 이사의 정원(Gardens of Ysa) without altering the name identity, English annotation, any other wording, prior D-20727 not-an-issue disposition, entity/occurrence keys or totals. Historical evidence is retained in previous_evidence. This is an approved textual correction preserving the earlier identity disposition, not a fresh finding.',
  'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
  'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
  'chinese' => source.fetch('zh_text'),
  'entity_dispositions_json' => JSON.generate('place:ysa' => 'not-an-issue')
}
screened = inventory.values.select do |row|
  JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(/\bGardens of Ysa\b/i) }
end
raise 'Gardens lexical coverage changed' unless screened.length == 76
lookup = index.to_h { |r| [[r.fetch('entity_key'), *m.key(r)], r] }
screen = screened.map do |row|
  occurrence = lookup.fetch(['place:ysa', *m.key(row)])
  raise 'unreviewed prior Gardens occurrence' if occurrence['status'] == 'needs-context'
  {
    'resource' => row['resource'], 'ID_Linha' => row['ID_Linha'],
    'Tipo_Variante' => row['Tipo_Variante'],
    'entity_key' => 'place:ysa', 'screening' => 'existing-terminal-key',
    'prior_status' => occurrence['status'], 'prior_evidence' => occurrence['evidence'],
    'english' => JSON.parse(row.fetch('en_texts_json')).compact.join("\n"),
    'korean' => row.fetch('work_text')
  }
end
proposal = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
screen_path = File.join(__dir__, "proper-name-candidate-screen-D#{d}.tsv")
raise 'correction artifacts already exist' if [proposal, screen_path].any? { |p| File.exist?(p) }
m.write_table(proposal, m::HEADERS.take(12), [review])
m.write_table(screen_path, screen.first.keys, screen)
m.run(proposal, d, nil, review_states: ['not-an-issue'])
after = m.table(m::INDEX)
raise 'Ysa correction changed disposition counts' unless
  after.group_by { |r| r['status'] }.transform_values(&:length) == counts
raise 'Ysa correction changed occurrence keys' unless
  after.map { |r| [r.fetch('entity_key'), *m.key(r)] } == keys
detail = <<~TEXT.chomp
  ### D-21505: Existing Ysa Scope And Missing Genitive

  Screened all 76 exact `Gardens of Ysa` lexical row keys (3 base,
  73 default; no affix): every key is already covered by terminal
  `place:ysa` decisions, including complete named-label contexts.
  No separate duplicate Gardens entity or new occurrence was added,
  and the screening is not a fresh linguistic disposition of those rows.
  The book-title attribution at default:14454 and ambiguous standalone
  labels base:3049/default:9150 retain their historical decisions and text;
  do not infer new book/location identities from those bare labels.

  Corrected only the missing genitive particle at default:53537,
  `이사 정원(Gardens of Ysa)` to `이사의 정원(Gardens of Ysa)`.
  English, Japanese イーサの庭園 and Chinese 伊萨花园 corroborate the
  place reference. This residual textual correction preserves the
  D-20727 identity disposition in place: all occurrence keys and status
  counts remain unchanged. The row-by-row existing-key screening is in
  `proper-name-candidate-screen-D21505.tsv`.
TEXT
m::DOCS.each do |path|
  text = File.read(path)
  marker = '<!-- current-proper-name-batch:end -->'
  raise "missing checkpoint #{path}" unless text.include?(marker)
  File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
end
%w[review edit-addendum].each do |kind|
  path = File.join(__dir__, "named-scope-#{kind}-D#{d}-#{m::RUN_DATE_COMPACT}.md")
  File.open(path, 'a') { |f| f.write("\n\n#{detail}\n") }
end
puts 'PASS: one genitive correction; all occurrence keys and disposition counts preserved.'
