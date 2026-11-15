# Repeated Source Text

`exact-english-default-groups.jsonl` is generated from the current English,
Japanese, Chinese, and Korean `default` CSVs. Each record groups exact,
non-empty English source matches and retains every matching ID and its
current text in all four languages. The first JSONL record stores source
SHA-256 fingerprints and group/occurrence counts.

Regenerate with
`python3 work/zh_cn/translation-reference/duplicates/build_exact_english_default_groups.py`;
use `--check` to verify that the checked-in index matches its inputs.

An exact English match is an impact-tracking clue, not proof of identical
meaning or context. Preserve ID-specific Korean wording when source meaning,
text function, register, or context warrants it. Dated group reviews and
application manifests remain in `work/zh_cn/audit/`.
