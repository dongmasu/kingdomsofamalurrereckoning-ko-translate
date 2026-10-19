#!/usr/bin/env ruby

# Candidate-only decisions for the D21774 tail queue. Confirmed entities are
# intentionally handled by separate definition/review data, not this helper.
module ScoutTheTailD21780
  extend self

  def candidate_groups
    {
      'The Chantry' => {
        keys: [['default', '7675', ''], ['base', '711', '11']],
        disposition: 'uncertain',
        evidence: 'Only 9 exact English source keys exist; Japanese 礼拝堂 and Chinese 礼拜堂 translate a chantry/chapel generically. The two queued labels do not establish one unique institution or site. Hold without creating an entity.'
      },
      'The God Fang' => {
        keys: [['default', '15664', ''], ['base', '1168', '11'],
               ['base', '3041', '11'], ['base', '4308', '11']],
        disposition: 'uncertain',
        evidence: 'Four exact English keys have inconsistent Chinese renderings (神之牙, 毒牙之神, 上帝之牙); Japanese ranges from ゴッドファング to a literal form. The aligned sources do not establish whether this is a named item, creature, or other referent. Hold; do not infer identity.'
      },
      'The Gardens of Ysa' => {
        keys: [['default', '9150', ''], ['base', '3049', '11']],
        disposition: 'not-an-issue',
        evidence: 'The 57 exact English matches consistently name the Gardens within Ysa, but the existing place:ysa history explicitly keeps complete Gardens labels atomic and does not infer their etymology. Preserve the terminal place:ysa findings at both queued keys; do not reopen them or create a duplicate city entity.'
      },
      'The Mission' => {
        keys: [['default', '15366', ''], ['default', '5273', ''],
               ['default', '7421', ''], ['default', '8398', '']],
        disposition: 'uncertain',
        evidence: 'The 66 exact English source matches refer to more than one mission, including St. Odwig and St. Hadwyn; Japanese 修道院 and Chinese 布道所 are generic institutional translations. Do not merge separate missions into one named location from capitalization or the four queued labels.'
      },
      'The Morning Prayer' => {
        keys: [['default', '40212', ''], ['base', '3104', '11']],
        disposition: 'uncertain',
        evidence: 'Only two exact source labels are queued. Japanese 朝のお祈り and Chinese 晨间祷告 support the ordinary phrase but provide no context establishing a unique named work, rite, or location. Hold without an entity decision.'
      },
      'The Proud Warsworn' => {
        keys: [['default', '4852', ''], ['base', '1769', '11']],
        disposition: 'uncertain',
        evidence: 'The only two exact English occurrences are short labels, with Japanese 誇り高きウォースウォーン and Chinese 骄傲的誓战者 supporting the descriptive reading but not proving it is generic rather than a named work, quest, title, or other entity. Hold both candidate memberships conservatively. Preserve the existing faction:warsworn not-an-issue finding at default:4852 unchanged; base:1769 has no prior indexed finding in the D21774 snapshot.'
      },
      'The Travelers' => {
        keys: [['default', '1206', ''], ['default', '14458', ''],
               ['default', '3427', '']],
        disposition: 'not-an-issue',
        evidence: 'The three queued bilingual labels refer to the already-established Travelers faction, not a second entity. Preserve the existing faction:travelers terminal findings at all three keys; no text or prior disposition is changed.'
      },
      'The Two-Faced Troll' => {
        keys: [['default', '18848', ''], ['base', '1221', '11']],
        disposition: 'uncertain',
        evidence: 'The only two exact English occurrences are short labels. Japanese 双頭のトロール and Chinese 双头巨魔 support a descriptive creature reading, but do not prove the English label is generic rather than a named creature, work, quest, or other entity. Hold both candidate memberships conservatively. Preserve the existing monster:troll accepted finding at default:18848 unchanged; base:1221 has no prior indexed finding in the D21774 snapshot.'
      },
      'The White At War' => {
        keys: [['default', '13500', ''], ['base', '1712', '11']],
        disposition: 'uncertain',
        evidence: 'Only two exact source labels are queued. Japanese 戦場の白 and Chinese 战争中的白色 translate the phrase but do not show whether it is a named work, item, or ordinary title. Hold without inferring an entity.'
      },
      'Traveler Sloop' => {
        keys: [['default', '47168', ''], ['default', '48988', ''],
               ['default', '51424', '']],
        disposition: 'uncertain',
        evidence: 'Japanese トラベラーのスループ帆船 and Chinese 旅行者斯洛浦 describe a Traveler sloop; the sources do not establish a unique vessel name rather than a vessel class. Preserve all existing faction:travelers exclusions at these keys; do not reopen them.'
      },
      'Treasures of Culn' => {
        keys: [['default', '37145', ''], ['default', '55278', ''],
               ['default', '55323', '']],
        disposition: 'uncertain',
        evidence: 'The 13 exact English matches refer to treasure associated with Culn, including a theft scheme, but do not establish a separate named work or unique item. Preserve existing place:culn histories at all three queued keys; do not merge the treasure with the place.'
      },
      'Trial of Initiation' => {
        keys: [['base', '2510', '11'], ['default', '26729', ''],
               ['default', '38853', ''], ['default', '8405', '']],
        disposition: 'uncertain',
        evidence: 'English context identifies a particular Scholia Arcana initiation event: it is administered, begun, completed, and required for admission; the source explicitly leaves its challenges unspecified, not its event status. Japanese 入門試練 and Chinese 启蒙试炼 corroborate. Treat as a named-event candidate for dedicated normalization (the source Korean varies among 입문 시험/시련/의식), not as entity-free merely because it is not a person, place, or work. Preserve all unrelated prior findings at default:8405 without reopening them.'
      },
      'Trial of Strength' => {
        keys: [['default', '50172', ''], ['default', '53052', '']],
        disposition: 'uncertain',
        evidence: 'English names the Trial of Strength as the agent imposing a magical curse, alongside a title-only label; Japanese 力の試練 and Chinese 力量试炼 corroborate the named trial. Treat as a named-event candidate for dedicated normalization, without inventing its contents, venue, or history.'
      },
      'Tuatha Overlord' => {
        keys: [['default', '43320', ''], ['default', '21983', '']],
        disposition: 'excluded',
        evidence: 'Context describes Tuatha Overlord guards/rank, not an additional entity. Preserve existing faction:tuatha and person:belne terminal findings at these keys; do not revise or recount them.'
      },
      'Twists of Fate' => {
        keys: [['default', '17279', ''], ['default', '62112', '']],
        disposition: 'uncertain',
        evidence: 'English explicitly defines Twists of Fate as an unlockable gameplay mechanic that grants permanent stat bonuses; the aligned Japanese ツイスト・オブ・フェイト and Chinese 命运转折 corroborate the named concept. Treat as a lore-term candidate for dedicated bilingual normalization, not as entity-free merely because it is a mechanic rather than a person, place, or work. The source Korean labels vary, so this candidate-only review does not choose a canonical form.'
      },
      'Tyrannus Bolganus' => {
        keys: [['default', '19050', ''], ['default', '53011', '']],
        disposition: 'uncertain',
        evidence: 'English describes "she who keeps the Bolgans at bay," while Japanese and Chinese render an epithet/title rather than a stable personal name. Preserve the existing monster:bolgan finding at default:53011; do not infer or merge an identity.'
      },
      'Undersewers' => {
        keys: [['base', '4579', '11'], ['default', '10594', ''],
               ['default', '4956', '']],
        disposition: 'uncertain',
        evidence: 'The five exact English source matches include undersewers associated with different urban areas, including Idylla; Japanese 地下下水道 and Chinese 下层下水道 are descriptive. The queued labels do not establish one unique site, so hold rather than register a global location.'
      },
      'Universalist' => {
        keys: [['default', '57747', ''], ['default', '3426', '']],
        disposition: 'not-an-issue',
        evidence: 'English defines Universalist as a broad combat-and-weapon Destiny archetype, not an individual. Japanese ユニバーサリスト and Chinese 博识者 support the gameplay-class sense; do not create a person or location.'
      }
    }.freeze
  end
end
