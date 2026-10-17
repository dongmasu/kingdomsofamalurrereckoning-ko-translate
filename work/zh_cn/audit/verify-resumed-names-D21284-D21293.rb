#!/usr/bin/env ruby

require 'set'
require_relative 'continue-proper-name-reviewed-batches'

module ResumedNamesVerification
  M = ReviewedNameBatches
  FIRST = 21_284
  LAST = 21_293
  INITIAL_HASHES = {
    'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
    'base' => '8486262cc98e9b186c8c8fe64c0cae6b529b40d8edae3cff538c5256759826cb',
    'default' => '02c068fd28edc475fbd6b70136314c943f5685095d5726df2513de4737727c56'
  }.freeze
  INITIAL_INDEX_HASH = '9ee9dfdffe2b42acb34d26be47078529d5ac521fbc02cfb610c99a5fc091f3dc'
  INITIAL_GLOSSARY_HASH = '4c75cccc05c695613d1313c0e4c23d024c6debb5b3d66a7f9e9e2e2f13114038'

  module_function

  def serialized_hash(headers, rows)
    digest = Digest::SHA256.new
    digest.update(CSV.generate_line(headers, col_sep: "\t", row_sep: "\r\n", force_quotes: true))
    rows.each do |row|
      digest.update(CSV.generate_line(headers.map { |header| row[header] },
                                      col_sep: "\t", row_sep: "\r\n", force_quotes: true))
    end
    digest.hexdigest
  end

  def run
    manifests = (FIRST..LAST).to_h do |d|
      [d, M.table(File.join(M::AUDIT, "proper-name-edits-D#{d}.tsv"))]
    end
    chain = M.command!('ruby', File.join(M::AUDIT, 'verify-proper-name-batch-chain.rb'),
                       FIRST.to_s, LAST.to_s)
    INITIAL_HASHES.each do |resource, hash|
      raise "initial CSV reconstruction differs: #{resource}" unless chain.include?("#{resource}: #{hash}")
    end
    data_check = M.command!('ruby', File.join(M::AUDIT, 'validate-proper-name-data.rb'))
    before_paths = {
      'affix' => M.csv_path('affix'),
      'base' => "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D21288/locatexts_zh_cn.koalocatext_base.csv",
      'default' => "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D21284/locatexts_zh_cn.koalocatext_default.csv"
    }
    before_rows = before_paths.to_h do |resource, path|
      raise "initial backup hash differs: #{resource}" unless
        Digest::SHA256.file(path).hexdigest == INITIAL_HASHES.fetch(resource)
      rows = ProperNameCellEditor.parse(File.binread(path))
      [resource, rows.to_h { |row| [ProperNameCellEditor.key(row), row['Texto']] }]
    end
    all = manifests.values.flat_map { |rows| rows.map(&:to_h) }
    additions = all.flat_map do |row|
      row.fetch('entity_key').split('|').map { |entity| [entity, *M.key(row)] }
    end.to_set
    raise 'unexpected resumed occurrence count' unless all.length == 179 && additions.length == 179
    index = M.table(M::INDEX)
    original_rows = index.reject do |row|
      additions.include?([row.fetch('entity_key'), *M.key(row)])
    end.map do |row|
      row.to_h.merge('korean_current' =>
        before_rows.fetch(row.fetch('resource')).fetch([row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]))
    end
    raise 'original index size differs' unless original_rows.length == 37_444
    raise 'original index evidence/dispositions changed' unless
      serialized_hash(index.headers, original_rows) == INITIAL_INDEX_HASH

    new_entities = %w[
      title:blades-of-yolvan title:yolvan-stone
      title:yolvans-poison place:yolvan source-form:yolvan person:elfhard-engar
      place:edmure-home source-form:gorta person:cadwallon-gwynedd family:gwynedds
    ] + ['named work:a-history-of-yolvan']
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'new glossary entry scope differs' unless
      glossary.count { |row| new_entities.include?(row['entity_key']) } == 11
    original_glossary = glossary.reject { |row| new_entities.include?(row['entity_key']) }.map(&:to_h)
    raise 'original glossary size differs' unless original_glossary.length == 1243
    raise 'original glossary entries changed' unless
      serialized_hash(glossary.headers, original_glossary) == INITIAL_GLOSSARY_HASH

    active_default = ProperNameCellEditor.parse(File.binread(M.csv_path('default')))
    protected_row = active_default.find { |row| row['ID_Linha'] == '51702' }
    raise 'D19515 protected name cell changed' unless
      protected_row.fetch('Texto') == before_rows.fetch('default').fetch(['51702', ''])
    raise 'protected historical key was recounted' if
      all.any? { |row| row['resource'] == 'default' && row['ID_Linha'] == '51702' }
    blocks = M::DOCS.map do |path|
      File.read(path)[/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m]
    end
    raise 'handoff checkpoints differ or are stale' unless
      blocks.compact.length == M::DOCS.length && blocks.uniq.length == 1 &&
      blocks.first.include?("Latest verified proper-name batch: D-#{LAST}") &&
      blocks.first.include?("Next batch: D-#{LAST + 1}")
    M.hashes.each_value { |hash| raise 'checkpoint CSV hash differs' unless blocks.first.include?(hash) }
    changed = all.select { |row| row['old'] != row['new'] }
    note = <<~TEXT
      # D-#{FIRST}-D-#{LAST}: Resumed Proper-Name Verification

      Date: #{M::RUN_DATE_ISO}

      Reviewed #{all.length} entity/row occurrences in #{all.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Changed #{changed.length} cell edit events in #{changed.map { |row| M.key(row) }.uniq.length} distinct CSV cells.
      Repeated row default:53181 concerns two distinct entities in D-21292 and D-21293; count it once for unique-row coverage.
      These are this run's focused scopes, not global translation totals or an overall completion percentage.

      PASS: inverse chain reconstructed every initial CSV hash.
      PASS: removing only the 179 new occurrence keys and restoring initial Korean snapshots reproduces the exact 37,444-row D-21283 index SHA-256 `#{INITIAL_INDEX_HASH}`.
      PASS: removing only 11 new glossary records reproduces the exact 1,243-entry initial glossary SHA-256 `#{INITIAL_GLOSSARY_HASH}`.
      Thus the original index dispositions/evidence and glossary entries were preserved byte-for-byte after snapshot reconstruction.
      PASS: protected default:51702 is unchanged and not recounted.
      PASS: all five current checkpoint blocks agree on D-#{LAST}, next D-#{LAST + 1}, and the active CSV hashes.
      The two provisional source-form records remain unresolved for identity, separately from indexed occurrence holds.
      Full proper-name discovery remains incomplete. No build, archive inspection, game test, commit or push was performed.

      ## Data Validation

      ```text
      #{data_check.strip}
      ```

      ## Inverse Byte Verification

      ```text
      #{chain.strip}
      ```
    TEXT
    path = File.join(M::AUDIT, "proper-name-resume-validation-D#{FIRST}-D#{LAST}-#{M::RUN_DATE_COMPACT}.md")
    File.write(path, note)
    puts note
  end
end

ResumedNamesVerification.run if $PROGRAM_NAME == __FILE__
