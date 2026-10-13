#!/usr/bin/env python3
"""Seed Chinese-structure Korean work CSVs from the Japanese-derived draft."""

from __future__ import annotations

import csv
import hashlib
import shutil
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
SOURCE_DIR = ROOT / "src" / "csv"
JA_DIR = ROOT / "work" / "ja_jp"
ZH_DIR = ROOT / "work" / "zh_cn"
RESOURCES = ("affix", "base", "default")
REFERENCE_LOCALES = ("en_us", "de_de", "es_es", "fr_fr", "it_it", "ru_ru")
REFERENCE_FIELDS = {
    "en_us": "English_same_variant",
    "de_de": "German_same_variant",
    "es_es": "Spanish_same_variant",
    "fr_fr": "French_same_variant",
    "it_it": "Italian_same_variant",
    "ru_ru": "Russian_same_variant",
}
JA_CHECKPOINTS = {
    "affix": "1a09f5536e0735c38567f5143fbb2babe6471f24c590e8baf9dfbce64457fa10",
    "base": "5f7f3375108c7e78d9209be00a2351b000c7b174ed7b513bed772f4e6ec09c4f",
    "default": "11eec96b5703b207ce615b703721376883435607abc94bf1d870c940eb70248e",
}
EVIDENCE_FIELDS = (
    "ID_Linha",
    "Tipo_Variante",
    "Chinese",
    "Korean_candidate",
    "Japanese_sibling_variants",
    "English_same_variant",
    "German_same_variant",
    "Spanish_same_variant",
    "French_same_variant",
    "Italian_same_variant",
    "Russian_same_variant",
    "Disposition",
)


def csv_path(directory: Path, locale: str, resource: str) -> Path:
    return directory / f"locatexts_{locale}.koalocatext_{resource}.csv"


def read_csv(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    with path.open("r", encoding="utf-8-sig", newline="") as stream:
        reader = csv.DictReader(stream, delimiter=";")
        if reader.fieldnames is None:
            raise ValueError(f"Missing CSV header: {path}")
        return list(reader.fieldnames), list(reader)


def key(row: dict[str, str], resource: str) -> tuple[str, ...]:
    if resource == "affix":
        return row["ID_Linha"], row["Tipo_Variante"]
    return (row["ID_Linha"],)


def index_rows(
    rows: list[dict[str, str]], resource: str, label: str
) -> dict[tuple[str, ...], dict[str, str]]:
    result: dict[tuple[str, ...], dict[str, str]] = {}
    for row in rows:
        row_key = key(row, resource)
        if row_key in result:
            raise ValueError(f"Duplicate {resource} key in {label}: {row_key}")
        result[row_key] = row
    return result


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def write_csv(
    path: Path, fields: list[str], rows: list[dict[str, str]]
) -> None:
    with path.open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.DictWriter(
            stream,
            fieldnames=fields,
            delimiter=";",
            lineterminator="\r\n",
            extrasaction="raise",
        )
        writer.writeheader()
        writer.writerows(rows)


def run() -> None:
    existing_outputs = [
        csv_path(ZH_DIR, "zh_cn", resource)
        for resource in RESOURCES
        if csv_path(ZH_DIR, "zh_cn", resource).exists()
    ]
    if existing_outputs:
        raise FileExistsError(
            "Refusing to overwrite an existing zh_cn work CSV; this is a "
            "one-time seeding script."
        )

    source_rows: dict[str, list[dict[str, str]]] = {}
    target_rows: dict[str, list[dict[str, str]]] = {}
    fields_by_resource: dict[str, list[str]] = {}
    source_indexes: dict[str, dict[tuple[str, ...], dict[str, str]]] = {}

    for resource in RESOURCES:
        ja_path = csv_path(JA_DIR, "ja_jp", resource)
        if sha256(ja_path) != JA_CHECKPOINTS[resource]:
            raise ValueError(f"Japanese source differs from checkpoint: {ja_path}")
        ja_fields, ja_rows = read_csv(ja_path)
        zh_path = csv_path(SOURCE_DIR / "zh_cn", "zh_cn", resource)
        zh_fields, zh_rows = read_csv(zh_path)
        if ja_fields != zh_fields:
            raise ValueError(f"CSV header mismatch for {resource}")

        ja_index = index_rows(ja_rows, resource, str(ja_path))
        index_rows(zh_rows, resource, str(zh_path))
        if resource != "affix":
            if [key(row, resource) for row in ja_rows] != [
                key(row, resource) for row in zh_rows
            ]:
                raise ValueError(f"{resource} IDs or row order differ")
        else:
            ja_keys = set(ja_index)
            zh_keys = [key(row, resource) for row in zh_rows]
            if not ja_keys.issubset(set(zh_keys)):
                raise ValueError("zh_cn is missing Japanese-template affix keys")
            if [row_key for row_key in zh_keys if row_key in ja_keys] != [
                key(row, resource) for row in ja_rows
            ]:
                raise ValueError("Shared affix key order differs")

        fields_by_resource[resource] = zh_fields
        source_rows[resource] = ja_rows
        target_rows[resource] = zh_rows
        source_indexes[resource] = ja_index

    references: dict[str, dict[tuple[str, ...], dict[str, str]]] = {}
    for locale in REFERENCE_LOCALES:
        _, rows = read_csv(csv_path(SOURCE_DIR / locale, locale, "affix"))
        references[locale] = index_rows(rows, "affix", locale)

    output_rows: dict[str, list[dict[str, str]]] = {}
    evidence: list[dict[str, str]] = []
    for resource in RESOURCES:
        ja_rows = source_rows[resource]
        ja_by_id: dict[str, list[dict[str, str]]] = defaultdict(list)
        for row in ja_rows:
            ja_by_id[row["ID_Linha"]].append(row)

        mapped_rows: list[dict[str, str]] = []
        for target in target_rows[resource]:
            row_key = key(target, resource)
            source = source_indexes[resource].get(row_key)
            mapped = dict(target)
            disposition = "EXACT_KEY"
            korean_candidate = source["Texto"] if source else ""

            if source is None:
                siblings = ja_by_id.get(target["ID_Linha"], [])
                sibling_texts = {row["Texto"] for row in siblings}
                if len(sibling_texts) == 1:
                    korean_candidate = next(iter(sibling_texts))
                    disposition = "SIBLING_FALLBACK_REVIEW"
                else:
                    disposition = "UNRESOLVED_REVIEW"

                mapped["Texto"] = korean_candidate
                if resource == "affix":
                    record = {
                        "ID_Linha": target["ID_Linha"],
                        "Tipo_Variante": target["Tipo_Variante"],
                        "Chinese": target["Texto"],
                        "Korean_candidate": korean_candidate,
                        "Japanese_sibling_variants": " || ".join(
                            f'{row["Tipo_Variante"]}={row["Texto"]}'
                            for row in siblings
                        ),
                        "Disposition": disposition,
                    }
                    for locale in REFERENCE_LOCALES:
                        ref = references[locale].get(row_key)
                        record[REFERENCE_FIELDS[locale]] = (
                            ref["Texto"] if ref else ""
                        )
                    evidence.append(record)
            else:
                mapped["Texto"] = source["Texto"]
            mapped_rows.append(mapped)
        output_rows[resource] = mapped_rows

    ZH_DIR.mkdir(parents=True, exist_ok=True)
    for resource in RESOURCES:
        write_csv(
            csv_path(ZH_DIR, "zh_cn", resource),
            fields_by_resource[resource],
            output_rows[resource],
        )

    evidence_path = ZH_DIR / "audit" / "affix-extra-variant-review.tsv"
    evidence_path.parent.mkdir(parents=True, exist_ok=True)
    with evidence_path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(
            stream,
            fieldnames=EVIDENCE_FIELDS,
            delimiter="\t",
            lineterminator="\n",
            extrasaction="raise",
        )
        writer.writeheader()
        writer.writerows(evidence)

    for name in (
        "estrutura_hashes.bin",
        "estrutura_hashes_flat.bin",
        "estrutura_hashes_stream.bin",
    ):
        shutil.copyfile(SOURCE_DIR / "zh_cn" / name, ZH_DIR / name)

    fallback = sum(
        row["Disposition"] == "SIBLING_FALLBACK_REVIEW" for row in evidence
    )
    unresolved = sum(
        row["Disposition"] == "UNRESOLVED_REVIEW" for row in evidence
    )
    print(
        f"Created zh_cn work CSVs: base={len(output_rows['base'])}, "
        f"default={len(output_rows['default'])}, affix={len(output_rows['affix'])}"
    )
    print(
        f"Extra affix variants: {len(evidence)}; sibling fallback={fallback}; "
        f"unresolved={unresolved}"
    )
    print(f"Variant evidence: {evidence_path}")
    for resource in RESOURCES:
        path = csv_path(ZH_DIR, "zh_cn", resource)
        print(f"{resource} sha256 {sha256(path)}")


if __name__ == "__main__":
    run()
