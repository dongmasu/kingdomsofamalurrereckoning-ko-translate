# Candidate Reconciliation: IDs `27750`-`27999`

- Date: 2026-11-14.
- Rechecked all 17 correction candidates against same-ID English, Japanese,
  Chinese, and active Korean rows, plus the sequential and linked-asset reports.
- Fifteen supported corrections were already present in the active CSV.
  `27798` received one additional naturalness edit; `27767` remains held
  because its singular `Templar` title lacks a settled Korean rendering.
- No speaker or playback order was inferred from the linked assets.

## Candidate Decisions

| ID | Decision and evidence |
| ---: | --- |
| `27767` | Held. The journal sentence accurately says that Templar Fastrada Tancese has died and that the narrator can no longer help the gnome expedition retrieve the book. `성전기사` is intelligible, but the evidence reviewed here does not settle the preferred Korean form for singular `Templar`; no speculative terminology change was made. |
| `27798` | Corrected. English and Chinese retain the direct `stranger` address, while Japanese omits it. In this relieved, casual thank-you, `낯선 사람` reads like a literal calque; `이방인` keeps the direct address in a more natural fantasy-game register. The rest of the line and its plain speech are unchanged. |
| `27803` | Confirmed current. `당긴 채로 유지하기` and the instruction to hold both controls express `Pull and hold`. Korean preserves the English/Chinese token order; Japanese places the button tokens differently. |
| `27833` | Confirmed current. The journal uses `실라리타(Syllareta)` consistently and correctly locates the spiders in the Webwood surrounding Canneroc. |
| `27859`, `27995` | Confirmed current. Both rows identify `The Den` as the gambling venue (`도박장(The Den)`), not the Hierophant's separate hideout. |
| `27874` | Confirmed current. The text says the Shroud of Omission was removed to reveal the established book, `세이블의 서신(Missives of Sable)`, before describing the resulting Praetorian attack and escape. |
| `27886` | Confirmed current. Both `여름 페이(Summer Fae)` and `겨울 페이(Winter Fae)` retain the source's seasonal distinction and English pairing. |
| `27888` | Confirmed current. `상대가 페이든 아니든` preserves `Fae or not`, and `술만 깨 있었으면` retains the source's `sober` condition. |
| `27908` | Confirmed current. `번즈 님(Master Byrnes)` now matches the English spelling and retains the address. |
| `27915` | Confirmed current. The short, conversational phrasing preserves the personified Death and the parallel waiting for both speaker and addressee. |
| `27929` | Confirmed current. The objective names the Sun, Storm, and Frost Stones and keeps the instruction to place the Storm Stone with Marus Torix's statue. `서리석(Frost Stones)` follows the recorded source-local plural form. |
| `27930` | Confirmed current. `주문을 외워` is supported by Japanese `魔法の呪文` and Chinese `魔法咒语` for the magic phrase that releases Adar. |
| `27957` | Confirmed current. `코라드 부관(Lieutenant Colad)의 무덤` pairs the full source label and remains a grave label. |
| `27968` | Confirmed current. The topic pairs `아포타이어(Apotyre)` and does not invent a more specific diagnosis than `sickness`. |
| `27983` | Confirmed current. `스프라이트(Sprite)` preserves the named creature type rather than reducing it to generic fairies. |
| `27984` | Confirmed current. The complete source label is paired as `컵의 여왕 메어(Maire, Queen of Cups)`. The same English/Japanese/Chinese label occurs in 19 rows, and the active Korean uses this same full pairing in all 19. The later active-CSV check in the `24000`-range reconciliation supersedes the older report's separate title/name form. |

The 15 previously applied corrections are `27803`, `27833`, `27859`,
`27874`, `27886`, `27888`, `27908`, `27915`, `27929`, `27930`, `27957`,
`27968`, `27983`, `27984`, and `27995`.

## Verification

- All 17 candidates were reconciled and newly counted in this batch; no
  candidate ID was counted twice.
- All four language tables contain one row for each candidate. Embedded
  line-break counts match. Runtime/markup signatures match, except for the
  previously documented Japanese-only token order at `27803`; Korean matches
  English and Chinese there.
- The only new translation edit was `default:27798`, applied by exact ID with
  `tools/replace_text_preserve_eol.py`. Only its `source_fingerprint` was
  refreshed in the review ledger.
- The complete review ledger validates against all 65,135 four-language
  rows. The CSV-preservation tests and context-index tests passed.
- The candidate-reconciliation JSON records the edit, decisions, and checks.
- No source CSV or extracted game asset was changed; no commit was made.

Cumulative candidate reconciliation is 1,618 / 4,015 (40.30%), with 2,397
not yet reconciled. The hold at `27767` remains unresolved.
