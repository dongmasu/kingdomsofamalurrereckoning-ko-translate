# Sequential `default` Revalidation: IDs `13500`-`13749`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Fifty-five existing ledger records were retained after fingerprint
  validation. The other 195 IDs were compared and added.
- Three newly recorded IDs have correction candidates. Six retain
  evidence-limited findings.
- Of the 195 new records, 141 have indexed quest-asset links and 54 do not.
  No new ID links to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `13579` | Naturalness | The translation describes the amulet as both a `전설적인 보물` and a `전설의 부적`, repeating the same idea. Consider `페이(Fae)의 전설적인 보물, 아만의 눈(Eye of Amman)이라는 부적을 되찾는 데 도움을 줄 사람을 죽여 버렸어.` | Medium |
| `13591` | Meaning | `we hope to stop him` becomes the stronger obligation `우리는 그를 막아야 해`. Preserve the hope rather than asserting duty; for example, `그는 니스카루(Niskaru) 군주를 풀어 주려 해. 우리가 그를 막을 수 있기를 바라. 미사루(Mitharu)여, 도와주소서!` | High |
| `13748` | Naturalness | `나는 가족에게서 나 자신을 추방해야 한다` is understandable but cumbersome. Consider the more concise `나는 가족에게서 추방을 자처해야 한다`, retaining the self-exile meaning and solemn register. | Medium |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `13540` | Meaning / referent | `Too much darkness. Too much hate.` can describe the outside life the speaker rejects, while Japanese attaches the darkness and hatred to the place where the speaker currently lives. Korean follows the Japanese reading. Keep the current broad reading pending stronger context. |
| `13554` | Meaning / referent | `my house` is rendered `내 집`; Japanese specifies a palace while Chinese refers to the family. The isolated line does not establish whether this means a literal residence, household, or House. Do not narrow it without context. |
| `13574`, `13629` | Meaning / kinship | Both exact-English rows use `누이`. Japanese is generic at `13574` but specifies a younger sister at `13629`; Chinese specifies a younger sister in both. The Korean does not specify age, but the available asset does not establish the speaker for either key. Retain pending stronger evidence rather than inferring a speaker or kinship perspective. |
| `13641` | Speech level | Japanese uses a polite greeting followed by plain-form questions, while Korean keeps the whole line polite; English does not encode the distinction and the line-level speaker is unknown. This may be a natural register choice, so do not change it without context. |
| `13665` | Meaning / terminology | `alchemical preserving methods` does not identify what is being preserved. Korean specifies alchemical materials, while Japanese and Chinese do not resolve the object. Keep the current wording pending contextual evidence. |

## Source / Reference Anomaly

At `13563`, Chinese does not preserve the point that becoming too familiar
with townspeople currently offers no benefit. Korean follows English and
Japanese. This is recorded as a reference-language divergence, not a Korean
correction candidate.

The established pairing at `13721`, `운명 없는 자(unfated one)`, matches the
previous ID-scoped review for this exact English expression and was retained.

## Duplicate and Structural Checks

- Thirty-three exact-English duplicate groups touch the new IDs, covering
  547 rows across the corpus. Korean text matches in every group, including
  the repeated `Shieldbrother.` wording at `6001` and `13607`.
- Runtime placeholders, named variables, layout tokens, named icons, and
  formatting-wrapper identities and order match across English, Japanese,
  Chinese, and Korean for all 195 new IDs.
- Logical line-break counts match across all four locales for all 195 IDs.
- Five Korean strings contain 72 existing embedded CRLF breaks: `13520` (1),
  `13572` (4), `13712` (12), `13715` (1), and `13730` (54). Their existing
  bytes were preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
