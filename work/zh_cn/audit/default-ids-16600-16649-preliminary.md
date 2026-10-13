# Preliminary Language Scan: `default` IDs 16600-16649

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16600-16649.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16608 | Lord Farrara / Summer / Luna / Cycle | Verify names and cosmological terms; preserve the elegy's self-sacrifice and five-line layout. | Korean retains Farrara's love for Summer and Luna, giving himself up so she survives, and the ended Cycle; whether Luna should remain a proper name is unresolved. | Medium |
| 16609 | `Circle` -> `마법진` | Confirm whether this isolated label denotes a magical circle, faction, or another UI concept. | Korean commits to “magic circle”; Japanese/Chinese use generic “circle/ring,” and no context is present. | Medium |
| 16614 | `Lord Gorrenet` -> `고렌넷 경` | Reconcile the title and name with Japanese, which calls him a great mage. | Korean follows the English honorific/title; Japanese adds a specific “great mage” role. The English/Chinese do not establish that role here. | Medium |
| 16618 | `Social Media Manager` -> `소셜 미디어 관리자` | Determine whether this is player-facing text or an internal/test string. | English and Japanese leave the exact English label; Chinese and Korean translate it. No context establishes whether localization is intended. | High |
| 16622 | `tragedian` / `villainous foil` | Verify the theatrical sense of `foil` and preserve the speaker's role as a tragedian. | Korean calls the role a tragic actor and the Hero's villainous adversary. “Foil” can mean a contrasting dramatic character rather than simply an enemy. | Medium |
| 16626 | `the Scale` -> `저울` | Determine whether Scale is a named Fateweaving device/location rather than an ordinary weighing scale. | Korean follows the literal English noun; Japanese identifies a “Great Scale,” Chinese uses a generic scale, and historical notes treat it as a possible named device. | Medium |
| 16631 | “the whole of the weave” -> `운명의 실타래 전체` | Preserve Fateweaving terminology consistently. | Korean retains the complete-weave metaphor and the protagonist's place within it; align `weave` with established project terminology. | Low |
| 16638 | `almost as infamous as I am` | Check the degree of comparison. | Korean says the victims are as notorious as the speaker (“no less than me”), omitting English `almost`; Japanese/Chinese also use an equal comparison. | Medium |
| 16643 | `Cur of Vengeance` -> `복수의 페이 커(Cur)` | Verify whether Cur is a named creature/title and align its established Korean form. | Korean preserves “Fae” and the proper name in parentheses; the source alone does not resolve the taxonomy/title. | Medium |
| 16645 | `Explore The Hidden Cahmber` -> `숨겨진 방 탐색` | Record the English source typo (`Cahmber`) and confirm it is intended as `Chamber`. | Korean renders “hidden chamber/room,” consistent with Japanese and Chinese; the English source contains an apparent typo. | High |
| 16649 | `Templar` -> `성전기사` | Verify the order's established name and retain that another Templar is the only one able to confront Octienne. | Korean preserves the limiting condition and the fortunate availability of one ally; the title/name remain corpus terminology questions. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16602-16603, 16608-16609, 16614,
  16618, 16622, 16626, 16631, 16638, 16643, and 16649 against the active
  four-locale rows. They remain open candidates; no historical note authorizes
  a translation edit.
- Recurring terminology candidates include Farrara, Luna, Cycle, Circle,
  Chaos, Templar, Fate/weave, and the Cur of Vengeance.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales, including the five-line poem and `{1}`/
  `{2}`/`{1}` stat variables. No structural exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16600-16649 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16650-16699.
