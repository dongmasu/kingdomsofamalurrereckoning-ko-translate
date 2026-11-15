# Dialogue Context Translation Edit Batch: IDs `15000`-`15999`

- Date: 2026-11-14.
- Scope: source-check all 56 correction candidates in this range against the
  current English, Japanese, Chinese, and Korean rows; align directly related
  names, terms, and exact-source groups.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker identity and playback order were not inferred from asset links.

## Decisions

Fifty candidates received source-supported corrections. Four were already
resolved in the active translation, and two were retained after checking the
current sources. No candidate in this range remains on hold.

The corrections address natural Korean phrasing and source meaning, including
the Scholia Arcana organization, the named Child of Dust, character and place
labels, quest objectives, the Sable title, and name/title pairing. Related
exact-source and terminology groups were checked across their linked IDs.
Each change is ID-scoped; differences justified by context were preserved.
The complete list of 103 text-fragment operations, affected IDs, and
source-grounded rationales is in the accompanying JSON manifest.

The four candidates already resolved were `15148`, `15295`, `15598`, and
`15816`. IDs `15499` and `15933` were retained because their current Korean
remains supported by the source context. There were no evidence-limited holds.

## Application and Verification

- The manifest's 103 ID-scoped operations affect 98 unique `default` IDs.
- Reversing the operations in memory restores the exact manifest input CSV
  SHA-256: `5aedbf20b1a742d7b19ee67b8fc5f0bb460cabd0f98b89242c0c327107198702`.
- Active CSV SHA-256:
  `be652801f9430795e11b93dcf567fff9230da6ff246e8fef8736da98341e4f28`.
- Review-ledger SHA-256:
  `cedd8aa9d6b8f978e5cf3c5bb8f6adfa5757d9932f32e48d714234fe2ab9e2e7`.
- The 65,135-ID review ledger remains in order; only fingerprints for the
  edited Korean rows were refreshed.
- This batch changes translation text only. It does not modify source CSVs,
  extracted game assets, localization binaries, or PAK files.
