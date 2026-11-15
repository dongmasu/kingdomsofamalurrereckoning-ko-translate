# FFQ35 Lua Bytecode Sample

- Date: 2026-11-15.
- Scope: one quest, `1164038.quest_bxml` / `ffq35`, its associated script
  `1164041` / `FFQ35`, and its two embedded Lua payloads.
- Result: static prototype, constant and instruction decoding succeeded for
  this pinned sample. This is not a complete Lua source recovery, a general
  format specification, or runtime validation.
- No translation CSV, review ledger, extracted asset or build tool was changed.

## Readable Results and Reproduction

The [reconstructed Lua subset](ffq35-lua-sample-20261115.reconstructed.lua)
shows six named dialogue callbacks, one stage callback and two anonymous
predicates in source-like form. It is manually derived, not executable
validation or original source. Synthetic predicate and argument names are
explicitly marked. The
[full static listing](ffq35-lua-sample-20261115.disassembly.txt)
contains every parsed function, constant, instruction word and byte offset.

```sh
python3 work/zh_cn/audit/probe_ffq35_lua.py
python3 work/zh_cn/audit/probe_ffq35_lua.py --write
python3 work/zh_cn/audit/probe_ffq35_lua.py --check
python3 -m unittest discover -s work/zh_cn/audit -p 'test_probe_ffq35_lua.py' -v
```

The experimental probe accepts only the three pinned payload hashes below;
it is research scaffolding, not a production decoder or replacement for the
corpus-wide envelope analyzer. Plain execution and `--check` are read-only;
`--write` only regenerates the audit listing. It never executes game Lua.

| Payload | Container offset | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| Script `1164041` in `134230570_klua.batch` | 7544685 | 7662 | `2b0ba91abe92a761ae7f28330f5765f74a1f45101cf879745a740b43697578b5` |
| Quest BXML payload 0 | 699 | 615 | `604abfc9f55fdccb5b276b23de8027683f993f898e5907234a65bbfb5bbc69b4` |
| Quest BXML payload 1 | 1323 | 615 | `f3ac587da8ba1cbd92c34d054ff14c8a9776b10b042ecebc9d4bc2b4f9eaec12` |

The batch record starts at 7544668, is 7679 bytes long, and has the record
name `FFQ35` and no serialized string references. The registered path is
`c:/unit4projects/koar/root/content/design/quests/ffq35.lua`; this is stored
provenance, not an available plaintext source file.

## Method and Structural Checks

Kender2's
[Kore VM notes](https://github.com/Kender2/amalur/blob/314e878609f42e9f53cb407c5dab72564ad5fdeb/korevm.md)
supplied the game-specific opcode numbering. For field positions and
instruction semantics, the comparison source was
[hksc lopcodes.h](https://github.com/Jake-NotTheMuss/hksc/blob/afa5ace6b2d11891b094ca637ccc772b9ef4ea59/src/lopcodes.h)
and its
[opcode definitions](https://github.com/Jake-NotTheMuss/hksc/blob/afa5ace6b2d11891b094ca637ccc772b9ef4ea59/src/lopcodes.def).
Its current loader and opcode numbering cannot be used unchanged: they target
later layouts and contain additional opcodes. Neither external tool was
claimed to decompile this sample; the probe was checked against local bytes.

The observed sample layout after the shared type table at offset 238 is:

1. Four big-endian metadata words. The first two are zero throughout this
   sample; the remaining pair resembles a source-line range. Their semantics
   are not asserted.
2. Two big-endian words interpreted as upvalue and parameter counts, one
   vararg byte, and a big-endian stack-size word.
3. Big-endian instruction count followed immediately by 4-byte instructions.
   There is no instruction-alignment padding in this sample. The first
   instruction begins at payload offset 271.
4. Big-endian constant count and tagged constants. Tags observed are nil,
   boolean, string and integral 4-byte number. Integers agree with the
   header's integral-number flag; interpreting them as IEEE floats instead
   produces tiny nonzero values for stage numbers such as 10.
5. Big-endian child count, recursively serialized child prototypes, then
   three zero metadata words. Nonzero values are intentionally unsupported.
6. A final opaque 8-byte trailer, `0000000100000000`. Its exact value and
   position are checked; no runtime meaning is assigned to it.

Instruction fields are `opcode=word>>25`, `A=word&255`, `B=(word>>17)&255`,
`C=(word>>8)&511`, and `Bx=(word>>8)&131071`. The jump target formula
`PC + 1 + Bx - 65535` yields valid, non-DATA targets for all 11 jumps.
`GETGLOBAL_MEM` is followed by one `DATA` cache word, and `GETFIELD_R1`
by two; treating those words as ordinary operations would distort the result.

Results:

- Script: one main prototype and 22 child functions, 625 instruction words.
- Each embedded payload: one wrapper and one child predicate, 31 words.
- Total: 27 prototypes and 687 words, of which 220 are auxiliary `DATA`
  words and 467 are non-DATA operations.
- Every declared range fits; recursive parsing and the explicitly opaque
  trailer account for every payload byte. All functions end in `RETURN`.
- All observed constant/closure references, register fields checked by the
  probe, cache-word framing and jump targets pass its sample constraints.
- All 22 script children receive names through matching-register
  `CLOSURE` + `SETGLOBAL` pairs, not by proximity of printable strings.
- Six tests pass, covering pinned output, truncation/trailing bytes, unknown
  opcodes, invalid constants/closures/jumps/registers, missing cache words,
  and unsupported metadata. These test the restricted model, not arbitrary
  Havok Script compatibility.

## Translation-Relevant Findings

The following mappings are static call interpretations supported by actual
function bodies and argument loading, not merely co-occurring strings:

| Script callback | Decoded body or direct effect |
| --- | --- |
| `on_dialog_line_1164038_204596_0` | `QUEST.set_stage(QUEST_ID("FFQ35"), 10)` |
| `on_dialog_line_1164038_204596_1` | Sets FFQ35 stage 30. |
| `on_dialog_line_1164038_204597_1` | Calls `FFQ35.set_spared_cartery(true)`, sets stage 40, gives `"Freeform Quest"` gold, and removes one `QuestItem_FFQ35_JayckDagger`. |
| `on_dialog_line_1164038_21374_5` | Sets stage 100. |
| `on_dialog_line_1164038_21374_6` | Sets stage 100. |
| `on_dialog_line_1164038_622331_1` | Only `RETURN`, no scripted action in this body. |

`on_start_stage_30` calls the quest-alert helper with `"update"` and
`factionsLibrary.set_faction_hostile(FACTION_ID("Player"),
FACTION_ID("Quest_FFQ35_Cartery"))`. `on_start_stage_100` calls the alert
helper with `"complete"`, grants quest XP/gold and a
`loot_rogue_unique06_hands` reward, and removes the dagger.
`on_start_stage_110` calls the alert helper with `"failed"`.
These are engine-call requests, not proof of their runtime success or timing.

The two anonymous embedded predicates have identical instruction sequences;
their constants differ only in the compared stage, 0 versus 10. Static
control-flow interpretation is:

```lua
return QUEST.get_stage(QUEST_ID("FFQ35")) == STAGE
    and ACTOR.was_object_killed(GOR_ID("NPC_DAL_LJO_MenriTogh")) == false
```

This supports targeted context research into acceptance, hostility,
sparing/rewards, and completion rather than reviewing the whole quest as
undifferentiated dialogue. Debug/cheat helpers are also present and must not
be mistaken for normal player dialogue or event flow.

## Limits and Next Useful Link

The BXML catalog has 56 linked `default` IDs and 17 conditional
`dialog_line_*__autogen_*` names. The script instead defines six
`on_dialog_line_1164038_*` callbacks. These are different namespaces and
counts. This experiment did not map their identities, attach the anonymous
predicates to particular BXML fields, or decode callback arguments.

In particular, `204596`, `204597`, `21374`, and `622331` in callback names
must not be treated as localization CSV row IDs. Neither shared quest
membership nor a stage number identifies a speaker or a playback order.
An empty callback does not mean the associated game dialogue is empty.

Next, decode the surrounding BXML dialogue/topic/event records and connect
callback or condition references to exact localization keys. Until then,
keep existing per-ID speaker/order fields unknown, do not clear translation
holds on this evidence alone, and do not change generated classification TSVs
or translations. Other quests and the full opcode/type/debug set remain
untested.

## Verification Notes

The six new probe tests and eleven existing container-analysis tests pass.
The sample listing's `--check`, the corpus envelope analyzer's six generated
index checks, and the local Markdown link-target checks pass.
The whole-worktree `git diff --check` reports trailing tabs in existing
classification TSV changes, including `dialogue-context-id-catalog.tsv`;
those unrelated files were left unchanged. This is not a clean-worktree
validation claim.

Confirmed reusable facts are summarized in the maintained
[resource corpus map](../translation-reference/classification/resource-corpus-map.md#ffq35-static-bytecode-sample).
