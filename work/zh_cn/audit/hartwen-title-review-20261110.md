# Hartwen Title Review - November 10, 2026

- Compared every active Korean occurrence of `Hartwen` with the same-ID English, Japanese, and Chinese sources. The active `default` resource has ten occurrences; no `base` or `affix` occurrences were found.
- These references identify one character: English uses the same proper name `Hartwen`, and the dialogue references the same woman with feminine pronouns. The titles differ by context; they do not indicate separate people.
- Kept the English source's title distinctions:
  - `Lady Hartwen` (`4258`, `20616`) → `하트웬 여사(Lady Hartwen)`.
  - `Huntress Hartwen` (`7988`) → `여사냥꾼 하트웬(Huntress Hartwen)`.
  - `Great Huntress Hartwen` (`26833`, `32762`, `34512`, `37805`, `44797`, `47001`) → `위대한 여사냥꾼 하트웬(Great Huntress Hartwen)`.
  - Bare `Hartwen` (`41202`) remains `하트웬(Hartwen)`.
- Updated nine rows to use these consistent title translations and full English title pairings. At `20616`, replaced `부인` with `여사`; the English says `Lady Hartwen`, and Chinese also uses a lady's honorific. Japanese instead renders both Lady references as `大狩人`; English remains the primary meaning source.
- Rechecked the complete changed sentences. The edits preserve the original meaning, dialogue register, relationship ambiguity at `20616`, and the placement instruction at `7988`; no unsupported relationship was added.
- The CSV replacement-helper regression suite passed all 11 tests. The CRLF-aware diff check passed.
