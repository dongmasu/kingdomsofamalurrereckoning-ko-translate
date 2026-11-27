# Translation Edit: `default:17547`

- Date: 2026-11-27.
- Scope: clarity and naturalness in a quest-description sentence.

## Decision

The English is explanatory quest text, not a line with an established
speaker. It says the amulet must be taken to Amman's hollow of Syl and
cleansed, and that Amman wants the player to enter his lair and face its
dangers. Japanese explicitly places Amman's cave in Syl; Chinese supports the
curse-removal and lair-danger meanings.

The prior wording was understandable but compressed the location as
`실(Syl)의 아만 굴` and used `불러들여` for Amman's intention. The revised
Korean is:

> 저주를 풀려면 부적을 실(Syl)에 있는 아만(Amman)의 굴로 가져가 정화해야
> 한다. 아만(Amman)은 널 자기 소굴로 끌어들여 그 안의 온갖 위험에 맞서게
> 하려 한다.

The explanatory, written register is retained rather than converting quest
text into dialogue. Existing proper-name dispositions are unchanged.

## Verification

- Changed only the `Texto` field for `default:17547` with
  `tools/replace_text_preserve_eol.py`.
- Updated only `default:17547`'s four-language `source_fingerprint` and its
  three Korean snapshots in the proper-name occurrence index.
- No source CSV, extracted asset, or game binary changed; no commit was made.
