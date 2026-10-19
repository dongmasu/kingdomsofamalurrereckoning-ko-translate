#!/usr/bin/env ruby

module PoisonReverieCandidateEvidence
  extend self

  GROUPS = {
    'Poison' => {
      keys: [['default', '38480', ''], ['default', '61144', '']],
      disposition: 'not-an-issue',
      evidence: 'English default:38480 uses Poison as a generic damage/effect label; default:61144 uses it as the ordinary poison in an alphabet poem. Japanese 毒 and Chinese 毒素 support the common substance/damage sense; Korean 독 is retained. The official Korean manual lists poison among generic damage types, not as an individually named entity. Do not register a poison entity or alter either row.'
    },
    'Pombero' => {
      keys: [['default', '13708', ''], ['default', '23217', '']],
      disposition: 'uncertain',
      evidence: 'English default:23217 calls the speaker a Slayer of Pombero, and default:13708 is a standalone Pombero label. Japanese Pombero/ポンベロ and Chinese transliterations support the name, but these rows do not establish whether Pombero is a person, creature, monster, or title-only referent. Preserve the existing Korean 폼베로 forms; do not infer an entity category.'
    },
    'Priestess Corelon' => {
      keys: [
        ['default', '34985', ''], ['default', '39621', ''],
        ['default', '46071', ''], ['default', '51404', ''],
        ['default', '51890', ''], ['default', '55825', ''],
        ['default', '59731', '']
      ],
      disposition: 'not-an-issue',
      evidence: 'All seven exact candidate keys are already owned by person:corelon in the occurrence index. The glossary canonical is Corelon / 코렐론(Corelon); Priestess is a translated role, not a second personal name. Japanese 神官コレロン and Chinese 女祭司科尔隆 corroborate the person/title reading. Preserve every prior accepted/not-an-issue row disposition and do not register or annotate a nested Priestess Corelon identity.'
    },
    'Priestess Jacinda' => {
      keys: [
        ['default', '4025', ''], ['default', '41180', ''],
        ['default', '54247', ''], ['default', '55444', ''],
        ['default', '61315', '']
      ],
      disposition: 'not-an-issue',
      evidence: 'All five exact candidate keys are already owned by person:jacinda. The glossary canonical is Jacinda / 자신다(Jacinda); Priestess is the translated office. Japanese 神官ジャシンダ and Chinese 女祭司雅辛达/贾辛达 corroborate. Retain the existing per-row entity decisions and Korean text; do not create a second title-person entity.'
    },
    'Priestess Seranon' => {
      keys: [
        ['default', '14533', ''], ['default', '16246', ''],
        ['default', '27786', ''], ['default', '46068', '']
      ],
      disposition: 'not-an-issue',
      evidence: 'All four exact candidate keys are already owned by person:abelyra-seranon, whose glossary aliases include Seranon. Japanese 神官セラノン and Chinese 女祭司塞拉农 corroborate. Preserve the existing scoped owner and Korean text; do not create person:seranon or infer that every historical priestess shares the current priestess’s identity.'
    },
    'Prismere Basin' => {
      keys: [
        ['default', '16546', ''], ['default', '28753', ''],
        ['default', '31192', '']
      ],
      disposition: 'uncertain',
      evidence: 'All three candidate keys already have resource:prismere matches. English gives the complete label Prismere Basin; Japanese プリスミアの水晶洞 and Chinese 赤晶盆 support a basin/cave reading, but the snapshot contains labels only and does not establish whether this is a distinct named site or a descriptive resource compound. Preserve existing resource matches and Korean text; defer any place identity.'
    },
    'Prismere Crystal' => {
      keys: [['default', '45555', ''], ['default', '48653', '']],
      disposition: 'not-an-issue',
      evidence: 'Both exact candidate keys are already owned by resource:prismere. English Prismere Crystal is the crystal/material compound, not evidence of a separate unique crystal entity. Japanese プリスミア・クリスタル and Chinese 赤晶 support the compound; Korean already uses 프리즘미어/Prismere and 수정. Preserve the resource matches and avoid a nested Prismere pair or new item identity.'
    },
    'Prismere Orb' => {
      keys: [
        ['base', '3149', '11'], ['default', '28760', ''],
        ['default', '29347', '']
      ],
      disposition: 'uncertain',
      evidence: 'All three exact candidate keys already have resource:prismere matches. English names a Prismere Orb used for teleporting; Japanese プリスミア・オーブ and Chinese 赤晶球体/赤晶球 corroborate the object. The rows do not establish whether it is a unique artifact or a generic teleportation device. Preserve the existing resource match and Korean full-compound wording; do not infer an item identity.'
    },
    'Reckoning' => {
      keys: [
        ['default', '3621', ''], ['default', '39728', ''],
        ['default', '63328', '']
      ],
      disposition: 'not-an-issue',
      dispositions: {
        'default:3621:' => 'uncertain',
        'default:63328:' => 'uncertain'
      },
      evidence: 'The official Korean manual uses 레코닝 모드 for the gameplay state, supporting default:39728, whose English says the concoction grants power to enter Reckoning. However, default:3621 says “systems in Reckoning” and default:63328 is a standalone label; the current evidence does not distinguish a short game-title reference from the mode for those two keys. Preserve all current Korean text and the complete game-title glossary entry; leave those two candidate identities uncertain rather than adding a mode or title alias.'
    }
  }.freeze

  def candidate_groups
    GROUPS
  end
end
