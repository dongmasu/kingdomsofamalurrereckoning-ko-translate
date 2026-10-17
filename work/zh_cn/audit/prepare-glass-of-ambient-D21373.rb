#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module GlassOfAmbientReviewD21373
  M = ReviewedNameBatches
  ENTITY = 'unique item:glass-of-ambient'
  NAME = '앰비언트의 거울(Glass of Ambient)'
  REVIEW = File.join(M::AUDIT, 'proper-name-discovery-D21373.tsv')
  TARGETS = {
    ['base', '2545'] => ['주변 경관 유리', NAME],
    ['base', '4770'] => ['주변 풍경의 유리', NAME],
    ['default', '8442'] => ['앰비언트 유리(Glass of Ambient)란', "#{NAME}이란"],
    ['default', '8975'] => ['앰비언트의 유리를 찾아야', "#{NAME}을 찾아야"],
    ['default', '13271'] => ['앰비언트의 유리잔(Glass of Ambient)', NAME],
    ['default', '15811'] => ['앰비언트의 유리잔(Glass of Ambient)', NAME],
    ['default', '20158'] => ['앰비언트의 거울은', "#{NAME}은"],
    ['default', '25871'] => ['앰비언트의 거울', NAME],
    ['default', '31357'] => ['앰비언트의 거울', NAME],
    ['default', '34661'] => ['앰비언트의 거울을', "#{NAME}을"],
    ['default', '35698'] => ['앰비언트의 거울을', "#{NAME}을"],
    ['default', '52734'] => [
      '유리(Glass)를',
      '거울을'
    ],
    ['default', '54737'] => [
      '앰비언트 유리(Glass of Ambient)가',
      "#{NAME}이"
    ],
    ['default', '58162'] => [
      '주변 경관 유리(Glass of Ambient)를',
      "#{NAME}을"
    ],
    ['default', '59803'] => ['앰비언트의 거울 찾기', "#{NAME} 찾기"]
  }.freeze

  EVIDENCE = 'English default:12766 explicitly identifies the Glass of Ambient as a mirror, and default:54737 calls it a magical mirror. Japanese 眺望のガラス and Chinese 方圆之镜 corroborate the same artifact. Reuse 앰비언트의 거울 and annotate the complete source-local name. At default:52734, the Glass is an anaphor to this mirror and is rendered 거울; no global Glass alias is added. Preserve other entities, antecedents, Korean particles, tokens, grammar, and line breaks.'

  module_function

  def run
    inventory = M.refresh_inventory
    source_rows = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z])Glass of Ambient(?![A-Za-z])/i)
      end
    end
    raise "expected 20 source rows, found #{source_rows.length}" unless source_rows.length == 20
    raise 'duplicate source row keys' unless source_rows.map { |row| M.key(row) }.uniq.length == 20
    raise 'edit map has a key outside the source scope' unless
      (TARGETS.keys - source_rows.map { |row| M.key(row).take(2) }).empty?
    raise 'expected 15 scoped text edits' unless TARGETS.length == 15

    rows = source_rows.sort_by do |source|
      [M::RESOURCES.index(source.fetch('resource')), source.fetch('ID_Linha').to_i]
    end.map do |source|
      key = M.key(source)
      old = source.fetch('work_text')
      new_text = old.dup
      target = TARGETS[key.take(2)]
      if target
        fragment, replacement = target
        raise "target span is not unique at #{key.inspect}" unless
          old.scan(Regexp.new(Regexp.escape(fragment))).length == 1
        new_text.sub!(fragment, replacement)
        raise "target span did not change at #{key.inspect}" if new_text == old
      end
      if key == ['default', '52734', '']
        fragment = '주변의 유리(Glass of Ambient)로'
        raise 'Glass of Ambient span missing at default:52734' unless new_text.include?(fragment)
        new_text.sub!(fragment, "#{NAME}로")
      end
      raise "unreviewed non-target edit at #{key.inspect}" if !target && new_text != old
      raise "opaque tokens or line breaks changed at #{key.inspect}" unless
        old.scan(/\{[^{}]*\}|\$[^$]*\$|<[^>]*>/) ==
          new_text.scan(/\{[^{}]*\}|\$[^$]*\$|<[^>]*>/) &&
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      raise "missing aligned locale evidence at #{key.inspect}" if english.empty? || japanese.empty? || source['zh_text'].to_s.empty?
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => EVIDENCE, 'english' => english, 'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    raise 'unexpected disposition totals' unless
      rows.count { |row| row['status'] == 'accepted' } == 15 &&
      rows.count { |row| row['status'] == 'not-an-issue' } == 5
    M.write_table(REVIEW, M::HEADERS, rows)
    puts "Prepared #{rows.length} Glass of Ambient rows: #{rows.count { |row| row['status'] == 'accepted' }} edits, #{rows.count { |row| row['status'] == 'not-an-issue' }} unchanged."
  end
end

GlassOfAmbientReviewD21373.run if $PROGRAM_NAME == __FILE__
