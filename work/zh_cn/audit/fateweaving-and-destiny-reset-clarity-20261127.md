# Fateweaving and Destiny-Reset Terminology Follow-Up

- Date: 2026-11-27.
- Scope: named `Fateweaving` uses and Fateweaver character-reset labels in
  the active Korean `default` table.
- Source authority: English establishes meaning; Japanese and Chinese are
  cross-checks.

## Decisions

Use `운명 점술(Fateweaving)` for the named Fateweaving practice or service.
The previous `운명 엮기` retained the source metaphor but did not tell Korean
players what the practice does. English contexts identify it as reading fate,
making predictions, and offering a service: `default:24692` links the practice
to farmers wanting advance knowledge of their yields, `26786` describes a
skeptic accusing a practitioner of selling readings as lies, and `47111`,
`52562`, `53721`, and `55977` describe it as a service offered by a priestess
or Fateweaver. Japanese consistently transliterates the name as
`フェイトウィーブ`; Chinese `织命` preserves the weaving metaphor. Those
forms support the association with fate-weaving, while the English contexts
clarify its player-facing meaning as divination. Keep the English pairing so
the fictional name remains identifiable.

This decision covers the 18 named practice/service occurrences listed below.
It does not change `Fateweaver` (`페이트위버`), `Order of Fateweavers`
(`페이트위버 교단`), or the descriptive `default:40909`, where fate threads
literally weave around a target.

The reset action `Unbind Destiny` and its usage counter `Destiny Unbound`
refer to the same character-reset feature. Japanese uses
`宿命から解放する` / `宿命からの解放`; Chinese uses `解绑天命` /
`命运解绑`. Use the current `Destiny = 숙명` terminology and the compact
shared label `숙명 해방` for all three UI strings:

| ID | English | Korean |
| ---: | --- | --- |
| 17426 | `Unbind Destiny: {1}{2}` | `숙명 해방: {1}{2}` |
| 34900 | `Unbind Destiny` | `숙명 해방(Unbind Destiny)` |
| 54781 | `Destiny Unbound: {1} times` | `숙명 해방: {1}회` |

## Fateweaving Occurrences

The following 18 named practice/service rows now use `운명 점술(Fateweaving)`:

`2745`, `7163`, `9804`, `14334`, `14541`, `15424`, `20128`, `23680`,
`24692`, `26476`, `26786`, `34645`, `39464`, `47111`, `52562`, `53721`,
`55977`, and `63340`.

`default:2745` uses `활동` for English `Activity`. Sentence particles were
checked after the noun change; the service is marked with the appropriate
Korean object particle where required.

## Verification

- Rechecked the affected rows against aligned English, Japanese, Chinese,
  and Korean source tables.
- Applied changes only by exact ID and expected prior text with
  `tools/replace_text_preserve_eol.py`.
- The literal fate-thread description at `default:40909` and all
  `Fateweaver` role/name usages remain outside the edit scope.
- The 19 changed Korean rows' review-ledger fingerprints were refreshed;
  the repeated-English index was regenerated from its four-language inputs.
