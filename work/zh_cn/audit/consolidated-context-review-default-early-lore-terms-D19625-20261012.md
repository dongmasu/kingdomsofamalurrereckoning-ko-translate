# Consolidated Context Review: Early Lore and Terms (D-19625)

- Date: 2026-10-12.
- Scope: twelve open findings D-1048, D-1056-D-1057, and D-1060-D-1068,
  covering default IDs 4439, 4462, 4466, 4472, 4476-4477, 4480, 4483,
  4485, 4492-4493, and 4499.
- English is the meaning anchor; Japanese and Chinese were checked directly.
  Relevant accepted corpus decisions and the official Korean manual were
  consulted. No PAK material was used.

## Decisions

| Decision / ID | Disposition | Evidence |
| --- | --- | --- |
| D-1048 / 4439 | not an issue | English's stomach-as-store punchline is rendered directly as the speaker's stomach serving as a storage place. Japanese and Chinese make the same comparison; Korean `창고` and `배` preserve the joke's substance even without reproducing English wordplay. |
| D-1056 / 4462 | not an issue | English identifies the Hierophant as a formal religious authority, and Chinese uses `大祭司`; Korean `대사제` expresses that office. Japanese's `導き手` is a different title choice, not evidence of a Korean meaning error. Manual page 7 names the Travelers faction as `트래블러` but does not establish a separate Hierophant title. |
| D-1057 / 4466 | not an issue | English says the skin is filled with a substance, Chinese explicitly says the inside of the hide is filled, and Japanese omits only the container noun. Korean `가죽 주머니` is a natural rendering of a skin used as a vessel; it does not alter the contents or scent. |
| D-1060 / 4472 | accepted | This row defines the Sorrows as accumulated destructive magic. English ID 64074 explicitly defines them as a force of magical energy, and accepted D-18322 uses `비탄의 힘` for that same force. Replace the unsupported transliteration `소로우즈` with the established Korean term while preserving the English identifier. |
| D-1061 / 4476 | not an issue | English, Japanese, and Chinese all present `Cureseeker` as Oleyn's descriptor before explaining that he protects and heals a mortal village. Korean `치유를 찾는 자` preserves that description without requiring a decision that it is a formal rank. |
| D-1062 / 4477 | accepted | The English has the malformed phrase `come age`; Japanese says he was sent to be raised, and Chinese says he was sent to mature under Lord Kandrian's influence. Korean's `보살핌 아래` adds a guardianship implication. Replace it with `영향을 받으며` to preserve the shared upbringing/maturation sense without asserting custody. |
| D-1063 / 4480 | not an issue | English identifies the Circle of Engard as the group expected to remove the Narca curse; Japanese and Chinese likewise identify a collective. Korean's `교단` is plausible in this magical-curse context, and `알마인 알라드` preserves the name/group relation without adding a new identity. |
| D-1064 / 4483 | not an issue | English's `the Marches` is a frontier-region reference; Korean `변경지` preserves that geographic sense. Chinese's `红色边境` is compatible, while Japanese diverges on the threat's subject. This row does not require choosing a corpus-wide proper-name spelling. |
| D-1065 / 4485 | not an issue | English `liths`, Chinese `岩层`, and Korean `암층` support geological layers/strata. Japanese's generic `石` does not contradict the Korean term. |
| D-1066 / 4492 | not an issue | English specifies a kite shield, Chinese says a kite-shaped shield, and Korean `연방패` is the corresponding shield form. The manual's page 7 armor overview gives general equipment context but no competing shape term. |
| D-1067 / 4493 | not an issue | English and Japanese preserve Basilica Gnostra as an institution/name; Chinese describes it as a basilica. Korean `바실리카 그노스트라(Basilica Gnostra)` follows the English proper name, consistent with the source-faithful treatment at ID 33555. |
| D-1068 / 4499 | not an issue | English capitalization and Japanese quotation marks support `Sparrows` as a collective name, and the surviving members are to be gathered so they can rebuild. Korean retains the name as `스패로우즈` without imposing the conflicting literal-bird reading suggested by Chinese. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 4472 | `소로우즈(The Sorrows)는 하우스가 수 세기에 걸쳐 겨울 페이(Winter Fae)에게서 빨아들인 파괴 마법이 쌓여 만들어진 것이다.` | `비탄의 힘(The Sorrows)은 하우스가 수 세기에 걸쳐 겨울 페이(Winter Fae)에게서 빨아들인 파괴 마법이 쌓여 만들어진 것이다.` |
| 4477 | `최근에야 부모를 여읜 그는 칸드리안(Kandrian) 경의 보살핌 아래 자라도록 이곳에 보내졌다.` | `최근에야 부모를 여읜 그는 칸드리안(Kandrian) 경의 영향을 받으며 자라도록 이곳에 보내졌다.` |

## Verification and Resume

- Pre-edit SHA-256:
  `02d5ca3045184f2e42ba4317b8c5c5fd90d1f84ec05ca029b519642000612480`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-sorrows-growth-D19625/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit active default SHA-256:
  `50dd636f3b88ce718820a0a00b9d8e94b66699d782c75a48726880564a1cce67`.
- Reversing both exact substitutions reproduces the backup byte-for-byte.
  UTF-8 BOM, row order, all unrelated bytes, 72,011 CRLF endings, and 73
  pre-existing bare-LF endings are preserved.
- Twelve uncertain keys closed: two accepted and ten `not an issue`.
- Totals: **2,557 accepted / 25,913 not an issue / 10,054 uncertain**
  (38,524). Separate provisional affix holds: 0.
- Resume at **D-1071 / default ID 4506**. Default review remains incomplete.
