# Sequential `default` Revalidation: IDs `1500`-`1749`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `1500`-`1749`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 187 new IDs were reviewed and recorded. The other 63 IDs in this interval
  already had ledger records and were left unchanged.
- Fifteen correction candidates and three evidence-limited holds were
  identified. Candidates are proposals, not approved edits.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. UI, objective, item, book,
  and other non-dialogue text was assessed according to its text type.
- ID `1621` explicitly identifies the speaker as Eran Methneen; that limited
  attribution is recorded. No dialogue order was inferred.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `1519` | Format | The title `The Fisherman's Bride` appears only as `어부의 신부`. Consider `어부의 신부(The Fisherman's Bride)`. | High |
| `1534` | Format / title | `Templar Jorielle` is rendered `템플러 조리엘(Jorielle)`, omitting the English title from the parenthetical. Consider `템플러 조리엘(Templar Jorielle)`. | High |
| `1553` | Terminology / format | The three named gnome pillars are inconsistently paired: `Praetorians` and `Templars` have English, while `Scholars` does not. Review as a set and consider `학자(Scholars), 프레토리안(Praetorians), 템플러(Templars)`, preserving the intended group names. | Medium |
| `1560` | Naturalness | `비극적으로 살해한 지금` is an awkward rendering of the tragic event followed by `since`. Consider `가드플로가 ... 지고왕을 살해한 비극 이후로` before the statement about Titarion. | High |
| `1572` | Format | The likely quest/title `Foiled Again!` is translated as `또 계획이 틀어졌군!` without its English title. Consider adding `(Foiled Again!)` if the title is confirmed in this text type. | Medium |
| `1580` | Format / title | The same sentence renders `Lord Creth` as `크레스 경(Lord Creth)` but `Lord Airmer` as `에어머(Airmer) 경`. Make the title format parallel, e.g. `에어머 경(Lord Airmer)`. | High |
| `1590` | Format / title | The named person and epithet `Maire, Queen of Cups` are reduced in English to `(Maire)`. Consider including the complete title, e.g. `컵의 여왕 메어(Maire, Queen of Cups)`. | High |
| `1671` | Terminology | This is the numeric `Health Regen` stat, but it uses `생명력 재생`; other active labels use `체력 재생` (e.g. IDs `20078` and `22227`). Consider `지속 시간 동안 초당 체력 재생 +20`. | High |
| `1686` | Meaning | `fell persons` carries a derogatory sense that is absent from `너희는 무지하군`. Consider retaining both the contempt and the claim of ignorance, e.g. `너희 비천한 자들은 무지하군`. | High |
| `1695` | Format | The proper name `Iceland` appears only as `아이슬란드`. Consider `아이슬란드(Iceland)`. | Medium |
| `1697` | Format | The proper name `St. Helena` appears only as `성 헬레나`. Consider `성 헬레나(St. Helena)`. | Medium |
| `1711` | Format | The title `Gathering Flames` appears only as `불꽃 모으기`. Consider `불꽃 모으기(Gathering Flames)`. | High |
| `1721` | Format | The proper name `Bolivia` appears only as `볼리비아`. Consider `볼리비아(Bolivia)`. | Medium |
| `1723` | Format | The named group `Circle of Therosin` appears only as `테로신의 고리`, while the associated card name is paired in English. Consider `테로신의 고리(Circle of Therosin)`. | High |
| `1739` | Format | The proper name `Svalbard & Jan Mayen Islands` appears only as `스발바르 제도와 얀마옌 제도`. Consider adding the complete English name. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `1676` | Speech level | Korean uses casual speech, while Japanese and Chinese use more polite phrasing. The linked asset has multiple NPCs and no per-key speaker mapping; hold rather than infer the speaker's relationship to the player. |
| `1692` | Address / title | `Master Dace` is translated as `데이스 경`; Japanese `大将` and Chinese `大人` suggest a title, but the exact role and appropriate Korean title are not established by this isolated line. Hold the title choice. |
| `1719` | Meaning | `dove` may be a nickname or metaphor in `You dare betray me, dove?!`; Japanese omits it, Chinese interprets it as a peace emissary, and Korean uses `친구`. Without scene or addressee evidence, hold the vocative. |

## Source and Structural Checks

- No exact-English duplicate groups occur among the 187 newly recorded IDs.
- Line-break counts match across all four languages. Runtime placeholder and
  layout-marker indices and order match; localized marker contents are allowed
  to differ. Markup and named-icon signatures also match.
- The 63 pre-existing ledger records in this interval were not rewritten or
  duplicated.

## Newly Recorded IDs

The 187 new ledger rows are:

`1500`, `1501`, `1505`, `1506`, `1511`, `1512`, `1513`, `1517`, `1518`,
`1519`, `1520`, `1521`, `1522`, `1524`, `1525`, `1526`, `1527`, `1529`,
`1530`, `1531`, `1533`, `1534`, `1539`, `1540`, `1541`, `1542`, `1544`,
`1545`, `1547`, `1548`, `1550`, `1552`, `1553`, `1554`, `1555`, `1556`,
`1557`, `1558`, `1559`, `1560`, `1561`, `1563`, `1564`, `1565`, `1568`,
`1569`, `1570`, `1571`, `1572`, `1574`, `1575`, `1576`, `1577`, `1578`,
`1579`, `1580`, `1581`, `1583`, `1584`, `1585`, `1586`, `1588`, `1589`,
`1590`, `1591`, `1596`, `1598`, `1599`, `1600`, `1602`, `1603`, `1604`,
`1605`, `1607`, `1608`, `1609`, `1610`, `1611`, `1613`, `1614`, `1616`,
`1617`, `1618`, `1620`, `1621`, `1622`, `1623`, `1624`, `1625`, `1626`,
`1628`, `1629`, `1630`, `1632`, `1633`, `1636`, `1640`, `1641`, `1642`,
`1645`, `1646`, `1647`, `1648`, `1649`, `1650`, `1651`, `1652`, `1653`,
`1654`, `1656`, `1657`, `1658`, `1660`, `1661`, `1662`, `1663`, `1664`,
`1665`, `1666`, `1667`, `1670`, `1671`, `1672`, `1673`, `1674`, `1676`,
`1677`, `1678`, `1679`, `1680`, `1681`, `1682`, `1684`, `1685`, `1686`,
`1687`, `1688`, `1689`, `1690`, `1692`, `1693`, `1694`, `1695`, `1696`,
`1697`, `1698`, `1700`, `1701`, `1702`, `1703`, `1704`, `1705`, `1706`,
`1707`, `1708`, `1710`, `1711`, `1712`, `1714`, `1716`, `1717`, `1719`,
`1720`, `1721`, `1722`, `1723`, `1724`, `1725`, `1726`, `1728`, `1729`,
`1730`, `1731`, `1732`, `1733`, `1734`, `1735`, `1737`, `1738`, `1739`,
`1740`, `1741`, `1743`, `1745`, `1746`, `1747`, `1748`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
