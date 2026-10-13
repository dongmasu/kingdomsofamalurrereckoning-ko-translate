# Preliminary Language Scan: `default` IDs 44551-44600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44551-44600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44555 | Snowmelt Spring / `스노우멜트 샘` | Preserve that the spring is above the sea and the travelers looked back at the distant shores they had left. | English places the spring above the sea; Korean's `바다 위에 선 그들은` can instead read as the people standing above/on the sea. The collective heartbreak is retained. | Medium |
| 44560 | “honest to gods dignity ... make a real life” / `신 앞에 떳떳한 존엄함 ... 제대로 된 삶` | Keep the source ambiguity open and review for idiomatic Korean without deciding whether the line is religious or about ordinary dignity. | English is awkward; Japanese and Chinese also diverge in interpreting it. Korean's `신 앞에 떳떳한 존엄함` is difficult to parse. Historical notes explicitly flag this line. | High |
| 44561 | “wild as the Sidhe” / `시드 사람들만큼이나 사납지` | Confirm whether `Sidhe` means its people, realm, or both. | English capitalizes `Sidhe`; Korean interprets it as the Sidhe people. The comparison remains intact, but the referent is not settled. | Medium |
| 44562 | Hospitalis Quarters / `진료 구역` | Confirm the formal location name and whether `Quarters` denotes a district, ward, or quarters. | Korean renders a generic medical zone; other locales also choose different category words. The proper-name status is unresolved. | Medium |
| 44566 | Offering / `봉헌 의식` | Confirm whether the capitalized Offering is a formal village ritual and standardize it. | English names the next Offering as a recurring event; Korean interprets it as a dedication/oblation ceremony. | Medium |
| 44569 | “our presence in Detyre is rapidly diminishing” / `우리 세력이 빠르게 줄어들고` | Confirm whether `presence` means population, political influence, or another form of presence. | English is deliberately broad; Korean selects diminishing influence/power. Historical notes explicitly leave population versus influence unresolved. | Medium |
| 44575 | Motus Mining report; Faer Gorta/Hanged Men/Scavs | Keep the report's paragraph structure and follow English where Chinese changes creature identities. Standardize the report's names and creature terms. | Korean retains all seven paragraphs and follows English for Faer Gorta, Hanged Men, and Scavs; Chinese instead renders some as skeletons/acid-spitting creatures. | Medium |
| 44585 | `dove` / `그대` | Check whether `그대` preserves the speaker's affectionate address and urgency. | English uses the intimate `dove`; Korean uses the general/literary `그대`. The urgency to move is preserved. Historical notes explicitly call out the endearment. | Medium |
| 44586 | Centurion / `백인대장` | Confirm the official Korean military/rank term and standardize it. | English capitalizes the rank; Korean uses a Roman-military equivalent. Historical notes leave the canonical form open. | Medium |
| 44590 | The Order / `교단` | Confirm and standardize the formal organization name. | English capitalizes `Order`; Korean's `교단` is plausible but may over-specify a religious order. | Medium |
| 44593 | Tasks / `{*2임무}` | Confirm the visible UI label and distinguish `Task` from the body text's generic/repeatable quest description. | The marker identity/order and `{LINE_LEFT}` are preserved. Korean localizes the label to `임무`, while the explanatory copy uses `퀘스트`; check consistency with the UI taxonomy. | Medium |

IDs 44551-44554, 44556-44559, 44563-44568, 44570-44574,
44576-44584, 44587-44589, 44591-44592, and 44594-44600 generally retain
the English meaning on this first reading. Names, setting terms, and UI
labels remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 44550-44649 were checked for
  the Mitharan item parts, Evenroots, Teithi, Snowmelt Spring, Heart
  blessing, Sidhe, Hospitalis Quarters, Offering, scarecrow/death, Detyre
  presence, the Motus Mining report, Faer Gorta/root golems/Scavs,
  Sphere of Protection, `dove`, Centurion, Tasks, and Bareth/murghan.
- The historical log explicitly preserves the long report's layout,
  identifies the Chinese divergence on Faer Gorta and Scavs, and leaves
  Detyre presence, the affectionate address, rank, and Tasks label open.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44551-44600 once
  and in identical ascending order.
- ID 44575 has 17 embedded line breaks in every locale; all paragraph
  boundaries are preserved. ID 44583 has one embedded line break in every
  locale.
- ID 44583 retains the `{*1[...]}` marker and ID 44593 retains `{*2...}`
  followed by `{LINE_LEFT}`; identities and order match across locales.
- The three-treasure count at 44579 is retained. No other numeric-value
  discrepancy or hidden formatting character was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44551-44600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44601.
