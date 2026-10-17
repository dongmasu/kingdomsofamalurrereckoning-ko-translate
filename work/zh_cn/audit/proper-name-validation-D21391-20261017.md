# D-21391: Independent And Structural Verification

Date: 2026-10-17

Reviewed 22 new entity/row occurrences under the existing
`person:enconeg-holn`: 20 changed cells and two retained cells. The short
form is `엔코네그(Enconeg)`, using the existing full-name stem rather than
introducing a conflicting `엔코넥` short form. English defines identity;
aligned Japanese and Chinese corroborate it. Vowel-final particles were
checked individually, including default:7289, 8265, 47080 and 55482.

The independent semantic pass found no translation, identity or particle
defect. The nine existing full-name cells and terminal dispositions were
preserved: default:4457, 8164, 17093, 25177, 31511, 32562, 37768, 51816
and 64069. No global short-name alias or duplicate entity was added.
This does not resolve any separate historical nymph referent/identity hold.
The repeated D-number prefix in the new evidence strings is clerical only;
the index matches the exact manifest evidence and terminal dispositions.

Validation results:

- Data validator: 1,602 unique entities and 40,260 active-aligned occurrences.
- Statuses: accepted 26,896; excluded 2,422; not-an-issue 10,912; uncertain 30.
- Source comparison: 39,734 generated matches; zero missing keys; 526
  manifest-backed contextual extras; zero undocumented extras.
- Terminal bilingual-label check: zero missing labels; one documented
  idiomatic non-label and four documented lowercase descriptive non-labels.
- D-21387-D-21391 inverse chain: 221 distinct reviewed row keys, 196
  changed cells; affix seven, base 20, default 169 edit events.
- All chain steps preserve BOM, exact mixed line-ending sequence, row
  order, keys, variants, non-target cells and all non-target bytes.
- D-21391 tests: six runs, ten assertions, no failures or errors after
  application. Prismere tests: five runs, seven assertions, no failures
  or errors. Byte-preserving editor fixtures pass.
- All five active checkpoint blocks agree on D-21391, next D-21392 and
  the current CSV hashes.

Current SHA-256:

- affix: `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`
- base: `cce89659a3f39f428ab41f587770bc980b1711f63cf5fe73bf1d624b1e10b98c`
- default: `095892781295c768770e477f09e67b3197c97efcca182b43c7ecd89ea926880c`

D-21391 pre-edit base/default backups:
`/private/tmp/ko-translate-backups/20261017/before-proper-name-D21391/`.
The last affix edit backup remains D-21387. Exact paths and pre/post
hashes are in the D-21391 addendum.

No unreviewed indexed keys remain. The 30 reviewed occurrence holds
span 28 distinct CSV row keys and remain unchanged. Discovery beyond
registered terms remains incomplete, so this is not overall completion.
The next available batch is D-21392. No build, PAK research, commit or
push was performed.
