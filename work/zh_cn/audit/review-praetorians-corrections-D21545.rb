#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module PraetoriansCorrectionsD21545
  extend self

  M = ReviewedNameBatches
  D = 21_545
  ENTITY = 'organization:praetorians'
  PROPOSAL = File.join(__dir__, "proper-name-residual-corrections-D#{D}.tsv")

  PATCHES = {
    '20249' => {
      'old' => '프리토리언들에게 들키지 않고',
      'new' => '프레토리안 근위대(Praetorians)의 주의를 끌지 않고',
      'previous_status' => 'uncertain',
      'english' => 'without attracting the Praetorians',
      'japanese' => '軍団兵に気づかれることなく',
      'chinese' => '不引起禁卫军的注意'
    },
    '5766' => {
      'old' => '프레토리안 근위대(Praetorians)이 압수했어',
      'new' => '프레토리안 근위대(Praetorians)가 압수했어',
      'previous_status' => 'accepted',
      'english' => 'the Praetorians confiscated it',
      'japanese' => '軍団兵に没収されちゃった',
      'chinese' => '禁卫军没收了它'
    },
    '32211' => {
      'old' => '프레토리안 근위대(Praetorians)이 압수하기',
      'new' => '프레토리안 근위대(Praetorians)가 압수하기',
      'previous_status' => 'accepted',
      'english' => 'the Praetorians confiscated it',
      'japanese' => '軍団兵に没収されちゃった',
      'chinese' => '禁卫军把它没收了'
    }
  }.freeze

  NOTE = 'Corrective residual for the existing organization:praetorians occurrence only; do not register or recount a new entity/key. English explicitly identifies the Praetorians. Japanese 軍団兵 and Chinese 禁卫军 corroborate the group; at default:20249 both aligned translations say not to attract/draw their attention, so replace the missed Korean variant 프리토리언 and preserve that meaning. At default:5766 and default:32211 the subject is the vowel-final Korean head 근위대, so 가 is grammatical rather than 이. Preserve all unrelated entity decisions, text, opaque tokens and exact line breaks; the prior status/evidence is recorded in the edit manifest.'

  def source_inventory
    M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end.to_h { |row| [M.key(row), row] }
  end

  def reviews(inventory, index)
    PATCHES.map do |id, patch|
      key = ['default', id, '']
      source = inventory.fetch(key)
      prior = index.find do |row|
        row.fetch('entity_key') == ENTITY && M.key(row) == key
      end
      raise "Praetorian existing key/status differs #{id}" unless
        prior && prior.fetch('status') == patch.fetch('previous_status')

      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Praetorian aligned source evidence differs #{id}" unless
        english.include?(patch.fetch('english')) &&
        japanese.include?(patch.fetch('japanese')) &&
        chinese.include?(patch.fetch('chinese'))

      old = source.fetch('work_text')
      raise "Praetorian Korean span differs #{id}" unless
        old.scan(Regexp.new(Regexp.escape(patch.fetch('old')))).length == 1
      new_text = old.sub(patch.fetch('old'), patch.fetch('new'))
      raise "Praetorian token or line-break change #{id}" unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) ==
          new_text.scan(ReviewedProperNameDiscovery::OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)

      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => new_text,
        'evidence' => "#{NOTE} #{key.join(':')}: exact English/Japanese/Chinese source spans are recorded.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'Praetorian correction proposal already exists' if File.exist?(PROPOSAL)
    inventory = source_inventory
    index = M.table(M::INDEX).map(&:to_h)
    rows = reviews(inventory, index)
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), rows)
    rows
  end

  def apply
    rows = prepare
    index_count = M.table(M::INDEX).length
    glossary_hash = Digest::SHA256.file(ReviewedProperNameDiscovery::GLOSSARY).hexdigest
    M.write_table(PROPOSAL, M::HEADERS, rows)
    M.run(PROPOSAL, D, 1, review_states: %w[accepted uncertain])
    raise 'Praetorian correction changed occurrence count or glossary' unless
      M.table(M::INDEX).length == index_count &&
      Digest::SHA256.file(ReviewedProperNameDiscovery::GLOSSARY).hexdigest == glossary_hash
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PraetoriansCorrectionsD21545.prepare
  when ['apply'] then PraetoriansCorrectionsD21545.apply
  else abort 'usage: review-praetorians-corrections-D21545.rb [prepare|apply]'
  end
end
