# Context Review: Mark Tutorial and Arcane Practitioners

- Date: 2026-10-11
- Decision: D-18273
- Scope: `default` IDs 20057, 20061, 20069, 20074, 20082, and 20089.
- Compared: English, Japanese, Chinese, Japanese-derived Korean, active
  Korean, and relevant accepted terminology/context.
- Result: correct and accept IDs 20082 and 20089; accept ID 20069 as
  `not an issue`; retain uncertainty at IDs 20057, 20061, and 20074.

## Evidence and Decisions

| ID | Decision | Evidence |
| ---: | --- | --- |
| 20057 | Uncertain retained | The antecedent of `it` in `until it does` is absent in English, Japanese, and Korean. Korean preserves the wait-until relation without inventing an event. |
| 20061 | Uncertain retained | The sentence is deliberately interrupted after `I gave it to ...`; neither the recipient nor the thing given is identified. Korean preserves both omissions and the reported Alfar Army claim. |
| 20069 | `not an issue` | The theft/borrowing self-correction, unnamed object, forgery alternative, and Moon Camp suggestion are retained. The source's incomplete `one...` is not silently completed. |
| 20074 | Uncertain retained | Korean preserves finding one, the many remaining, and the woman's sudden departure. English capitalizes `The Maid`; Japanese expands to the Maid of Windemere while Chinese says “maiden.” The exact title/name referent is not established locally. |
| 20082 | Accepted; change `버튼을 눌러` to `버튼을 짧게 눌러` | English `Tap`, Japanese press-and-release, and Chinese `click` distinguish the first action from the later press-and-hold detonation. Korean now makes the short-tap/hold contrast explicit while preserving the Mark target set and fiery explosion. |
| 20089 | Accepted; change `교단` to `단체` and `비전술 장인` to `비전술사` | English describes practitioners within an order; Japanese and Chinese describe a university/academy and arcane users/mages. Neutral `단체` avoids asserting a religious body, and `비전술사` describes practitioners without the unsupported artisan/craftsperson implication. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 20082 | `버튼을 눌러 마법 표식으로 대상을 지정합니다. 버튼을 길게 눌러 표식이 찍힌 적 모두를 화염 폭발로 터뜨리세요.` | `버튼을 짧게 눌러 마법 표식으로 대상을 지정합니다. 버튼을 길게 눌러 표식이 찍힌 적 모두를 화염 폭발로 터뜨리세요.` |
| 20089 | `이 교단에는 대륙 최고의 비전술 장인들이 모여 있다.` | `이 단체에는 대륙 최고의 비전술사들이 모여 있다.` |

Only the active Korean `Texto` cells at IDs 20082 and 20089 changed.

## Verification

- A byte-identical pre-edit backup was made before editing:
  `/private/tmp/ko-translate-backups/20261011/before-mark-arcane-practitioner-20082-20089-D18273/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `bbc20b8c1988d924b86a0cb06d8600d9612c6960fac63208b68a94257290aa73`.
- Post-edit SHA-256:
  `bd26350291e42a380af9e6c4bbc25bbe7c584ea613c15bdf225b46a714549dbb`.
- Reversing only the two approved substitutions reproduces the backup
  byte-for-byte. BOM is present; CRLF count remains 72,011 and bare-LF count
  remains 73.
- IDs 20057, 20061, 20069, 20074, 20082, and 20089 occur once and in the
  same order in all five compared files. No runtime markers occur.
- Cross-resource totals through D-18273: 1,960 accepted, 23,133
  `not an issue`, and 13,429 uncertain (38,522 total); next decision:
  D-18274.

These are working dispositions, not independent final linguistic approval.
