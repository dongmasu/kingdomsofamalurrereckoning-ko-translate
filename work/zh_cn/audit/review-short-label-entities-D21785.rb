#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ShortLabelEntitiesD21785
  extend self

  D = 21_785
  POMBERO = '폼베로(Pombero)'
  ROTCLAW = '로트클로(Rotclaw)'
  BASIN = '프리즘미어 분지(Prismere Basin)'
  ROSE = '칸드리안의 장미(Rose of Kandrian)'
  ORB = '프리즘미어 구슬(Prismere Orb)'

  NOTES = {
    pombero: <<~TEXT.gsub(/\s+/, ' ').strip.freeze,
      English names Pombero at default:13708, 23217 and 38683. The latter
      two identify the same named creature as the Fomorian duke's defeated
      opponent; Japanese ポンベロ and Chinese 庞贝罗 corroborate the name.
      Register only the named creature, distinct from the Fomorians; do not
      infer species, biography or a relationship. Pair the standalone label
      and the missing name in the source-matched title phrase. Keep the
      already paired default:23217 unchanged.
    TEXT
    rotclaw: <<~TEXT.gsub(/\s+/, ' ').strip.freeze,
      English default:50987 explicitly calls Rotclaw a minor kobold warrior;
      default:63022 and 64223 independently identify the same named kobold.
      Japanese ロトクロー and Chinese 腐爪 corroborate the identity. Register
      the named creature separately from the kobold species, Blackshriek and
      King Fang. Reuse the established Korean 로트클로(Rotclaw); correct only
      the unpaired, semantically translated standalone label at default:27000.
    TEXT
    prismere_basin: <<~TEXT.gsub(/\s+/, ' ').strip.freeze,
      All three exact English labels name Prismere Basin. Japanese
      プリスミアの水晶洞 and Chinese 赤晶盆 support the named location while
      English anchors the basin meaning. Register the place separately from
      the Prismere resource and Prismere Chantries. Use the existing Korean
      stem 프리즘미어 and pair the complete compound once, without a nested
      resource annotation.
    TEXT
    rose: <<~TEXT.gsub(/\s+/, ' ').strip.freeze,
      English default:7723 explicitly lists the Rose of Kandrian among three
      requested items, and defaults 11022, 20046, 28656 and 59162 identify
      the same quest object or its recovery. Japanese カンドリアンのバラ and
      Chinese 坎德利安玫瑰/坎德利安的玫瑰 corroborate. Register the item, reuse
      칸드리안의 장미, and add the complete English pair only at exact
      standalone/repeated name spans. Do not infer a plant species or change
      surrounding quest wording.
    TEXT
    orb: <<~TEXT.gsub(/\s+/, ' ').strip.freeze
      The exact English Prismere Orb label and default:28760 teleport-use
      prompt identify the same named object. Japanese プリスミア・オーブ/
      プリスミアのオーブ and Chinese 赤晶球/赤晶球体 corroborate. Register
      the item separately from the Prismere resource. Reuse the prevailing
      Korean 구슬 form, normalize base:3149's isolated 구체, and pair the
      complete item name once without a nested Prismere annotation.
    TEXT
  }.freeze

  SPECS = [
    {
      key: 'creature:pombero', english: 'Pombero', category: 'creature',
      korean: POMBERO, variants: '폼베로|폼베로(Pombero)',
      count: 3, notes: NOTES.fetch(:pombero)
    },
    {
      key: 'creature:rotclaw', english: 'Rotclaw', category: 'creature',
      korean: ROTCLAW, variants: '로트클로|로트클로(Rotclaw)|부패 발톱',
      count: 6, notes: NOTES.fetch(:rotclaw)
    },
    {
      key: 'place:prismere-basin', english: 'Prismere Basin', category: 'place',
      korean: BASIN, variants: '프리즘미어(Prismere) 분지|프리즘미어 분지',
      count: 3, notes: NOTES.fetch(:prismere_basin)
    },
    {
      key: 'item:rose-of-kandrian', english: 'Rose of Kandrian', category: 'item',
      korean: ROSE, variants: '칸드리안의 장미',
      count: 7, notes: NOTES.fetch(:rose)
    },
    {
      key: 'item:prismere-orb', english: 'Prismere Orb', category: 'item',
      korean: ORB, variants: '프리즘미어(Prismere) 구체|프리즘미어 구슬',
      count: 3, notes: NOTES.fetch(:orb)
    }
  ].freeze

  def transform(spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    term = spec.fetch(:english)
    raise "English source term missing #{key.inspect}" unless
      english.match?(/(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i)

    case spec.fetch(:key)
    when 'creature:pombero'
      raise 'Pombero locale corroboration missing' unless
        japanese.match?(/ポンベロ|Pombero/) && chinese.match?(/庞贝罗|Pombero/)
      if key[1] == '13708'
        raise 'Pombero standalone label changed' unless text == '폼베로'
        [POMBERO, false]
      elsif key[1] == '38683'
        old = '폼베로의 처단자'
        raise 'Pombero title phrase changed' unless text.include?(old)
        [text.sub(old, "#{POMBERO}의 처단자"), false]
      else
        raise 'unexpected Pombero source key' unless key == ['default', '23217', '']
        raise 'existing Pombero pair missing' unless text.include?(POMBERO)
        [text, false]
      end
    when 'creature:rotclaw'
      raise 'Rotclaw locale corroboration missing' unless
        japanese.match?(/ロトクロー|Rotclaw/) && chinese.match?(/腐爪|Rotclaw/)
      if key[1] == '27000'
        raise 'Rotclaw standalone label changed' unless text == '부패 발톱'
        [ROTCLAW, false]
      else
        raise "unexpected Rotclaw source key #{key.inspect}" unless
          %w[50926 50987 55629 63022 64223].include?(key[1])
        raise 'existing Rotclaw pair missing' unless text.include?(ROTCLAW)
        [text, false]
      end
    when 'place:prismere-basin'
      raise 'Prismere Basin locale corroboration missing' unless
        japanese.include?('水晶洞') && chinese.include?('赤晶盆')
      if %w[16546 31192].include?(key[1])
        old = '프리즘미어(Prismere) 분지'
        raise 'Prismere Basin component span changed' unless text.include?(old)
        [text.sub(old, BASIN), false]
      else
        raise 'unexpected Prismere Basin source key' unless key[1] == '28753'
        raise 'existing Prismere Basin pair missing' unless text.include?(BASIN)
        [text, false]
      end
    when 'item:rose-of-kandrian'
      raise 'Rose of Kandrian locale corroboration missing' unless
        japanese.include?('カンドリアンのバラ') &&
        chinese.match?(/坎德利安(?:的)?玫瑰/)
      if %w[1473 33698].include?(key[1])
        raise 'Rose standalone label changed' unless text == '칸드리안의 장미'
        [ROSE, false]
      elsif key[1] == '20046'
        old = '칸드리안의 장미를'
        raise 'Rose quest-object span changed' unless text.include?(old)
        [text.sub(old, "#{ROSE}를"), false]
      elsif key[1] == '28656'
        old = '칸드리안의 장미'
        raise 'Rose quest-object span changed' unless
          text.include?(old) && !text.include?(ROSE)
        [text.sub(old, ROSE), false]
      elsif key[1] == '59162'
        old = '칸드리안의 장미'
        raise 'Rose quest-object span changed' unless text.include?(old) && !text.include?(ROSE)
        [text.sub(old, ROSE), false]
      else
        raise "unexpected Rose of Kandrian source key #{key.inspect}" unless
          %w[7723 11022].include?(key[1])
        raise 'existing Rose of Kandrian pair missing' unless text.include?(ROSE)
        [text, false]
      end
    when 'item:prismere-orb'
      raise 'Prismere Orb locale corroboration missing' unless
        japanese.match?(/プリスミア.*オーブ/) && chinese.match?(/赤晶球/)
      if key == ['base', '3149', '11']
        old = '프리즘미어(Prismere) 구체'
        raise 'Prismere Orb variant changed' unless text == old
        [ORB, false]
      else
        raise "unexpected Prismere Orb source key #{key.inspect}" unless
          %w[28760 29347].include?(key[1])
        raise 'existing Prismere Orb pair missing' unless text.include?(ORB)
        [text, false]
      end
    else
      raise "unreviewed discovery entity #{spec.fetch(:key)}"
    end
  end

  def apply
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      English is the identity and meaning anchor; exact aligned Japanese and
      Chinese source cells corroborate each entity. Reviewed every exact
      English source hit across affix/base/default. Normalize only the
      named spans listed in the per-row manifest; preserve existing entity
      owners, all other text, tokens, particles and line breaks. No PAK,
      PAK-derived data or historical global tally was consulted.
    TEXT
    ReviewedDiscoverySpecs.run(
      D, 'Pombero, Rotclaw, Prismere Basin, Rose of Kandrian, And Prismere Orb',
      SPECS, context, '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

ShortLabelEntitiesD21785.apply if $PROGRAM_NAME == __FILE__
