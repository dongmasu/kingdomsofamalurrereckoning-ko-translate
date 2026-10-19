# Proper-Name Continuation: D-21578-D-21587

Date: 2026-10-17. Full proper-name discovery remains incomplete.
Next batch: **D-21588**, continuing source discovery/residual review.
The sequential default translation review through ID 65134 remains complete.

## Scope And Results

All name scopes were searched across affix/base/default, using immutable
English CSVs for identity and meaning, aligned Japanese for pronunciation,
and Chinese for corroboration. The official Korean manual extraction and
reference contain no direct entries for these newly reviewed names/titles;
their omission is not treated as counter-evidence. No PAK or derived asset
was inspected, and no source/tool/release file was changed.

| Batch | Row-Key Events | Entity Matches | Texto Edits | Scope |
| --- | ---: | ---: | ---: | --- |
| D-21578 | 8 | 8 | 8 | Independent Anker/Odi/Bede work/place labels |
| D-21579 | 48 | 53 | 13 | Lerkara Fel, Patrick Morkan, Kellis Cen, Rikka Egest |
| D-21580 | 27 | 27 | 24 | Complete titles of previously reviewed owners |
| D-21581 | 11 | 20 | 9 | Six explicit authors and nine distinct works |
| D-21582 | 17 | 17 | 17 | Numbered memoirs and source-local diary labels |
| D-21583 | 10 | 10 | 8 | Remaining owner-named titles in the bounded scan |
| D-21584 | 13 | 19 | 9 | Named Abyss cloak, equipment and common-noun exclusions |
| D-21585 | 1 | 0 new | 0 | Metadata-only Sigbert work-label separation |
| D-21586 | 18 | 18 | 18 | Ten unannotated complete personal names |
| D-21587 | 1 | 2 (one new) | 1 | Separate quoted Abyss experiment; superseded rationale notices |

The 154 row-key processing events cover **147 distinct CSV keys**.
There are **106 distinct edited Texto cells: 35 base and 71 default**.
There are 107 edit events because default:58825 was refined in D-21587
after its D-21584 edit. Affix was searched but unchanged.
The 173 new entity/row index matches
are not global translation-review totals. D-21585 carries forward one
D-21580 acceptance under an independent work-label key; it adds no
acceptance, occurrence, translation edit or reopened decision.

The glossary now contains 1,961 entries, up from 1,880. The increase
includes one metadata split, not 81 newly identified physical people/objects.
Source-label entries do not by themselves assert physical-work equivalence.

Tormin Sagard, Turin Ayle and Brok Almar now have consistent complete
Korean/English names. Split Lerkara given-name/surname pairs and the partial
Patrick Morkan annotation were corrected. Courden uses 쿠어든 in both
distinct treatises. Complete work labels use one full title annotation
instead of nested owner-name annotations.

The named cloak uses 어비스(Abyss); complete equipment labels
retain 심연의 and pair their full English names. The six equipment matches
are excluded from the cloak identity, and four ordinary abyss references
remain unchanged. No equipment rarity or physical-equivalence claim is made.
The quoted experiment is registered separately as `"Abyss" experiment`;
default:58825 now pairs the full experiment name. Its earlier cloak
attribution is excluded, with the old disposition/evidence retained in the
corrective D-21587 manifest. This adds one index entry and one net exclusion,
not a new acceptance count or a claim of physical identity with the cloak.
Seven glossary notes shared the original D-21584 rationale, including its
experiment-to-cloak attribution. D-21587 labels that copied rationale
historical/superseded on the cloak, Shoes, Cowl, Handwraps, Robes, Ring and
armor entries while retaining the original text. No equipment canonical,
status or identity decision is changed by those notices.

Odi/Bede owner-person identities remain unresolved. The unidentified author
of generic Memoirs Prologue is not assigned to Tyr Magnus or another author.
Independent review identified an unsupported same-work inference for
Sigbert's Journal and Journal of Sigbert Sawerth. D-21585 removes that alias
and preserves both row-specific title pairings and all prior status counts.
D-21587 marks the obsolete same-work assertion superseded in 26 current
index rationales while retaining their historical text and dispositions.

## Verification

- `verify-proper-name-batch-chain.rb 21578 21587`: PASS. All 107 edit
  events reconstruct byte-identical backups and the initial D-21577 hashes.
- BOM, exact mixed line-ending sequence, headers, row counts/order,
  keys/variants, tokens, target values and all non-target bytes: PASS.
- `validate-proper-name-data.rb`: PASS, 1,961 unique glossary entries and
  44,401 unique active-aligned entity/row matches.
- `audit-proper-name-residual-final.rb`: PASS, 43,387 source-generated
  matches, 1,014 documented contextual extras, no missing source/index keys,
  no undocumented extras and no terminal bilingual-label omissions.
- `test-owner-work-review-D21578-D21587.rb`: PASS, 21 tests / 179 assertions.
- Discovery gate tests: PASS, 23 tests / 17 assertions.
- Checkpoint tests: PASS, two tests / 23 assertions.
- Residual-audit regression: PASS, one test / nine assertions.
- All five current checkpoint blocks: byte-identical.
- `git -c core.whitespace=cr-at-eol diff --check`: PASS without
  normalizing the intentionally mixed line endings.
- Source CSVs, tooling and README: unchanged. No build or new in-game test.

Zero unreviewed indexed matches does not establish exhaustive discovery.
The existing **96 reviewed unresolved matches in 93 distinct row keys**
remain unchanged; no new evidence was used to reopen them. The 305-term
machine candidate list remains fully dispositioned but is not exhaustive.
Do not quote an overall completion percentage from these index counts.

The published ZIP remains the earlier verified **D-21569** snapshot;
none of the working changes here has been packaged or published.

## Verified State

| Active Resource | SHA-256 |
| --- | --- |
| affix | `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310` |
| base | `13e739d6cd88898448241ace8239ac1c1203f9db885cb64591eb7ffcf3f683de` |
| default | `f3e17982a19cd667b1de116bacbbbbe4b5f8e8324f37468ee55dd23f05918e9e` |

Latest actual pre-edit backups:

- Base: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21584/locatexts_zh_cn.koalocatext_base.csv`.
- Default: `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21587/locatexts_zh_cn.koalocatext_default.csv`.
- Affix: unchanged here; retain the D-21521 backup recorded in the checkpoint.

Initial default hash and D-21577 pre-edit backup were checked at execution
start. The active default matched
`1bbe42982584d5d523f4c0e53a8b7ecf6ca3228f5d929fa61065c59f85d283ae`;
the D-21577 backup matched its recorded pre-edit hash
`c6a07442887da3fdb4de0a44c20666dc62d8d01db00f7258b96d6ba24ad5dd10`.

Aligned inventory: 73,430 rows; SHA-256
`b14fcf4212c86a2956cdda5f0aeb169b76c4fe758c2dcca55f1694ac103a324a`.
Occurrence index: 44,401 rows; SHA-256
`fc52bfc92a87d5b9ae797cc357e25b714d6b967a0fb07452b5c57472fff3bce2`.
Glossary: 1,961 entries; SHA-256
`0fa29b7a9d0b861a21b28b46b80fc222cd6b848f2548ec30ffeca08a84f9d1a5`.

Latest reviewed key: **default:58825 / quoted Abyss experiment**, D-21587.
Next D number: **D-21588**. Continue discovery, not sequential default
translation IDs, and do not repeat already dispositioned person/work keys.
The read-only next queue is `proper-name-next-candidates-D21588-20261017.md`.
Start with Roth Garver / default:25864; ten candidates cover 62 full-name
source hits, including 22 standalone labels (ten already paired).
These are discovery candidates, not the existing holds or a total backlog.
