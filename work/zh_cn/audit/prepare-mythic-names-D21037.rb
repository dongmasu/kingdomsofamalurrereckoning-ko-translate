#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module MythicNamesD21037
  M = ReviewedNameBatches
  SPECS = [
    ['person:hecatyr', 'Hecatyr', 'person', '헤카티르', [], 3,
     'default:9813|default:15168|default:17745',
     'Named mythic Titan/individual, described as the three-mother and guardian of the gateway to the dead. Person is used for the named individual, not as a claim of mortality or a playable race. Japanese ヘカティール and Chinese 赫卡提尔 corroborate identity. Preserve the established 헤카티르 reading and the source-local gender/parental imagery.'],
    ['person:selinia', 'Selinia', 'person', '셀리니아', [], 2,
     'default:17745|default:38272',
     'Named Titan and messenger of Lunala, explicitly identified in English default:17745. Person denotes the individual, not a claim of mortality or race. Japanese セリニア and Chinese 瑟林尼亚 corroborate identity. Preserve the established 셀리니아 reading; do not change narrative pronouns in this name-only pass.'],
    ['deity:lunala', 'Lunala', 'deity', '루날라', ['루나라'], 32,
     'default:15739|default:17645|default:17745|default:34316',
     'Named goddess of the moon/night, explicitly identified by the English lore and prayers. Japanese ルナーラ and Chinese 卢娜拉 corroborate identity. Preserve established 루날라 and normalize 루나라 in the poem. Equipment titles retain the source possessive construction rather than inventing a separate item identity.'],
    ['person:arcadia', 'Arcadia', 'person', '아카디아', [], 2,
     'default:28172|default:51089',
     'English default:28172 explicitly identifies Arcadia as a Titan and individual admired for her beauty, not a geographical Arcadia. Person denotes the mythic individual, not a claim of mortality. Japanese アルカディア and Chinese 阿卡迪亚 corroborate identity; preserve the established 아카디아 reading.'],
    ['deity:helius', 'Helius', 'deity', '헬리우스', [], 19,
     'default:33479|default:41972|default:56955|base:244',
     'Named sun god, explicitly identified by English default:33479 and default:56955; Japanese ヘリウス and Chinese 赫利乌斯 corroborate identity. Preserve established 헬리우스. This registration covers exact English Helius only; source spelling Helios is not automatically merged without a separate contextual review.'],
    ['person:bisarane', 'Bisarane', 'person', '비사라네', %w[비사레인 비사라니 비사란 비자레인], 142,
     'base:4143|default:8147|default:56524|default:48091',
     'Named Winter Fae individual and King/leader of the House of Sorrows, explicitly self-identified in English default:8147 and default:56524 and described as a Winter Fae associated with the House in default:48091. Person denotes the named individual, not a claim of mortality or a playable race. Japanese ビザレイン and Chinese 比萨拉恩/比萨兰 corroborate identity. Normalize observed 비사레인/비사라니 to the corpus-majority 비사라네. Keep the House of Sorrows and the magical force Sorrows distinct from this person.']
  ].freeze
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21037-expanded.tsv'

  module_function

  def normalize(text, english, korean, variants)
    forms = ([korean] + variants).sort_by { |form| -form.length }
    pattern = /(?:#{forms.map { |form| Regexp.escape(form) }.join('|')})(?:[ \t]*\(#{Regexp.escape(english)}\))?/
    raise "no matched Korean #{english}" unless text.match?(pattern)
    updated = text.gsub(pattern) { "#{korean}(#{english})" }
    final = korean[-1].ord - 0xAC00
    has_batchim = final % 28 != 0
    liquid = final % 28 == 8
    expected = {
      '을' => has_batchim ? '을' : '를', '를' => has_batchim ? '을' : '를',
      '이' => has_batchim ? '이' : '가', '가' => has_batchim ? '이' : '가',
      '은' => has_batchim ? '은' : '는', '는' => has_batchim ? '은' : '는',
      '과' => has_batchim ? '과' : '와', '와' => has_batchim ? '과' : '와',
      '으로' => has_batchim && !liquid ? '으로' : '로',
      '로' => has_batchim && !liquid ? '으로' : '로'
    }
    updated.gsub(/#{Regexp.escape(korean)}\(#{Regexp.escape(english)}\)(으로|[을를이가은는과와로])/) do |span|
      particle = Regexp.last_match(1)
      span.sub(/#{Regexp.escape(particle)}\z/, expected.fetch(particle))
    end
  end

  def run
    definition_path = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21037.tsv')
    review_path = REVIEW_PATH
    raise "already exists: #{review_path}" if File.exist?(review_path)
    inventory = M.refresh_inventory.values
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    definitions = []
    by_key = {}
    SPECS.each do |entity, english, category, korean, variants, count, anchors, notes|
      raise "already registered: #{entity}" if glossary.any? { |row| row['entity_key'] == entity }
      definitions << {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => variants.join('|'),
        'evidence_ids' => "D-21037-D-21040|#{anchors}", 'status' => 'confirmed',
        'notes' => "#{notes} The official Korean manual PDF pages 1-2 provide Fate/deity context and established names of related gods (Gaea, Lyria, Belen, Vraekor); its non-exhaustive playable patron list does not settle this name."
      }
      sources = inventory.select do |source|
        JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
          text.match?(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i)
        end
      end
      raise "coverage differs for #{english}: #{sources.length}" unless sources.length == count
      sources.each do |source|
        key = M.key(source)
        review = by_key[key] ||= {
          'resource' => source.fetch('resource'),
          'ID_Linha' => source.fetch('ID_Linha'),
          'Tipo_Variante' => source['Tipo_Variante'].to_s,
          'entity_key' => [], 'old' => source.fetch('work_text'),
          'new' => source.fetch('work_text'), 'evidence' => [],
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'), 'entity_dispositions_json' => {},
          'previous_status' => '', 'previous_evidence' => ''
        }
        updated = normalize(review.fetch('new'), english, korean, variants)
        status = review['new'] == updated ? 'not-an-issue' : 'accepted'
        review['new'] = updated
        review['entity_key'] << entity
        review['entity_dispositions_json'][entity] = status
        review['evidence'] << "#{entity}: #{notes} Aligned English/Japanese/Chinese were checked for this exact row. Add or standardize only the matched name and preserve all other wording/particles and previously accepted names."
      end
    end
    prior_definitions = if File.file?(definition_path)
                          normalized = File.read(definition_path).gsub(/\r\n?/, "\n")
                          CSV.parse(normalized, headers: true, col_sep: "\t").map(&:to_h)
                        else
                          []
                        end
    prior_entities = prior_definitions.map { |row| row['entity_key'] }
    expected_entities = definitions.map { |row| row['entity_key'] }
    raise 'existing definitions are not a subset of this reviewed discovery' unless
      (prior_entities - expected_entities).empty?
    reviews = by_key.values.sort_by do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
    end.map do |row|
      row.merge(
        'entity_key' => row['entity_key'].join('|'),
        'evidence' => row['evidence'].join(' '),
        'entity_dispositions_json' => JSON.generate(row['entity_dispositions_json']),
        'status' => row['old'] == row['new'] ? 'not-an-issue' : 'accepted'
      )
    end
    # Hecatyr, Selinia, and Lunala overlap in one shared lore row, which
    # contributes two duplicate entity matches beyond the distinct row count.
    expected_rows = SPECS.sum { |spec| spec.fetch(5) } - 2
    raise "expected #{expected_rows} distinct rows, got #{reviews.length}" unless
      reviews.length == expected_rows
    M.write_table(definition_path, glossary.headers, definitions)
    M.write_table(review_path, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} distinct rows / #{SPECS.sum { |spec| spec.fetch(5) }} entity matches: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

MythicNamesD21037.run if $PROGRAM_NAME == __FILE__
