# Disposition and Edit Batch: `default` IDs 9000-9049

- Decision date: 2026-10-09.
- Scope: preliminary findings and carried historical questions for `default`
  IDs 9000-9049.
- English governs meaning, Japanese informs voice/register and source
  structure, and Chinese is supporting evidence. Existing audit decisions and
  active-corpus terminology were also checked.
- Thirteen findings received dispositions: three accepted, four `not an
  issue`, and six uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 9000 is `not an issue`: the two houses remain unnamed and the threat that
  they will crumble is preserved.
- ID 9001 is accepted: `이모할머니` adds a great-aunt generation absent from
  the English. The active Korean now says `네 이모의 부적을 찾았어.` This
  removes the unsupported generation; the maternal/paternal relation remains
  unestablished and is not claimed as a canonical term.
- ID 9003 is `not an issue`: the father's insult and homeland/people size
  contrast are retained without inferring the speaker's identity.
- ID 9009 remains uncertain: English `infrequent` and Japanese `uncommon`
  indicate a rarity tier, but the exact Korean UI term is not established.
- ID 9018 is `not an issue`: the nautical `wake` image and unfinished verse
  fragment are preserved.
- ID 9026 remains uncertain: English capitalization and Japanese's Maid of
  Windemere support a named title, but the canonical Korean form is unresolved.
- ID 9028 remains uncertain: the source name and plural count are retained,
  but `투아타` versus `투아사` requires a corpus-wide terminology decision.
- ID 9030 remains uncertain: `Delver`, `House`, and `sorrows` have unresolved
  role/entity terminology; the line's basic relationship is preserved.
- ID 9035 remains uncertain: marker identity and effect meaning are preserved,
  but the Korean combat-category terminology is not established.
- ID 9036 remains uncertain: English says `Pledgeshields`, while Japanese
  describes second-class mercenaries and Chinese transliterates the shield
  term. The canonical rank form is unresolved.
- ID 9041 is accepted: the request is revised to
  `더펠은 그 용병과 일당을 상대하는 걸 도와 달라고 했다.` This expresses
  Derfel's request for help dealing with the mercenary and his band. The
  unsettled translation of `Oathblade` is not changed.
- ID 9043 is accepted: the pick is described as seen in Eloren Criet's small
  jewelry box, without asserting that she put it there.
- ID 9047 is `not an issue`: the preliminary report incorrectly attached a
  `Plagueshield` question to this row. The four locale rows describe beauty,
  temperament, and a potential match; none mentions either `Plagueshield` or
  `Pledgeshield`. No translation edit is warranted.

## Applied Edits

These three edits were already present in the active CSV when this interrupted
checkpoint was reconciled. Their source alignment and exact text were verified
and are now recorded as accepted decisions:

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 9001 | `네 이모할머니의 부적을 찾았어.` | `네 이모의 부적을 찾았어.` | D-2513: remove the unsupported great-aunt generation. |
| 9041 | `...더펠은 그 용병과 일당을 처리하는 데 도와 달라고 했다.` | `...더펠은 그 용병과 일당을 상대하는 걸 도와 달라고 했다.` | D-2522: make the request idiomatic while preserving its meaning. |
| 9043 | `엘로렌 크리엣이 작은 보석함에 자물쇠따개를 넣어 둔 걸 봤다.` | `엘로렌 크리엣의 작은 보석함에서 자물쇠따개를 본 적 있어.` | D-2523: avoid asserting who placed the pick in the box. |

## Verification

- The preliminary report covers all 50 IDs. English, Japanese, Chinese, and
  Korean rows for the cited findings were compared directly.
- The `Plagueshield` candidate attached to ID 9047 is a preliminary
  cross-reference error; `Pledgeshields` occurs at ID 9036.
- The active Korean `default` CSV SHA-256 at checkpoint reconciliation is
  `b1c21b52a056b8f55f96187f0d19551cc3953f147c1461458018ee96cd64ed55`.
- Before this batch: 396 accepted, 795 `not an issue`, and 1,320 uncertain.
  After this batch: 399 accepted, 799 `not an issue`, and 1,326 uncertain.
- Resume at ID 9050; 56,085 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
