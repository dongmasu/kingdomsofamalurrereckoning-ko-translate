#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module CipherD21004
  extend self
  M = ReviewedNameBatches
  ENTITY = 'item:cipher-of-ethene'
  SHORT = '사이퍼(Cipher)'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Cipher of Ethene',
    'category' => 'unique item', 'korean_canonical' => '에테네의 사이퍼(Cipher of Ethene)',
    'english_aliases' => 'Cipher|The Cipher|Broken Cipher of Ethene|The Broken Cipher',
    'korean_variants' => '사이퍼|암호|암호문|암호 장치|암호기',
    'evidence_ids' => 'D-21004-D-21005|base:566:11|base:4207:11|default:25458|default:32362',
    'status' => 'confirmed',
    'notes' => 'English explicitly names the carried artifact Cipher at default 32362 and identifies it as an artifact at 25458 and a conduit to the gods at 64162. Cipher of Ethene and its broken state are the same named object; short labels remain locally short and broken-state labels keep their qualification. Japanese サイファー/エセンのサイファー and Chinese 密令/伊希恩密令 corroborate. Use established 사이퍼 rather than alternating generic 암호, 암호기, 암호문 and 암호 장치. Reuse the official-manual deity spelling 에테네; the manual does not directly name this expansion artifact. The lower-case cipher at 17444/30184 is the same path-reordering artifact in context, not a cryptographic homonym.'
  }.freeze

  def transform(old, key)
    case key
    when ['base', '566', '11']
      raise 'unexpected intact item name' unless old == '에테네(Ethene)의 암호'
      return '에테네의 사이퍼(Cipher of Ethene)'
    when ['base', '4207', '11']
      raise 'unexpected broken item name' unless old == '에테네(Ethene)의 깨진 암호문'
      return '에테네의 부서진 사이퍼(Broken Cipher of Ethene)'
    when ['default', '26923', '']
      raise 'unexpected full artifact span' unless old.include?('에테네(Ethene)의 사이퍼(Cipher)')
      return old.sub('에테네(Ethene)의 사이퍼(Cipher)', '에테네의 사이퍼(Cipher of Ethene)')
    when ['default', '36959', ''], ['default', '38889', '']
      raise 'unexpected standalone The Cipher' unless %w[사이퍼 암호].include?(old)
      return '사이퍼(The Cipher)'
    when ['default', '41609', '']
      raise 'unexpected standalone broken Cipher' unless old == '부서진 암호'
      return '부서진 사이퍼(The Broken Cipher)'
    end

    text = old.gsub(/(?:사이퍼|암호 장치|암호기|암호문|암호)(?:\(Cipher\))?/, SHORT)
    text.gsub!("#{SHORT}은", "#{SHORT}는")
    text.gsub!("#{SHORT}을", "#{SHORT}를")
    text.gsub!("#{SHORT}과", "#{SHORT}와")
    text.gsub!("#{SHORT}으로", "#{SHORT}로")
    text.gsub!(/#{Regexp.escape(SHORT)}이(?=\s|[,.!?]|$)/, "#{SHORT}가")
    raise "missing translated Cipher #{key.inspect}" unless text.include?(SHORT)
    text
  end

  def run(mode)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Cipher source scope changed #{generated.length}" unless generated.length == 57
    raise 'Cipher resource distribution changed' unless
      generated.group_by { |row| row['resource'] }.transform_values(&:length) == { 'base' => 2, 'default' => 55 }
    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      updated = transform(old, key)
      status = old == updated ? 'not-an-issue' : 'accepted'
      reason = 'English identifies the carried, broken/repaired artifact Cipher, the conduit used with the Hyperian; Japanese サイファー and Chinese 密令 corroborate the same object. Standardize its short name as 사이퍼(Cipher), retain full Cipher of Ethene and broken-state labels atomically, and preserve source-local short forms. Use manual 에테네 for the deity. Adjust particles to vowel-final 사이퍼, including 기존 사이퍼(Cipher)을 at 52852.'
      reason += ' The lower-case source cipher still denotes the same magic path-reordering artifact in this quest, not an ordinary cipher text.' if %w[17444 30184].include?(key[1])
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => reason,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions = File.join(__dir__, 'proper-name-discovery-definitions-D21004.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D21004.tsv')
    M.write_table(definitions, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, [DEFINITION])
    M.write_table(proposals, M::HEADERS, reviews)
    puts "Cipher: #{reviews.length} keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    if mode == 'apply'
      ReviewedProperNameDiscovery.run([definitions, proposals, '21004'])
    elsif mode != 'prepare'
      abort 'usage: review-cipher-D21004.rb [prepare|apply]'
    end
  end
end

CipherD21004.run(ARGV.fetch(0, 'prepare')) if $PROGRAM_NAME == __FILE__
