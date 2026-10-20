#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module PrepareCaptainContextsD21859
  module_function

  def run
    batches = ReviewedNameBatches
    output = File.join(__dir__, 'proper-name-review-input-D21859.tsv')
    raise 'review already exists' if File.exist?(output)
    inventory = batches.table(batches::INVENTORY).to_h { |row| [batches.key(row), row.to_h] }
    index = batches.table(batches::INDEX).to_h do |row|
      [[row['entity_key'], *batches.key(row)], row.to_h]
    end
    trav_evidence = <<~TEXT.gsub(/\s+/, ' ').strip
      Source-local military-versus-nautical title correction: English
      default:23356 identifies Desiderus Trav's Ariad soldiers and
      default:35289 describes his land-force attack through Shadow Pass.
      Aligned Japanese デシデルス・トラブ隊長 and Chinese
      徳希德鲁斯·特拉弗队长 do not describe a ship captain here.
      Replace only 선장 in the two exact Captain Desiderus Trav labels with
      대위, reusing the existing Captain Trav rendering at default:8153,
      23893 and 59948, where Chinese 特拉弗上尉 also supports military rank.
      Retain person:desiderus and person:trav component ownership; do not
      create an identity, alias, or global Captain translation rule.
    TEXT
    talibor_evidence = <<~TEXT.gsub(/\s+/, ' ').strip
      Source-local watch-command title correction: English default:13351
      and 28074 explicitly identify Eriad Talibor as Captain of the Watch,
      and default:51355 says Captain Talibor, of the City Watch.
      Japanese タリボー隊長 and Chinese 塔利波尔队长 corroborate.
      Replace the residual 선장 and inconsistent 대위 renderings with the
      established 대장 used at default:11158,18113,22382,39724,51056,51355.
      Pair only the source-written complete title/name as Captain Talibor,
      or preserve the existing Captain Eriad Talibor full annotation.
      The shipwreck/slave-sale evidence does not make the watch commander a
      ship captain. Preserve person:talibor and person:eriad ownership,
      existing full-name spellings, other names, and wording. Change only
      the immediately attached 와/였다고 to 과/이었다고 where required by
      the new final consonant in 대장.
      No new identity, global alias, or global Captain replacement is added.
    TEXT
    targets = {
      '33107' => [%w[person:desiderus person:trav], '선장', '대위', 'Captain Desiderus Trav', trav_evidence],
      '34981' => [%w[person:desiderus person:trav], '선장', '대위', 'Captain Desiderus Trav', trav_evidence],
      '689' => [['person:talibor'], '탈리보르(Talibor) 대위', '탈리보르 대장(Captain Talibor)', 'Captain Talibor', talibor_evidence],
      '24504' => [['person:talibor'], '탈리보르(Talibor) 선장', '탈리보르 대장(Captain Talibor)', 'Captain Talibor', talibor_evidence],
      '30951' => [['person:talibor'], '탈리보르(Talibor) 대위와', '탈리보르 대장(Captain Talibor)과', 'Captain Talibor', talibor_evidence],
      '53530' => [%w[person:eriad person:talibor], '선장 에리아드', '대장 에리아드', 'Captain Eriad Talibor', talibor_evidence],
      '56507' => [['person:talibor'], '탈리보르(Talibor) 대위였다고', '탈리보르 대장(Captain Talibor)이었다고', 'Captain Talibor', talibor_evidence],
      '59790' => [['person:talibor'], '탈리보르(Talibor) 선장', '탈리보르 대장(Captain Talibor)', 'Captain Talibor', talibor_evidence]
    }
    reviews = targets.map do |id, (entities, old_span, new_span, title, evidence)|
      key = ['default', id, '']
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact
      raise "source title mismatch #{id}" unless english.all? { |text| text.include?(title) }
      raise "Japanese command context mismatch #{id}" unless japanese.all? { |text| text.include?('隊長') }
      raise "Chinese command context mismatch #{id}" unless source.fetch('zh_text').include?('队长')
      entities.each do |entity|
        prior = index.fetch([entity, *key])
        raise "protected prior disposition #{id}/#{entity}" unless %w[accepted not-an-issue].include?(prior['status'])
      end
      old = source.fetch('work_text')
      raise "old span mismatch #{id}" unless old.scan(old_span).length == 1
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => entities.join('|'), 'status' => 'accepted',
        'old' => old, 'new' => old.sub(old_span, new_span), 'evidence' => evidence,
        'english' => english.join("\n"), 'japanese' => japanese.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, 'accepted'] })
      }
    end
    batches.write_table(output, batches::HEADERS, reviews)
    puts output
  end
end

PrepareCaptainContextsD21859.run if $PROGRAM_NAME == __FILE__
