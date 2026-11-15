# `Locksmith` Term Review

- Date: 2026-11-16
- Scope: all English-source `locksmith`, possessive/plural forms, and
  `locksmithing` in `base` and `default`; no matches in `affix`.
- Inventory: 2 `base` keys and 28 `default` keys, compared across English,
  Japanese, Chinese, and active Korean CSVs.
- Method: English establishes meaning; Japanese informs voice and usage;
  Chinese is corroborating evidence. Asset links are used only as context
  candidates, not as proof of speaker or exact in-game use.

## Findings

`locksmith` has several senses in this corpus: a person who makes or repairs
locks, a shop/service being listed with other establishments, a named place
associated with a locksmith, and the related craft or gameplay topic. One
Korean word should not be forced onto every sense.

**Approved terminology:** use `자물쇠공` for a person/occupation and
`자물쇠 장인` when the source explicitly emphasizes a master craftsman. Use
`자물쇠공방` only for the establishment-list sense, and `자물쇠공의 집` or
`자물쇠공의 연구실` for possessive premises labels. Keep craft/product and
skill/activity senses separate.

## Sense Classification

Classify the referent before selecting a Korean equivalent:

- **Person / occupation:** `base:2935/11`, `default:11047`, `13084`,
  `16982`, `19238`, `20251`, `22602`, `24621`, `30572`, `30730`, `34997`,
  `36850`, `40956`, `43498`, `47768`, `52569`, `52637`, and `53090`.
  These refer to a locksmith as a worker, named individual, occupational
  label, or dialogue/objective target. At `40956` and `47768`, `Locksmith
  Tarion` is the person who owns the house; the whole phrase also names a
  place. At standalone `default:24621`, Chinese `锁匠` identifies the
  occupation and Japanese `鍵鍛冶屋` supports the locksmith trade; the
  Japanese compound can leave the person/shop distinction open in isolation,
  but the combined evidence supports the person/occupation reading.
- **Establishment / service venue:** `default:11842`, `14712`, `15506`,
  `37598`, and `39425`. The English frames these as places whose doors are
  open; Japanese lists the services as welcoming visitors, and Chinese also
  explicitly refers to their doors. Although Japanese `鍵師` and Chinese
  `锁匠` can look like person labels in isolation, the sentence-level
  referent is the establishment. Use `자물쇠공방` for `locksmith` in this
  specific service-list construction.
- **Premises / workplace label:** `base:992`, `default:19901`, and
  `54265`. The head of each label is a house or lab associated with a
  locksmith; the possessive/person relationship should remain clear.
- **Craft / merchandise:** `default:47902` describes Tarion's wares, not a
  person or a venue.
- **Lockpicking-related label:** `default:59325`, `62108`, and `63755` are
  repeated `Locksmithing` labels. Japanese `開錠術` and the game's separate
  `Lockpicking` labels (`開錠` / `开锁`) support the current Korean
  `자물쇠 따기`; Chinese `制锁` conflicts by suggesting lockmaking. Keep
  `자물쇠 따기` for these three keys as the user's preferred game-context
  reading, and record the Chinese wording as a source discrepancy.

The venue class is not a global translation rule for `locksmith`. In
particular, a person label or a person located in a place remains a person
reference even when nearby text mentions a house or settlement.

`default:33969` (`Lockmaster Tarion`) and `default:41572` (`Lockmaster
Jorielle`) are related but distinct English titles, not exact `locksmith`
occurrences. Japanese `鍵師` and Chinese `锁具大师` support the existing
`자물쇠 장인` wording for both. They were checked for consistency but are
not included in the exact-`locksmith` inventory.

The service-list use means a welcoming establishment rather than a person
standing among buildings. At `default:14712`, the user approved the scoped
`자물쇠공방` rendering. The same sense occurs at `default:11842`, `15506`,
`37598`, and `39425`, so those four rows now use `자물쇠공방` as well.
Their other wording and distinct dialogue registers were preserved.

`Locksmithing` requires contextual separation. `default:47902` is a
craft/product-list phrase: Korean `자물쇠 제작품` is compatible with Chinese
`制锁工艺` and the Japanese sales wording about high-quality keys and locks.
IDs `59325`, `62108`, and `63755` are an identical-source label, consistently
translated as `자물쇠 따기`. Japanese `開錠術` supports the lock-opening
reading, as do the game's distinct `Lockpicking` labels (`開錠` in Japanese,
`开锁` in Chinese). Chinese `制锁` instead suggests lockmaking and is recorded
as a conflicting localization. The user prefers `자물쇠 따기` for these
three game-context labels; do not generalize this choice to the separate
craft/product use at `default:47902`.

## Occurrence Review

| Resource / ID | English use | Active Korean | Assessment |
| --- | --- | --- | --- |
| `base:992/11` | Locksmith's House | 자물쇠공의 집 | Clear owner/place construction. |
| `base:2935/11` | Locksmith | 자물쇠공 | Clear person/role label; canonical form. |
| `default:11047` | Visit the Locksmith Tarion | 자물쇠공 타리온을 찾아가라 | Person; normalized to the canonical occupation. |
| `default:11842` | Inn/trader/locksmith/sanctuary welcome visitors | 자물쇠공방, 성소는 ... 문을 엽니다 | Establishment/service venue; now matches the scoped venue sense. |
| `default:13084` | Locksmith Tarion said... | 자물쇠공 타리온은... | Clear person; normalized to the canonical occupation. |
| `default:14712` | Same service list, with “Still” and “traveler” | 자물쇠공방 ... 기꺼이 환영합니다 | User-approved scoped establishment wording. |
| `default:15506` | Service list | 자물쇠공방 ... 맞이하고 있어요 | Establishment/service venue; person form corrected, line voice retained. |
| `default:16982` | The locksmith in Tirin's Rest | 티린의 안식처(Tirin's Rest)에 있는 자물쇠공 | Clear person; normalized to the canonical occupation. |
| `default:19238`, `43498` | Master locksmith in Tirin's Rest | 티린의 안식처(Tirin's Rest)에 있는 자물쇠 장인 | Clear skilled person; identical-source translations agree. |
| `default:19901` | Locksmith's Lab | 자물쇠공의 연구실 | Clear possessive place label; canonical owner term. |
| `default:20251` | Locksmith Tarion | 자물쇠공 타리온 | Clear person; normalized to the canonical occupation. |
| `default:22602` | the locksmith | 자물쇠공 | Clear person; normalized to the canonical occupation. |
| `default:24621` | Locksmith | 자물쇠공 | Standalone occupational label; Chinese and Japanese support the person/trade reading. Existing Korean already matches. |
| `default:30572` | The locksmith named Pledgeshield Fenan | 자물쇠공 | Clear person; normalized, with the accusation otherwise preserved. |
| `default:30730` | master locksmith | 자물쇠 장인 | Clear skilled person; uses the approved master-craftsman form. |
| `default:34997` | I am the locksmith | 자물쇠공 | Clear person and natural self-identification. |
| `default:36850` | Talk to the Locksmith | 자물쇠공과 대화하기 | Clear person/objective; normalized to the canonical occupation. |
| `default:37598`, `39425` | Service list | 자물쇠공방 ... 맞이하고 있어요 | Establishment/service venue; same-source group and line voice retained. |
| `default:40956` | Locksmith Tarion's house | 자물쇠공 타리온의 집 | Clear person/place relation. |
| `default:43498` | Master locksmith in Tirin's Rest | 티린의 안식처(Tirin's Rest)에 있는 자물쇠 장인 | Same-source group as `19238`; normalized to the same master-craftsman wording. |
| `default:47768` | Locksmith Tarion's house | 자물쇠공 타리온(Tarion)의 집 | Same person as `40956`; person and owned place are distinguished. |
| `default:47902` | Tarion's quality wards and locksmithing | 고급 방호 부적과 자물쇠 제작품 | Craft/product sense; supported by Chinese and Japanese context. |
| `default:52569` | Locksmith Tarion | 자물쇠공 타리온 | Clear person/name label. |
| `default:52637` | Where is the locksmith? | 자물쇠공이 어디 있다고 했지? | Clear person. |
| `default:53090` | locksmith Tarion | 자물쇠공 타리온 | Clear person; Japanese and Chinese agree. |
| `default:54265` | Locksmith House | 자물쇠공의 집 | Clear possessive place label; agrees with `base:992`. |
| `default:59325`, `62108`, `63755` | Locksmithing | 자물쇠 따기 | User-preferred lock-opening reading; Japanese supports it, Chinese `制锁` conflicts. |

## Disposition

- Applied the user-approved person/occupation distinction: `자물쇠공` for a
  locksmith and `자물쇠 장인` for the explicitly skilled `master locksmith`.
  The established venue form `자물쇠공방` and possessive premises forms remain
  distinct.
- Updated 12 `default` rows (`11047`, `13084`, `16982`, `19238`, `19901`,
  `20251`, `22602`, `30572`, `30730`, `36850`, `43498`, and `47768`) and
  `base:2935/11` with ID-scoped edits. `default:24621` was classified as a
  person/occupation label but needed no text change because it already uses
  `자물쇠공`.
- The earlier service-list edits at `default:11842`, `15506`, `37598`, and
  `39425` remain limited to `자물쇠공방`; sentence voice and line breaks are
  retained. No global replacement was used.
- `Locksmithing` labels remain separate from the locksmith occupation and
  `default:47902` craft/product wording. The three labels retain
  `자물쇠 따기`; only the Chinese `制锁` conflict remains documented.

## Verification

- All 30 English-source occurrences were matched by stable ID across English,
  Japanese, Chinese, and active Korean; the `affix` table has no match.
- The 30 occurrences are classified as 18 person/occupation references, 5
  establishment lists, 3 premises/workplace labels, 1 merchandise/craft use,
  and 3 lockpicking-related labels. `Lockmaster` titles at `default:33969`
  and `41572` were checked separately.
- The 13 changed cells passed the preserving editor. The repeated-source
  index and only the 12 changed `default` ledger fingerprints were refreshed
  and checked; all 65,135 review-ledger fingerprints validate.
- The proper-name occurrence index contained 11,777 stale `korean_current`
  snapshots across `affix`, `base`, and `default`. Those fields were
  synchronized to the active CSVs; all other columns and bytes were preserved.
  The generated glossary had two record boundaries using LF instead of CRLF;
  they were normalized without changing embedded evidence newlines. Full
  validation now passes: 2,350 unique entities and 48,484 active-aligned
  occurrences.
- The remaining terminology conflict is limited to Chinese `制锁` on the
  three `Locksmithing` labels; the current Korean follows the
  Japanese/game-context lock-opening reading.
