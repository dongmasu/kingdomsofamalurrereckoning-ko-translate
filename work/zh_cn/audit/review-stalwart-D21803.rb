#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewStalwartD21803
  extend self

  M = ReviewedNameBatches
  D = 21_803
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21802.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  CANDIDATE_KEYS = [
    ['affix', '360', '11'], ['affix', '360', '12'], ['affix', '360', '14'],
    ['affix', '360', '21'], ['affix', '360', '22'], ['affix', '360', '24'],
    ['default', '64178', '']
  ].freeze
  ENTITY = 'item:the-stalwart'
  NAME_KEY = ['default', '64178', ''].freeze
  COMMON_HOMONYM_KEYS = [
    ['default', '13575', ''], ['default', '23481', ''], ['default', '40922', '']
  ].freeze
  SOURCE_KEYS = (COMMON_HOMONYM_KEYS + [NAME_KEY]).freeze
  OLD = '그 배의 이름은 스톨워트(Stalwart)야. 훌륭한 배지.'
  NEW = '그 배의 이름은 스톨워트(The Stalwart)야. 훌륭한 배지.'
  SPECS = [{
    key: ENTITY,
    english: 'The Stalwart',
    category: 'item',
    korean: '스톨워트(The Stalwart)',
    aliases: '',
    variants: '스톨워트|Stalwart',
    count: 4,
    notes: 'Default:64178 explicitly says “The Stalwart, she’s called” and calls it a worthy vessel, so this is the ship’s proper name, not the ordinary affix adjective. Japanese スタルワート号 preserves the name phonetically and Chinese 忠诚号 conveys a worthy/steadfast vessel. Reuse Korean 스톨워트 and pair the exact English title as 스톨워트(The Stalwart). The same case-insensitive phrase also appears as ordinary lowercase adjective + article at default:13575, 23481, and 40922; exclude those contextual homonyms without editing their sentences. Keep affix:360’s six grammatical variants as the common adjective 굳건한; they are not this ship name.'
  }].freeze
  EDIT_EVIDENCE = 'English default:64178 explicitly identifies The Stalwart as a named vessel. Japanese スタルワート号 corroborates the phonetic name and ship classification; Chinese 忠诚号 corroborates the steadfast/worthy sense. Pair the already used Korean ship-name transliteration as 스톨워트(The Stalwart), changing only the missing article in the English annotation. The same case-insensitive phrase appears in ordinary lowercase adjectival clauses at default:13575, 23481, and 40922; exclude those three homonyms without editing their sentences. The six affix:360 variants are the common adjective “Stalwart,” translated as 굳건한; exclude them from this ship identity and preserve all six affix cells unchanged.'

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior = File.read(M::DOCS.first)[marker]
    raise 'D-21802 is not the active checkpoint' unless
      prior&.include?('Latest verified proper-name batch: D-21802 ')
    raise 'active checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior }
    raise 'candidate output already exists' if File.exist?(DISPOSITIONS)

    inventory = M.refresh_inventory
    candidate = M.table(INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == 'Stalwart'
    end
    raise 'Stalwart short-label candidate missing' unless candidate
    members = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    raise 'Stalwart candidate membership changed' unless members.to_set == CANDIDATE_KEYS.to_set

    name_source = inventory.fetch(NAME_KEY)
    raise 'unexpected ship-name English source' unless
      JSON.parse(name_source.fetch('en_texts_json')).compact.join("\n") ==
        "The Stalwart, she's called. A worthy vessel."
    raise 'unexpected ship-name Japanese source' unless
      JSON.parse(name_source.fetch('ja_texts_json')).compact.join("\n") ==
        'スタルワート号だ。その名のとおりの船だよ'
    raise 'unexpected ship-name Chinese source' unless
      name_source.fetch('zh_text') == '她被称为“忠诚号”。一艘靠谱的船。'
    raise 'unexpected Korean ship-name source' unless name_source.fetch('work_text') == OLD

    CANDIDATE_KEYS.select { |parts| parts[0] == 'affix' }.each do |parts|
      source = inventory.fetch(parts)
      raise "affix candidate source differs at #{parts.inspect}" unless
        JSON.parse(source.fetch('en_texts_json')).compact == ['Stalwart'] &&
        source.fetch('work_text') == '굳건한'
    end

    prior_index = M.table(M::INDEX).map(&:to_h).group_by { |row| key(row) }
    ReviewedDiscoverySpecs.run(
      D, 'The Stalwart Named Vessel', SPECS, EDIT_EVIDENCE,
      '<!-- current-proper-name-batch:start -->'
    ) { |_spec, row_key, text, source|
      if row_key == NAME_KEY
        raise 'Stalwart old text differs' unless text == OLD
        [NEW, false]
      elsif COMMON_HOMONYM_KEYS.include?(row_key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        raise "unexpected common adjective context at #{row_key.inspect}" unless
          english.match?(/(?<![A-Za-z0-9])the stalwart(?![A-Za-z0-9])/i)
        [text, true]
      else
        raise "unexpected Stalwart source key #{row_key.inspect}"
      end
    }

    refreshed = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    disposition_rows = CANDIDATE_KEYS.sort_by { |parts| [parts[0], parts[1].to_i, parts[2]] }.map do |parts|
      source = refreshed.fetch(parts)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      {
        'english_candidate' => 'Stalwart',
        'disposition' => parts[0] == 'affix' ? 'excluded' : 'accepted',
        'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => source.fetch('work_text'),
        'evidence' => "D-#{D}: #{parts[0] == 'affix' ? 'This six-variant affix is the ordinary adjective “Stalwart,” not the named ship. Preserve 굳건한 in all variants. ' : ''}#{EDIT_EVIDENCE}",
        'prior_index_dispositions_json' => JSON.generate(
          prior_index.fetch(parts, []).map do |entry|
            [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
          end
        )
      }
    end
    raise 'Stalwart candidate dispositions differ' unless
      disposition_rows.count { |row| row['disposition'] == 'accepted' } == 1 &&
      disposition_rows.count { |row| row['disposition'] == 'excluded' } == 6
    M.write_table(DISPOSITIONS, HEADERS, disposition_rows)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(refreshed.values, glossary, index)
    snapshot_path = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
    M.write_table(snapshot_path, ShortLabelDiscovery20261018::HEADERS, snapshot)
    raise 'Stalwart remains in refreshed candidate queue' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'Stalwart' }
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    candidate_line = "Stalwart candidate memberships: 7 reviewed; 1 named-vessel match accepted and 6 generic adjective variants excluded. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
    M::DOCS.each do |path|
      text = File.read(path)
      block = text[marker]
      block = block.sub(/^Next batch:.*$/, next_line)
      block = block.sub(/^(Next batch:.*\n)/, "\\1#{candidate_line}\n")
      File.write(path, text.sub(marker, block))
    end
    note = <<~TEXT

      ## D-#{D}: Stalwart Candidate Membership Review

      English default:64178 identifies The Stalwart as a named vessel;
      Japanese スタルワート号 and Chinese 忠诚号 corroborate. Standardize the
      ship label as `스톨워트(The Stalwart)`. The six `affix:360` variants
      are the ordinary adjective `Stalwart` and remain `굳건한`; they are
      excluded from the ship entity. Three lowercase `the stalwart` sentence
      matches at default:13575, 23481 and 40922 are also excluded as ordinary
      adjective homonyms, with no sentence edits. Candidate dispositions:
      `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      path = File.join(__dir__, name)
      File.open(path, 'a') { |file| file.write(note) }
      text = File.read(path)
      File.write(path, text.sub(/^Next batch:.*$/, next_line))
    end
    %w[README.md decision-register-20261009.md].each do |name|
      File.open(File.join(__dir__, name), 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: reviewed The Stalwart separately from six common adjective affix variants; ship label corrected."
  end
end

ReviewStalwartD21803.run if $PROGRAM_NAME == __FILE__
