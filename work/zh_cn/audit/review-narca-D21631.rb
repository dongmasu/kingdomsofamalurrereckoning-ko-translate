#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewNarcaD21631
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_631
  ENTITY = 'lore_term:narca'
  EVIDENCE = <<~TEXT.chomp
    English explicitly names the Narca curse/affliction and the Narca
    affected by it. default:9677 attributes its inadvertent creation to
    Halcyor; 46180 says brethren went mad and became Narca. Register the
    source term as a lore term, not a person, race, deity or distinct
    faction. This accommodates the explicitly attested affliction and
    affected-being uses without claiming they are interchangeable entities.
    Japanese ナーカ and Chinese 纳尔卡 support the existing 나르카 stem.
    Standardize the isolated 나라카 spelling and annotate the first
    unpaired 나르카 span once per row. Preserve complete Narca Curse
    parentheses, subsequent same-row short references and class modifiers
    such as Zealot/Sorcerer. No class is promoted to a separately named NPC.
    All affix/base/default sources were searched; all 50 exact hits are
    default rows. The official Korean manual has no direct entry.
    No PAK material, old-disposition reopening, global recount, build or
    release change is involved. Other source discovery is separate.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    values = {
      'entity_key' => ENTITY, 'english_canonical' => 'Narca',
      'category' => 'lore term', 'korean_canonical' => '나르카(Narca)',
      'english_aliases' => '', 'korean_variants' => '나르카|나라카',
      'evidence_ids' => "D-#{D}|default:9677|default:46180",
      'status' => 'confirmed', 'notes' => EVIDENCE
    }
    definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    generated = build_occurrences(inventory.values, [definition]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise 'Narca source scope differs' unless generated.length == 50 && generated.all? { |r| r['resource'] == 'default' }
    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source['work_text']
      text = old.gsub('나라카', '나르카')
      covered = text.scan(/\(([^()\r\n]+)\)/).flatten.any? { |label| label.match?(/\bNarca\b/i) }
      unless covered
        raise "missing Narca translation #{key.inspect}" unless text.include?('나르카')
        text.sub!('나르카', '나르카(Narca)')
      end
      status = text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => text,
        'evidence' => EVIDENCE,
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end.sort_by { |r| r['ID_Linha'].to_i }
    R.validate!([definition], reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews.select { |r| r['old'] != r['new'] })
    puts "D-#{D}: 50 reviewed rows, #{reviews.count { |r| r['old'] != r['new'] }} Texto edits."
    [glossary.headers, definition, reviews]
  end

  def apply
    headers, definition, reviews = prepare
    paths = %w[proper-name-discovery-definitions proper-name-discovery].map { |stem| File.join(__dir__, "#{stem}-D#{D}.tsv") }
    raise 'discovery artifacts exist' if paths.any? { |path| File.exist?(path) }
    M.write_table(paths[0], headers, [definition])
    M.write_table(paths[1], M::HEADERS.take(12), reviews)
    R.run([*paths, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewNarcaD21631.prepare
  when ['apply'] then ReviewNarcaD21631.apply
  else abort 'usage: review-narca-D21631.rb [prepare|apply]'
  end
end
