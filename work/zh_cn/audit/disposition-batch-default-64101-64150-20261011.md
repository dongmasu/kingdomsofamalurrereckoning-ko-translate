# Disposition Batch: `default` IDs 64101-64150

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- Two accepted targeted corrections, 26 `not an issue` IDs, and 22 uncertain
  findings. These are working dispositions, not independent linguistic
  approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18105 | 64114 | `그 사람은 프란츠라고 불려. 프란츠 엥겔하트(Franz Englehart). 그자와 같은 '직업'인 사람들은 누구든 믿지 않지만, 그중에서도 특히 못 믿겠어.` | `그 사람은 프란츠라고 불려. 프란츠 엥겔하트(Franz Englehart). 그 '직업'에 종사하는 다른 사람들만큼이나 그 사람도 믿을 수 없어.` | English says the speaker distrusts Franz to the same degree as other people in his profession; `특히` incorrectly intensifies the distrust of Franz. |
| D-18105 | 64118 | `언덕 반대편에 있는 우리 우리로, 풀을 뜯는 땅에서 영양을 가능한 한 많이 몰고 와 줘.` | `방목지에서 영양을 최대한 많이 몰아 언덕 반대편의 우리 안으로 데려와 줘.` | English and the other locales describe directing antelope from grazing land into a corral. Remove the duplicated `우리` reading and restore a clear source-to-destination instruction. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18106 | 64101 | `Fortify` may mean strengthen defenses or make the land secure for settlement; the source separately mentions possibly settling there. Keep the current wording pending context. |
| D-18106 | 64103 | Deirdre Gwint and Dvergan Lorestones are clear, but canonical Korean forms for the names and lore term are not established. |
| D-18106 | 64105 | The speaker's interrupted explanation and grief for Maire are retained; confirm the relationship and canonical name spelling in context. |
| D-18106 | 64107 | `Second` is likely a formal duel assistant/witness role, but the project's established Korean role term is not confirmed. |
| D-18106 | 64109 | The figurative wish to end the tale splendidly is retained; the established rendering of the House of Ballads and its victory language needs consistency review. |
| D-18106 | 64110 | English uses nonstandard `weren't`; Korean regularizes it. Whether the speaker's dialect/register should be marked more strongly needs character-context review. |
| D-18106 | 64112 | The burned-farm question is retained, but Culn's identity and canonical spelling vary across locale renderings. |
| D-18106 | 64116 | The thorn-and-shadow blessing may be a named religious formula; the lore reference is unresolved. |
| D-18106 | 64117 | `Cousin` may be literal kinship or a familiar Varani address; the row alone does not establish the relationship. |
| D-18106 | 64120 | The abrupt invocation of Lyria followed by a curse against the Fae is preserved; the phrase's established voice/register remains contextual. |
| D-18106 | 64123 | Ingredient identities, quantities, temporary Alchemy effect, workbench, and paragraph layout are preserved; official Korean item terminology is not confirmed. |
| D-18106 | 64124 | Capitalized plural `The Staffs` may be a named category or a generic UI label; Korean singular/plural convention is unresolved. |
| D-18106 | 64125 | The need to find the Sorrows is clear, but the setting-specific referent and canonical Korean term remain open. |
| D-18106 | 64128 | `Scion` may be a formal title, heir, or individual; do not replace the transliteration without lore evidence. |
| D-18106 | 64130 | The ritual sequence and protection objective are retained; confirm canonical forms and status of Scaith magic and the Solemn Bell. |
| D-18106 | 64133 | Hrindi Zungar's waiting and the request for help are clear; locale name spellings differ and no canonical Korean form is established. |
| D-18106 | 64136 | The respectful greeting and inquiry about the Archsage's experience are preserved; confirm the established Korean title and honorific. |
| D-18106 | 64143 | The 60% trigger chance, poisoned-enemy death condition, 275 Poison Damage, and one line break are preserved; retain pending terminology/style review. |
| D-18106 | 64145 | The fetch objective is clear, but `the Rialte Brocaire` may be a named item, person, or task object. |
| D-18106 | 64147 | `Lyria's Lost` may be a named relic or a generic lost possession; the current generic rendering follows other locales but is not conclusive. |
| D-18106 | 64148 | The temporary Blacksmithing effect, Alchemy Workbench, three reagent identities and quantities (2, 2, 1), and paragraph layout are preserved; confirm established item terms. |
| D-18106 | 64150 | `Your grace` indicates high status, but English and Chinese/Japanese differ in how explicitly they mark it; verify whether `전하` fits the addressee's rank. |

## Not an Issue

Decision D-18107 records these 26 IDs: 64102, 64104, 64106, 64108,
64111, 64113, 64115, 64119, 64121-64122, 64126-64127, 64129,
64131-64132, 64134-64135, 64137-64142, 64144, 64146, and 64149.
They preserve the available meaning, voice, labels, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 64101-64150 once,
  in identical ascending order.
- Embedded newline counts match for all rows. Recipe 64123 retains three
  embedded line breaks; recipe 64148 retains four. Poison Cloud at 64143
  retains one line break, 60%, and 275 damage.
- No runtime-marker differences or numeric-value changes were found.
- Rechecked the source-keyed historical questions for this range, including
  fortification/settlement, Dvergan Lorestones, Maire, Second, Sagrell,
  Franz's profession, thorn/shadow blessing, antelope herding, Scion, the
  Solemn Bell ritual, Archsage honorific, Poison Cloud, Rialte Brocaire,
  Lyria's Lost, and `your grace`.
- Only the `Texto` cells at IDs 64114 and 64118 changed. UTF-8 BOM, record
  count, key order, embedded lineation, and outer CRLF record separators
  are preserved. Pre-edit SHA-256:
  `6e9a73072bf8fe9f5a85855c71450dcea4397c4ef6fe7df44a67873509c7ff4f`.
  Post-edit SHA-256:
  `fa77505806d0afdd2c60724a0277cd64d4c0042d6df4562184ce7128606d663f`.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-64101/locatexts_zh_cn.koalocatext_default.csv`.

- D-18105 records two accepted corrections, D-18106 records 22 uncertain
  findings, and D-18107 records 26 `not an issue` IDs. Totals at D-18107:
  1,826 accepted, 16,496 `not an issue`, and 12,633 uncertain
  (30,955 dispositions); next D-18108.

Resume at `default` ID 64151; 984 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
