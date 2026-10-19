#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

# This reviewed linguistic scope deliberately creates no entity identities.
module SourceLabelsD21621
  extend self
  M = ReviewedNameBatches
  D = 21_621
  STEMS = {
    'Acae' => '아카에', 'Agathe' => '아가테', 'Ainmere' => '아인미어',
    'Anicetus' => '아니케투스', 'Arcaneid' => '아르카네이드',
    'Ardinia' => '아르디니아', 'Utricul' => '우트리쿨',
    'Vandala' => '반달라', 'Veshani' => '베샤니', 'Woerlowe' => '워얼로',
    'Ychen' => '이첸', 'Yurele' => '유렐레', 'Zosime' => '조시메'
  }.freeze
  EXPECTED_KEYS = [
    ['base', '2011', '11'], ['base', '3224', '11'], ['base', '3266', '11'],
    *%w[16620 16779 19592 25633 25715 26408 30493 31616 32264 33559
        34310 34374 34935 41488 43088 47221 47532 49272 50220 56850
        57610 58285 63091 64752].map { |id| ['default', id, ''] }
  ].freeze

  def reviews(inventory)
    EXPECTED_KEYS.map do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source['en_texts_json']).compact.join("\n")
      old = source['work_text']
      text = old.dup
      if %w[16620 26408 58285].include?(key[1]) && key[0] == 'default'
        label = 'Cynric'
        text = '신릭(Cynric)'
      elsif english == 'Yzzzzhgoi'
        label = english
        text += '(Yzzzzhgoi)' unless text.include?('(Yzzzzhgoi)')
      else
        label = STEMS.keys.find { |term| english.match?(/\b#{Regexp.escape(term)}\b/) }
        raise "unexpected source #{key.inspect}" unless label
        stem = STEMS.fetch(label)
        if label == 'Arcaneid'
          text = '아르카네이드(Arcaneid)'
        elsif !text.include?("(#{label})")
          raise "missing expected Korean span #{key.inspect}" unless text.scan(stem).length == 1
          text.sub!(stem, "#{stem}(#{label})")
        end
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => "source-label:#{label.downcase}",
        'status' => old == text ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => text,
        'evidence' => 'Source-local linguistic annotation only; no entity category, identity, alias or occurrence registration. ' +
          case label
          when 'Arcaneid'
            'Reuse the already paired base:3224:11/default:56850 Korean stem across the same exact English label; Japanese アーケネイド and Chinese 阿卡内德 confirm the source span, not a mandatory new pronunciation.'
          when 'Cynric'
            'Japanese シンリック and Chinese 辛瑞克 support the established 신릭 stem; 58285 has untranslated supporting labels. Do not link an isolated label to Lirin, Wine, a family, mine or contract.'
          when 'Veshani'
            'Reuse base:2011:11/3266:11 베샤니(Veshani). default:30493 is actually unpaired, correcting the earlier narrative; 50220 explicitly calls the inscription a name, without identifying the woman or a deity.'
          when 'Yurele'
            'Annotate the shared source name component, leaving Escort/호위 outside the name span; do not assign a person, unit or quest identity.'
          when 'Yzzzzhgoi'
            'Keep each existing Korean spelling; divergent Japanese/Chinese and Korean pronunciation remain unresolved. English annotation does not settle pronunciation.'
          else
            'Retain the existing Korean transliteration and add the exact English label. Supporting phonetic locales do not establish referent type or justify a pronunciation rewrite.'
          end,
        'english' => english,
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => '{}',
        'previous_status' => '{}', 'previous_evidence' => '{}'
      }
    end
  end

  def run
    pattern = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    previous = documents.values.first[pattern]
    raise 'unexpected checkpoint' unless previous&.include?('Latest verified proper-name batch: D-21620 ')
    raise 'checkpoint mismatch' unless documents.values.all? { |text| text[pattern] == previous }
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'batch already exists' if File.exist?(manifest)
    before_hashes = M.hashes
    glossary_hash = Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest
    inventory = M.refresh_inventory
    rows = reviews(inventory)
    raise 'unexpected review scope' unless rows.length == 27 && rows.map { |r| M.key(r) }.sort == EXPECTED_KEYS.sort
    index = M.table(M::INDEX)
    raise 'source labels already have entity ownership' if index.any? { |r| EXPECTED_KEYS.include?(M.key(r)) }
    before_decisions = index.map { |r| r.to_h.reject { |k, _v| k == 'korean_current' } }
    M.write_table(manifest, M::HEADERS, rows)
    backup = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup, before_hashes)
    verification = M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                            '--review', manifest, '--backup-dir', backup)
    inventory = M.refresh_inventory
    rows.each { |r| raise 'post-edit mismatch' unless inventory.fetch(M.key(r))['work_text'] == r['new'] }
    index.each { |r| r['korean_current'] = inventory.fetch(M.key(r)).fetch('work_text') }
    raise 'entity decisions changed' unless before_decisions == index.map { |r| r.to_h.reject { |k, _v| k == 'korean_current' } }
    M.write_table(M::INDEX, index.headers, index)
    raise 'glossary changed' unless glossary_hash == Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest
    edits = rows.count { |r| r['old'] != r['new'] }
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    block = previous.sub(/Latest verified proper-name batch:.*?\n/, "Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).\n")
    block.sub!(/Reviewed .*?\nGroups:.*?\n/,
               "Reviewed 27 distinct source-label row keys across 15 label groups; #{edits} Texto edits, #{27 - edits} unchanged. Last reviewed key: default:64752 / source label Yzzzzhgoi.\nThese are linguistic source-label decisions, not entity/row registrations or new indexed holds; no referent categories or identities were inferred.\n")
    block.sub!(/Next batch: D-\d+;.*?\n/, "Next batch: D-21622; complete all-resource residual discovery and final validation; source-label resume queue D-21621 is processed.\n")
    M.hashes.each { |resource, hash| block.sub!(/^- #{resource}: `[a-f0-9]{64}`\./, "- #{resource}: `#{hash}`.") }
    block.sub!(/Last batch pre-edit backups and byte validation:\n.*?(?=Last actual CSV-edit backups)/m,
               "Last batch pre-edit backups and byte validation:\n#{integrity}\n#{verification.strip}\n")
    checks.each do |check|
      line = integrity.lines.find { |value| value.start_with?("- #{check[:resource]}:") }.strip
      block.sub!(/(?<=Last actual CSV-edit backups \(retained across no-edit batches\):\n)(.*?)(?=Aligned inventory:)/m) do |retained|
        retained.sub(/^- #{check[:resource]}:.*$/, line)
      end
    end
    block.sub!(/Aligned inventory:.*?\n/, "Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.\n")
    block.sub!(/Occurrence index:.*?\n/, "Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.\n")
    report = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    block.sub!(/Report: `.*?`\./, "Report: `work/zh_cn/audit/#{report}`.")
    block.sub!(/Addendum: `.*?`\./, "Addendum: `work/zh_cn/audit/#{addendum}`.")
    block.sub!(/Exact source comparison manifest: `.*?`\./, "Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.")
    explanation = <<~TEXT
      The 14 previously unclassified groups (24 rows) and three isolated
      Cynric labels received source-local linguistic review. Unknown entity
      type is not a reason to omit a defensible exact English annotation.
      No glossary entry or occurrence was added, relinked, reopened or recounted.
      The manifest's source-label keys are review labels, not entity owners.
      Existing Korean spellings are preserved except the supported Arcaneid
      and Cynric inconsistencies. Yzzzzhgoi pronunciation remains a documented
      hold; both source-label spellings now retain the same exact English.
      Veshani default:30493 was unpaired in the actual CSV, contrary to the
      earlier read-only narrative; both that label and the inscription are
      corrected. No deity/person/item identity is inferred from the figurine.
      English governs meaning; aligned Japanese/Chinese are in the manifest.
      The official manual extraction/reference do not directly identify these
      labels. No PAK material was read. All three resources were searched.
      Full residual discovery and final validation are still pending.
      No source CSV, release ZIP, public README or build tool was changed.
    TEXT
    File.write(File.join(__dir__, report), "# D-#{D}: Source-Local Name Labels\n\n#{explanation}\n#{block}\n")
    File.write(File.join(__dir__, addendum), "# D-#{D} Edit Addendum\n\n#{edits} changed default Texto cells; no affix/base edits.\nBOM, mixed line endings, tokens, ordered keys/variants, all non-target bytes\nand inverse backup equality passed the editor and independent verifier.\n\n#{block}\n")
    documents.each { |path, text| File.write(path, text.sub(pattern, block)) }
    puts "D-#{D}: #{rows.length} reviewed rows, #{edits} edits; unchanged glossary and entity decisions\n#{verification}"
  end
end

SourceLabelsD21621.run if $PROGRAM_NAME == __FILE__
