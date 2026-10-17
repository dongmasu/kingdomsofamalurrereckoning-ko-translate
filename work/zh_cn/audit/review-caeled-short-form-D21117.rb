#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'

module CaeledShortFormD21117
  M = ReviewedNameBatches
  D = 21_117
  ENTITY = 'place:caeled-coast'
  PATH = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  INDEX = M::INDEX

  CASES = {
    '14549' => {
      'status' => 'accepted',
      'old_span' => '캐리드(Caeled)',
      'new_span' => '케일드(Caeled)',
      'evidence' => 'The English source says “out here in Caeled”; Japanese キャレッド and Chinese 卡莱海岸 identify the same southern region. Reuse the established Caeled spelling 케일드, pairing only the source-short place mention. The earlier D-4402 uncertainty about the separate Hero of Mel Senshir title is not reopened.'
    },
    '18137' => {
      'status' => 'not-an-issue',
      'evidence' => 'English describes Caeled as the family’s former domain; Japanese キャレッド and Chinese 凯乐德 corroborate the place reference. The existing Korean already pairs Caeled. D-5742 is preserved as a terminal sequential-review finding and is not recounted.'
    },
    '25174' => {
      'status' => 'accepted',
      'old_span' => '케일드의',
      'new_span' => '케일드(Caeled)의',
      'evidence' => 'English says there were few children in Caeled; Japanese キャレッド and Chinese 凯乐德 corroborate the place. Add the missing English pairing to the established Korean name. No other part of the sentence is changed.'
    },
    '52784' => {
      'status' => 'not-an-issue',
      'evidence' => 'English identifies the Caeled nobles; Japanese キャレッド and Chinese 凯乐德 corroborate the place reference. The Korean already pairs Caeled. The separate person:clary-ansilla disposition at this key remains unchanged and is not recounted.'
    },
    '57006' => {
      'status' => 'uncertain',
      'evidence' => 'English, Japanese, and Chinese provide only the isolated label “Caeled”. It could be the established Caeled Coast region, but this row alone does not establish its entity or intended canonical name. Keep the already bilingual Korean unchanged and do not add a global Caeled alias.'
    }
  }.freeze

  def self.prepare(inventory)
    CASES.map do |id, decision|
      source = inventory.fetch(['default', id, ''])
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      raise "default:#{id} lacks the Caeled source name" unless
        english.match?(/(?<![A-Za-z])Caeled(?![A-Za-z])/)

      new_text = old.dup
      if decision['old_span']
        raise "default:#{id} expected one exact Korean span" unless
          old.scan(Regexp.new(Regexp.escape(decision.fetch('old_span')))).length == 1
        new_text.sub!(decision.fetch('old_span'), decision.fetch('new_span'))
      end
      raise "default:#{id} changed line breaks" unless
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
      raise "default:#{id} changed opaque tokens" unless
        old.scan(/\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/) ==
          new_text.scan(/\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/)

      {
        'resource' => 'default',
        'ID_Linha' => id,
        'Tipo_Variante' => '',
        'entity_key' => ENTITY,
        'status' => decision.fetch('status'),
        'old' => old,
        'new' => new_text,
        'evidence' => "#{decision.fetch('evidence')} This is an exact row-scoped Caeled occurrence; no unrestricted English alias is registered. English is authoritative; Japanese and Chinese are corroborating evidence.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => decision.fetch('status'))
      }
    end
  end

  def self.apply
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    rows = prepare(inventory)
    index = M.table(INDEX)
    known = index.map { |row| [row['entity_key'], *M.key(row)] }.to_set
    additions = rows.map do |row|
      key = [ENTITY, *M.key(row)]
      {
        'entity_key' => ENTITY,
        'resource' => row.fetch('resource'),
        'ID_Linha' => row.fetch('ID_Linha'),
        'Tipo_Variante' => '',
        'matched_english' => 'Caeled',
        'english_source' => row.fetch('english'),
        'korean_current' => row.fetch('old'),
        'status' => 'needs-context',
        'evidence' => 'Exact source-short Caeled candidate; row-scoped identity review only, no global alias.'
      }
    end
    existing = index.select do |row|
      row['entity_key'] == ENTITY && rows.any? { |review| M.key(review) == M.key(row) }
    end
    if existing.empty?
      raise 'D-21117 keys are already indexed under another state' if
        additions.any? { |row| known.include?([row['entity_key'], *M.key(row)]) }
      M.write_table(INDEX, index.headers, index.map(&:to_h) + additions)
    else
      raise 'partial or mismatched D-21117 occurrence registration' unless
        existing.length == additions.length &&
          additions.all? do |addition|
            found = existing.find do |row|
              [row['entity_key'], *M.key(row)] ==
                [addition['entity_key'], *M.key(addition)]
            end
            found && %w[matched_english english_source korean_current status].all? do |field|
              found[field] == addition[field]
            end
          end
    end
    M.write_table(PATH, rows.first.keys, rows)
    M.run(PATH, D, nil)
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-caeled-short-form-D21117.rb' unless ARGV.empty?
  CaeledShortFormD21117.apply
end
