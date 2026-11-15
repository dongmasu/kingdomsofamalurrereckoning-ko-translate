# Sequential `default` Revalidation: IDs `27250`-`27499`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese,
  and Chinese for meaning, naturalness, register, terminology, and structure.
- Rechecked 65 existing entries and added 185 new IDs. Five correction
  candidates (including one reclassified existing row) and five new
  evidence-limited holds are recorded. Three earlier candidates and three
  earlier holds remain.
- No translation CSV, source asset, or binary was modified.

## Correction Candidates

Findings remain pending the editor/approval step.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `27258` | Naturalness | English describes Patrick's death and the player's laying his wife's remains to rest. Korean `패트릭 ...이 죽고 그의 아내의 시신도 안식에 들게 했다` changes subject mid-construction. Consider `패트릭 모르칸(Patrick Morkan)은 죽었고, 그의 아내의 시신도 안식에 들게 했다`, retaining the subsequent instruction to consult Lerkara at Mel Aglir. | High |
| `27292` | Meaning | Attack 2 deals immediate Piercing Damage and Bleeding Damage over six seconds, as Japanese explicitly distinguishes. Korean `관통 피해 65와 출혈 피해 12를 주며, 6초 동안 지속됩니다` makes the duration apply indistinctly to the whole attack. Consider `각 투사체는 관통 피해 65를 주고, 6초에 걸쳐 출혈 피해 12를 줍니다`. Preserve both attack blocks, projectile count, numerical values, and mana costs. | High |
| `27370` | Terminology / naturalness | English `alchemical recipes` and Japanese `錬金術の調合法` mean alchemical formulas, not cooking recipes. Replace `연금술 조리법` with `연금술 제조법` or the established formula-label equivalent after checking the item's full terminology. The stand-alone `Recipe` at `27132` is not automatically the same context. | High |
| `27446` | Meaning / naturalness | `listen to that Sister Zelda` means listening to Zelda herself, not hearing stories about her. Japanese differs in sentiment, but English and Chinese clearly convey exasperation. Consider `젤다 수녀(Sister Zelda)의 말을 일 분만 더 들어야 한다면...` or an equivalent frustrated fragment; preserve the unfinished threat rather than completing it. | High |
| `27487` | Meaning / terminology | English explicitly names `sprites`; Japanese `スプライト` confirms the creature type. Korean generic `요정들` loses this distinction, as in existing `27492`. Consider `스프라이트(Sprite)들에게 붙잡히기 전에는...`; preserve the ancient wandering-pool account. This is a new finding on an existing ledger row. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `27254` | Speech level | Japanese is plain, while Korean consistently uses `-요` and `제`. No per-line speaker or quest-stage mapping establishes whether politeness is intentional. Do not rewrite from English alone. `단검` agrees with base `807`/`2069`. |
| `27291` | Meaning / source conflict | `took over his job, and his heart` is ambiguous between romantic affection and taking on his spirit/intent. Japanese and Chinese explicitly select inherited intent, while Korean `그의 마음도 얻었어` implies winning his affection. Keep pending the relationship/scene; do not invent a romance or erase one without evidence. |
| `27378` | Meaning / context | `before the mortal armies follow you` could refer to pursuit or following the addressee in death. Korean selects pursuit. The fragment and Japanese do not settle the referent; preserve as unresolved rather than adding a death claim. |
| `27387` | Meaning / terminology | English `Well Progress Log`, Japanese `魂の泉` and Korean `샘 진행 기록` suggest a Well of Souls research log, but the short English label does not itself give the full proper name. Verify the associated book/UI context before expanding to `영혼의 샘(Well of Souls) ...`; do not confuse it with the Ysa Font. |
| `27459` | Speech level | Japanese `次の指示を待ってる` is plain; Korean `기다리겠습니다` is formal. A subordinate awaiting instructions can plausibly be polite, but the asset does not prove speaker/relationship. Retain pending direct context instead of assigning a voice. |

## Earlier Findings And Checks

- Retain `27391` (Ratofer family charter should follow the established
  `칙허장`), `27442` (search for the Blades and Seal, not go to them), and
  `27492` (Sprite creature-type terminology).
- Retain holds at `27330` (register/context), `27375` (Aster spelling),
  and `27418` (brother's relative age differs between Japanese and Chinese).
- The base forms are `장궁` (`495`, `713`), `대검` (`185`, `3113`, `4430`,
  `4704`), `단검` (`807`, `2069`), and `지팡이` (`4300`). The weapon
  expressions at `27254`, `27315`, `27415`, and `27429` agree.
- 62 exact-English duplicate groups touch this range (1,119 corpus rows).
  The `You?` group differs as `너?` / `너였어?`; Japanese differs as
  `あなた？` / `君か`, supporting the distinction. `The Great General`
  differs only in its English annotation at `27284` and `44014`, not in
  meaning; retain pending consistent title-display policy rather than
  treating it as a translation contradiction.
- Logical newline counts and normalized runtime/localized-markup token
  signatures agree across all four languages for every row. Existing
  Korean CRLF inside ability/material blocks is preserved.
- No individual speaker or playback order is inferred from row numbers,
  asset membership, or NPC/handler symbols.

After this range, 37,365 of 65,135 unique IDs are recorded (57.37%),
leaving 27,770. Sequential coverage reaches `27499`; next: `27500`-`27749`.
