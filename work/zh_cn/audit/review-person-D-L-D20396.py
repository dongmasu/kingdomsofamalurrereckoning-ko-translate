#!/usr/bin/env python3
import csv
import json
import re
from collections import Counter, defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
INVENTORY = Path("/private/tmp/proper-name-source-inventory.tsv")
GLOSSARY = ROOT / "work/zh_cn/audit/proper-name-glossary.tsv"
OUTPUT = ROOT / "work/zh_cn/audit/proper-name-proposals-D-L-D20396.tsv"
HEADERS = [
    "resource", "ID_Linha", "Tipo_Variante", "entity_key", "status",
    "old", "new", "evidence", "english", "japanese", "chinese",
]
TITLE_PREFIXES = (
    "대현자", "성전기사", "기사", "대사", "교수", "선생", "학자",
    "사반트", "소령", "대령", "선장", "상인", "숙련자", "마법사",
    "주술사", "대장", "왕", "여왕", "사제",
)
TITLE_SUFFIXES = ("경", "부인", "선생", "학자", "교수", "대사", "님")
PARTICLE_PAIRS = (
    ("으로", "로"),
    ("은", "는"),
    ("이", "가"),
    ("을", "를"),
    ("과", "와"),
)
OTHER_PARTICLES = (
    "에게서", "으로부터", "에게", "한테", "에서", "으로", "라고",
    "라며", "라면", "라는", "이란", "이며", "이고", "의", "에", "도",
    "만", "부터", "까지", "보다", "처럼",
)
PREFERRED_KOREAN = {
    "person:fallon": "파론",
    "person:egest": "이게스트",
    "person:gwalchmai": "그왈크마이",
}
SOURCE_BACKED_VARIANTS = {
    "person:fallon": ("파론", "팰런", "패런", "팔론", "팔런", "폴런", "폴론"),
    "person:egest": ("이게스트", "에게스트", "에제스트"),
    "person:gwalchmai": ("그왈크마이", "그월크마이", "그왈흐마이", "그월흐마이"),
}
AUDITED_ROW_DISPOSITIONS = {
    ("base", "68"): ("not-an-issue", None),
    ("base", "387"): ("accepted", "파론(Fallon) 형제에게 II"),
    ("base", "734"): ("not-an-issue", None),
    ("default", "4530"): ("not-an-issue", None),
    ("default", "6979"): ("not-an-issue", None),
    ("default", "13768"): ("not-an-issue", None),
    ("default", "15564"): ("not-an-issue", None),
    ("default", "17578"): ("not-an-issue", None),
    ("default", "17692"): ("not-an-issue", None),
    ("default", "21438"): (
        "accepted",
        "웨일런과 달탄 이임스(Daltan Eames)의 결투에서 웨일런의 보조자로 나섰다. "
        "웨일런은 클루리콘 복무를 피하려고 결투를 치밀한 탈출 계획으로 꾸몄다. "
        "어머니 샬라레인의 통찰력과 내 도움이 없었다면 성공했을 것이다. "
        "이제 그녀에게 돌아가 보상을 받아야겠다.",
    ),
    ("default", "26197"): ("accepted", "달탄 이임스(Daltan Eames)"),
    ("default", "27614"): ("not-an-issue", None),
    ("default", "28438"): ("not-an-issue", None),
    ("default", "28623"): ("not-an-issue", None),
    ("default", "31986"): ("accepted", "달탄 이임스(Daltan Eames)"),
    ("default", "34814"): ("not-an-issue", None),
    ("default", "35503"): (
        "accepted",
        "결투에서 웨일런의 보조인이 되기로 했다. 달탄 이임스(Daltan Eames)에게 "
        "알린 뒤에는 달탄(Daltan)의 검끝에 그림자 장미를 바르라고 했다. "
        "웨일런은 그 이유를 알려 주지 않았다.",
    ),
    ("default", "36774"): (
        "accepted",
        "웬딩의 겔파인에게 그림자의 장미를 받은 뒤, 장교 회관에 있는 "
        "달탄(Daltan)을 찾아가. 준비됐다고 전해.",
    ),
    ("default", "40106"): (
        "accepted",
        "맹세코 아무것도 기억 안 나. 여동생의 명예를 걸고 전쟁 영웅 "
        "달탄 이임스(Daltan Eames)에게 결투를 신청했던 것 같아.",
    ),
    ("default", "42281"): ("accepted", "달탄 이임스(Daltan Eames)"),
    ("default", "45895"): ("not-an-issue", None),
    ("default", "45924"): (
        "accepted",
        "정교하게 장식된 이 칼날들을 달탄(Daltan)이 결투에서 사용할 것이다.",
    ),
    ("default", "48364"): ("not-an-issue", None),
    ("default", "49268"): (
        "accepted",
        "결투에서 웨일런의 보조인을 맡기로 했어. 먼저 상대인 달탄 이임스"
        "(Daltan Eames)를 찾아가 웨일런이 준비됐다고 알려야 해.",
    ),
    ("default", "50226"): (
        "accepted",
        "웨일런의 결투를 시작할 때가 됐다. 결투를 시작하려면 웨일런과 "
        "달탄(Daltan), 그리고 각자의 결투 보조인이 약속한 장소에 모여야 한다.",
    ),
    ("default", "55520"): ("not-an-issue", None),
    ("default", "58762"): ("not-an-issue", None),
    ("default", "62341"): ("not-an-issue", None),
    ("default", "64687"): (
        "accepted",
        "그녀는 네 뜻을 알아들을 거야. 그다음 번의 장교 회관에 가서, "
        "검을 살피는 척하며 달탄(Daltan)의 검 끝에 몰래 조금 발라.",
    ),
    ("base", "1270"): ("accepted", "파론(Fallon) 형제에게 I"),
    ("base", "1312"): ("not-an-issue", None),
    ("base", "1893"): ("not-an-issue", None),
    ("base", "2773"): ("not-an-issue", None),
    ("default", "1330"): ("accepted", "그왈크마이(Gwalchmai)"),
    ("default", "1963"): ("uncertain", None),
    ("default", "2145"): ("accepted", "파론(Fallon) 형제(Brother Fallon)는 찾았어?"),
    ("default", "2511"): ("not-an-issue", None),
    ("default", "2576"): (
        "accepted",
        "오래된 창고 말이야? 거기 있는 건 거의 다 그왈크마이(Gwalchmai) 거야. "
        "우린 손도 안 대. 사실 그가 대부분 열쇠로 잠가 놨어.",
    ),
    ("default", "2835"): (
        "accepted",
        "아니, 아니. 취하긴 했어도 난 그왈크마이(Gwalchmai)야. "
        "거래 조건은 이거야. 받을지 말지 결정해.",
    ),
    ("default", "3286"): ("accepted", "그왈크마이(Gwalchmai)"),
    ("default", "4023"): ("not-an-issue", None),
    ("default", "4523"): (
        "accepted",
        "파론(Fallon) 수도사가 갖고 있을 거야. 그런데 벌써 돌아왔어야 하는데. "
        "글렌다라 숲을 지나 선교원 쪽으로 가 봐. 뭔가 찾을 수 있을 거야.",
    ),
    ("default", "4867"): (
        "accepted",
        "글렌다라 숲에서 뒤집힌 수레 옆에 브라더 파론(Brother Fallon)의 시신이 "
        "있는 걸 발견했어. 브라더 우도(Brother Udo)는 그 소식을 듣고 "
        "파론(Fallon)의 기도 구슬을 찾아 달라고 했지. 아마 아직 시신에 있을 거야.",
    ),
    ("default", "5506"): ("accepted", "브라더 파론(Brother Fallon)의 염주 찾기"),
    ("default", "5523"): ("accepted", "그왈크마이(Gwalchmai)"),
    ("default", "7587"): (
        "accepted",
        "아주 작은 글씨로 '그왈크마이(Gwalchmai)'라고 새겨진 낡은 황동 열쇠.",
    ),
    ("default", "8008"): ("accepted", "그왈크마이(Gwalchmai)"),
    ("default", "8562"): ("accepted", "파론(Fallon)의 기도 염주가 필요한가?"),
    ("default", "9025"): ("uncertain", None),
    ("default", "9165"): ("accepted", "파론(Fallon)"),
    ("default", "9805"): ("uncertain", None),
    ("default", "10609"): (
        "accepted",
        "파론(Fallon) 수사는 디덴힐에 의료품을 가져다주려고 성 하드윈 불멸 "
        "선교회를 떠난 지 하루가 넘었다. 우도 수사가 그를 찾아보라고 했다. "
        "최악의 일이 벌어졌다면 파론(Fallon)의 기도 묵주를 가지고 돌아와야 한다.",
    ),
    ("default", "11238"): ("accepted", "브라더 파론(Brother Fallon)의 염주를 돌려줘라"),
    ("default", "11765"): ("accepted", "파론(Fallon)"),
    ("default", "13213"): ("not-an-issue", None),
    ("default", "14475"): ("uncertain", None),
    ("default", "17784"): ("not-an-issue", None),
    ("default", "22140"): ("not-an-issue", None),
    ("default", "24285"): ("accepted", "이게스트(Egest)"),
    ("default", "25329"): ("uncertain", None),
    ("default", "32950"): ("not-an-issue", None),
    ("default", "35016"): ("not-an-issue", None),
    ("default", "36894"): ("uncertain", None),
    ("default", "43870"): (
        "accepted",
        "여긴 세 등불 여관이야. 역병 때문에 우리 그레이(Gray)도 "
        "치료사의 보살핌을 받고 있지만, 그래도 영업 중이지.",
    ),
    ("default", "45649"): ("not-an-issue", None),
    ("default", "48023"): ("uncertain", None),
    ("default", "51271"): ("not-an-issue", None),
    ("default", "60225"): ("not-an-issue", None),
    ("base", "418"): ("excluded", None),
    ("base", "424"): ("not-an-issue", None),
    ("base", "560"): ("excluded", None),
    ("base", "2712"): ("excluded", None),
    ("base", "3450"): ("excluded", None),
    ("default", "2279"): ("not-an-issue", None),
    ("default", "3864"): ("not-an-issue", None),
    ("default", "4047"): ("excluded", None),
    ("default", "4724"): ("excluded", None),
    ("default", "5288"): ("excluded", None),
    ("default", "7431"): ("excluded", None),
    ("default", "7671"): ("excluded", None),
    ("default", "11271"): ("excluded", None),
    ("default", "12142"): ("excluded", None),
    ("default", "14304"): ("not-an-issue", None),
    ("default", "15404"): ("excluded", None),
    ("default", "16990"): ("excluded", None),
    ("default", "18321"): ("excluded", None),
    ("default", "19719"): ("excluded", None),
    ("default", "20418"): ("not-an-issue", None),
    ("default", "21063"): ("excluded", None),
    ("default", "21277"): (
        "accepted", "스테그 다크바리(Steg Darkvari)는 결백해.",
    ),
    ("default", "22843"): ("excluded", None),
    ("default", "22992"): ("uncertain", None),
    ("default", "23499"): ("excluded", None),
    ("default", "23863"): ("not-an-issue", None),
    ("default", "27377"): ("excluded", None),
    ("default", "30533"): ("excluded", None),
    ("default", "30620"): ("uncertain", None),
    ("default", "30987"): ("excluded", None),
    ("default", "32149"): ("excluded", None),
    ("default", "33476"): ("not-an-issue", None),
    ("default", "34765"): ("excluded", None),
    ("default", "35429"): (
        "accepted",
        "그룬트 다크바리(Grund Darkvari)와 사촌들은 아데사에서 오는 "
        "노움의 수송대를 습격하고 약탈하며 부정한 돈벌이를 해왔다. "
        "빠르게 한몫 챙기고 싶다면 다크바리 가문의 광산을 습격해 "
        "약탈 행위와 다크바리 가문 자체를 끝장내면 된다.",
    ),
    ("default", "35684"): (
        "accepted", "스테그 다크바리(Steg Darkvari)",
    ),
    ("default", "36146"): (
        "accepted",
        "스테그 다크바리(Steg Darkvari)에게 그의 연인에 관한 진실을 "
        "말하기로 했다. 충격받은 듯하지만, 진실을 아는 편이 나을 거라고 생각한다.",
    ),
    ("default", "36533"): (
        "accepted", "스테그 다크바리(Steg Darkvari)",
    ),
    ("default", "44033"): ("excluded", None),
    ("default", "44328"): (
        "accepted",
        "스테그 다크바리(Steg Darkvari)와 그의 젊은 연인 흐린디 중가르는 "
        "아포티르를 떠나 아데사에서 새 삶을 시작하고 싶어 한다. 그러려면 "
        "스테그가 출입이 금지된 다크바리 광산 깊은 곳에서 물건 하나를 가져와야 한다.",
    ),
    ("default", "44875"): ("excluded", None),
    ("default", "45840"): ("not-an-issue", None),
    ("default", "45872"): ("excluded", None),
    ("default", "46371"): ("excluded", None),
    ("default", "46842"): ("not-an-issue", None),
    ("default", "48597"): ("excluded", None),
    ("default", "49927"): ("excluded", None),
    ("default", "50179"): ("excluded", None),
    ("default", "50320"): ("excluded", None),
    ("default", "52668"): ("excluded", None),
    ("default", "54137"): ("excluded", None),
    ("default", "55300"): ("excluded", None),
    ("default", "55752"): ("excluded", None),
    ("default", "56614"): ("excluded", None),
    ("default", "57573"): ("excluded", None),
    ("default", "58119"): ("uncertain", None),
    ("default", "59457"): ("excluded", None),
    ("default", "59562"): ("excluded", None),
    ("default", "59769"): (
        "accepted",
        "화이트스톤 감옥 열쇠를 손에 넣었다. 스테그에게 돌아가 감방을 열고 "
        "스테그 다크바리(Steg Darkvari)가 탈출하게 해야겠다.",
    ),
    ("default", "59807"): ("excluded", None),
    ("default", "60877"): ("excluded", None),
    ("default", "61305"): ("excluded", None),
    ("default", "61445"): ("excluded", None),
    ("default", "61865"): ("not-an-issue", None),
    ("default", "62269"): ("excluded", None),
    ("default", "63972"): ("not-an-issue", None),
}
COMMON_KOREAN_FORMS = {
    "person:deadeye": {"명사수"},
    "person:gray": {"회색"},
    "person:green": {"초록", "녹색", "초록색"},
    "person:garrou": {"가루"},
    "person:hain": {"하인"},
}
NON_NAME_WORDS = {
    "a", "about", "after", "again", "and", "apparently", "attack",
    "before", "but", "by", "chase", "complete", "confront", "defeat",
    "deliver", "escort", "find", "follow", "from", "give", "help",
    "if", "in", "investigate", "kill", "like", "meet", "now", "of",
    "on", "report", "retrieve", "return", "save", "speak", "stop",
    "talk", "tell", "then", "to", "visit", "watch", "with",
}
TITLE_WORDS = {
    "adept", "ambassador", "archsage", "brother", "captain", "commander",
    "general", "lady", "lieutenant", "lord", "master", "mayor", "mistress",
    "prince", "professor", "savant", "sir", "templar",
}
NON_PERSON_DARKVARI = re.compile(
    r"\b(?:the\s+Darkvari|(?:and|,)\s+Darkvari\b|Darkvari\s+(?:and\s+"
    r"Cynrics|family|people|folk|clan|race|key|map|treasure|contract|"
    r"colliery|mine|outlaw|are|were|is|was))\b"
)


def read_tsv(path):
    with path.open(encoding="utf-8-sig", newline="") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def english_terms(entity):
    return list(dict.fromkeys(
        term.strip()
        for term in [entity["english_canonical"],
                     *entity.get("english_aliases", "").split("|")]
        if term and term.strip()
    ))


def occurrences(texts, entity):
    found = []
    terms = sorted(english_terms(entity), key=len, reverse=True)
    for text_index, text in enumerate(texts):
        if not text:
            continue
        matches = []
        for term in terms:
            pattern = re.compile(
                rf"(?<![A-Za-z]){re.escape(term)}(?![A-Za-z])"
            )
            matches.extend(
                (match.start(), match.end(), term)
                for match in pattern.finditer(text)
            )
        matches.sort(key=lambda item: (item[0], -(item[1] - item[0])))
        kept = []
        for match in matches:
            if any(match[0] >= prior[0] and match[1] <= prior[1]
                   for prior in kept):
                continue
            kept.append(match)
        found.extend((text_index, *match) for match in kept)
    return found


def korean_forms(entity):
    canonical = PREFERRED_KOREAN.get(
        entity["entity_key"],
        entity["korean_canonical"].split("(", 1)[0].strip(),
    )
    forms = [canonical, *entity.get("korean_variants", "").split("|")]
    forms.extend(SOURCE_BACKED_VARIANTS.get(entity["entity_key"], ()))
    forms = [form.strip().rstrip("?") for form in forms if form.strip()]
    # Title-bearing variants belong to the titled-name entry, not its component.
    filtered = []
    for form in forms:
        if not re.search(r"[가-힣]", form):
            continue
        if " " in form and any(form.endswith(" " + title) for title in TITLE_SUFFIXES):
            continue
        filtered.append(form)
    return sorted(set(filtered), key=len, reverse=True)


def entity_korean_base(entity):
    return entity["korean_canonical"].split("(", 1)[0].strip()


def has_final_consonant(syllable):
    code = ord(syllable) - 0xAC00
    return 0 <= code <= 11171 and code % 28 != 0


def expected_particle(pair, korean):
    last = korean[-1]
    consonant = has_final_consonant(last)
    if pair == ("으로", "로"):
        return "으로" if consonant and (ord(last) - 0xAC00) % 28 != 8 else "로"
    return pair[0] if consonant else pair[1]


def particle_at(text, index):
    tail = text[index:]
    for pair in PARTICLE_PAIRS:
        for particle in pair:
            if tail.startswith(particle):
                after = tail[len(particle):]
                if not after or not re.match(r"[가-힣]", after):
                    return particle, pair
    for particle in OTHER_PARTICLES:
        if tail.startswith(particle):
            after = tail[len(particle):]
            if not after or not re.match(r"[가-힣]", after):
                return particle, None
    return "", None


def valid_right_edge(text, index):
    tail = text[index:]
    if not tail or not re.match(r"[가-힣]", tail):
        return True
    particle, _ = particle_at(text, index)
    return bool(particle)


def find_korean_matches(text, entity):
    matches = []
    canonical = PREFERRED_KOREAN.get(
        entity["entity_key"],
        entity["korean_canonical"].split("(", 1)[0].strip(),
    )
    english = entity["english_canonical"]
    for form in korean_forms(entity):
        start_at = 0
        while True:
            start = text.find(form, start_at)
            if start < 0:
                break
            start_at = start + 1
            prefix_start = start
            prefix = ""
            before = text[:start]
            for title in TITLE_PREFIXES:
                candidate = title + " "
                if before.endswith(candidate):
                    proposed_start = start - len(candidate)
                    if proposed_start == 0 or not re.match(
                        r"[가-힣]", text[proposed_start - 1]
                    ):
                        prefix_start = proposed_start
                        prefix = candidate
                        break
            if start > 0 and re.match(r"[가-힣]", text[start - 1]) and not prefix:
                continue
            end = start + len(form)
            if not valid_right_edge(text, end):
                continue

            annotation = ""
            annotated_end = end
            annotation_match = re.match(r"[ \t]*\(([^()\r\n]*)\)", text[end:])
            if annotation_match:
                annotation = annotation_match.group(1)
                annotated_end = end + annotation_match.end()
            if form in COMMON_KOREAN_FORMS.get(entity["entity_key"], set()) and not re.search(
                rf"(?<![A-Za-z]){re.escape(english)}(?![A-Za-z])",
                annotation,
                re.IGNORECASE,
            ):
                continue
            particle, pair = particle_at(text, annotated_end)
            if not particle:
                particle, pair = particle_at(text, end)
                particle_start = annotated_end
            else:
                particle_start = annotated_end

            canonical_name = canonical
            valid_annotation = bool(
                re.search(
                    rf"(?<![A-Za-z]){re.escape(english)}(?![A-Za-z])",
                    annotation,
                    re.IGNORECASE,
                )
            )
            title_annotation = bool(
                re.match(r"^(?:Archsage|Sir|Lord|Lady|Scholar|Captain|Brother)\b",
                         annotation, re.IGNORECASE)
                and valid_annotation
            )
            already_canonical = form == canonical and (
                valid_annotation or not annotation
            )
            matches.append({
                "start": prefix_start,
                "name_start": start,
                "name_end": end,
                "end": annotated_end,
                "particle_start": particle_start,
                "particle": particle,
                "pair": pair,
                "form": form,
                "canonical": canonical_name,
                "prefix": prefix,
                "annotation": annotation,
                "valid_annotation": valid_annotation or title_annotation,
                "already_canonical": already_canonical,
            })

    matches.sort(key=lambda item: (item["start"], -len(item["form"])))
    non_overlapping = []
    for match in matches:
        if any(match["name_start"] < prior["name_end"] and
               match["name_end"] > prior["name_start"]
               for prior in non_overlapping):
            continue
        non_overlapping.append(match)
    return non_overlapping


def normalize_entity(text, entity, expected_count):
    matches = find_korean_matches(text, entity)
    if len(matches) != expected_count or not matches:
        return text, "uncertain", (
            f"English source has {expected_count} matched occurrence(s), "
            f"but Korean has {len(matches)} safely bounded glossary form(s)."
        )

    edits = []
    for match in matches:
        annotation = match["annotation"]
        if match["valid_annotation"]:
            suffix = f"({annotation})"
        else:
            suffix = f"({entity['english_canonical']})"
            if annotation:
                suffix += f"({annotation})"

        replacement = match["prefix"] + match["canonical"] + suffix
        particle = match["particle"]
        pair = match["pair"]
        if particle and pair:
            expected = expected_particle(pair, match["canonical"])
            replacement += expected
        elif particle:
            replacement += particle
        edits.append((match["start"], match["particle_start"] + len(particle),
                      replacement, match))

    new_text = text
    for start, end, replacement, _ in reversed(edits):
        new_text = new_text[:start] + replacement + new_text[end:]
    if new_text == text:
        return text, "not-an-issue", "Korean canonical name and English annotation are already valid."
    return new_text, "accepted", "Exact English name, bounded Korean form, and aligned locale context support this row-level normalization."


def clip(text, spans=(), limit=420):
    text = (text or "").strip()
    if len(text) <= limit:
        return text
    if spans:
        start, end = spans[0]
        left = max(0, start - limit // 3)
        right = min(len(text), max(end + limit // 2, left + limit))
        if right - left > limit:
            right = left + limit
        prefix = "..." if left else ""
        suffix = "..." if right < len(text) else ""
        return prefix + text[left:right] + suffix
    half = limit // 2
    return text[:half] + " ... " + text[-half:]


def source_evidence(source, target_entities, hits_by_key):
    english_texts = json.loads(source.get("en_texts_json") or "[]")
    japanese_texts = json.loads(source.get("ja_texts_json") or "[]")
    english_parts = []
    japanese_parts = []
    english_indices = []
    for key, hits in hits_by_key.items():
        for text_index, start, end, _term in hits:
            text = english_texts[text_index]
            english_parts.append((text_index, start, end, text))
            english_indices.append(text_index)
            if text_index < len(japanese_texts):
                japanese_parts.append(japanese_texts[text_index])
    english_snippets = []
    for text_index, start, end, text in english_parts:
        english_snippets.append(clip(text, [(start, end)]))
    english_text = "\n---\n".join(dict.fromkeys(english_snippets))
    japanese_text = "\n---\n".join(dict.fromkeys(
        item for item in japanese_parts if item
    ))
    return (
        clip(english_text),
        clip(japanese_text),
        clip(source.get("zh_text", "")),
    )


def full_name_cover_map(all_entities):
    covers = []
    for entity in all_entities:
        canonical = entity["english_canonical"]
        if " " not in canonical or entity.get("status") != "confirmed":
            continue
        for term in english_terms(entity):
            if " " in term:
                covers.append((entity["entity_key"], term))
    return covers


def adjacent_source_name(text, start, end, canonical):
    prefix = re.search(r"([A-Z][a-z]+)[ \t]+$", text[:start])
    suffix = re.match(r"[ \t]+([A-Z][a-z]+)\b", text[end:])
    left = prefix.group(1) if prefix else ""
    right = suffix.group(1) if suffix else ""
    if left and (left.casefold() in NON_NAME_WORDS or left.casefold() in TITLE_WORDS):
        left = ""
    if right and (right.casefold() in NON_NAME_WORDS or right.casefold() in TITLE_WORDS):
        right = ""
    if left and right:
        # A nearby grammatical/title token is not a personal-name component.
        return f"{left} {canonical} {right}"
    if left:
        return f"{left} {canonical}"
    if right:
        return f"{canonical} {right}"
    return ""


def source_full_name_match(work, full_name):
    if not full_name:
        return False
    tokens = full_name.split()
    if len(tokens) < 2:
        return False
    annotation = re.compile(r"\(([^()\r\n]*)\)")
    allowed_titles = {"Archsage", "Sir", "Lord", "Lady", "Scholar", "Captain",
                      "Brother", "Master", "Professor"}
    for match in annotation.finditer(work):
        contents = match.group(1).strip()
        words = contents.split()
        if words and words[0] in allowed_titles:
            words = words[1:]
        if " ".join(words).casefold() == full_name.casefold():
            return True
    return False


def source_locale_supports_full_name(source, text_index):
    japanese_texts = json.loads(source.get("ja_texts_json") or "[]")
    japanese = (
        japanese_texts[text_index]
        if text_index < len(japanese_texts)
        and isinstance(japanese_texts[text_index], str)
        else ""
    )
    chinese = source.get("zh_text", "")
    return "・" in japanese and "·" in chinese


def generic_collision(entity, source, source_texts, hits):
    key = entity["entity_key"]
    if (key == "person:eagonn" and source["resource"] == "default"
            and source["ID_Linha"] == "42993"):
        return "excluded", "Glossary note identifies this Korean 이건 as a demonstrative, not Eagonn."
    if key in {"person:gray", "person:green"}:
        canonical = PREFERRED_KOREAN.get(
            key, entity_korean_base(entity)
        )
        annotation = re.compile(
            rf"\([^()]*\b{re.escape(entity['english_canonical'])}\b[^()]*\)",
            re.IGNORECASE,
        )
        if annotation.search(source.get("work_text", "")):
            return "", ""
        korean_named_form = bool(re.search(
            rf"(?<![가-힣]){re.escape(canonical)}(?![가-힣])",
            source.get("work_text", ""),
        ))
        japanese = " ".join(
            text for text in json.loads(source.get("ja_texts_json") or "[]")
            if isinstance(text, str)
        )
        chinese = source.get("zh_text", "")
        japanese_name = "グレイ" if key == "person:gray" else "グリーン"
        chinese_name = "格雷" if key == "person:gray" else "格林"
        locale_name_support = japanese_name in japanese or chinese_name in chinese
        personal_english_context = any(
            re.search(
                rf"\b(?:my|his|her|their|our)\s+(?:own\s+)?"
                rf"{re.escape(entity['english_canonical'])}\b|"
                rf"\b{re.escape(entity['english_canonical'])}'s\b",
                source_texts[text_index],
            )
            for text_index, _start, _end, _term in hits
        )
        if korean_named_form and locale_name_support and personal_english_context:
            return "", ""
        return "excluded", (
            "Generic color-word collision is not supported as a personal name "
            "by Korean annotation and aligned Japanese/Chinese name forms."
        )
    if key == "person:darkvari":
        decisions = []
        for text_index, start, end, _term in hits:
            text = source_texts[text_index]
            left = max(0, start - 45)
            right = min(len(text), end + 60)
            decisions.append(bool(NON_PERSON_DARKVARI.search(text[left:right])))
        if decisions and all(decisions):
            return "excluded", "English context names the Darkvari people/group or an object/place, not an individual."
        if any(decisions):
            return "uncertain", "This source cell mixes a Darkvari group/object reference with a possible personal-name use; occurrence-level mapping is ambiguous."
    return "", ""


def build_rows(inventory, glossary):
    selected = [
        entity for entity in glossary
        if entity.get("category") == "person"
        and entity.get("status") == "confirmed"
        and re.match(r"^[D-L]", entity.get("english_canonical", ""), re.I)
    ]
    selected_by_key = {entity["entity_key"]: entity for entity in selected}
    all_entities = [
        entity for entity in glossary if entity.get("status") == "confirmed"
    ]
    full_covers = full_name_cover_map(all_entities)
    rows = []
    occurrence_count = Counter()
    recommended_full_names = set()

    for source in inventory:
        english_texts = json.loads(source.get("en_texts_json") or "[]")
        if not english_texts:
            continue
        hits_by_key = {
            entity["entity_key"]: occurrences(english_texts, entity)
            for entity in selected
        }
        hits_by_key = {key: hits for key, hits in hits_by_key.items() if hits}
        if not hits_by_key:
            continue

        # A component hit is not a separate mention when its exact source span
        # is part of a glossary full name. Keep out-of-scope full names visible.
        excluded_covers = defaultdict(list)
        retained_hits = {}
        for key, hits in hits_by_key.items():
            entity = selected_by_key[key]
            terms = english_terms(entity)
            kept = []
            for hit in hits:
                text_index, start, end, term = hit
                text = english_texts[text_index]
                covering = []
                for full_key, full_term in full_covers:
                    if full_key == key:
                        continue
                    pattern = re.compile(
                        rf"(?<![A-Za-z]){re.escape(full_term)}(?![A-Za-z])"
                    )
                    covering.extend(
                        (match.start(), match.end(), full_key)
                        for match in pattern.finditer(text)
                        if match.start() <= start and match.end() >= end
                    )
                if covering:
                    full_start, full_end, full_key = covering[0]
                    if full_key in selected_by_key:
                        continue
                    excluded_covers[key].append((hit, full_key, full_start, full_end))
                    continue
                kept.append(hit)
            if kept:
                retained_hits[key] = kept

        # Retain explicit excluded rows for out-of-range glossary full names.
        for key, covered in excluded_covers.items():
            retained_hits.setdefault(key, [])
            for hit, full_key, full_start, full_end in covered:
                text_index = hit[0]
                text = english_texts[text_index]
                if text_index >= 0:
                    retained_hits[key].append(hit)

        if not retained_hits:
            continue

        old = source.get("work_text", "")
        new_text = old
        entity_statuses = []
        evidence_notes = []
        valid_changes = []
        uncertain_keys = []
        pending_review_keys = []
        excluded_keys = []

        for key, hits in retained_hits.items():
            entity = selected_by_key[key]
            covered = excluded_covers.get(key, [])
            independent_hits = [
                hit for hit in hits
                if not any(hit == item[0] for item in covered)
            ]
            if covered and not independent_hits:
                full_keys = sorted({item[1] for item in covered})
                excluded_keys.append(key)
                entity_statuses.append("excluded")
                evidence_notes.append(
                    f"{key}: occurrence belongs to out-of-scope full name(s) "
                    f"{'|'.join(full_keys)}; not treated as a standalone component."
                )
                continue
            if not independent_hits:
                continue

            collision_status, collision = generic_collision(
                entity, source, english_texts, independent_hits,
            )
            if collision:
                entity_statuses.append(collision_status)
                evidence_notes.append(f"{key}: {collision}")
                if collision_status == "excluded":
                    excluded_keys.append(key)
                    continue
                uncertain_keys.append(key)
                continue

            expected_count = max(
                sum(1 for hit in independent_hits if hit[0] == text_index)
                for text_index in range(len(english_texts))
            )
            normalized, status, note = normalize_entity(new_text, entity, expected_count)
            if status == "accepted":
                status = "uncertain"
                note = (
                    "Automated normalization candidate retained for individual "
                    "linguistic review; not accepted from regex matching alone."
                )
                pending_review_keys.append(key)
                new_text = normalized

            inferred_full_names = set()
            if " " not in entity["english_canonical"]:
                for text_index, start, end, _term in independent_hits:
                    phrase = adjacent_source_name(
                        english_texts[text_index], start, end,
                        entity["english_canonical"],
                    )
                    if phrase and source_locale_supports_full_name(source, text_index):
                        inferred_full_names.add(phrase)
            if inferred_full_names:
                paired = [
                    phrase for phrase in inferred_full_names
                    if source_full_name_match(old, phrase)
                ]
                if len(paired) == len(inferred_full_names):
                    status = "not-an-issue"
                    normalized = old
                    note = (
                        "Source and current Korean parenthetical preserve full "
                        "name(s) " + "|".join(sorted(paired)) +
                        "; keep the component separate and review a full-name glossary key."
                    )
                else:
                    status = "uncertain"
                    normalized = old
                    new_text = old
                    note = (
                        "Possible source full name(s) " +
                        "|".join(sorted(inferred_full_names)) +
                        " lack a confirmed paired Korean-English form; do not annotate only the component."
                    )
                    for phrase in inferred_full_names:
                        recommended_full_names.add(
                            (key, phrase, source["resource"], source["ID_Linha"])
                        )

            if status == "uncertain":
                uncertain_keys.append(key)
                entity_statuses.append(status)
                evidence_notes.append(f"{key}: {note}")
                continue
            new_text = normalized
            entity_statuses.append(status)
            evidence_notes.append(f"{key}: {note}")
            if status == "accepted":
                valid_changes.append(key)
            occurrence_count[key] += len(independent_hits)

        if uncertain_keys:
            if set(uncertain_keys) != set(pending_review_keys):
                new_text = old
            status = "uncertain"
        elif valid_changes:
            status = "accepted"
        elif entity_statuses and all(item == "excluded" for item in entity_statuses):
            status = "excluded"
        elif entity_statuses:
            status = "not-an-issue"
        else:
            continue

        keys = sorted(set(retained_hits))
        evidence = (
            "Generated proposal: English/Japanese/Chinese excerpts come from "
            "the same inventory row; Hangul boundaries and particle handling "
            "are automated checks, not a blanket human-review claim. "
            + " ".join(evidence_notes)
        )
        english_excerpt, japanese_excerpt, chinese_excerpt = source_evidence(
            source, selected, retained_hits
        )
        row = [
            source["resource"], source["ID_Linha"],
            source.get("Tipo_Variante", ""),
            "|".join(keys), status, old, new_text, evidence,
            english_excerpt, japanese_excerpt, chinese_excerpt,
        ]
        rows.append(row)

    rows.sort(key=lambda row: (row[0], int(row[1]), row[2]))
    return rows, selected, occurrence_count, recommended_full_names


def run():
    inventory = read_tsv(INVENTORY)
    glossary = read_tsv(GLOSSARY)
    generated_rows, selected, occurrence_count, recommendations = build_rows(inventory, glossary)
    all_generated_count = len(generated_rows)
    by_row_key = {(row[0], row[1]): row for row in generated_rows}
    audited_keys = set(AUDITED_ROW_DISPOSITIONS)
    provisional_rows = [
        row for row in generated_rows if (row[0], row[1]) not in audited_keys
    ]
    rows = []
    missing_audited_keys = []
    for row_key, (status, proposed_text) in AUDITED_ROW_DISPOSITIONS.items():
        row = by_row_key.get(row_key)
        if row is None:
            missing_audited_keys.append(row_key)
            continue
        row = list(row)
        row[4] = status
        if proposed_text is not None:
            row[6] = proposed_text
        if status == "uncertain":
            row[7] = (
                "Human-inspected, materially uncertain: retain source/current text "
                "pending full-name or entity-boundary resolution."
            )
            row[6] = row[5]
        elif status == "excluded":
            row[7] = (
                "Human-inspected exclusion: aligned source context uses this as a "
                "family/group, object/place, or other non-individual reference."
            )
        else:
            row[7] = (
                "Human-inspected disposition; aligned English/Japanese/Chinese "
                "context and Korean name boundary checked."
            )
        rows.append(row)
    rows.sort(key=lambda row: (row[0], int(row[1]), row[2]))
    with OUTPUT.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n",
                            quoting=csv.QUOTE_MINIMAL)
        writer.writerow(HEADERS)
        writer.writerows(rows)

    statuses = Counter(row[4] for row in rows)
    print(f"glossary_entities={len(selected)}")
    print(
        f"audited_rows={len(rows)} statuses={dict(sorted(statuses.items()))}; "
        f"provisional_generated_rows={all_generated_count - len(rows)} "
        f"provisional_statuses={dict(sorted(Counter(row[4] for row in provisional_rows).items()))}"
    )
    if missing_audited_keys:
        print(f"missing_audited_keys={missing_audited_keys}")
    print(f"provisional_full_name_candidates_not_audited={len(recommendations)}")
    print(f"output={OUTPUT}")
    print("source_backed_variant_recommendations=" + "; ".join(
        f"{key} preferred={PREFERRED_KOREAN[key]} "
        f"alternatives={'|'.join(values)}"
        for key, values in sorted(SOURCE_BACKED_VARIANTS.items())
    ))


if __name__ == "__main__":
    run()
