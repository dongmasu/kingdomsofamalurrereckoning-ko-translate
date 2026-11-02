# Translation Edit Addendum (2026-11-03)

## ID 56331

- Before: `장인의 전당(Craft Hall)을 세워 코라(Cora)는 영지 분쟁과 무역 다툼을 해결하고 시장의 여왕이 되었다.`
- After: `코라(Cora)는 장인의 전당(Craft Hall)을 세워 토지 분쟁과 무역 다툼을 해결하고 시장의 여왕이 되었다.`
- Rationale: The English says, “By making the Craft Hall, Cora settled a land dispute, a trade argument, and made herself queen of the market.” Japanese and Chinese likewise make building the Craft Hall the means or occasion for Cora to resolve the disputes and become the market's queen. Put Cora first as the clear subject, and use “토지 분쟁” for the source's “land dispute”; retain the already established bilingual forms `코라(Cora)` and `장인의 전당(Craft Hall)`.
- Validation: Updated only `default:56331`; the UTF-8 BOM and existing line-ending distribution (71,885 CRLF, 199 LF) were preserved.

## ID 14334

- Before: `운명 직조`
- After: `운명 엮기(Fateweaving)`
- Rationale: The English source is the standalone term `Fateweaving`; Japanese `フェイトウィーブ` transliterates it, while Chinese `织命` literally expresses weaving fate. Other standalone Korean labels for this same source term already use `운명 엮기`. In-game descriptions explain that Fateweavers read the threads of fate and provide readings; a separate gameplay description says they can reset a character's Skills and Abilities. Thus this is a fate-reading practice and service, not literal textile-making. Align this isolated label with the established Korean form and include the English term to clarify the otherwise ambiguous UI label. This initial correction was expanded into the complete occurrence review below.
- Validation: This initial ID-scoped correction was followed by a full occurrence review and consistency pass, documented in `audit/fateweaving-consistency-review-20261103.md`.

## Fateweaving Occurrence Review

- Reviewed all 19 English source rows containing `Fateweaving` or descriptive `fate weaving`, matched by ID against Japanese, Chinese, and active Korean.
- Standardized all 18 practice/service uses to `운명 엮기(Fateweaving)`, including the activity label and seven standalone labels. The remaining descriptive phrase at `default:40909` refers to threads of fate weaving around a target, not the named practice, and remains a natural descriptive translation.
- Corrected sentence-level variants at `default:9804`, `14541`, `24692`, `52562`, and `53721`; other sentence translations were retained after cross-check.
- Confirmed the active CSV's 65,135 data rows, UTF-8 BOM, and existing mixed line endings (71,885 CRLF, 199 LF) were preserved. Detailed row dispositions are in `audit/fateweaving-consistency-review-20261103.md`.
