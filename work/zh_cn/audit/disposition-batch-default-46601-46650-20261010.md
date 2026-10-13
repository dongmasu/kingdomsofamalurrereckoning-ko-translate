# Disposition Batch: `default` IDs 46601-46650

- Date: 2026-10-10. Compared active Korean against English meaning, Japanese
  voice/register, Chinese supporting evidence, source-keyed historical
  questions, and accepted terminology. This is a working disposition pass,
  not independent final linguistic approval.
- Decisions: one accepted, eight uncertain, and two `not an issue`
  dispositions.
- CSV edit: ID 46633.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 46604 | Uncertain | `전쟁의 맹세자` conveys the faction name, but prior decisions leave the canonical Korean form of `Warsworn` unresolved; do not substitute a competing transliteration without a terminology decision. |
| 46606 | Uncertain | Korean follows the English `Belen's Testament`; Japanese calls it a Belen group and Chinese says covenant. The source relationship and canonical institution name remain unresolved. |
| 46610 | Uncertain | The isolated label `Lower` could denote quality, rank, direction, or another UI category. `낮음` is retained pending context. |
| 46617 | Uncertain | Korean follows English `Sons of Laz`, while Japanese says `Laz Soldier`; Chinese supports the Sons reading. Preserve the current source-led translation until the faction identity is established. |
| 46618 | Uncertain | Korean says the addressee did not swing the sword; Japanese says the sword was not drawn and Chinese says the addressee spared someone. Context is needed to resolve the idiom and the following honor/cruelty question. |
| 46622 | Uncertain | `지상인` is a plausible rendering of `topsider`, but the source's capitalization and historical note leave open whether this names a people/status. |
| 46626, 46628, 46650 | Uncertain | These appear to be template/test or unavailable-use labels. The locales translate or preserve them differently; intended display behavior is not established, so do not normalize the strings. |
| 46633 | Accepted | Change `악명 높은` to `위험한` for `deadly`. English, Japanese `凶悪`, and Chinese `致命` describe danger, not an established reputation. Keep the separate `Warden Rask` title question open. |
| 46633 | Uncertain | `Warden Rask` is rendered as `감시관 라스크`; Chinese suggests a prison-warden role, but the exact in-world office/title remains context-dependent. |
| 46643 | Not an issue | Korean places `{1}` after `승리`, matching English and Chinese. Japanese reverses the order; all token identities are retained and the Korean wording is grammatical. |
| 46601-46650 excluding the IDs above | Not an issue | The remaining translations preserve the source meaning and layout. This includes the witch/overthrow rumor, the recipe's 2/2/2/1 quantities, mortality qualification, and the casual complaint at 46648. No further supported correction was found. |

Decision IDs D-14232 through D-14242. Direct register totals after this
batch: 1,435 accepted, 4,633 `not an issue`, and 8,208 uncertain (14,276
categorized dispositions). The next decision ID is D-14243.

CSV SHA-256 before editing:
`36b266ace78072a362a86423f2f2d5cb1552f9d1965cc517787d60555e3513d5`.
CSV SHA-256 after editing:
`d7857b24971d063750f65677bc7ec97f9037c19370674a479a4fbd8e543aa3ec`.
The UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings
are preserved. English, Japanese, Chinese, and Korean each contain IDs
46601-46650 once in ascending order; line-break counts and runtime-token
identities match. The four ingredient quantities remain 2/2/2/1.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 46633 | `이 물건은 악명 높은 헤드헌터 사이러스 페퍼의 소유물이야.` | `이 물건은 위험한 헤드헌터 사이러스 페퍼의 소유물이야.` | Render `deadly` as danger, supported by English, Japanese, and Chinese, without adding the unsupported claim that Cyrus is notorious. |
