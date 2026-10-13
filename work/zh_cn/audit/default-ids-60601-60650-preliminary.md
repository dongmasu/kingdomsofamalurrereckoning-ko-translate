# Preliminary Language Scan: `default` IDs 60601-60650

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 60601-60650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 60603 | `Love Again Another Day` / `또 다른 날의 사랑` | Determine whether this is a song/poem title and use an established Korean title if one exists. | Korean retains the English title in parentheses; Japanese means “I will love again someday,” while Chinese says “love another day.” The historical log flags it as a possible titled song/poem. | Medium |
| 60614 | “a lofty [assistant]” / `잘난 조수` | Resolve whether `lofty` means tall, high-ranking, or arrogant; avoid assigning a character attitude without support. | Korean's `잘난` suggests conceit. Japanese says the assistant is tall; Chinese interprets it as higher-status. The English remains ambiguous. | Medium |
| 60617 | Court of Enchantments / `마법 궁정` | Confirm the formal name and consistent Korean for the Court of Enchantments within the House of Ballads. | Korean preserves the House and Court relationship. Japanese instead calls it the Hero's Court, while Chinese transliterates an Enchanted Court. The historical log requests a canonical Korean form. | Medium |
| 60622 | Baronett / `남작` | Verify whether `Baronett` is a proper entity/name or the title “baronet,” and avoid conflating it with “baron.” | English capitalizes `Baronett`; Korean renders a generic baron. Chinese uses “baronet,” and the historical prompt explicitly asks whether the term is a name or title. | Medium |
| 60625 | Allestar / `알레스타` | Confirm the canonical place-name spelling and align it with other occurrences. | English and Korean use Allestar; Japanese has a divergent phonetic form and Chinese also transliterates it differently. | Medium |
| 60638 | Bendaci Servant / `벤다시 서번트` | Determine whether this is a named servant rank, person, or faction and use the established form. | English capitalizes the full label; Korean transliterates it. The historical audit asks what role it names. | Medium |
| 60640 | Scion / `계승자(Scion)` | Distinguish the formal in-world Scion title from generic heir/descendant senses and keep this occurrence consistent with the terminology inventory. | English capitalizes Scion; Korean translates it as “heir” and retains the English in parentheses. Historical notes specifically ask for its institutional sense. | Medium |
| 60646 | “baby brothers” / `세상의 어린 동생들` | Determine whether “baby brothers” means literal infants, younger male siblings/comrades, or an affectionate term for recruits. | Korean reads it as young younger siblings; Japanese omits “baby,” while Chinese says younger brothers. The source-keyed prompt leaves the reference open. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional terms include Saturnyn, the Weave,
Fomorous Hugues, Kail Murdagh, Niskaru, the Telling, Ballads, Cthongeny,
Phlegra, Ysa, Njordir's Font, Ordura, Crilgarin, Baronett, Allestar,
Bendaci Servant, Scion, Tak, Idylla, Quake, Evercut, Sun Camp, Hierophant,
Adessa, Primal Sprite, and the other character/place names in this batch.
The multi-line creation passage at 60631 retains its three-line structure.
Existing Korean bilingual-name formatting is retained as found; this pass
does not impose a global parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked source-keyed historical entries for IDs `60601-60650` in the
  archived `60550-60649` question range. Applicable open prompts include
  `Love Again Another Day` (60603), whether `lofty` describes height or
  status (60614), the Court of Enchantments (60617), Baronett (60622),
  Bendaci Servant (60638), the institutional sense of Scion (60640), and
  “baby brothers” (60646).
- Historical prompts remain open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 60601-60650 once
  and in identical ascending order. All four full `default` files retain
  matching key order.
- Embedded newline counts match throughout the batch, including the
  three-line creation passage at ID 60631.
- Runtime marker wrapper/order match. The label inside `{*1[...]}` at
  ID 60635 is localized in each locale; the Upgrade marker, Quake stun
  effect, and increased Quake damage are retained.
- The `70%` Bleeding/Poison and `50%` Shadow Flare values at ID 60647 are
  preserved.
- No translation CSV edit was made.

## Batch Status

IDs 60601-60650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 60651.
