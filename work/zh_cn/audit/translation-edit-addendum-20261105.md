# Translation Edit Addendum - 2026-11-05

## Fallon quest objectives

- Compared `default` IDs `12267`, `37479`, `50513`, and `64037` across English, Japanese, Chinese, and Korean. English uses `Search for Brother Fallon` for the first pair and `Look for Brother Fallon` for the second; Chinese uses the same find-Fallon objective for all four. Japanese specifies examining Fallon's body for the first pair and looking for him for the second, but English and Chinese do not support adding "body" to the Korean objective.
- Standardized the Korean objective style to `팰런 수사(Brother Fallon) 찾기`. Updated IDs `12267` and `37479`; IDs `50513` and `64037` already used this wording.
- Verified all four ID-specific rows and used the byte-preserving replacement helper for the two changed rows.

## Reckoning Mode terminology

- Compared all 21 English `default` rows containing `Reckoning Mode` with the active Korean rows. ID `18449` was the only occurrence translated as `운명 개방 모드`; the other 20 use `레코닝 모드`.
- Replaced only the wrapped term at `default:18449` with `{*1레코닝 모드}`, following the official Korean manual's `Reckoning = 레코닝` and the established project usage.
