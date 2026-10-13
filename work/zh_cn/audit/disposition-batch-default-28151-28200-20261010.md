# Disposition and Edit Batch: `default` IDs 28151-28200

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28151-28200, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: three accepted, two `not an issue`, and six uncertain.
- Accepted corrections at IDs 28162, 28172, and 28178 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28162 | `그가 누구인지는 적혀 있지 않다` for the unnamed assistant's identity | Accepted: change to `정체는 언급되지 않았다`. English uses singular `they`, and the other locales differ on number; none establishes the assistant's gender. The new wording preserves the unknown identity without adding gender or number. |
| 28172 | Apotharni `감히 거스르지 못했다` | Accepted: change to `엘게아(Elgea)에서 그들 사이를 거닐 때조차 아포타르니(Apotharni)는 주저했다`. English `demurred` and Japanese hesitation support reluctance, not a definite inability or refusal to oppose. |
| 28178 | `그럴 줄 알았어` for “Smartest thing you've said all day.” | Accepted: change to `오늘 한 말 중 가장 똑똑한 말이네`. English, Japanese, and Chinese all comment that this is the addressee's smartest statement of the day; the current Korean instead means “I expected that.” |
| Remaining ordinary dialogue, objectives, and concise UI wording in IDs 28151-28200, excluding separately listed findings | Keep current wording. | Not an issue: no additional isolated meaning or register correction is better supported by the checked references. Recurring names and terms are handled separately as uncertain rather than treated as approved. |
| IDs 28151-28200 structural and value checks | Keep keys, order, line breaks, runtime-token structure, and displayed values. | Not an issue: each locale contains the 50 IDs once in identical order; the preliminary structure check found no token, line-break, or numeric-value discrepancy requiring correction. |
| 28170 | Possession/Savants fragment | Uncertain: English is clipped and the locale references complete or construe the fragment differently. Preserve the current fragment pending scene context. |
| 28171 | `우리 불쌍한 오리` for “my poor duck” | Uncertain: English and Chinese support a literal duck, while Japanese reads an affectionate human referent. Do not resolve the cross-locale referent conflict without scene context. |
| 28151, 28153-28154, 28158, 28161, 28165, 28168, 28172-28174, 28181-28182, 28184-28187, 28191, 28195-28198 | Maire, Mitharan, Wyvyrn-Girfe, Aodh/Valfillian Carr, Mitharu, Tuatha, Brother Mason, Arcadia myth names, Origin account notice, Skoria, Balor, Thorvald, Osduin, Crilgarin, Aara, Arden, and Gansy | Uncertain: preserve current identities and content pending corpus-wide canonical spelling, title, platform-label, and lore-term alignment. At 28172, this applies to names and the rest of the myth; the Apotharni action correction is separately accepted above. |
| 28186 | St. Odwig's brothers / mission | Uncertain: Japanese identifies a monastery, Chinese a mission, and English leaves the institution type open. Korean preserves the mission reading; confirm the exact institution in context. |
| 28189 | Tuatha / Fae relation and terminology | Uncertain: the source explicitly equates the groups for explanation, but canonical Korean race/faction forms and the relation between the labels need glossary alignment. |
| 28194 | `Varani Rhyme` / `바라니 운문` | Uncertain: Japanese supports a rhyming poem and Chinese a folk song. Keep the current title pending a canonical literary-term decision. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- IDs 28151-28200 occur once in each locale in identical order. The prior
  structural scan found matching line-break counts and normalized runtime
  tokens; the source values reviewed in this range remain unchanged.
- Only Korean `Texto` at IDs 28162, 28172, and 28178 changed. No source CSV,
  key, row order, or variant structure changed.
- Active default CSV SHA-256:
  `552a4f70e0c1036e82ae2bcf7b31760d4fd91643a8b6f634e99c44ed1a0f5077`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 871 accepted, 2,995 `not an issue`, and
  4,974 uncertain (8,840 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28201; 36,934 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
