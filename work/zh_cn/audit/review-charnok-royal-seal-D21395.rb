#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module CharnokRoyalSealD21395
  module_function

  def transform(entity, text)
    case entity
    when 'place:charnok-quarry'
      pattern = /샤르녹(?:\(Charnok\))? 채석장(?:\(Charnok Quarry\))?/
      raise 'missing complete quarry label' unless text.match?(pattern)
      text.gsub(pattern, '샤르녹 채석장(Charnok Quarry)')
    when 'title:royal-seal-of-ansilla'
      pattern = /안실라(?:\(Ansilla\))?(?:의 왕실| 왕가의) 인장(?:\(Royal Seal of Ansilla\))?/
      raise 'missing complete royal seal label' unless text.match?(pattern)
      text.gsub(pattern, '안실라의 왕실 인장(Royal Seal of Ansilla)')
    else
      raise "unreviewed entity #{entity}"
    end
  end

  def run
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      Review complete English labels, not generic Charnok/Ansilla aliases.
      Charnok Quarry occurs at base:3769 and default:55336; Japanese
      カルノック採石場 and Chinese 查诺克采石场/查尔诺克采石场 support a named
      quarry. Reuse the existing complete default label 샤르녹 채석장 and
      move the base annotation to the entire place name. Standalone Charnok
      at default:51720 has no identity link established here and is not
      reviewed or changed. Royal Seal of Ansilla occurs at base:796/4816;
      Japanese アンシラの紋章 and Chinese 皇家安西拉奖章 corroborate the
      royal seal label. Normalize the complete label as 안실라의 왕실 인장,
      retaining English Royal explicitly and pairing the entire title.
      Register this as a complete named label, not proof of unique rarity,
      equipment subtype, or identity with Ansilla Key. Existing House Ansilla,
      people, castle and key scopes remain distinct and unchanged. Official
      Korean manual PDF p. 4 gives map context and pp. 6-8 equipment context;
      it does not identify these exact labels. All three active and aligned
      source resources were searched, yielding four distinct row keys.
    TEXT
    specs = [
      {
        key: 'place:charnok-quarry', english: 'Charnok Quarry', category: 'place',
        korean: '샤르녹 채석장(Charnok Quarry)',
        variants: '샤르녹 채석장|샤르녹(Charnok) 채석장', count: 2, notes: context
      },
      {
        key: 'title:royal-seal-of-ansilla', english: 'Royal Seal of Ansilla',
        category: 'title', korean: '안실라의 왕실 인장(Royal Seal of Ansilla)',
        variants: '안실라 왕가의 인장|안실라(Ansilla)의 왕실 인장',
        count: 2, notes: context
      }
    ]
    allowed = {
      'place:charnok-quarry' => [['base', '3769', '11'], ['default', '55336', '']],
      'title:royal-seal-of-ansilla' => [['base', '796', '11'], ['base', '4816', '11']]
    }
    ReviewedDiscoverySpecs.run(
      21_395, 'Charnok Quarry And Royal Seal Complete Labels', specs, context,
      '## D-21394: Vincent Helvern Complete Name'
    ) do |spec, key, text, _source|
      raise "unexpected named label #{key.inspect}" unless allowed.fetch(spec[:key]).include?(key)
      [transform(spec[:key], text), false]
    end
  end
end

CharnokRoyalSealD21395.run if $PROGRAM_NAME == __FILE__
