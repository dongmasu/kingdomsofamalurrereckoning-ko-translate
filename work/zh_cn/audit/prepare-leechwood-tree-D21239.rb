#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "resource:leechwood-tree", english: "Leechwood Tree", category: "resource",
   korean: "리치우드 나무(Leechwood Tree)", count: 2,
   notes: "English base:1267 names the tree itself; default:42501 describes how it strangles surrounding plants and distinguishes its powdered Leechwood Bark reagent. Japanese リーチウッドの木 and Chinese 水蛭木 corroborate. Register the tree separately from the harvested bark, reusing its already standardized 리치우드 stem. The default tree wording was corrected at D-21229 but not included in that batch's entity coverage; this supplemental review closes that registration gap without recounting the earlier edit as a new edit."}
]
context = "Independent review of D-21229 found a tree-name registry gap, not an English/Japanese/Chinese meaning conflict. Search all three source/active resources and record both exact tree labels; keep the tree and bark as distinct named resource referents. Official Korean manual PDF pages 4 and 8 explains reagent harvesting and alchemical recipes, not these specific tree names. Preserve default:42501's bark label and styled Leech token. No existing hold or historical global total is reopened."
ReviewedDiscoverySpecs.run(21_239, "Leechwood Tree Registration Gap", specs, context,
  "## D-21238: Atomic People And Language Suffix Labels") do |spec, key, text, source|
  pattern = /리치우드 나무(?:\(Leechwood Tree\))?(?!껍질)/
  raise "expected one tree span" unless text.scan(pattern).length == 1
  [text.sub(pattern, spec[:korean]), false]
end
%w[named-scope-review-D21229-20261016.md named-scope-edit-addendum-D21229-20261016.md].each do |filename|
  target = File.join(__dir__, filename)
  File.write(target, File.read(target) + "\n## Supplemental Entity Coverage\n\nD-21239 separately reviewed and registered Leechwood Tree in base:1267 and default:42501. D-21229's ten changed cells included the source-supported tree span at default:42501, but its twelve indexed matches covered only the listed existing entities, not that additional tree referent. This subsequent supplement makes the entity-coverage limitation explicit; it does not repeat the earlier CSV edit or alter historical global totals.\n")
end
