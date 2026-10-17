#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module ResumedNameCandidatesD21454
  extend self
  M = ReviewedNameBatches
  D = 21_454
  QUEUE = '/private/tmp/proper-name-person-scout-D21448.tsv'
  NEXT_QUEUE = '/private/tmp/proper-name-person-scout-D21454.tsv'
  NOTES = {
    'Gwynedd' => 'Existing Nesta/Cadwallon full names and separately registered couple; do not create a surname alias or recount their terminal scopes.',
    'Hera' => 'D-21450 accepts the contextual Whitestone given-name reference only; D-21453 registers the separate deceased Hera Edithing. No global Hera alias.',
    'Mattix Dace' => 'Covered by the existing person:mattix scope, including complete full-name pairs; no duplicate person registration.',
    'Omission' => 'Component of the registered Shroud of Omission, not a new person or global short alias.',
    'Whispering Witch' => 'D-21448 expands the sampled 15 contexts to all 20 exact English keys; 12 cells corrected.',
    'Corgan' => 'Full Corgan Hold rows remain terminal; isolated default:55716 preserves its earlier unresolved identity, without a global Corgan alias.',
    'Criet' => 'Existing Eloren Criet full-name contexts and paired surname references; no new global surname alias.',
    'Deod' => 'D-21452 separates porter Deod Dungaras and docent Deod Twillt. Bare Deod references remain a separate contextual discovery follow-up, not a global alias.',
    'Jera' => 'Full Soren/Dace forms are already reviewed. Bare default:15390/31242 remain unresolved; default:54851 is already paired. No global Jera alias.',
    'Mudhold' => 'D-21450 adds four row-scoped short references under the existing Mudhold Fasting entity; no global short alias.',
    'Grinning' => 'Component of already registered Grinning Vane Spirrick/Grinning Vane and the separately registered armband; do not register the adjective alone.',
    'Osgar' => 'D-21441/D-21442 already cover the contextual given name and complete dagger label; no duplicate occurrence.',
    'Waterhall' => 'Unresolved identity at default:41059/46711; no CSV edit or link to Waterhall Down. Preserve the earlier D-14260 hold for 46711. Full Waterhall Down keys remain terminal.',
    'Torix' => 'D-21449 corrects only the previously missed short-name annotations at 22343; the 60136 follow-up was already terminal. No new occurrence count.',
    'Brand' => 'D-21451 registers the complete Fate\'s Brand label. Existing Honor Brand compounds remain terminal; ordinary brand/new/mark uses are not names.',
    'Lamps' => 'Component of existing Three Lamps Inn/Tavern/Three Lamps aliases; no separate Lamps entity.',
    'Medgar' => 'D-21449 adds the missed final short-name annotation at 26414; prior full-name and dagger scopes are retained.',
    'Running' => 'D-21451 distinguishes the named card, its five atomic equipment compounds, and Running with Scalpels. It also checks the two lowercase card references beyond this sample. Ordinary running and the alphabet poem are not new entities.',
    'Canyon Hill Mine' => 'Existing place:canyon-hill reviews already cover complete Mine/Site compounds; do not create a duplicate place.',
    'Ardeen' => 'Existing Lina Ardeen identity; D-21449 repairs only the later Lina short-English annotation at 59973, without adding an occurrence.'
  }.freeze

  def run
    report_path = File.join(__dir__, "proper-name-candidate-screen-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum_path = File.join(__dir__, "proper-name-candidate-screen-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    raise 'screen batch already exists' if [report_path, addendum_path].any? { |path| File.exist?(path) }
    queues = M.table(QUEUE)
    raise 'resume candidate snapshot differs' unless queues.map { |row| row['english_candidate'] } == NOTES.keys
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    indexed_by_key = index.group_by { |row| M.key(row) }
    headers = %w[rank english_candidate resource ID_Linha Tipo_Variante english japanese chinese korean_current prior_or_current_scopes_json screening_note]
    samples = queues.flat_map do |candidate|
      candidate['source_context_keys'].split('|').map do |value|
        resource, id, variant = value.split(':', 3)
        key = [resource, id, variant.to_s]
        source = inventory.fetch(key)
        {
          'rank' => candidate['rank'], 'english_candidate' => candidate['english_candidate'],
          'resource' => resource, 'ID_Linha' => id, 'Tipo_Variante' => variant.to_s,
          'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
          'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
          'chinese' => source['zh_text'], 'korean_current' => source['work_text'],
          'prior_or_current_scopes_json' => JSON.generate(indexed_by_key.fetch(key, []).map do |row|
            row.to_h.slice('entity_key', 'status', 'evidence')
          end),
          'screening_note' => NOTES.fetch(candidate['english_candidate'])
        }
      end
    end
    manifest = File.join(__dir__, "proper-name-candidate-screen-D#{D}.tsv")
    M.write_table(manifest, headers, samples)
    M.write_table(File.join(__dir__, "proper-name-person-scout-resume-snapshot-D#{D}.tsv"),
                  queues.headers, queues.map(&:to_h))
    following = M.table(NEXT_QUEUE)
    M.write_table(File.join(__dir__, "proper-name-person-scout-next50-D#{D}.tsv"),
                  following.headers, following.map(&:to_h))
    previous = File.read(M::DOCS.first)[/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m]
    raise 'preceding completed batch differs' unless previous && previous.include?('Latest verified proper-name batch: D-21453 ')
    block = previous.sub(/Latest verified proper-name batch:.*?\n/, "Latest verified proper-name batch: D-#{D} candidate screening (#{M::RUN_DATE_ISO}).\n")
    block.sub!(/Reviewed .*?\nGroups:.*?\n/, "Screened 20 heuristic candidates at #{samples.length} sampled candidate/row contexts (#{samples.map { |row| M.key(row) }.uniq.length} distinct CSV row keys); routed new scopes to D-21448-D-21453 and preserved earlier terminal scopes without recounting.\n")
    block.sub!(/Next batch: D-\d+;.*?\n/, "Next batch: D-#{D + 1}; continue source discovery from proper-name-person-scout-next50-D#{D}.tsv; the saved 50-candidate queue is a pre-registration snapshot, not a current ranking. Bare Deod follow-up also remains.\n")
    block.sub!(/Last batch pre-edit backups and byte validation:\n.*?Last actual CSV-edit backups/m,
               "Last batch pre-edit backups and byte validation:\nNo CSV edits in this screening batch; all D-21448-D-21453 edit backups and validations remain in their reports.\nLast actual CSV-edit backups")
    block.sub!(/Report: `.*?`\./, "Report: `work/zh_cn/audit/#{File.basename(report_path)}`.")
    block.sub!(/Addendum: `.*?`\./, "Addendum: `work/zh_cn/audit/#{File.basename(addendum_path)}`.")
    block.sub!(/Exact source comparison manifest: `.*?`\./, "Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.")
    report = <<~TEXT
      # D-#{D}: Resumed Proper-Name Candidate Screening

      Date: #{M::RUN_DATE_ISO}

      This reconciles the saved 20-candidate resume snapshot (ranks 366-385 at
      creation) against the current English-led inventory and exact prior/new
      occurrence records. The manifest retains Japanese, Chinese and Korean
      cells for #{samples.length} candidate/row contexts at
      #{samples.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      This is discovery routing, not a second translation decision or tally.
      Focused D-21448-D-21453 reports describe expanded exact source coverage.

      #{NOTES.map { |name, note| "- #{name}: #{note}" }.join("\n")}

      Unresolved candidate identities (for example Waterhall, isolated Jera and
      bare Deod) are not automatically confirmed or counted as reviewed indexed
      holds. The indexed 39 holds are a separate established population.
      The saved next-50 snapshot is a queue only; incomplete investigations must
      not be reported as completed reviews. Generic headwords in it need their
      complete source compound inspected before entity registration.

      No CSV, glossary, occurrence decision or historical total was changed.
      No PAK or PAK-derived resource was inspected. Official manual
      setting/map/quest context was consulted; its roster is non-exhaustive.
      Full proper-name discovery remains incomplete.

      #{block}
    TEXT
    marker_pattern = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    document_texts = M::DOCS.to_h do |path|
      text = File.read(path)
      raise "checkpoint block differs #{path}" unless
        text.scan('<!-- current-proper-name-batch:start -->').length == 1 &&
        text.scan('<!-- current-proper-name-batch:end -->').length == 1 &&
        text[marker_pattern] == previous
      [path, text]
    end
    File.write(report_path, report)
    File.write(addendum_path, "# D-#{D} Screening Addendum\n\nNo CSV edits or new occurrence decisions. No new pre-edit backup required.\n\n#{block}\n")
    document_texts.each do |path, text|
      updated = text.sub(marker_pattern, block)
      raise "checkpoint substitution failed #{path}" unless updated[marker_pattern] == block
      File.write(path, updated)
    end
    raise 'final checkpoint blocks differ' unless M::DOCS.map { |path| File.read(path)[marker_pattern] }.uniq == [block]
    puts "D-#{D}: 20 candidates, #{samples.length} sampled contexts; no CSV/index/glossary edits"
  end
end

ResumedNameCandidatesD21454.run if $PROGRAM_NAME == __FILE__
