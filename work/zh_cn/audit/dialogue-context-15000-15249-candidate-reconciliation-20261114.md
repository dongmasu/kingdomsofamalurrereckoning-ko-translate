# Candidate Reconciliation: IDs `15000`-`15249`

- Date: 2026-11-14.
- Scope: all eighteen current ledger candidates in this range, compared with
  English, Japanese, Chinese, and the active Korean translation.
- Sixteen existing corrections were confirmed; `15073` and `15090` were
  refined for source precision and natural Korean.
- Quest assets support grouping only. No individual speaker or playback
  order was inferred.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `15022` | Previously applied, confirmed | In the Scholia Arcana academic context, `우리 결사단` is supported by the linked SASQ01 wording; no global replacement is implied. |
| `15041` | Previously applied, confirmed | `청구서 회수하기` correctly treats the Sigra quest's invoices as billing documents, not delivery invoices or parcels. |
| `15073` | Refined | English and Japanese say the couple left Rathir for work elsewhere; the line now states this directly. It also describes the wife as a soldier and the narrator as belonging to the rough outfit, without implying that either newly enlisted. |
| `15075` | Previously applied, confirmed | `먼지의 자손(Child of Dust)` matches the established term and pairs the source name. |
| `15078` | Previously applied, confirmed | `또 한 명의 필멸자가 장작더미에 오르겠군` preserves the ominous pyre image without the stiff “offering for cremation” calque. |
| `15082` | Previously applied, confirmed | The translation preserves the Kollossae suffering, the opponents' likely return, and the present chance to finish them in conversational Korean. |
| `15090` | Refined | `최소 대출금조차 갚기엔 턱없이 부족해` naturally conveys that the offered amount cannot cover even the smallest loan. The return-with-enough-coin instruction remains. |
| `15091` | Previously applied, confirmed | The welcome and thanks now both use conversational plain speech while retaining Idylla and Beckoned. |
| `15098` | Previously applied, confirmed | `킨 대사(Ambassador Keen)` keeps the established English title/name order. |
| `15148` | Previously applied, confirmed | The Khamazandu offer is identical across all seven journal entries; this first sentence matches the other six, while the progress clause remains ID-specific. |
| `15164` | Previously applied, confirmed | The instruction says to select the ability and press `{1}` to return to the slotting screen. Runtime/display wrappers and their order are preserved. |
| `15183` | Previously applied, confirmed | The company heading is paired as `브래드 앤 서그렌 상회(Brad and Cergren Traders)`. The contract retains all three goods, quantities, prices, parties, and paragraph breaks. |
| `15190` | Previously applied, confirmed | `책을 넘겨주기` clearly names the action in the Travelers exchange, rather than making the book sound like the other party to a trade. |
| `15198` | Previously applied, confirmed | `염주` follows the Udo Marsh prayer-beads terminology review and matches the exact-English duplicate rows. |
| `15221` | Previously applied, confirmed | `남동생` conveys “baby brother” without implying that he was a child. `전쟁에도 나갔어` does not add volunteering, and the remaining line preserves his trouble-seeking characterization. |
| `15222` | Previously applied, confirmed | `작은 자여` and the elevated description of the mage as a weak instrument match the Khamazandu wording used at `42683` and `50460`. |
| `15226` | Previously applied, confirmed | `별난 이교도` preserves English's “strangest heathen” sense without changing it to a foreign or unfamiliar person. The welcome and exhortation keep a consistent elevated register. |
| `15243` | Previously applied, confirmed | `영혼의 샘(Well)` pairs the capitalized research subject with the established short English label without expanding it into a broader alias. |

## Related Consistency Checks

- The identical Khamazandu offer sentence at `7589`, `15148`, `19510`,
  `21922`, `54076`, `64167`, and `64664` has consistent Korean. Their
  journal-progress clauses remain specific to each ID.
- The named company heading at `11917`, `15183`, `36628`, and `58806` uses
  `브래드 앤 서그렌 상회(Brad and Cergren Traders)`. The rest of these
  contract/ledger entries remains ID-specific.
- `Ambassador Keen` is consistently rendered at `14922` and `15098`.
- `작은 자여` is consistent at `15222`, `42683`, and `50460`.
- The repeated `You want Fallon's prayer beads?` rows `6166`, `20909`, and
  `15198` agree in Korean; `염주` also follows the bounded prayer-beads term
  review.
- All decisions were checked by text type. Journal and UI wording was not
  assigned a dialogue speaker based on asset membership.

## Verification

- All eighteen in-range candidates are reconciled; cumulative reconciliation
  is 868 / 4,015 (21.62%), with 3,147 remaining.
- Only `15073` and `15090` changed in this range; their four-language source
  fingerprints are current in the review ledger.
- CSV structure, BOM, record order, tokens, paragraph breaks, and existing
  line endings are preserved.
- Source CSVs and extracted game assets were not changed.
