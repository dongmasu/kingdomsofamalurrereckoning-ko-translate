#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21772
  extend self

  M = ReviewedNameBatches
  D = 21_772
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21771.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  GROUPS = {
    'Main Hall' => {
      keys: [['base', '4248', '11'], ['default', '32899', ''], ['default', '55994', '']],
      disposition: 'uncertain',
      evidence: 'The paired prose at default:55994 identifies a Main Hall within the Scholia Arcana Grounds, but the same English phrase is used for halls in other keeps and houses elsewhere in the source corpus. The two short labels lack enough local context to prove they refer to the Scholia Arcana site. Preserve all Korean text; do not create a global Main Hall alias or merge generic halls.'
    },
    'Moondown' => {
      keys: [
        ['default', '42542', ''], ['default', '18071', ''],
        ['default', '22492', ''], ['default', '2675', ''],
        ['default', '30989', ''], ['default', '33127', ''],
        ['default', '41640', ''], ['default', '4731', ''],
        ['default', '4818', ''], ['default', '50654', ''],
        ['default', '63558', '']
      ],
      dispositions: { '42542' => 'uncertain' },
      disposition: 'not-an-issue',
      evidence: 'The ten paired narrative rows are already source-traceable references to Camp Moondown or its military position and retain their prior row findings. The standalone default:42542 remains uncertain under the existing place:camp-moondown disposition; D-21417/D-21418 distinctions among Camp Moondown, Moondown Hill, and the Siege of Moondown are preserved. No alias, CSV text, or prior decision is changed or recounted.'
    },
    'Morkan House' => {
      keys: [['base', '3704', '11'], ['default', '34424', '']],
      disposition: 'uncertain',
      evidence: 'English, Japanese モーカン・ハウス, Chinese 莫坎的家, and Korean 모르칸 가문 support a Morkan-associated house, but do not establish whether this label names a family, residence, or both. Preserve the existing person:morkan not-an-issue result at base:3704 and make no entity merge or CSV change.'
    },
    'Motus Mining Headquarters' => {
      keys: [['base', '386', '11'], ['default', '8363', '']],
      disposition: 'uncertain',
      evidence: 'The labels and aligned Japanese/Chinese identify Motus Mining headquarters, but surrounding English distinguishes ruined offices in Apotyre, a Hollowlands branch/headquarters, and the Adessa home office. These rows do not establish one unique named site versus a generic company facility label. Preserve organization:motus-mining exclusion at base:386 and the existing Korean text; do not add a place entity from the label alone.'
    },
    'Observers' => {
      keys: [['default', '59716', ''], ['default', '54786', '']],
      disposition: 'not-an-issue',
      evidence: 'English Observers, Japanese 監視者, and Chinese 观察者 describe people by their generic observing role; the paired Korean already says 관찰자들(Observers). No distinct named organization, faction, or individual is established. Preserve both labels and prior row findings.'
    },
    'Oracle' => {
      keys: [['default', '53372', ''], ['default', '54558', ''], ['default', '52102', '']],
      disposition: 'not-an-issue',
      evidence: 'English Oracle, Japanese 預言者, and Chinese 神谕者 identify a generic prophetic/religious office, not one named person. The return objective does not identify which individual holds the role. Preserve the existing Korean role wording and do not create a duplicate person or title entity.'
    },
    'Oracles' => {
      keys: [['default', '46403', ''], ['default', '55324', '']],
      disposition: 'uncertain',
      evidence: 'The sentence describes a plural community called Oracles that remains faithful to the gods, but does not establish whether this is a formal faction, a religious office, or a generic class of seers. Japanese 預言者 and Chinese 神谕者 do not settle the organization status. Preserve the Korean text and defer a global faction/person-group registration.'
    },
    'Order' => {
      keys: [
        ['default', '28280', ''], ['default', '12671', ''],
        ['default', '3252', ''], ['default', '51052', ''],
        ['default', '53922', '']
      ],
      disposition: 'uncertain',
      evidence: 'The exact English label is polysemous in these rows: aligned Japanese/Chinese 秩序 at default:28280 supports abstract order, while defaults 12671/3252/51052 use the term for an institution and default:53922 describes fabled beings “of Order.” These contexts do not establish one shared entity or canonical English alias. Preserve the current Korean distinctions and defer a global lore-term or organization entry.'
    }
  }.freeze

  def key(row)
    M.key(row)
  end

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def disposition_for(term, key)
    GROUPS.fetch(term).fetch(:dispositions, {}).fetch(key[1], GROUPS.fetch(term).fetch(:disposition))
  end

  def build_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| key(row) }
    reviews = GROUPS.flat_map do |term, decision|
      candidate = candidates.fetch(term) { raise "missing candidate #{term}" }
      keys = candidate_keys(candidate)
      raise "#{term} candidate coverage differs" unless keys.sort == decision.fetch(:keys).sort
      keys.map do |row_key|
        source = inventory.fetch(row_key) { raise "missing aligned row #{row_key.inspect}" }
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
        raise "#{term} absent from #{row_key.inspect}" unless
          english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
        {
          'english_candidate' => term,
          'disposition' => disposition_for(term, row_key),
          'resource' => row_key[0],
          'ID_Linha' => row_key[1],
          'Tipo_Variante' => row_key[2],
          'english' => english,
          'japanese' => japanese,
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(row_key, []).map do |entry|
              [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
            end
          )
        }
      end
    end
    counts = reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    raise "unexpected D-21772 candidate totals: #{counts.inspect}" unless
      reviews.length == 30 && counts == { 'uncertain' => 15, 'not-an-issue' => 15 }
    raise 'overlapping candidate rows would be double-counted' unless
      reviews.map { |row| key(row) }.uniq.length == reviews.length
    reviews
  end

  def checkpoint_text(snapshot, retained_backups, inventory, reviews)
    index = M.table(M::INDEX)
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    hashes = M.hashes
    index_counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    candidate_counts = reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    next_term = snapshot.first&.fetch('english_candidate', 'none')
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 30 short-label candidate memberships in 30 distinct source keys: #{candidate_counts.inspect}.
      Candidate groups: {"Main Hall"=>3, "Moondown"=>11, "Morkan House"=>2, "Motus Mining Headquarters"=>2, "Observers"=>2, "Oracle"=>3, "Oracles"=>2, "Order"=>5}. Last reviewed candidate: Order / default:53922.
      Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; begins `#{next_term}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Candidate-only uncertainty is recorded separately and does not alter occurrence-index statuses.
      These focused index states are not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      CSV edits in this no-edit candidate batch: none; no new backup required.
      Last actual CSV-edit backups (retained across this no-edit batch):
      #{retained_backups}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(glossary_path).hexdigest}`.
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
    TEXT
  end

  def checkpoint(path, summary)
    text = File.read(path)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
    raise "active checkpoint missing in #{path}" unless text.match?(marker)
    File.write(path, text.sub(marker, block))
  end

  def run
    existing = [File.exist?(OUTPUT), File.exist?(SNAPSHOT)]
    raise 'only one paired D-21772 output exists' if existing.uniq.length > 1
    before = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h { |row| [row.fetch('english_candidate'), row] }
    reviews = build_reviews(inventory, index, candidates)
    raise 'candidate-only review changed active CSV' unless M.hashes == before
    if existing.all?
      raise 'existing D-21772 dispositions differ from rebuilt evidence' unless M.table(OUTPUT).map(&:to_h) == reviews
    else
      M.write_table(OUTPUT, HEADERS, reviews)
    end
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    if existing.all?
      raise 'existing D-21772 snapshot differs from rebuilt discovery' unless
        M.table(SNAPSHOT).map(&:to_h) == snapshot
    else
      M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    end
    retained = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups(?: \(retained across (?:no-edit batches|this no-edit batch)\))?:\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    summary = checkpoint_text(snapshot, retained, inventory, reviews)
    evidence = reviews.map do |row|
      term = row.fetch('english_candidate')
      "- #{term} / #{row.fetch('resource')}:#{row.fetch('ID_Linha')}: #{row.fetch('disposition')}. #{row.fetch('evidence')}"
    end.join("\n")
    note = <<~TEXT

      ## D-#{D}: Generic Labels And Unresolved Homonyms

      Reviewed 30 candidate memberships across eight bounded labels:
      `not-an-issue` (15) and `uncertain` (15). The generic observing and
      prophetic roles were excluded from new entity registration. Main Hall,
      Morkan House, Motus Mining Headquarters, Oracles, and Order remain
      unresolved at the stated keys; Moondown's standalone 42542 uncertainty
      and all prior place/person/organization findings remain unchanged.
      No CSV, glossary, occurrence-index, or historical tally changed.
      Exact aligned evidence is in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      Remaining bounded candidates: #{snapshot.length}, beginning
      `#{snapshot.first&.fetch('english_candidate', 'none')}`; this is not an
      exhaustive completion estimate. Full discovery remains incomplete.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    File.write(report, "# D-#{D}: Generic Labels And Unresolved Homonyms\n\nDate: #{M::RUN_DATE_ISO}\n\n#{summary}\n\n## Evidence\n\n#{evidence}\n#{note}")
    File.write(addendum, "# D-#{D} Edit Addendum\n\n#{summary}\n\nNo CSV edit was made; existing uncertain/excluded entity dispositions were preserved and not recounted.\n#{note}")
    M::DOCS.each { |path| checkpoint(path, summary + note) }
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      text = File.read(path)
      marker = '## D-21771: Master Mystic Title And Masterful Construction Ability'
      raise "previous batch marker missing in #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, note + "\n" + marker))
    end
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'candidate validation failed' unless validation.include?('PASS') &&
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    lines = residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip)
    verification = "\nValidation (no-edit candidate batch): #{validation.strip}\nResidual bilingual/index audit: PASS; #{lines.join('; ')}\n"
    [report, addendum].each { |path| File.write(path, File.read(path) + verification) }
    puts "D-#{D}: reviewed 30 candidate memberships (15 not-an-issue, 15 uncertain); no CSV or occurrence-index changes; #{snapshot.length} candidate groups remain."
  end
end

ReviewShortLabelCandidatesD21772.run if $PROGRAM_NAME == __FILE__
