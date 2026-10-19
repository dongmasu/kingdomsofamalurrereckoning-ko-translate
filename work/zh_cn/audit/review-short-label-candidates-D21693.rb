#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ReviewShortLabelCandidatesD21693
  extend self

  M = ReviewedNameBatches
  D = 21_693
  SNAPSHOT = File.join(__dir__, 'proper-name-short-label-discovery-D21692.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  REVIEWED = {
    'Alfar Warship' => {
      disposition: 'not-an-issue',
      evidence: 'All three exact rows identify an Alfar warship class, not a separately named vessel. English Alfar is the proper species term and is already paired as 알파르(Alfar); Warship is translated as 전함. Japanese アルファーの軍艦 and Chinese 精灵战舰 independently render the descriptive vessel phrase. Preserve the existing people:alfar row dispositions; do not invent a ship name or entity.'
    },
    'Amphora' => {
      disposition: 'uncertain',
      evidence: 'The eight exact rows consistently identify an amphora vessel, but the sources do not establish whether the capitalized item label denotes one unique quest object or the generic vessel type. Japanese アンフォラ and Chinese 双耳罐 support the vessel sense without settling named-object status. Historical decisions D-887/D-18364 and D-2212/D-10321 distinguish the named-vessel reading from the unresolved generic-versus-quest-object reading on other keys; do not reopen or recount those keys. Keep all current cells unchanged and do not register a global item until the identity scope is established.'
    },
    'Brother Wulf' => {
      disposition: 'not-an-issue',
      evidence: 'The seven source rows identify Wulf; the Korean name is already paired as 울프(Wulf), and the translated title 수사 is supported by Chinese 伍尔夫修士 and the aligned religious context. Exact labels elsewhere use 울프 수사(Brother Wulf), but that does not make the source-short person-name pairing incomplete. Preserve the prior person:wulf decisions, including D-20593 at default:57606 and the D-21204 cross-row review.'
    },
    'Captain Dodwyn' => {
      disposition: 'not-an-issue',
      evidence: 'The three exact source rows identify Dodwyn; 도드윈(Dodwyn) already pairs the personal name and 선장 translates Captain. Japanese ドドウィン船長 and Chinese 多德文队长 corroborate. D-21599 explicitly preserves translated military-rank wording and does not add redundant English parentheses when the person name is already paired. Keep all prior person:dodwyn statuses/evidence.'
    },
    'Captain Enright' => {
      disposition: 'not-an-issue',
      evidence: 'Both exact rows use the source-short surname Enright rather than the full name Dorothy Enright. 엔라이트(Enright) already pairs the name; 대위/대장 are translated rank terms. Japanese エンライト隊長 and Chinese 恩赖特队长 corroborate the title/name. D-21599 explicitly pairs the full name only where English supplies it and preserves ranks; do not add the given name or reopen the existing person:dorothy-enright decisions.'
    },
    'Dame Oleyn' => {
      disposition: 'not-an-issue',
      evidence: 'Both exact rows identify Oleyn; 올레인(Oleyn) already pairs her name and 경녀/여사 render Dame. Japanese 淑女オリン and Chinese 奥蕾因女爵 corroborate. D-20734-D-20735 already reviewed these exact keys and retained the complete title/name at default:27196 and the paired person name at default:35383. Preserve those terminal decisions.'
    }
  }.freeze
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  def row_key(row)
    M.key(row)
  end

  def run
    raise 'D-21692 candidate snapshot is missing' unless File.file?(SNAPSHOT)
    raise "D-#{D} output already exists" if File.exist?(OUTPUT)
    inventory = M.refresh_inventory
    candidates = M.table(SNAPSHOT).to_h do |row|
      [row.fetch('english_candidate'), row.to_h]
    end
    index = M.table(M::INDEX)
    reviewed_rows = []
    REVIEWED.each do |term, decision|
      candidate = candidates.fetch(term) { raise "candidate missing from snapshot: #{term}" }
      keys = (
        JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
        JSON.parse(candidate.fetch('paired_evidence_keys_json'))
      ).uniq.map { |parts| parts.map(&:to_s) }.sort
      raise "empty candidate key scope: #{term}" if keys.empty?
      keys.each do |key|
        source = inventory.fetch(key) { raise "source key missing: #{key.inspect}" }
        english_text = JSON.parse(source.fetch('en_texts_json')).compact
        pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
        raise "English candidate absent from #{key.inspect}" unless
          english_text.any? { |text| text.match?(pattern) }
        entity_rows = index.select { |row| row_key(row) == key }
        reviewed_rows << {
          'english_candidate' => term,
          'disposition' => decision.fetch(:disposition),
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'english' => english_text.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(
            entity_rows.map { |row| [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')] }
          )
        }
      end
    end
    unique_keys = reviewed_rows.map { |row| M.key(row) }.uniq
    raise "D-#{D} exceeds 50 distinct source keys: #{unique_keys.length}" if unique_keys.length > 50
    raise 'candidate rows are not unique' unless
      reviewed_rows.map { |row| [row['english_candidate'], *M.key(row)] }.uniq.length == reviewed_rows.length
    M.write_table(OUTPUT, HEADERS, reviewed_rows)

    counts = REVIEWED.group_by { |_term, item| item.fetch(:disposition) }
      .transform_values(&:length)
    grouped_keys = REVIEWED.to_h do |term, _decision|
      [term, reviewed_rows.select { |row| row['english_candidate'] == term }.length]
    end
    hashes = M.hashes
    hashes_text = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed six short-label candidate groups across 25 distinct resource/ID/variant keys: #{counts.inspect}. Per-group source-key coverage: #{grouped_keys.inspect}. These are candidate dispositions, not new entity-index matches and not global translation totals.
      Alfar Warship is a generic vessel-class phrase; the Alfar species name is already bilingual. Brother Wulf, Captain Dodwyn, Captain Enright, and Dame Oleyn have already-paired Korean personal names with translated titles/ranks; their prior terminal entity decisions remain unchanged. Amphora remains a documented identity-scope uncertainty; no source-supported unique-object scope is established, and its texts and earlier decisions remain unchanged.
      Next batch: D-#{D + 1}; continue the unreviewed groups in `proper-name-short-label-discovery-D21692.tsv`. That dated snapshot contains 265 groups/559 distinct label keys; six groups/25 distinct keys are dispositioned here. The snapshot count is not an exhaustive total or completion percentage.
      Indexed matches: #{index.length}; #{index.group_by { |row| row['status'] }.transform_values(&:length).sort.map { |status, count| "#{status}=#{count}" }.join(', ')}. Indexed dispositions and counts were not changed.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256 (unchanged in this no-edit batch):
      #{hashes_text}
      No CSV cells were edited; no new backup was needed. The latest pre-edit backups remain those recorded in the D-21692 addendum. CSV row order, BOM, mixed line endings, and non-target bytes were untouched.
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Candidate review manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
    TEXT
    File.write(File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
               "# D-#{D}: Short-Label Candidate Dispositions\n\n#{block}\n\n## Evidence\n\n#{REVIEWED.map { |term, item| "- `#{term}` (#{grouped_keys.fetch(term)} keys), #{item.fetch(:disposition)}: #{item.fetch(:evidence)}" }.join("\n")}\n")
    File.write(File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
               "# D-#{D} Edit Addendum\n\n#{block}\n\nNo CSV edits, index changes, glossary changes, or cumulative-count changes were made. The manifest retains exact English, Japanese, Chinese, and Korean cells for all 25 distinct source keys and snapshots prior indexed decisions where present.\n")

    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    prior = docs.values.first[marker]
    raise 'D-21692 checkpoint is not current' unless
      prior&.include?('Latest verified proper-name batch: D-21692 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior }
    docs.each do |path, text|
      replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n"
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n\n## D-#{D}: Short-Label Candidate Dispositions\n\nReviewed 25 distinct source keys in six short-label groups. Five groups are not new proper-name defects because each row already pairs the actual name or species and translates the generic rank/descriptor. `Amphora` remains uncertain between a generic vessel and a uniquely scoped quest object. Prior occurrence-index decisions and counts were preserved; no CSV or glossary changes were made. Exact aligned cells and prior states are in `proper-name-short-label-dispositions-D#{D}.tsv`.\n"
      elsif path.end_with?('README.md')
        text << "\n\n## D-#{D}: Short-Label Candidate Dispositions\n\nReviewed 25 exact source keys for six candidate groups. Five were resolved as already adequate name pairing or generic descriptor; Amphora remains an explicitly documented identity-scope hold. No CSV, occurrence index, glossary, or cumulative count changed. See the D-#{D} report, addendum, and source manifest.\n"
      end
      File.write(path, text)
    end
    puts "D-#{D}: reviewed six candidate groups/25 distinct source keys; five not-an-issue, one uncertain; no CSV or index changes."
  end
end

ReviewShortLabelCandidatesD21693.run if $PROGRAM_NAME == __FILE__
