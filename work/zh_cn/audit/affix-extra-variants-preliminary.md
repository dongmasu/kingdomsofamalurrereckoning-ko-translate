# Preliminary Follow-Up: Chinese-Only `affix` Fallback Variants

- Current disposition (2026-10-12, D-19546): all 140 keys have a working
  disposition; 10 are `ACCEPTED`, 95 are `NOT_AN_ISSUE`, and 35 are
  `UNCERTAIN`. The earlier statements below describe the preliminary state
  before disposition. See
  [`disposition-affix-extra-variants-20261011.md`](disposition-affix-extra-variants-20261011.md)
  and [`D-19546`](consolidated-affix-willful-followup-D19546-20261012.md).
- Review date: 2026-10-09
- Scope: the 105 previously unchecked Chinese-only fallback variants.
- Variant keys per ID: 12, 14, 21, 22, and 24.
- Compared English `FF` entries by `ID_Linha`, actual Japanese variant 11,
  the Japanese-derived Korean sibling in `work/ja_jp/`, Chinese exact
  variants, active Korean candidates, and available German, Spanish, French,
  Italian, and Russian sibling evidence.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

Each listed Korean fallback is identical across its five target variants.
The current forms generally preserve the English/Japanese-derived sibling
meaning. At the time of this preliminary pass, rows remained provisional;
plural/gender distinctions from other locales did not automatically require
separate Korean forms.

| ID | English `FF` / Chinese | Korean fallback | Preliminary candidate / question | Confidence |
| ---: | --- | --- | --- | --- |
| 28 | `Elemental` / `元素` | `원소의` | Meaning is supported across languages; preserve the elemental-damage sense. | Low |
| 45 | `Lord's` / `领主` | `군주의` | Check whether `Lord` is a generic lord, a title, or a specific entity in the assembled item name. | Medium |
| 55 | `of the Fated` / `宿命` | `운명의` | Korean can mean “of fate,” while English refers to the Fated as people. Check item/lore context before deciding whether to make the people-reference explicit. | Medium |
| 78 | `Entropic` / `熵` | `엔트로피의` | Entropy-based reading is consistent; retain the established scientific term. | Low |
| 85 | `Fundamental` / `基本` | `근본적인` | Broadly consistent; check the assembled modifier for natural Korean agreement. | Low |
| 101 | `Favors's` / `恩典` | `호의의` | English has a malformed possessive/plural form. Cross-language references range across favor, fortune, and patronage; determine whether Favors is a proper concept or ordinary favor. | Medium |
| 115 | `of the Reckoned` / `天罚者` | `심판받은 자의` | Punished/judged-person readings are supported; preserve the agent/person sense rather than reducing it to the act of judgment. | Medium |
| 117 | `Fortune's` / `命运` | `행운의` | Korean emphasizes luck, while English and several sibling forms can mean fate/destiny or the proper name Fortune. Context remains necessary. | Medium |
| 124 | `Ruin's` / `废墟` | `폐허의` | Chinese supports physical ruin, but English capitalization and some sibling readings allow Ruin as a named force or destructive fate. | Medium |
| 196 | `of Putrefication` / `腐化` | `부패의` | English misspells `Putrefaction`; Korean conveys putrefaction/decay and cross-language evidence supports the intended sense. | Low |
| 202 | `Slayers` / `杀戮者` | `처치자` | The killer/slayer sense is supported. Check whether the item name needs a stronger “slayer/killer” term than the game-style `처치자`. | Medium |
| 223 | `Primitive` / `原始` | `원시의` | Directly supported across languages; retain the primitive/ancient sense as context requires. | Low |
| 231 | `Putrified` / `纯净` | `부패한` | English is malformed and Chinese literally says “pure,” contrary to German, Spanish, French, Italian, Russian, and the English/Japanese sibling. The Korean fallback follows the consistent putrefied/rotten reading. | High |
| 240 | `Primordial` / `本初` | `태고의` | Primordial/original sense is consistent across available evidence. | Low |
| 289 | `Stupifying` / `昏沉` | `멍하게 만드는` | English misspells `Stupefying`; Korean's dazing/stupefying effect matches the Chinese and other language evidence. | Low |
| 444 | `of the Willful` / `恣意` | `의지가 굳은 자의` | Korean emphasizes strong resolve, while `willful` and several sibling readings can mean stubborn or obstinate. Check the intended character/item trait. | Medium |
| 466 | `of the Unyielding` / `执着` | `굴하지 않는 자의` | The unyielding/persistent sense is supported; Korean preserves a person-denoting construction. | Low |
| 496 | `Prime` / `至尊` | `최상급` | Sibling translations diverge among primeval, fundamental, first, and elite. Korean chooses superior/first-rate; inspect the item context before fixing the sense. | Medium |
| 510 | `of the Determined` / `坚决` | `결연한 자의` | Determined/resolute person sense is supported across the available references. | Low |
| 527 | `Aurora` / `极光` | `오로라` | Could be a proper name or the natural phenomenon; Chinese means polar light while several locales retain Aurora. Keep the traceable form pending context. | Medium |
| 574 | `Indestructable` / `不灭` | `파괴 불가능한` | English misspells `Indestructible`; Korean expresses the intended indestructible/immortal sense supported by the other locales. | Low |

## Historical Review-State Reconciliation

- The inventory lists 140 Chinese-only variants across 28 IDs, five variants
  per ID. At the preliminary stage, all 140 were marked
  `PRELIMINARY_CROSSCHECKED_OPEN`; the current disposition is recorded in
  `affix-extra-variant-review.tsv` and the report linked above.
- Existing reports for IDs 255, 263, 299, 337, 341, 368, and 369 already
  explicitly compared 35 variants. Their inventory state at that time was
  `PRELIMINARY_CROSSCHECKED_OPEN`; this was not final approval.
- This follow-up compared the remaining 105 variants across 21 IDs listed
  above. Their review state has since been superseded by the disposition
  report linked above.

## Structural and Source Checks

- All 105 expected `(ID_Linha, Tipo_Variante)` keys occur once in Chinese
  and active Korean, with no missing or duplicate target keys.
- For every row, the Chinese text and Korean candidate match their exact
  source CSV rows; the Japanese-derived Korean sibling matches variant 11
  in `work/ja_jp/`.
- Each of the 21 IDs has an English `FF` source entry. All populated
  German/Spanish/French/Italian/Russian evidence values were found under the
  same source ID in their respective affix resources.
- Korean text remains identical across each ID's five variant keys. This
  preserves the keys without forcing grammatical gender/number distinctions
  that Korean does not encode here.
- During this preliminary pass, no translation CSV was edited; the findings
  were candidates only and did not authorize edits.

## Batch Status

The focused preliminary cross-check of all 140 Chinese-only fallback
variants is recorded: 35 from the earlier seven ID reports and 105 in this
follow-up. A later working disposition covers all 140 keys; it is not
independent final linguistic approval.
