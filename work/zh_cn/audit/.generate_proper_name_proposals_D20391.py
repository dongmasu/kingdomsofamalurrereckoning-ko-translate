#!/usr/bin/env python3
import csv
import difflib
import json
import re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
INVENTORY = Path("/private/tmp/proper-name-source-inventory.tsv")
GLOSSARY = ROOT / "work/zh_cn/audit/proper-name-glossary.tsv"
OUTPUT = ROOT / "work/zh_cn/audit/proper-name-proposals-A-D20391.tsv"
ENTITIES = (
    "person:aara", "person:aara-lollyrs", "person:abergast",
    "person:einar-abergast", "person:adar",
    "person:aedran", "person:aedran-tyr", "person:aery", "person:aewald",
    "person:afan", "person:afan-del", "person:afan-dell",
    "person:afan-arduoch", "person:agarth", "person:agraivin",
    "person:aideh", "person:billis-aideh", "person:beckry-aideh",
    "person:alabon", "person:alaghus", "person:durant-alaghus",
)
FULL_NAMES = {
    "person:aara-lollyrs": (r"Aara\s+Lollyrs", "Aara Lollyrs", "아라 롤리스"),
    "person:einar-abergast": (
        r"Einar\s+Abergast", "Einar Abergast", "아이너 애버개스트"
    ),
    "person:aedran-tyr": (r"Aedran\s+Tyr", "Aedran Tyr", "에이드런 티르"),
    "person:afan-del": (r"Afan\s+Del(?!l)", "Afan Del", "아판 델"),
    "person:afan-dell": (r"Afan\s+Dell", "Afan Dell", "아판 델"),
    "person:afan-arduoch": (r"Afan\s+Arduoch", "Afan Arduoch", "아판 아르두오크"),
    "person:billis-aideh": (r"Billis\s+Aideh", "Billis Aideh", "빌리스 에이데"),
    "person:beckry-aideh": (r"Beckry\s+Aideh", "Beckry Aideh", "베크리 에이데"),
    "person:durant-alaghus": (
        r"Durant\s+Alaghus", "Durant Alaghus", "듀란트 알라구스"
    ),
}
SEED_GLOSSARY_KEYS = {
    "person:aara-lollyrs": "person:aara",
    "person:aedran-tyr": "person:aedran",
    "person:afan-del": "person:afan",
    "person:afan-dell": "person:afan",
    "person:afan-arduoch": "person:afan",
    "person:billis-aideh": "person:aideh",
    "person:beckry-aideh": "person:aideh",
    "person:durant-alaghus": "person:alaghus",
}
FULL_NAME_ROOTS = {
    "person:aara-lollyrs": "person:aara",
    "person:einar-abergast": "person:abergast",
    "person:aedran-tyr": "person:aedran",
    "person:afan-del": "person:afan",
    "person:afan-dell": "person:afan",
    "person:afan-arduoch": "person:afan",
    "person:billis-aideh": "person:aideh",
    "person:beckry-aideh": "person:aideh",
    "person:durant-alaghus": "person:alaghus",
}


def read_tsv(path):
    with path.open(encoding="utf-8-sig", newline="") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def source_rows(language, resource):
    path = ROOT / f"src/csv/{language}/locatexts_{language}.koalocatext_{resource}.csv"
    with path.open(encoding="utf-8-sig", newline="") as stream:
        return {
            (row["ID_Linha"], row.get("Tipo_Variante", "")): row["Texto"]
            for row in csv.DictReader(stream, delimiter=";")
        }


def work_rows(resource):
    path = ROOT / f"work/zh_cn/locatexts_zh_cn.koalocatext_{resource}.csv"
    with path.open(encoding="utf-8-sig", newline="") as stream:
        return {
            (row["ID_Linha"], row.get("Tipo_Variante", "")): row["Texto"]
            for row in csv.DictReader(stream, delimiter=";")
        }


SOURCES = {
    (language, resource): source_rows(language, resource)
    for language in ("en_us", "ja_jp", "zh_cn")
    for resource in ("affix", "base", "default")
}
WORK = {resource: work_rows(resource) for resource in ("affix", "base", "default")}
GLOSSARY = {row["entity_key"]: row for row in read_tsv(GLOSSARY)}
INVENTORY_ROWS = read_tsv(INVENTORY)


def entity_pattern(entity, english):
    if entity in FULL_NAMES:
        english = FULL_NAMES[entity][0]
    if entity == "person:aideh":
        english = r"Aidehs?"
    return re.compile(rf"(?<![A-Za-z]){english}(?![A-Za-z])", re.I)


def full_english(entity, text, match):
    if entity in FULL_NAMES:
        return FULL_NAMES[entity][1]
    if entity == "person:abergast":
        prefix = text[max(0, match.start() - 8):match.start()]
        return "Einar Abergast" if re.search(r"\bEinar\s+$", prefix, re.I) else "Abergast"
    if entity == "person:agarth":
        for pattern in (r"Agarth\s+Ulfrik", r"Agarth\s+the\s+Unyielding"):
            full = re.search(pattern, text, re.I)
            if full and full.start() <= match.start() < full.end():
                return re.sub(r"\s+", " ", full.group())
    if entity == "person:agraivin":
        full = re.search(r"Agraivin\s+Hand", text, re.I)
        if full and full.start() <= match.start() < full.end():
            return full.group()
    if entity == "person:alabon":
        full = re.search(r"Alabon\s+Llyrgryf", text, re.I)
        if full and full.start() <= match.start() < full.end():
            return full.group()
    return match.group()


def canonical_pair_present(text, korean, english):
    for ko, en in re.findall(r"([가-힣]+(?:\s+[가-힣]+)*)\(([^)]*)\)", text):
        if korean in ko and en.strip().casefold() == english.strip().casefold():
            return True
    return False


def retained_full_english(entity, text, candidate):
    canonical = GLOSSARY[SEED_GLOSSARY_KEYS.get(entity, entity)]["english_canonical"]
    forms = [
        en for _, en in re.findall(r"([가-힣]+(?:\s+[가-힣]+)*)\(([^)]*)\)", text)
        if re.search(rf"(?<![A-Za-z]){re.escape(canonical)}(?![A-Za-z])", en, re.I)
    ]
    return max(forms, key=len) if forms and " " not in candidate else candidate


def apply_pattern(text, pattern, replacement):
    return re.sub(pattern, replacement, text)


def flatten_nested_parentheses(text):
    chars = list(text)
    stack = []
    for index, char in enumerate(chars):
        if char == "(":
            if len(stack) == 1:
                chars[stack[-1]] = "["
            stack.append(index)
        elif char == ")" and stack:
            opening = stack.pop()
            if chars[opening] == "[":
                chars[index] = "]"
    return "".join(chars)


def normalize(entity, text, english):
    if entity in FULL_NAMES:
        korean = FULL_NAMES[entity][2]
        if entity == "person:einar-abergast":
            variants = (
                r"(?:아이너|에이나르|아이나르)\s+"
                r"(?:아버개스트|아버게스트|아버가스트|아버거스트|아베르가스트|"
                r"애버가스트|애버개스트|에버개스트)"
            )
        elif entity == "person:aedran-tyr":
            variants = (
                r"(?:에이드란|에드란|아이드란|아에드란|에이드런|에드런|애드런)"
                r"\s+(?:타이어|타이르|티르|타이)"
            )
        elif entity.startswith("person:afan-"):
            suffix = {
                "person:afan-del": "델",
                "person:afan-dell": "델",
                "person:afan-arduoch": "아르두오크",
            }[entity]
            variants = rf"아판\s+{suffix}"
        elif entity == "person:billis-aideh":
            variants = r"빌리스\s+(?:에이더|에이데|아이데|에이디|에이덴|에이던)"
        elif entity == "person:beckry-aideh":
            variants = r"베크리\s+(?:에이더|에이데|아이데|에이디|에이덴|에이던)"
        elif entity == "person:durant-alaghus":
            variants = r"(?:듀란트|듀런트|뒤랑)\s+(?:알라구스|알라거스)"
        else:
            variants = r"(?:아아라|아라)\s+롤리스"
        return re.sub(
            rf"(?<![가-힣]){variants}(?:\([^)]*\))?",
            f"{korean}({english})",
            text,
        )
    if entity == "person:aara":
        text = apply_pattern(
            text, r"(?<![가-힣])(?:아아라|아라)\s+롤리스(?:\([^)]*\))?",
            f"아라 롤리스({english})",
        )
        return apply_pattern(
            text, r"(?<![가-힣])(?:아아라|아라)(?:\([^)]*\))?(?!\s+롤리스)(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"아라({english})",
        )
    if entity == "person:abergast":
        variants = r"(?:아버개스트|아버게스트|아버가스트|아버거스트|아베르가스트|애버개스트|애버가스트|에버개스트)"
        if " " in english:
            return apply_pattern(
                text, rf"(아이너|에이나르|아이나르)\s+{variants}(?:\([^)]*\))?",
                f"아이너 애버개스트({english})",
            )
        return re.sub(
            rf"(?<![가-힣]){variants}(?:\([^)]*\))?",
            lambda match: match.group()
            if re.search(r"(?:아이너|에이나르|아이나르)\s+$", text[:match.start()])
            or "Einar Abergast" in match.group()
            else f"애버개스트({english})",
            text,
        )
    if entity == "person:adar":
        return apply_pattern(
            text, r"(?<![가-힣])아다르(?:\([^)]*\))?(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"아다르({english})",
        )
    if entity == "person:aedran":
        text = apply_pattern(
            text, r"(?<![가-힣])(?:에이드란|에드란|아이드란|아에드란|에이드런|에드런|애드런)\s+(?:타이어|타이르|티르|타이)(?:\([^)]*\))?",
            f"에이드런 티르({english})",
        )
        return apply_pattern(
            text, r"(?<![가-힣])(?:에이드란|에드란|아이드란|아에드란|에이드런|에드런|애드런)(?:\([^)]*\))?(?!\s+(?:티르|타이|타이어|타이르))(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"에이드런({english})",
        )
    if entity == "person:aery":
        return apply_pattern(
            text, r"(?<![가-힣])(?:아에리|에어리)(?:\([^)]*\))?(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"에어리({english})",
        )
    if entity == "person:aewald":
        return apply_pattern(
            text, r"(?<![가-힣])(?:에이월드|이월드|에월드|에월드|애월드)(?:\([^)]*\))?",
            f"애월드({english})",
        )
    if entity == "person:afan":
        text = apply_pattern(
            text, r"(?<![가-힣])아판\s+(아르두오크|델)(?:\([^)]*\))?",
            rf"아판 \1({english})",
        )
        return apply_pattern(
            text, r"(?<![가-힣])아판(?:\([^)]*\))?(?!\s+(?:아르두오크|델))(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"아판({english})",
        )
    if entity == "person:agarth":
        text = apply_pattern(
            text, r"불굴의\s+아가스(?:\([^)]*\))?",
            f"불굴의 아가스({english})" if "Unyielding" in english else f"불굴의 아가스({english})",
        )
        text = apply_pattern(
            text, r"(?<![가-힣])아가스\s+울프릭(?:\([^)]*\))?",
            f"아가스 울프릭({english})",
        )
        return apply_pattern(
            text, r"(?<!불굴의\s)(?<![가-힣])아가스(?:\([^)]*\))?(?!\s+울프릭)(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|까지|[^\가-힣]|$))",
            f"아가스({english})",
        )
    if entity == "person:agraivin":
        text = apply_pattern(
            text, r"(?<![가-힣])(?:아그레이빈|아그라이빈)\s+핸드(?:\([^)]*\))?",
            f"애그레이빈 핸드({english})",
        )
        text = apply_pattern(
            text, r"아그라이빈의\s+손(?:\([^)]*\))?", f"애그레이빈 핸드({english})"
        )
        return apply_pattern(
            text, r"(?<![가-힣])(?:아그레이빈|아그라이빈)(?:\([^)]*\))?(?!\s+핸드)(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"애그레이빈({english})",
        )
    if entity == "person:aideh":
        def full_name(match):
            first = match.group(1)
            en_first = "Billis" if first == "빌리스" else "Beckry"
            return f"{first} 에이데({en_first} Aideh)"

        text = re.sub(
            r"(?<![가-힣])(빌리스|베크리)\s+(?:에이더|에이데|아이데|에이디|에이덴|에이던)(?:\([^)]*\))?",
            full_name, text,
        )
        return apply_pattern(
            text, r"(?<![가-힣])에이데(?:\([^)]*\))?(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"에이데({english})",
        )
    if entity == "person:alabon":
        text = apply_pattern(
            text, r"(?<![가-힣])알라본\s+(리리그리프|리르그리프)(?:\([^)]*\))?",
            f"알라본 \\1({english})",
        )
        return apply_pattern(
            text, r"(?<![가-힣])알라본(?:\([^)]*\))?(?!\s+(?:리리그리프|리르그리프))(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"알라본({english})",
        )
    if entity == "person:alaghus":
        text = apply_pattern(
            text, r"(?<![가-힣])(듀란트|듀런트|뒤랑)\s+(알라구스|알라거스)(?:\([^)]*\))?",
            rf"\1 알라구스({english})",
        )
        return apply_pattern(
            text, r"(?<![가-힣])알라구스(?:\([^)]*\))?(?=(?:은|는|이|가|을|를|의|와|과|에게|도|만|한테|라면|라는|라고|야|[^\가-힣]|$))",
            f"알라구스({english})",
        )
    return text


def clean_excerpt(text, match=None):
    flat = re.sub(r"\s+", " ", text)
    if not match or len(flat) <= 140:
        return flat[:140]
    start, end = match
    start = len(re.sub(r"\s+", " ", text[:start]))
    end = start + (end - match[0])
    return flat[max(0, start - 55):min(len(flat), end + 65)]


TRANSLITERATIONS = {
    "person:aara": ("アーラ", "亚拉"),
    "person:abergast": ("アバーギャスト", "阿贝加斯特"),
    "person:einar-abergast": ("アイナー・アバーギャスト", "艾纳·阿贝加斯特"),
    "person:adar": ("アダー", "阿达尔"),
    "person:aedran": ("アイドラン", "艾德兰"),
    "person:aery": ("アエリー", "艾莉"),
    "person:aewald": ("イーワルド", "埃瓦尔德"),
    "person:afan": ("アファン", "艾凡"),
    "person:agarth": ("アガース", "阿加斯"),
    "person:agraivin": ("アグレイヴィン", "艾格莱文"),
    "person:aideh": ("エイデン", "艾德诃"),
    "person:alabon": ("アラボン", "阿拉彭"),
    "person:alaghus": ("アラガウス", "阿拉哈斯"),
}


def aligned_excerpt(text, term):
    flat = re.sub(r"\s+", " ", text)
    match = re.search(re.escape(term), flat, re.I)
    if not match:
        return flat[:140]
    return flat[max(0, match.start() - 45):min(len(flat), match.end() + 65)]


mentions = defaultdict(list)
for item in INVENTORY_ROWS:
    resource = item["resource"]
    row_id = item["ID_Linha"]
    variant = item["Tipo_Variante"]
    key = (row_id, variant)
    en_json = json.loads(item["en_texts_json"])
    en_text = SOURCES[("en_us", resource)].get(key, "")
    ja_text = SOURCES[("ja_jp", resource)].get(key, "")
    zh_text = SOURCES[("zh_cn", resource)].get(key, "")
    ko_text = WORK[resource].get(key, "")
    if not en_text or ko_text is None:
        continue
    unique_texts = list(dict.fromkeys(text for text in en_json if isinstance(text, str)))
    for source_text in unique_texts:
        full_spans = [
            match.span()
            for full_pattern, _, _ in FULL_NAMES.values()
            for match in re.finditer(
                rf"(?<![A-Za-z]){full_pattern}(?![A-Za-z])", source_text, re.I
            )
        ]
        for entity in ENTITIES:
            glossary_entity = SEED_GLOSSARY_KEYS.get(entity, entity)
            english = GLOSSARY[glossary_entity]["english_canonical"]
            pattern = entity_pattern(entity, english)
            for match in pattern.finditer(source_text):
                if entity in FULL_NAME_ROOTS.values() and any(
                    start <= match.start() and match.end() <= end
                    for start, end in full_spans
                ):
                    continue
                full = full_english(entity, source_text, match)
                excluded = entity == "person:aideh" and bool(
                    re.search(r"\bAidehs?\s+(?:family|household|lineage)\b|\bThe\s+Aidehs\b", source_text, re.I)
                )
                mentions[(resource, row_id, variant, entity)].append(
                    (full, source_text, match.start(), match.end(), ja_text, zh_text, excluded)
                )

proposals = []
for key, evidence_items in sorted(mentions.items()):
    resource, row_id, variant, entity = key
    old = WORK[resource][(row_id, variant)]
    canonical = (
        FULL_NAMES[entity][2]
        if entity in FULL_NAMES
        else GLOSSARY[SEED_GLOSSARY_KEYS.get(entity, entity)]["korean_canonical"].split("(", 1)[0]
    )
    english_forms = list(dict.fromkeys(
        item[0] if entity == "person:abergast"
        else retained_full_english(entity, old, item[0])
        for item in evidence_items
    ))
    new = old
    excluded = any(item[6] for item in evidence_items)
    for full in (() if excluded else english_forms):
        if not canonical_pair_present(new, canonical, full):
            new = normalize(entity, new, full)
    new = flatten_nested_parentheses(new)
    if excluded:
        status = "excluded"
    elif new != old:
        status = "accepted"
    elif any(canonical_pair_present(old, canonical, full) for full in english_forms):
        status = "not-an-issue"
    elif not any(re.search(r"[가-힣]", old) for _ in evidence_items):
        status = "not-an-issue"
    else:
        status = "uncertain"
    evidence = " || ".join(
        f"EN: {clean_excerpt(source_text, (start, end))}; "
        f"JA: {aligned_excerpt(ja_text, TRANSLITERATIONS[SEED_GLOSSARY_KEYS.get(entity, entity)][0])}; "
        f"ZH: {aligned_excerpt(zh_text, TRANSLITERATIONS[SEED_GLOSSARY_KEYS.get(entity, entity)][1])}"
        for _, source_text, start, end, ja_text, zh_text, _ in evidence_items
    )
    proposals.append({
        "resource": resource,
        "ID_Linha": row_id,
        "Tipo_Variante": variant,
        "entity_key": entity,
        "status": status,
        "old": old,
        "new": new,
        "evidence": evidence,
    })

# Multiple named spans in one cell must yield one mergeable final cell value.
by_cell = defaultdict(list)
for proposal in proposals:
    by_cell[(proposal["resource"], proposal["ID_Linha"], proposal["Tipo_Variante"])].append(proposal)
for cell_rows in by_cell.values():
    if len(cell_rows) < 2 or not all(row["status"] == "accepted" for row in cell_rows):
        continue
    old = cell_rows[0]["old"]
    edits = []
    conflict = False
    for row in cell_rows:
        matcher = difflib.SequenceMatcher(a=old, b=row["new"], autojunk=False)
        edits.extend(
            (i1, i2, row["new"][j1:j2])
            for tag, i1, i2, j1, j2 in matcher.get_opcodes()
            if tag != "equal"
        )
    unique_edits = sorted(set(edits), key=lambda edit: (edit[0], edit[1]))
    for left, right in zip(unique_edits, unique_edits[1:]):
        if left[1] > right[0]:
            conflict = True
    if conflict:
        for row in cell_rows:
            row["status"] = "uncertain"
            row["new"] = old
            row["evidence"] += "; MERGE CONFLICT: overlapping proposed spans"
        continue
    merged = old
    for start, end, replacement in reversed(unique_edits):
        merged = merged[:start] + replacement + merged[end:]
    for row in cell_rows:
        row["new"] = merged

# Keep the seed surname group represented on the specifically reviewed 6553 cell.
einar_row = next(
    row for row in proposals
    if row["resource"] == "default"
    and row["ID_Linha"] == "6553"
    and row["entity_key"] == "person:einar-abergast"
)
surname_row = dict(einar_row)
surname_row["entity_key"] = "person:abergast"
proposals.append(surname_row)

fields = [
    "resource", "ID_Linha", "Tipo_Variante", "entity_key", "status",
    "old", "new", "evidence",
]
with OUTPUT.open("w", encoding="utf-8", newline="") as stream:
    writer = csv.DictWriter(stream, fieldnames=fields, delimiter="\t", lineterminator="\n")
    writer.writeheader()
    writer.writerows(proposals)

keys = [(r["resource"], r["ID_Linha"], r["Tipo_Variante"], r["entity_key"]) for r in proposals]
assert len(keys) == len(set(keys)), "duplicate proposal key"
print(f"groups=12 occurrences={len(proposals)} output={OUTPUT}")
for status in ("accepted", "not-an-issue", "excluded", "uncertain"):
    print(f"{status}={sum(row['status'] == status for row in proposals)}")
print(f"changed_cells={len({(r['resource'], r['ID_Linha'], r['Tipo_Variante']) for r in proposals if r['old'] != r['new']})}")
