# Disposition and Edit Batch: `default` IDs 28301-28350

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28301-28350, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, two `not an issue`, and seven uncertain.
- Accepted corrections at IDs 28301 and 28349 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28301 | `제가 사생아 보기트(Boggart)를 여럿 낳게 했다고` for “I've fathered several illegitimate boggart children” | Accepted: change to `제가 보기트(Boggart) 사생아를 여럿 두었다고`. The current `낳게 했다` says the speaker caused someone else to give birth; the source alleges the speaker fathered the children. The revision states parenthood without adding a birth-giver gender. |
| 28349 | `날 실망시키지 마` for “Make me proud.” | Accepted: change to `날 자랑스럽게 해 줘`. English and Chinese ask the addressee to make the speaker proud; the current Korean reverses the sentiment into “don't disappoint me.” Japanese's “I'm counting on you” supports encouragement. |
| IDs 28301-28350 structural and runtime checks | Preserve line breaks, localized markers, and keys/order. | Not an issue: all four locales contain each ID once in identical order; embedded breaks and normalized token identities/order match, including the nested quest/minimap and curse/healer/control markers at IDs 28331 and 28340. |
| Remaining ordinary dialogue, objectives, and concise UI wording in IDs 28301-28350, excluding separately listed findings | Keep current wording. | Not an issue: no additional isolated meaning or register correction is better supported. |
| 28301 | `her eminence Templar Tancese` / Tancese's rank and the letter's medical-sounding jokes | Uncertain: the source and locale versions recast the comic complaint and title differently. The accepted parenthood correction does not resolve the rank or surrounding-joke interpretation. |
| 28307 | `성난` for “indignant” | Uncertain: English's `indignant` is more specific than “angry,” while Japanese and Chinese also shift toward fierce/forceful descriptions. Keep pending speaker/context review. |
| 28310 | `그레이벌 요새(Gravehal Keep)의 자매 요새` | Uncertain: English is a compressed “sister keep” fragment; Japanese and Chinese differ on whether the counterpart is a fort/city or fortress. Preserve the permanent `+3%` ranged-damage effect. |
| 28317 | `이야기의 흐름` for capitalized `the Telling` | Uncertain: English capitalizes a lore term; Japanese and Chinese use tradition/prophecy readings, and historical notes treat it as a potentially formal Fae tradition. |
| 28326 | `이제 알겠지` for “Well, you're getting it.” | Uncertain: the isolated phrase may describe understanding, progress, or obtaining something; Japanese/Chinese also diverge. |
| 28328 | `소울딥(Souldeep)의 금식` / “Souldeep Fasting” | Uncertain: English says fasting, while Japanese and Chinese describe an underground passage/tunnel; preserve pending setting context and comparison with `Undersea Fasting`. |
| 28350 | `케스트(Kest)의 판` for “Kest's table” | Uncertain: the gambling context suggests a physical card table or venue, while Korean `판` can refer to the game/session. Confirm the displayed venue meaning before editing. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- Only Korean `Texto` at IDs 28301 and 28349 changed. No source CSV, key,
  row order, or variant structure changed.
- Active default CSV SHA-256:
  `0a9290e4029e7c7d82d7ee2899b144754b66cc3e97130969887de39f6a872651`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 876 accepted, 3,001 `not an issue`, and
  4,993 uncertain (8,870 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28351; 36,784 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
