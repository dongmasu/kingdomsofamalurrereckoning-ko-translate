# Sequential `default` Revalidation: IDs `10500`-`10749`

- Date: 2026-11-11.
- Scope: compare active Korean against English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-two existing ledger records in this range were retained after their
  four-language fingerprints were verified. All 188 previously unrecorded
  IDs were compared and added.
- Among the 188 newly reviewed IDs, twelve have correction candidates and ten
  have evidence-limited findings; these sets do not overlap. Existing
  candidate/uncertainty dispositions among the 62 retained records were not
  recounted.
- Of the 188 new IDs, 131 have indexed quest-asset links and 57 do not.
  Asset association does not establish an individual speaker or playback
  order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10523` | Name pairing | `Vekreth` and `Arylia` appear only in Korean transliteration. Pair them with the exact English source spellings. The official manual spells Aryllia with a double `l`; preserve the English row's `Arylia` spelling in the parenthetical rather than silently changing the source. `Lupoku` is correctly rendered `로포쿠(Lopoku)` under the official Korean manual's established name. | High |
| `10528` | Meaning / terminology | `the Testament` is an active group planning further violence, not a testament document. Japanese identifies the Belen sect and Chinese describes a covenant; replace `유언서` with the established cult/group reading used elsewhere (`벨렌의 성약단` / `테스타먼트`) after selecting the matching local form. | High |
| `10531` | Name pairing | Pair `길먼` with `Gilman`. The current `형제` does not specify an age relationship, which is appropriate because English and Chinese do not say whether Gilman is older or younger; do not restore the unsupported younger-brother reading from the preliminary scan. | High |
| `10548` | Name pairing | Pair the named Mya and the ship Stormbreaker with their English forms. The existing line breaks and nautical imagery are intact; keep the English names source-local rather than inferring additional identities. | Medium-high |
| `10578` | Name / task pairing | `Sojourn` is the named first task of the Orison, but Korean renders it only as `체류 의식`. Consider `체류 의식(Sojourn)` while preserving the completed-task and return-to-temple sequence. | Medium |
| `10603` | Name pairing | Pair `아델레나` with `Adelena` in the objective. The English names the flute's owner, and the Korean currently omits that source spelling. | High |
| `10628` | Address / honorifics | `My liege` is rendered `폐하`, while the Japanese says `我が主` and Chinese says `君主`; the same English address is usually `주군` in the active corpus (for example, IDs `909`, `1419`, and `2265`). Prefer the established generic address unless direct context confirms a royal title. | Medium-high |
| `10658` | Terminology | `the Sorrows` is the named magical force, but Korean reduces it to generic `슬픔`. Use the established `비탄의 힘(Sorrows)` concept when describing the force found in others. The capitalized `Delve` action itself remains context-sensitive and should not be expanded beyond the source. | High |
| `10683` | Creature subtype / name pairing | Both references to `Trolls of the mountains` are rendered `산의 트롤(Troll)`, leaving the subtype outside the English pairing. Pair the complete type consistently, e.g. `산의 트롤(Trolls of the mountains)`; do not reduce it to generic `Troll`. | High |
| `10732` | Name pairing | Pair the scout's name as `니나(Nina)`. The sentence identifies her by name but the active Korean has no English form. | High |
| `10739` | Historical names / title pairing | Preserve the established `에라셀 원정` wording, but pair the complete event name as `에라셀 원정(Erathell Campaign)`. `Varlaine` is unpaired while `Orieator` is paired; also pair the named `War of the Plains`, `The Lance`, and `Dawn March` consistently with the already paired `Battle for Galafor Plain`. | Medium-high |
| `10742` | Address / honorifics | `my liege` is again rendered `폐하`. Japanese supplies only a greeting and Chinese uses `君主`; align with the recurring `주군` form unless direct context establishes that `폐하` is intended. | Medium-high |

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `10533` | Meaning / ritual | `Perform the Giving` is a capitalized command. Japanese describes a rite of giving, Chinese says distribution, and Korean interprets it as a votive ceremony. The isolated key does not settle the rite's precise function; retain pending direct quest-text evidence. |
| `10550` | Meaning / item category | `Votive of Water` is rendered `물의 봉헌물`. Japanese suggests an ornament and Chinese a votive talisman; the key does not identify the item's function or equipment category. |
| `10580` | Meaning / proper-name status | `the Hollow` is capitalized and described as the speaker's awakening place, den, and grounds. Korean `공동` may be a generic hollow or a named place; retain pending context. |
| `10593` | Source wording / title | The English has the anomalous phrase `into every nook and fasting` and spells the book `Frostbreak Ominbus`. Japanese and Chinese interpret the first phrase as searching through hiding places, which Korean follows, but the source does not resolve the wording or canonical book-title spelling. |
| `10597` | UI meaning | The one-word label `Even` is translated `짝수`, matching Japanese `偶数`; Chinese instead reads it as a tied result. The card-game context makes the Korean plausible but the isolated label is not decisive. |
| `10616` | Meaning | `Alfar lore` is translated `알파르 전승`. Japanese says Alfar magic, while Chinese describes Alfar stories; the exact intended sense of `lore` is not settled by this line. |
| `10668` | Address / title | `Your grace` becomes `전하`; Japanese uses `閣下` and Chinese `陛下`. The title and the addressee's rank cannot be settled from this key or its asset-level association. |
| `10702` | Meaning / scope | The English fragment `Her and Grim and some man named Phasmer Humm` does not make clear whether the traitor label applies only to her or to all three. Korean preserves the ambiguity; do not resolve the accusation's scope. |
| `10706` | UI meaning / title | `Noble in Sacrifice` may be a named Destiny/title or a descriptive label. Korean `숭고한 희생` is plausible, but the short key does not establish its category. |
| `10749` | UI meaning / structure | `Target Weight Ranged` is a compressed technical label without separators. Korean `원거리 대상 중량` preserves its terms, but their relation and intended display remain unclear. |

## Prior Decisions and Source Anomalies

- ID `10523` uses the official manual's `로포쿠(Lopoku)` form. The source's
  `Lupoku` spelling is a documented variant, not a Korean name error.
- ID `10552` spells the location `Cape Soalce` in English; Korean
  `솔라스 곶(Cape Solace)` follows the Japanese/Chinese evidence and the
  recurring source-corpus name. This is a source typo, not a Korean
  correction candidate.
- ID `10595` correctly uses `비탄의 힘` for the Sorrows force per the prior
  disposition at ID `1002` (D-19590).
- ID `10653` retains the House of Seasons relation established for the
  Seasons Sanctuary in D-20386.
- ID `10693` uses the established `미타란` adjective and preserves the full
  English item label; `자루` remains a plausible rendering of `Shaft`.
- ID `10729` was previously closed as not an issue for the exact
  `Maire, Queen of Cups` title (D-19444); its Korean preserves both title
  and person.
- The malformed English at ID `10601` (`my the infiltration`) does not
  prevent the active Korean from preserving the intended boast.
- The earlier preliminary concern that ID `10531` specifies a younger
  brother is not present in the active text; `형제` leaves age unspecified.

## Duplicate and Structural Checks

- Fifty-five exact-English duplicate groups touch this range, comprising
  878 rows across the corpus. Every group has matching Korean text.
- Runtime placeholder and display-wrapper signatures, brace balance, and
  logical line-break counts match across English, Japanese, Chinese, and
  Korean for all 188 new IDs.
- Seven Korean strings contain 29 existing embedded CRLF breaks:
  `10523` (1), `10548` (8), `10593` (7), `10627` (4), `10645` (1),
  `10683` (4), and `10739` (4). All were preserved.
- Asset associations were used only as candidate context. No individual
  speaker or playback order was inferred.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
