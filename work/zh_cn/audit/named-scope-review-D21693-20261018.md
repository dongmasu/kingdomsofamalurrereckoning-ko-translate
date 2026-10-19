# D-21693: Short-Label Candidate Dispositions

Latest verified proper-name batch: D-21693 (2026-10-18).
Reviewed six short-label candidate groups across 25 distinct resource/ID/variant keys: {"not-an-issue"=>5, "uncertain"=>1}. Per-group source-key coverage: {"Alfar Warship"=>3, "Amphora"=>8, "Brother Wulf"=>7, "Captain Dodwyn"=>3, "Captain Enright"=>2, "Dame Oleyn"=>2}. These are candidate dispositions, not new entity-index matches and not global translation totals.
Alfar Warship is a generic vessel-class phrase; the Alfar species name is already bilingual. Brother Wulf, Captain Dodwyn, Captain Enright, and Dame Oleyn have already-paired Korean personal names with translated titles/ranks; their prior terminal entity decisions remain unchanged. Amphora remains a documented identity-scope uncertainty; no source-supported unique-object scope is established, and its texts and earlier decisions remain unchanged.
Next batch: D-21694; continue the unreviewed groups in `proper-name-short-label-discovery-D21692.tsv`. That dated snapshot contains 265 groups/559 distinct label keys; six groups/25 distinct keys are dispositioned here. The snapshot count is not an exhaustive total or completion percentage.
Indexed matches: 46150; accepted=30890, excluded=3011, not-an-issue=12146, uncertain=103. Indexed dispositions and counts were not changed.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256 (unchanged in this no-edit batch):
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `2486607c818c26511fdfe42c1116de1eb6fde8ee41a427a2dd8cb08aacac8a54`.
- default: `9d435ed2e1a658106bd996c078eeee6fc847b3521d1fb9c964099f53ec79bf29`.
No CSV cells were edited; no new backup was needed. The latest pre-edit backups remain those recorded in the D-21692 addendum. CSV row order, BOM, mixed line endings, and non-target bytes were untouched.
Aligned inventory: 73430 rows; SHA-256 `ed1ebc6d4028c7fe4498e1b208d162e51969e9fb22cd1ca3ca182bb7b3f567b7`.
Occurrence index: 46150 rows; SHA-256 `a8ad27c4142257032f190faba50718df9d56b854fac763ab817c13c6c95c3ba0`.
Proper-name glossary: 2211 entries; SHA-256 `f5f28c5fbb21fc93fcbbbe5a994155819839c90af8288d3346aaed686d2a3b0a`.
Candidate review manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D21693.tsv`.
Report: `work/zh_cn/audit/named-scope-review-D21693-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21693-20261018.md`.


## Evidence

- `Alfar Warship` (3 keys), not-an-issue: All three exact rows identify an Alfar warship class, not a separately named vessel. English Alfar is the proper species term and is already paired as 알파르(Alfar); Warship is translated as 전함. Japanese アルファーの軍艦 and Chinese 精灵战舰 independently render the descriptive vessel phrase. Preserve the existing people:alfar row dispositions; do not invent a ship name or entity.
- `Amphora` (8 keys), uncertain: The eight exact rows consistently identify an amphora vessel, but the sources do not establish whether the capitalized item label denotes one unique quest object or the generic vessel type. Japanese アンフォラ and Chinese 双耳罐 support the vessel sense without settling named-object status. Historical decisions D-887/D-18364 and D-2212/D-10321 distinguish the named-vessel reading from the unresolved generic-versus-quest-object reading on other keys; do not reopen or recount those keys. Keep all current cells unchanged and do not register a global item until the identity scope is established.
- `Brother Wulf` (7 keys), not-an-issue: The seven source rows identify Wulf; the Korean name is already paired as 울프(Wulf), and the translated title 수사 is supported by Chinese 伍尔夫修士 and the aligned religious context. Exact labels elsewhere use 울프 수사(Brother Wulf), but that does not make the source-short person-name pairing incomplete. Preserve the prior person:wulf decisions, including D-20593 at default:57606 and the D-21204 cross-row review.
- `Captain Dodwyn` (3 keys), not-an-issue: The three exact source rows identify Dodwyn; 도드윈(Dodwyn) already pairs the personal name and 선장 translates Captain. Japanese ドドウィン船長 and Chinese 多德文队长 corroborate. D-21599 explicitly preserves translated military-rank wording and does not add redundant English parentheses when the person name is already paired. Keep all prior person:dodwyn statuses/evidence.
- `Captain Enright` (2 keys), not-an-issue: Both exact rows use the source-short surname Enright rather than the full name Dorothy Enright. 엔라이트(Enright) already pairs the name; 대위/대장 are translated rank terms. Japanese エンライト隊長 and Chinese 恩赖特队长 corroborate the title/name. D-21599 explicitly pairs the full name only where English supplies it and preserves ranks; do not add the given name or reopen the existing person:dorothy-enright decisions.
- `Dame Oleyn` (2 keys), not-an-issue: Both exact rows identify Oleyn; 올레인(Oleyn) already pairs her name and 경녀/여사 render Dame. Japanese 淑女オリン and Chinese 奥蕾因女爵 corroborate. D-20734-D-20735 already reviewed these exact keys and retained the complete title/name at default:27196 and the paired person name at default:35383. Preserve those terminal decisions.
