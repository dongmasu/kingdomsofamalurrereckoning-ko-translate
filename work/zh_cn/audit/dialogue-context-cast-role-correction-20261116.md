# Casting-Role Translation Correction

- Date: 2026-11-16.
- Rechecked `default` IDs `15728`, `21540`, `22701`, `37586`, `42029`,
  `51851`, `62298`, `62323`, and `62724`.
- English `I have cast [name]` means that the named actor has been assigned a
  role, not that an actor was selected to play the named person.
- Quest text at `27676` identifies Rhode, Zotikus, and Ariope as the three
  available actors and says to choose roles for them. At `35168`, it assigns
  Zotikus as the Villain, Ariope as the Jottun, and Rhode as the Hero.
  Completion text at `56295` explicitly says the roles were assigned to those
  actors.
- The Chinese counterparts of the nine short lines reverse the actor/role
  relationship; the English quest description and completion text resolve
  that ambiguity. Japanese says each person's role was decided and is
  consistent with the corrected direction.
- Corrected the three repeated actor-name groups:
  - Rhode (`21540`, `51851`, `62298`): `로드(Rhode)가 맡을 배역을 정했어.`
  - Zotikus (`15728`, `37586`, `42029`):
    `조티쿠스(Zotikus)가 맡을 배역을 정했어.`
  - Ariope (`22701`, `62323`, `62724`):
    `아리오페(Ariope)가 맡을 배역을 정했어.`
- Updated only these nine Korean cells, their `source_fingerprint` fields,
  and the corresponding Korean snapshots in
  `proper-name-occurrences.tsv`. Historical review dispositions were not
  rewritten.
