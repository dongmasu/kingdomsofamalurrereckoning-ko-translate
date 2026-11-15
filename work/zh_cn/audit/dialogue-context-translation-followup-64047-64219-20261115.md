# Translation Follow-up: IDs `64047`-`64219`

- Date: 2026-11-15.
- Rechecked 15 prior findings against the current Korean and the same-ID
  English, Japanese, and Chinese sources.
- Two translations were corrected. Other reviewed wording was retained where
  it follows the English meaning or preserves a source ambiguity.

## Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `64047` | Retain | The Korean poem preserves all five source lines, the conditional wish, the Hyperian, and Ethene's demand. No unsupported speaker or agency was added. |
| `64056` | Retain | `발라드의 집(House of Ballads) 계급` matches the English and Chinese rank wording; Japanese uses a title/status term. |
| `64090` | Retain | English and Chinese say the Winter Court spawned the Tuatha, while Japanese describes Winter Court Fae following them. Korean follows the English source and adds no information beyond it. |
| `64095` | Hold | `No Items Salvaged` may describe a result or a failed salvage operation. The locale sources differ, and the active UI context is unavailable; no wording was forced. |
| `64101` | Retain | `요새화하고 ... 정착` preserves the English fortification/settlement possibilities and agrees with Chinese; Japanese specifically emphasizes strengthening defenses. |
| `64112` | Retain | English, Japanese, and Chinese all ask whether Culn had farms. The Korean keeps the question and pairs `컬른(Culn)`. |
| `64151` | Retain | The three descriptive phrases differ somewhat across the sources. Korean retains the English distinctions without inventing a proper species or title. |
| `64157` | Retain | The Korean preserves the contrast that maintaining the inn was already difficult even without the eight-legged monsters; the colloquial complaint remains intact. |
| `64166` | Retain | The entry preserves the Alfar Army Captain's reward for rescuing troops from the Banshaen Queen's castle, with the faction and creature names paired. |
| `64186` | Retain | Japanese explicitly describes a memorial monument; the Korean `공적을 기리는 비석` expresses that promise naturally. |
| `64189` | Corrected | English names the location `Cranalt`; Japanese and Chinese confirm it is a Fae cave. Added the missing English pairing in both mentions and clarified that the madness is believed related to the wizard's experiments, rather than asserting that the wizard himself is the cause. |
| `64202` | Retain | English and Chinese place the woman at the base of a spire in Pryderi. Japanese adds a son and describes a merchant entrance, which are absent from English; the Korean stays with the English-supported location and does not add the son. |
| `64204` | Retain | `도무스 폴리티카(Domus Politica)` is already the established paired name in the active Korean; the other sources translate or interpret the institution differently. |
| `64216` | Retain | The English names `Byrn Elgar`, and Korean pairs that exact spelling as `번 엘가(Byrn Elgar)`. The other locales provide phonetic forms but no stronger English spelling evidence. |
| `64219` | Corrected | The active term `포룸` differed from established `포럼(Forum)` at `209`. The sentence was made more natural while preserving the memoir's next-chapter statement. |

## Applied Changes

- `64189` before: `론드 농장(Rond Farm)의 아를레트 론드(Arlette Rond)와 남편 덴릿(Dennrit)이 자신들을 괴롭히는 광기를 치료해 달라고 부탁했다. 두 사람은 상류의 페이(Fae) 동굴 크라날트에서 실험하던 제니커(Jenniker)라는 마법사가 원인이라고 믿는다. 크라날트로 가서 제니커(Jenniker)를 찾아봐야겠다.`
- `64189` after: `론드 농장(Rond Farm)의 아를레트 론드(Arlette Rond)와 남편 덴릿(Dennrit)이 자신들을 괴롭히는 광기를 치료해 달라고 부탁했다. 두 사람은 그 광기가 상류에 있는 페이(Fae) 동굴 크라날트(Cranalt)에서 실험하던 제니커(Jenniker)라는 마법사와 관련 있다고 믿는다. 크라날트(Cranalt)로 가서 제니커(Jenniker)를 찾아봐야겠다.`
- `64219` before: `바실리카 그노스트라(Basilica Gnostra)의 세부 사항을 살피는 대목에서, 회고록은 다음 장이 포룸을 다룬다고 말한다.`
- `64219` after: `바실리카 그노스트라(Basilica Gnostra)의 세부 내용을 살펴보다가, 회고록에서 다음 장은 포럼(Forum)을 다룬다는 걸 알게 됐다.`

Only the active Korean `Texto` fields for `64189` and `64219` changed. Their
four-language ledger fingerprints were refreshed. No ledger dispositions or
dialogue attributions were changed.

## Verification

- The CSV-preservation tests passed: 11 tests.
- The dialogue-context index tests passed: nine tests.
- The review ledger validated all 65,135 IDs and their four-language
  fingerprints.
- The index, asset catalog, and all-ID catalog reproduced successfully.
- The active Korean CSV retained its UTF-8 BOM and 65,135 ordered IDs, with
  71,839 CRLF separators, 242 LF-only separators, and zero bare CR characters.
- The CRLF-aware `git diff --check` passed.
- No commit was made.
