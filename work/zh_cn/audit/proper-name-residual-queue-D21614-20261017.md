# D-21614 Residual Discovery Queue

Date: 2026-10-17. **Source candidates, not accepted corrections or a global
remaining-work count.** The sequential default review is already complete
through ID 65134. Do not restart it or treat all unregistered words as names.

## Concrete Next Scope

Resume at **D-21614**, with **default:32149**, then default:5288 and 43618.
English 32149 explicitly identifies the Darkvari, Cynrics, Zungars and
Skorias as four mining families. D-21611 completed only the explicit
Zungar family/Zungars scope. Other family-name references still mix
individual/surname, collective and racial-looking Korean forms.

Review Darkvari/Darkvaris, Cynric/Cynrics and Skoria/Skorias across all
affix/base/default source rows, including explicit family phrases.
English is authoritative; Japanese/Chinese provide per-row checks.
Verify owner/row history before registering collective scopes. Current
owners include person:darkvari, person:skoria, person:lirin-cynric and
person:adath-skoria, plus their three already registered mines. Do not
create duplicate people, collide with their exact English aliases, alter
their terminal dispositions or count excluded personal-name rows as newly
reviewed people. Do not assume every surname occurrence is a family.
Retain separate family, person, place and possessive-item scopes.
Partition the actual reviewed row keys into batches of at most 50.

D-21611 also exposed unnormalized bare Zungar collective/possessive
references outside the exact family/Zungars matcher, such as default:321,
2905, 21063, 36703, 37914, 38067, 38373, 57573 and 62269. The existing
person:zungar exclusions remain valid. Any later collective correction
must be row-scoped and must not create a colliding global Zungar alias.
Zungar contract/base:278 and Zungar Key/base:2748 are distinct named
item/work candidates, not automatically part of the new family matcher.

## Unclassified Label Candidates

A read-only exact-English search across all three resources found these
14 unregistered label families in 24 distinct source rows. Most have only
labels, not sentences establishing a referent type or an identity link.
They were not accepted as new people/items/deities merely because Japanese
is phonetic or because a base label exists. No CSV changes or indexed
dispositions were created for this table. Absence from the non-exhaustive
official Korean manual supplies no positive classification evidence.

| English | Exact Source Keys | Current Korean / Caution |
| --- | --- | --- |
| Acae | default:25633 | 아카에; label only |
| Agathe | default:32264, 43088 | 아가테; labels only |
| Ainmere | default:49272 | 아인미어; label only |
| Anicetus | default:47221 | 아니케투스; label only |
| Arcaneid | base:3224:11; default:31616, 56850 | 아르카네이드/아케네이드; item/person/type not established |
| Ardinia | default:57610 | 아르디니아; label only |
| Utricul | default:19592, 34310 | 우트리쿨; labels only |
| Vandala | default:41488 | 반달라; label only |
| Veshani | base:2011:11, 3266:11; default:30493, 50220 | 베샤니; figurine names a woman, not sufficient to assert deity/item/person equivalence |
| Woerlowe | default:34374 | 워얼로; label only |
| Ychen | default:25715 | 이첸; label only |
| Yurele | default:16779, 33559 | 유렐레; Escort label alone does not establish identity |
| Yzzzzhgoi | default:63091, 64752 | 이즈즈고이/이즈고이; Japanese/Chinese phonetic forms diverge strongly |
| Zosime | default:34935, 47532 | 조시메; labels only |

The earlier Eyrie Peak/default:5973 and Eryie Peak/default:58845
unclassified labels remain separate discovery holds. No new evidence
establishes a person, place or mutual equivalence.

Other unclassified ability/title-looking labels observed in the same
read-only scan include Warding Blast/default:10592, Aftershock/44734,
Winter's Embrace/26209, WintersEmbrace/39445 and Upheaval/53849.
Their label shape alone does not establish a skill category or alias link.
Ordinary upheaval in default:1085/10183 must not be rewritten as a name.
Arrow Storm was different: its English description explicitly identifies
a Longbow Special, and its five-key scope was reviewed in D-21610.

## Scope And Completion

The 96 indexed uncertain matches in 93 rows are reviewed holds, not the
complete set of undiscovered or unclassified names. The 14-term table and
two earlier labels are outside that indexed count; do not add them to it
without explicit entity/row registration and a reviewed disposition.
The next family scope has not yet been fully extracted or reviewed, so no
honest exact total or overall completion percentage can be derived here.

Require per-row dispositions, all-resource cross-checks, no duplicate
entity/row registrations, byte-preserving edits with immediate backups,
active glossary/index checks, regression tests and a residual discovery
pass before declaring overall completion. An empty indexed pending list
or a fixed number of completed batches is not sufficient.
