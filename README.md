# Kingdoms of Amalur: Re-Reckoning

## 한국어

- Steam: [Kingdoms of Amalur: Re-Reckoning](https://store.steampowered.com/app/1041720/Kingdoms_of_Amalur_ReReckoning/)
- 정식 한글 패치 ZIP: [다운로드](https://github.com/dongmasu/kingdomsofamalurrereckoning-ko-translate/releases/download/KingdomsOfAmalur_Korean_zh_cn_20261115134051/KingdomsOfAmalur_Korean_zh_cn_20261115134051.zip)

### 작업 배경과 감사

유튜브에서 [노박님의 게임 소개 영상](https://www.youtube.com/watch?v=nCVV3Ql-_rU)을 보고 *Kingdoms of Amalur: Re-Reckoning*에 관심을 갖게 됐습니다. 게임을 무척 신나게 소개해 주셔서 직접 해보고 싶어졌습니다. 처음에는 ~~zxcv3428님의 한글화 패치~~로 알고 있던 배포본을 받아 플레이했습니다. 이후 원본 게시물이 [한무테님의 블로그](https://m.blog.naver.com/gusrud6151/224392008033)에 있는 것을 확인했습니다. 그 한글화 덕분에 게임을 즐길 수 있어 감사하지만, 제가 받은 배포본이 1GB가 넘는 완성형 PAK이었고 영어 로케일(`en_us`)을 한글 텍스트로 교체해 영어를 선택하면 한글이 표시되는 점은 아쉬웠습니다. 그래서 필요한 리소스만 배포하고 각자 보유한 게임 파일로 패키지를 재구성하는 방식을 직접 만들어보기로 했습니다.

작업 중 [커뮤니티 개선판](https://gall.dcinside.com/mgallery/board/view/?id=rpgundivded&no=66527)이 나온 것도 확인했습니다. 기존 한글화의 번역을 개선한 작업을 반갑게 생각합니다. 또한 꾸준히 업데이트해 주시고 번역 품질도 점점 나아지고 있어, 개선판으로 게임을 즐기시는 게 더 나은 선택일 것이라고 생각합니다. 다만 제가 아쉽게 느꼈던 배포 방식과 언어 슬롯 문제는 개선판에서도 해결되지 않은 것으로 보여 독립적인 번역 작업을 계속하기로 했습니다.

이 프로젝트는 세 번째 한글화 작업입니다. 완성된 한글 패치를 제공하는 것뿐 아니라, 누구나 번역을 이어갈 수 있는 작업 환경과 추출·번역·재패킹 방법을 남기는 것을 목표로 합니다. 그래야 이후 게임 업데이트나 DLC가 나와도 다른 분들이 작업을 이어가며 번역 품질을 유지할 수 있기 때문입니다. 이 작업의 출발점이 된 [Amalur PT-BR 번역과 추출·재패킹 스크립트](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67)를 제공해 주신 분께 감사드립니다.

오랜만에 *World of Warcraft* 공개 베타 시절도 떠올리며, 요즘은 이 게임을 즐겁게 플레이하고 있습니다.

### 번역 원칙과 표기

기존 한글 패치의 번역문은 참고하지 않았습니다. 용어와 세계관 배경을 위해 원작 발매 당시의 공식 한국어 자료인 [`Kingdom of Amulur 공식 한글 설명.pdf`](references/manual/Kingdom%20of%20Amulur%20공식%20한글%20설명.pdf)를 참고했습니다. 번역의 의미는 영어 원문을 기준으로 판단하고, 일본어는 말투·경어·평어와 문장 구조를, 중국어는 보조 자료로 활용했습니다. 다른 언어도 필요한 경우 교차 검증에 사용했습니다.

CSV에서는 메뉴와 대사가 한데 섞여 있고, 이어지는 대사도 여러 행에 흩어져 있어 행만으로 화자나 앞뒤 문맥을 알아보기 어려운 경우가 많습니다. 항목을 유형과 게임 리소스에 따라 분류하고, 영어를 의미의 기준으로 삼아 일본어·중국어와 대조합니다. 문맥이나 근거가 불충분한 부분은 임의로 고치지 않고 보류합니다.

Lua 스크립트 추출·검토는 번역에 추가 맥락을 얻기 위한 보조 조사였지만, 전체 검토에서 현지화 ID나 대사와 직접 연결되는 근거는 찾지 못했습니다. 크레딧 제작진 직함 16개를 확인하는 데 제한적인 단서가 되었으나, 실제 게임 내 표시 여부까지 입증하지는 못했습니다. 따라서 Lua 추출물은 번역의 필수 자료가 아닙니다. 자세한 결과와 한계는 [Lua 번역 검토 보고서](work/zh_cn/audit/lua-corpus-translation-review-20261115.md)와 [추출·재인코딩 기록](work/zh_cn/audit/lua-script-extraction-and-reencoding-20261115.md)을 참고하세요.

`Tipo_Variante`는 `base`와 `affix` 바이너리의 variant 데이터에서 읽은 1바이트 값이며 CSV에는 2자리 16진수로 기록됩니다. 원본 바이너리와 CSV의 항목·값·텍스트는 8개 로케일 모두에서 일치합니다. 일부 언어의 예시는 코드와 성·수 형태의 상관관계를 뒷받침하지만, 전체 코드표나 게임 내 variant 선택 규칙은 확인되지 않았습니다. 현재 한국어 `affix` 작업본에서는 variant가 여러 개인 573개 ID 모두 같은 한국어 문구를 사용합니다. 이는 번역 자료에서 확인되는 선택일 뿐, 게임이 variant를 무시한다는 뜻은 아닙니다. 자세한 근거와 한계는 [variant 및 표기 분석](work/zh_cn/audit/default-markup-and-variant-evidence-20261115.md)을 참고합니다.

`default` 바이너리에는 `{1}`, `{*1...}`, `{LINE_SPACE}` 같은 중괄호 표기가 문자열로 저장되어 있습니다. 문맥과 다국어 대응은 숫자 표기가 치환 슬롯, `{*N...}`가 표시용 마크업, `{LINE_...}`가 레이아웃 표기일 가능성을 뒷받침하지만, 실제 게임 내 동작은 확인되지 않았습니다. 따라서 일반 문장부호처럼 삭제하지 말고 번호·중첩·ID별 구성을 보수적으로 보존합니다. 숫자 슬롯은 해당 ID의 언어별 문맥을 확인한 경우에만 한국어 어순에 맞춰 옮기며, 반복 횟수나 마크업 범위를 다른 언어에 맞춰 일괄 변경하지 않습니다. 상세 증거는 [variant 및 표기 분석](work/zh_cn/audit/default-markup-and-variant-evidence-20261115.md)과 [중괄호 표기 교차 검수](work/zh_cn/audit/default-brace-cross-language-20261105.md)에 정리했습니다.

검수할 때는 영어만 기준으로 삼지 말고, 모든 언어에서 같은 ID의 표기 구성과 문맥을 대조합니다. 언어별로 순서·강조 범위·레이아웃 표기가 다를 수 있으므로 차이를 곧바로 오류로 보거나 영어와 일괄 동일화하지 않습니다. 누락·추가·괄호 불균형은 원문과 다른 언어의 대응을 확인하고, 근거가 부족하면 보류합니다. 현지화 도구는 이 표기를 해석하지 않고 문자열로 다루므로, 표기를 바꿀 때는 해당 ID를 검증합니다.

아이템 이름에 붙는 영어 `of ...` 형태는 이 프로젝트의 조합 표기에서 `반지 *얼음 방패*`처럼 별표로 감싼 수식어로 나타냅니다. 동사와 목적어가 조합되는 경우에는 `폭파하기:`처럼 콜론을 붙여 뒤에 목적어가 이어짐을 표시합니다. 아이템에 발동 조건이 이름 뒤에 붙는 경우에는 영어 `at Night`를 `(야간)`처럼 괄호로 표시해 야간에만 능력이 발휘됨을 나타냅니다. 이는 프로젝트 안에서 조합과 조건을 구분하기 위한 표기 관례입니다.

고유명사의 일관성은 [고유명사 사전](work/zh_cn/audit/proper-name-glossary.tsv), [출현 후보 및 판정 목록](work/zh_cn/audit/proper-name-occurrences.tsv), [검토 기록](work/zh_cn/audit/README.md)을 참고합니다. 복합 인명은 전체 이름을 `브론웬 센(Bronwen Senn)`처럼 한 번만 병기하고, `브론웬(Bronwen) 센(Senn)`처럼 구성 요소마다 영문을 중복 표기하지 않습니다. 이 자료는 확인된 항목을 정리한 참고 자료이며 고유명사 전수 목록은 아닙니다.

특히 `_base`의 영어 원문이 대문자 `The`로 시작하면 단순한 정관사로만 처리하지 말고, 아이템명·퀘스트명 등 제목이나 고유명사일 가능성을 먼저 살핍니다. 문맥에 맞는 한국어 제목으로 옮기고, 이름을 식별하기 쉽도록 `한글 (The English Name)` 형식의 원문 병기도 검토합니다. 다만 `The`로 시작한다는 이유만으로 무조건 고유명사라고 단정하지 말고 실제 문맥을 확인합니다.

### 관련 자료

- [노박님의 게임 소개 영상](https://www.youtube.com/watch?v=nCVV3Ql-_rU)
- [Amalur PT-BR 번역 및 추출·재패킹 스크립트](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67)
- ~~기존 한글화 패치 - zxcv3428~~
- [원본 한글화 게시물 - 한무테님](https://m.blog.naver.com/gusrud6151/224392008033)
- [커뮤니티 개선판](https://gall.dcinside.com/mgallery/board/view/?id=rpgundivded&no=66527)
- [나무위키 「킹덤 오브 아말러」 문서](https://namu.wiki/w/%ED%82%B9%EB%8D%A4%20%EC%98%A4%EB%B8%8C%20%EC%95%84%EB%A7%90%EB%9F%AC) - 세계관과 용어 맥락을 확인하기 위한 보조 참고자료

### 현지화 리소스 구조

기준 CSV 자료에는 8개 로케일(`de_de`, `en_us`, `es_es`, `fr_fr`, `it_it`, `ja_jp`, `ru_ru`, `zh_cn`)별로 `base`, `default`, `affix` 리소스가 있다.

파일명 형식은 `locatexts_<locale>.koalocatext_<type>`이다. 영문 리소스에는 `base` 항목 4,844개, `default` 항목 65,135개, `affix` 항목 586개가 있다. PT-BR 스크립트는 `base`와 `default` 파일의 첫 4바이트를 항목 수가 아니라 매직값으로 취급하고, 그 뒤에서 오름차순 4바이트 절대 오프셋 배열을 추정한다. 배열과 첫 문자열 오프셋 사이의 바이트는 스크립트가 `hash`로 부르는 불투명 데이터로 분리해 재패킹 시 보존한다. 따라서 스크립트는 포인터와 텍스트 위치는 이용하지만 이 불투명 영역의 필드별 의미까지 해독하지는 않는다. `base`와 `affix`의 variant 레코드에는 텍스트와 별도로 저장되는 1바이트 값이 있으며, CSV의 `Tipo_Variante`는 이를 2자리 16진수로 기록한다. 바이너리와 CSV의 일치 결과 및 의미 해석의 한계는 [variant 및 표기 분석](work/zh_cn/audit/default-markup-and-variant-evidence-20261115.md)에 정리했다.

#### 언어별 CSV 행 수 차이

아래는 `src/csv/`의 CSV를 세미콜론 구분자로 파싱한 데이터 레코드 수다(헤더 제외). `affix`의 586은 모든 언어에서 공통인 고유 ID 수이고, CSV 행 수는 각 ID에 들어 있는 variant 수에 따라 달라진다. `base`와 `default`는 모든 언어의 레코드 수가 같다.

| 로케일 | `affix` 레코드 | `base` 레코드 | `default` 레코드 | `default` 물리 줄 수 (`wc -l`) |
| --- | ---: | ---: | ---: | ---: |
| `de_de` | 3,491 | 4,844 | 65,135 | 72,115 |
| `en_us` | 586 | 4,844 | 65,135 | 72,080 |
| `es_es` | 2,345 | 4,844 | 65,135 | 72,168 |
| `fr_fr` | 2,305 | 4,844 | 65,135 | 72,013 |
| `it_it` | 2,330 | 4,844 | 65,135 | 72,059 |
| `ja_jp` | 3,311 | 4,844 | 65,135 | 72,080 |
| `ru_ru` | 3,449 | 4,844 | 65,135 | 72,105 |
| `zh_cn` | 3,451 | 4,844 | 65,135 | 72,074 |

`affix`는 `en_us`에서 ID마다 `FF` variant 한 개만 있지만, 다른 언어는 상당수 ID에 여러 variant가 있다. 스페인어와 독일어의 일부 대응 문구는 이런 차이가 성·수 같은 문법 형태와 관련된다는 해석을 뒷받침한다. PT-BR 모드 제작자도 스페인어 리소스를 선택한 이유로 성별·복수형 변형을 언급했지만, 이는 제작자의 설명이다. 관찰된 상관관계만으로 전체 코드의 의미나 게임의 variant 선택 규칙을 확정할 수는 없다.

재패킹 시에는 `Tipo_Variante` 값을 ID 및 variant별 행과 함께 그대로 보존한다. 일부 코드는 특정 언어·항목의 성·수 형태와 대응하지만, 같은 코드가 전체 문장에 붙는 사례도 있고, 언어별 코드 사용도 다르다. 따라서 `0x1?`/`0x2?`나 끝자리 숫자를 보편적인 단수·복수·성 코드표로 단정하지 않는다. 영어 `affix`에서 사용하는 `FF`의 의미와 게임 내 선택 규칙도 확인되지 않았다. 세부 사례와 검증 범위는 [variant 및 표기 분석](work/zh_cn/audit/default-markup-and-variant-evidence-20261115.md)을 참고한다.

`default`의 CSV 레코드는 모든 언어에서 65,135개로 같다. `wc -l` 수가 다른 것은 CSV 필드 안의 대사에 포함된 줄바꿈도 물리 줄로 세기 때문이다. 따라서 이 파일은 단순 물리 줄 수가 아니라 CSV 파서가 읽은 레코드 수로 비교해야 한다.

### 구작 공식 한국어 매뉴얼 참고

`references/manual/Kingdom of Amulur 공식 한글 설명.pdf`는 원작 *Kingdoms of Amalur: Reckoning*의 11페이지 공식 한국어 게임 소개·매뉴얼이다. Re-Reckoning은 같은 게임의 리마스터이므로 이 자료를 세계관 이해와 한국어 번역의 중요 기준으로 삼고, 매뉴얼에 정착된 명칭과 용어는 리마스터에서도 동일하게 사용한다.

이 자료가 설명하는 핵심 배경은 모든 생명체의 운명이 정해졌다고 예언된 세계에서, 운명이 기록되지 않은 주인공이 되살아나 아말러의 미래를 바꾼다는 것이다. `Fate`는 세계의 질서와 인물의 정해진 운명을 가리키고, `Reckoning`은 그 운명을 바꾸는 힘 및 전투 모드와 연결된다. 두 개념을 일반적인 “행운”이나 “결산”처럼 번역하지 않도록 게임 내 문맥을 살핀다.

| 원문 용어 | 매뉴얼의 한국어 표기 |
| --- | --- |
| Fateweaver | 페이트위버 |
| Fate Shift | 운명의 뒤틀림 |
| Reckoning | 레코닝 |
| Faelands | 패란즈 |
| Crystal War | 크리스탈 워 |
| Lorestone | 로어스톤 |
| Ward | 워드 |
| Almain / Varani | 알마인 / 바라니 |
| Ljosalfar / Dokkalfar | 료스알파르 / 도크알파르 |
| Might / Finesse / Sorcery | 힘 / 재주 / 마법 |
| Detect Hidden / Mercantile / Sagecraft | 숨겨진 물건 찾기 / 상술 / 마법물품 제작 |

위 표기는 프로젝트의 기준 용어다. 번역 대상의 문맥에 맞춰 활용하되, 같은 개념에는 매뉴얼의 한국어 표기를 일관되게 사용한다. 매뉴얼에 없는 용어는 이 기준 용어와 세계관 맥락에 맞춰 정한다.

예외: `Alfar`는 `알파르`로 표기한다. 게임 내 발음과 계통 이름의 소리 연결을 살리기 위해 `Dokkalfar`는 `도크알파르`, `Ljosalfar`는 `료스알파르`로 표기한다. 이 두 파생 종족명에 한해서는 오래된 매뉴얼 표기 `도크알브`와 `료스알브`를 대체한다.

나무위키 문서는 인물·세력·사건의 배경 맥락을 파악하는 보조 자료로 활용한다. 커뮤니티 편집 문서이므로 번역의 사실 근거나 공식 용어표로 단정하지 않으며, 번역은 영어 원문을 기준으로 하고 공식 매뉴얼과 게임 내 근거를 우선한다.

### 모딩 및 한글화 작업

현지화 형식의 핵심 참고 자료는 [Amalur PT-BR 번역 및 추출·재패킹 스크립트](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67)다. 이 자료는 `affix`, `base`, `default` 리소스별 CSV 추출·재패킹 스크립트를 제공한다. 스크립트 사본은 `tools/loc_toolset/`에 두었으며, UTF-8 문자열 디코딩을 수정했다. 세 유형 모두 무수정 CSV 왕복 검사를 통과했다. 사용자는 문자셋 파일과 공용 글꼴 목록을 추가하지 않은 시험 패치에서 한글 출력이 정상인 것을 확인했다. 한글 패치는 GitHub 정식 Release로 공개되어 있다. 전체 게임 버전 호환성과 장시간 플레이 검증은 별도의 미검증 범위다.

#### 빠른 번역 및 패치 절차

`work/zh_cn/`의 `affix`, `base`, `default` CSV에서 텍스트를 수정한 뒤 `tools/build.sh`를 실행하면 `dist/<날짜시간>/KingdomsOfAmalur_Korean_zh_cn_<날짜시간>.zip` 형식의 ZIP이 생성됩니다. AI 등 도구를 활용할 때는 관련 Markdown 문서도 함께 참고하면 작업 맥락을 파악하는 데 도움이 됩니다. ZIP을 압축 해제하고 `RunKoreanPatch.bat`을 더블클릭합니다. `.ps1` 파일을 직접 더블클릭하면 메모장 등 편집기로 열릴 수 있습니다. 기본 경로가 아니라면 실행 후 게임 설치 폴더를 입력합니다. 설치 과정은 기존 `patch_0.pak`을 풀고 필요한 파일을 덮어써 새 PAK으로 다시 패키징하므로 몇 분 걸릴 수 있습니다. 적용 후 Steam에서 게임 언어를 `Chinese Simplified`로 설정합니다. 스크립트는 기준 버전 `cs:15032`를 확인합니다. 배포 패키지에는 Noto 폰트 리소스가 포함됩니다. 폰트 제외 실험 패키지는 한글 대신 하이픈을 출력해 사용할 수 없습니다. 실험 결과와 남은 선택적 검증은 [패키지 검증 기록](work/zh_cn/audit/pending-package-validation-20261014.md)을 참고하세요.

정식 GitHub Release 제목은 기존 릴리즈와 동일하게 `Korean Patch - YYYY-MM-DD` 형식으로 작성하고, 본문은 한국어로 작성합니다. 본문 섹션 순서와 분량은 `work/zh_cn/audit/README.md`의 릴리즈 노트 형식을 따릅니다.

#### Nexus 게시글 참고사항

제작자는 게시글에서 PT-BR 번역에 `es_es`의 `affix`, `base`, `default`를 사용했고, 게임 언어도 Spanish로 설정해야 한다고 안내했다. 영어를 그대로 두고 스페인어 슬롯을 대체한 이유는 성별·복수형에 따른 문법 변형을 활용하기 위해서라고 설명한다. 이는 PT-BR 패치의 방식이며, 블로그에서 받은 한글 패치가 어떤 언어 슬롯을 썼는지는 별도로 추출한 파일을 기준으로 판단해야 한다.

제작자는 `---- ---` 출력의 원인을 글꼴 글리프나 UTF-8 인코딩이 아니라 ID/텍스트 포인터 정렬 문제로 진단했다. 이는 해당 제작자의 진단으로 기록하며, 모든 문자 표시 문제에서 글꼴·문자셋 문제를 배제하는 근거로 일반화하지 않는다. 이 저장소의 폰트 제외 시험에서도 하이픈 출력이 관찰됐지만, 증상만으로 두 사례의 원인이 같다고 볼 수는 없다. 다른 사용자가 무수정 CSV 왕복 후 `<Invalid Loc Key>`를 보고한 사례도 있으므로, 번역 전 선택 로케일별 무수정 왕복과 게임 내 검증이 필요하다.

게시글의 제작자는 수정하지 않은 스크립트를 Steam 및 GOG에서 시험했다고 말했지만, 댓글에는 특정 게임 버전에서 메뉴의 `$Button Title` 키가 노출되는 호환성 문제가 보고되어 있다. 따라서 게임 버전 호환은 자동으로 보장된다고 보지 않는다. 또한 댓글에는 CSV 구분자를 comma라고 언급한 부분이 있지만, 이 저장소의 `tools/loc_toolset/` 스크립트는 세미콜론(`;`)을 사용한다. 이 작업에서는 실제 스크립트와 CSV 헤더 형식을 따른다. 게시글은 AI 번역 API 스크립트는 공개하지 않았고, 추출·재패킹용 Python 스크립트를 제공했다고 설명한다.

#### 작업 순서

번역·검수·수정·검증 역할과 권한 경계는 [번역 역할 문서](TRANSLATION-ROLE.md)를 따른다.

1. Windows의 게임 설치 폴더에서 원본 `data/patch_0.pak`을 백업한다. 게임 폴더의 `modding/pakfileunpacker.exe`로 별도 작업 폴더에 언팩한다. 추출 대상 폴더는 먼저 만들어 둔다.
2. 추출본에서 `locatexts_<locale>.koalocatext_{affix,base,default}` 파일을 찾는다.
3. 새 로케일 추가 방법은 아직 확인되지 않았다. 블로그에서 받은 기존 한글 패치는 `en_us` 파일명을 유지한다. PT-BR 배포 안내는 `patch_0.pak`을 교체하고 게임 언어를 스페인어로 바꾸라고 하므로 `es_es` 슬롯을 사용하는 것으로 보인다. Thai 모드 v1.1은 Steam 언어를 Japanese로 설정하도록 안내하므로 `ja_jp` 슬롯을 대체하는 것으로 보인다. 다만 Thai 패키지 내부 파일명은 아직 직접 확인하지 않았다. 새 로케일을 추가한다고 가정하지 말고 기존 슬롯 하나를 대상으로 정한다.
4. `src/csv/<locale>/`의 기준 CSV는 수정하지 않는다. 선택한 로케일의 리소스를 `tools/loc_toolset/`의 `unpacker_base.py`, `unpacker_default.py`, `unpacker_affix.py`로 각각 CSV로 추출한다. 현재 한글 작업본은 `work/zh_cn/`이며, `zh_cn` 리소스의 키·variant·순서를 유지한다. 재패킹에 필요한 `estrutura_hashes*.bin` 보조 파일도 같은 작업 폴더에 보존한다.
5. 작업용 CSV의 텍스트 필드만 번역·수정한다. 행 ID, variant type, 순서, 게임 토큰은 보존한다. 대응하는 `repacker_*.py`로 다시 바이너리화하면 `_NOVO.bin` 파일이 생성된다.
6. `_NOVO.bin` 접미사를 제거해 대상 리소스의 원래 파일명으로 맞춘 뒤, 게임 PAK의 전체 추출 작업본에 덮어쓴다. 전체 추출 파일 경로가 들어 있는 빌드 목록으로 새 아카이브를 만든다. 명령 형식은 `pakfilebuilder.exe -c <build-list.txt> <new-patch_0.pak>`이다. 원본 PAK을 바로 덮어쓰지 말고 별도 출력본을 먼저 검증한 다음 교체한다.

#### 스크립트 수정 및 검증

Nexus 원본 언패커는 UTF-8 디코딩 대신 각 입력 바이트에 `chr()`를 적용해 스마트 따옴표와 한글 문자열을 깨뜨렸다. `tools/loc_toolset/`의 작업 사본에서는 세 언패커를 UTF-8 디코딩 방식으로 수정했고, 재패커는 수정하지 않았다. 세 리소스 유형의 무수정 CSV 왕복을 확인했으며, `base` CSV의 한국어 문자열이 바이너리 재패킹 후에도 유지되는 것을 검증했다. 사용자는 문자셋 파일과 공용 글꼴 목록 없이 한글이 표시되는 것을 시험 패치로 확인했고, 패치는 정식 Release로 공개됐다. 모든 UI와 장시간 플레이를 포괄하는 게임 내 검증까지 완료했다는 뜻은 아니다.

#### 배포 파일로 게임에 적용하기

정식 `zh_cn` ZIP은 현지화 바이너리 3개와 Noto 폰트 리소스 29개를 담으며, 문자셋과 공용 글꼴 목록은 포함하지 않는다. 폰트 제외 ZIP은 한글 대신 하이픈을 출력해 사용할 수 없었다. 사용자는 문자셋과 공용 글꼴 목록 변경 없이 한글 출력이 정상인 것도 확인했다. 폰트 리소스별 크기 비교 등 선택적 조사는 [패키지 검증 기록](work/zh_cn/audit/pending-package-validation-20261014.md)에 남아 있다.

확인한 기존 한글 패치들은 `en_us` 현지화 리소스를 한글 텍스트로 교체해 영어 슬롯을 덮어쓴다. 이 프로젝트는 번역이나 게임 적용에 문제가 생겼을 때 영어 원문을 확인하고 비교할 수 있도록 `zh_cn` 슬롯을 사용하며, `en_us` 리소스는 보존한다. 한글 패치를 사용할 때는 Steam 언어를 `Chinese Simplified`로 설정하고, 문제를 확인할 때는 영어로 바꿔 원문과 비교할 수 있다.

조사한 원본 PAK의 게임 버전은 메인 메뉴에서 `Version: cs:15032`로 확인했으며, Steam BuildID `10619381`은 출처를 확인하는 보조 정보다. ZIP에는 완성된 PAK이 아니라 Windows 적용 스크립트와 필요한 변경 파일만 들어 있다. 스크립트는 사용자의 기존 PAK을 풀고 패키지 파일을 덮어써 별도 PAK을 만든 뒤, 검증에 성공하면 원본을 백업하고 교체한다. 덮어쓰지 않는 다른 모드 파일은 함께 남을 수 있지만, 같은 파일을 수정하는 모드와의 충돌은 피할 수 없으며 다른 게임 버전과의 호환성도 확인되지 않았다. 확인된 기준 버전은 `cs:15032`다.

1. ZIP 전체를 Windows PC의 한 폴더에 압축 해제한다. `RunKoreanPatch.bat`, `KoreanPatch.ps1`, `README.txt`, `SHA256SUMS.txt`, `payload/`가 함께 있어야 한다.
2. `RunKoreanPatch.bat`을 더블클릭한다. `.ps1` 파일을 직접 더블클릭하지 않는다. 관리자 권한이 없으면 UAC 권한 요청이 표시된다. 스크립트가 Steam 기본 경로를 확인하고, 유효한 게임 폴더가 없으면 GOG 기본 경로들을 확인한다. 둘 다 찾지 못한 경우에만 게임 경로를 입력한다.
3. 게임 폴더를 확인하면 이후 절차는 자동으로 진행된다. 스크립트는 ZIP 체크섬과 게임 파일을 확인하고, 언팩 대상 파일명·명령·출력 폴더와 빌드 목록을 게임 도구에 전달한다. 원본 PAK을 풀고 ZIP의 `payload/`를 덮어써 별도 PAK을 만든 뒤 재추출하여 검증한다. 완료 또는 오류 메시지를 보여준 후 아무 키나 누를 때까지 창을 유지한다.
4. 검증이 끝난 경우에만 기존 `data\patch_0.pak`을 시간표시가 붙은 `.backup-` 파일로 보관하고 새 PAK으로 교체한다. 실패 시 원본은 교체하지 않는다. 문제가 있으면 안내된 백업본을 복원한다.
5. 적용 후 Steam 게임 언어를 `Chinese Simplified`로 설정한다.

## English

- Steam: [Kingdoms of Amalur: Re-Reckoning](https://store.steampowered.com/app/1041720/Kingdoms_of_Amalur_ReReckoning/)
- Official Korean patch ZIP: [Download](https://github.com/dongmasu/kingdomsofamalurrereckoning-ko-translate/releases/download/KingdomsOfAmalur_Korean_zh_cn_20261115134051/KingdomsOfAmalur_Korean_zh_cn_20261115134051.zip)

### Project Background and Acknowledgements

I became interested in *Kingdoms of Amalur: Re-Reckoning* after watching [Novak's enthusiastic YouTube introduction to the game](https://www.youtube.com/watch?v=nCVV3Ql-_rU). I first played with a release I understood to be ~~zxcv3428's Korean patch~~. I later found the original Korean patch post on [Hanmutae's blog](https://m.blog.naver.com/gusrud6151/224392008033). I am grateful that the patch made the game accessible to me. I did, however, find two things disappointing: the copy I downloaded was a complete PAK archive over 1 GB, and it replaced the English (`en_us`) text, so selecting English displayed Korean. I therefore decided to make a patch that distributes only the needed resources and rebuilds the package using files already in each player's game installation.

During my work, I also saw a [community improvement patch](https://gall.dcinside.com/mgallery/board/view/?id=rpgundivded&no=66527). I welcome the effort to improve the earlier Korean localization. The patch has also continued to receive updates, and its translation quality keeps improving, so it may be an even better way to enjoy the game. However, it did not appear to address the distribution and locale-slot issues that mattered to me, so I decided to continue this independent project.

This is my third Korean localization project. My goal is not only to provide a finished patch, but also to leave a workspace and document the extraction, translation, and repacking process so that anyone can continue the work and help maintain its quality after future updates or DLC. I am grateful to the author of the [Amalur PT-BR translation and its extraction/repacking scripts](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67), which made this project possible.

It has been a long time since the *World of Warcraft* open beta, and this game has brought back some of those memories. I am enjoying playing it again.

### Translation Principles and Conventions

I did not use the text of earlier Korean patches as a translation reference. For terminology and setting context, I consulted the official Korean manual from the original game's release, [`Kingdom of Amulur 공식 한글 설명.pdf`](references/manual/Kingdom%20of%20Amulur%20공식%20한글%20설명.pdf). English is the basis for meaning; Japanese is used to check tone, honorifics, and sentence structure, while Chinese is supplementary. Other languages are also used for cross-checking when useful.

The CSV mixes menu strings and dialogue, and lines from the same conversation can be scattered across rows. A row alone often does not reveal the speaker or surrounding context. Group strings by type and available game-resource evidence, compare English meaning with Japanese voice and register and Chinese as supplementary evidence, and leave items unresolved when the context or evidence is insufficient.

In `base` and `affix`, `Tipo_Variante` records a byte read from each variant's binary string record as two-digit hexadecimal. The original binaries and CSV records, values, and text match across all eight locales. Some localized examples support a correlation between codes and grammatical forms such as gender or number, but no complete code map or in-game variant-selection rule has been confirmed. The active Korean `affix` draft currently uses identical Korean text across all variants of 573 multi-variant IDs. This is an observed translation choice, not evidence that the game ignores those variants. See the [variant and markup analysis](work/zh_cn/audit/default-markup-and-variant-evidence-20261115.md) for evidence and limits.

The original `default` binaries store brace forms such as `{1}`, `{*1...}`, and `{LINE_SPACE}` as literal text. Context and cross-language alignment suggest that numbered forms are substitution slots, `{*N...}` is display markup, and `{LINE_...}` is layout markup, but their actual in-game behavior has not been confirmed. Do not remove them as ordinary punctuation; conservatively preserve their numbers, nesting, and ID-specific structure. Move a numbered slot to fit Korean only after checking its meaning in that same ID. Do not globally alter repetitions or markup spans to match another language. See the [variant and markup analysis](work/zh_cn/audit/default-markup-and-variant-evidence-20261115.md) and [cross-language brace audit](work/zh_cn/audit/default-brace-cross-language-20261105.md).

When reviewing markup, compare the same ID across available languages. Do not assume every difference is an error or mechanically make every language match English. Investigate missing, additional, or unbalanced markers using context; leave uncertain cases unresolved. The localization tools preserve these forms as text and do not validate their runtime behavior.

For item names containing English `of ...` constructions, this project's composition convention marks the modifier with asterisks, as in `반지 *얼음 방패*`. When a verb is combined with an object, a colon marks the verb portion, as in `폭파하기:`. If an item's activation condition follows its name, a condition such as `at Night` is shown in parentheses as `(야간)`, indicating that the ability works only at night. These are project-specific conventions for distinguishing composed strings and conditions.

Use the existing [proper-name glossary](work/zh_cn/audit/proper-name-glossary.tsv), [candidate occurrence/disposition index](work/zh_cn/audit/proper-name-occurrences.tsv), and [review records](work/zh_cn/audit/README.md) as references for names already examined. Pair full compound names once, for example `브론웬 센(Bronwen Senn)`, not component-by-component as `브론웬(Bronwen) 센(Senn)`. These records are partial references, not a claim that all names have been found or verified.

For `_base` entries whose English source begins with capitalized `The`, do not treat it as only a definite article by default. First consider whether the string is an item name, quest name, or other title/proper name. Translate it as a natural Korean title in context, and consider retaining the source as `Korean (The English Name)` to make the name traceable. The initial `The` is a cue to inspect context, not proof that every such string is a proper noun.

### Related Resources

- [Novak's YouTube introduction to the game](https://www.youtube.com/watch?v=nCVV3Ql-_rU)
- [Amalur PT-BR translation and extraction/repacking scripts](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67)
- ~~Earlier Korean patch - zxcv3428~~
- [Original Korean patch post by Hanmutae](https://m.blog.naver.com/gusrud6151/224392008033)
- [Community improvement patch](https://gall.dcinside.com/mgallery/board/view/?id=rpgundivded&no=66527)
- [Namu Wiki article on Kingdoms of Amalur](https://namu.wiki/w/%ED%82%B9%EB%8D%A4%20%EC%98%A4%EB%B8%8C%20%EC%95%84%EB%A7%90%EB%9F%AC) - secondary context for setting and terminology

### Localization Resource Structure

The reference CSV data contains three resource types (`base`, `default`,
and `affix`) for each of eight locales (`de_de`, `en_us`, `es_es`, `fr_fr`,
`it_it`, `ja_jp`, `ru_ru`, and `zh_cn`).

Files follow the pattern `locatexts_<locale>.koalocatext_<type>`. The English resources contain 4,844 `base` entries, 65,135 `default` entries, and 586 `affix` entries. The PT-BR scripts treat the first four bytes of `base` and `default` files as magic values, not entry counts, then infer an ascending array of 4-byte absolute offsets. Bytes between that array and the first string offset are separated as opaque data, called `hash` by the scripts, and preserved during repacking. Thus, the scripts use the pointers and locate the text, but do not decode the individual fields in that opaque region. `base` and `affix` variant records also contain a one-byte value separate from the text; the CSV records it as two-digit hexadecimal in `Tipo_Variante`. The binary/CSV comparisons and limits on interpreting these codes are documented in the [variant and markup analysis](work/zh_cn/audit/default-markup-and-variant-evidence-20261115.md).

#### Why CSV Row Counts Differ by Locale

The table below counts parsed CSV data records in `src/csv/` using the semicolon delimiter (header excluded). All locales have the same 586 unique `affix` IDs, but exported `affix` row counts vary because an ID can have multiple variants. `base` and `default` have the same record counts in every locale.

| Locale | `affix` records | `base` records | `default` records | `default` physical lines (`wc -l`) |
| --- | ---: | ---: | ---: | ---: |
| `de_de` | 3,491 | 4,844 | 65,135 | 72,115 |
| `en_us` | 586 | 4,844 | 65,135 | 72,080 |
| `es_es` | 2,345 | 4,844 | 65,135 | 72,168 |
| `fr_fr` | 2,305 | 4,844 | 65,135 | 72,013 |
| `it_it` | 2,330 | 4,844 | 65,135 | 72,059 |
| `ja_jp` | 3,311 | 4,844 | 65,135 | 72,080 |
| `ru_ru` | 3,449 | 4,844 | 65,135 | 72,105 |
| `zh_cn` | 3,451 | 4,844 | 65,135 | 72,074 |

In `en_us`, each `affix` ID has one `FF` variant. Other locales have multiple variants for many IDs. Some Spanish and German examples correlate with gender and number forms, and the PT-BR mod author also cited gender/plural forms when explaining the choice of Spanish resources. That statement is the author's account, not an official format specification. These observations do not establish a complete code map or the game's variant-selection rules.

Preserve `Tipo_Variante` with its ID- and variant-specific row when repacking. Some codes correlate with gender or number in particular language entries, but the same code can mark a complete sentence and code usage differs by locale. Do not treat `0x1?`/`0x2?` or final digits as a universal singular/plural/gender code map. The meaning of English `affix` code `FF` and the game's runtime selection rules remain unknown. See the [variant and markup analysis](work/zh_cn/audit/default-markup-and-variant-evidence-20261115.md) for evidence and limits.

Every `default` CSV has 65,135 parsed records. The differing `wc -l` totals count embedded line breaks inside quoted dialogue fields as physical lines. Compare CSV records with a CSV parser rather than raw line counts.

### Older Official Korean Manual as Context

`references/manual/Kingdom of Amulur 공식 한글 설명.pdf` is the 11-page official Korean game introduction/manual for the original *Kingdoms of Amalur: Reckoning*. Re-Reckoning is a remaster of the same game, so this manual is a key source for world context and Korean localization. Reuse its established names and terms consistently in the remaster translation.

Its central premise is that the world's inhabitants are believed to have fixed destinies, but the resurrected protagonist has no fate written in the great tapestry and can change Amalur's future. `Fate` refers to this world order and characters' destinies; `Reckoning` is tied to the power and combat mode that can alter that fate. Preserve this distinction in context rather than translating either term by a generic dictionary sense.

| Original term | Korean term used in the manual |
| --- | --- |
| Fateweaver | 페이트위버 |
| Fate Shift | 운명의 뒤틀림 |
| Reckoning | 레코닝 |
| Faelands | 패란즈 |
| Crystal War | 크리스탈 워 |
| Lorestone | 로어스톤 |
| Ward | 워드 |
| Almain / Varani | 알마인 / 바라니 |
| Ljosalfar / Dokkalfar | 료스알파르 / 도크알파르 |
| Might / Finesse / Sorcery | 힘 / 재주 / 마법 |
| Detect Hidden / Mercantile / Sagecraft | 숨겨진 물건 찾기 / 상술 / 마법물품 제작 |

These are the project's standard Korean terms. Apply them consistently to the corresponding concepts in Re-Reckoning; for terms not covered by the manual, choose wording consistent with this glossary and the game's world context.

Exception: keep `Alfar` as `알파르`, but use `도크알파르` for `Dokkalfar` and `료스알파르` for `Ljosalfar` to preserve their audible connection to the Alfar name. These two derived race names intentionally override the older manual spellings `도크알브` and `료스알브`.

The Namu Wiki article may help clarify character, faction, and event context. It is community-maintained and is not an authoritative translation source or glossary; use the English source and in-game evidence for translation decisions, with the official Korean manual taking precedence for established Korean terms.

### Modding and Localization Workflow

The primary localization-format reference is the [Amalur PT-BR Translation and its unpacker/repacker scripts](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67). It provides CSV unpacker/repacker scripts for the `affix`, `base`, and `default` resources. Copies of the scripts are kept in `tools/loc_toolset/`; UTF-8 string decoding was fixed in the unpackers. No-edit CSV round-trip checks passed for all three resource types. The user confirmed Korean output in a test without the characterset or common font list, and the Korean patch is published as an official GitHub Release. Comprehensive UI, long-play, and cross-version validation are outside the checks completed so far.

#### Quick Translation and Patch Build

Edit the text in the `affix`, `base`, and `default` CSVs under `work/zh_cn/`, then run `tools/build.sh`. It creates a ZIP under `dist/<timestamp>/` named `KingdomsOfAmalur_Korean_zh_cn_<timestamp>.zip` and includes all 29 required Noto font resources. If using AI or other tools, consult the related Markdown documents for project context. Extract the ZIP and double-click `RunKoreanPatch.bat`; do not double-click `KoreanPatch.ps1`, which may open in a text editor. Enter the game installation folder if it is not the default. The installer unpacks the existing `patch_0.pak`, overlays the required files, and rebuilds it, which may take several minutes. Set the Steam game language to `Chinese Simplified` afterward. The script checks for baseline version `cs:15032`.

#### Notes from the Nexus Posts

The author says the PT-BR translation uses the `es_es` `affix`, `base`, and `default` resources, and instructs users to set the game language to Spanish. The stated reason for replacing the Spanish slot while leaving English intact is to use grammatical variants such as gender and plural forms. This describes the PT-BR patch; determine which slot the downloaded Korean patch uses from its extracted files rather than assuming it uses the same one.

The author attributes `---- ---` output to misaligned string IDs/text pointers rather than missing font glyphs or UTF-8 encoding. Record this as the author's diagnosis, not as proof that font or character-set issues can never cause display problems. Another user reported `<Invalid Loc Key>` after an unedited CSV round trip, so perform a no-edit round-trip and in-game check for the selected locale before translating.

The author reports testing the unmodified scripts on Steam and GOG, but comments also report `$Button Title` menu failures associated with game-version compatibility. Do not assume compatibility is guaranteed across builds. A comment mentions comma-delimited CSV, while the scripts in this repository use semicolons (`;`); follow the actual local scripts and CSV headers. The author says the AI translation API script was not published; the provided Python scripts are for extraction and repacking.

#### Workflow

Translation, review, editing, and verification permissions are defined in [TRANSLATION-ROLE.md](TRANSLATION-ROLE.md).

1. Back up the original `data/patch_0.pak` in the Windows game installation. Use the game's `modding/pakfileunpacker.exe` to unpack it into a separate working directory. Create the destination directory first.
2. Find the `locatexts_<locale>.koalocatext_{affix,base,default}` files.
3. Adding a new locale has not been verified. The earlier Korean patch downloaded from the blog keeps the `en_us` filenames. The PT-BR distribution instructs users to replace `patch_0.pak` and switch the game to Spanish, suggesting it uses the `es_es` slot. Thai mod v1.1 instructs users to set the Steam language to Japanese, suggesting it replaces the `ja_jp` slot; the package's internal filenames have not been inspected directly. Do not assume a new locale can be added; choose an existing slot.
4. Keep the reference CSVs in `src/csv/<locale>/` unchanged. Extract each selected resource to CSV with `unpacker_base.py`, `unpacker_default.py`, or `unpacker_affix.py` from `tools/loc_toolset/`. The active Korean working files are in `work/zh_cn/`, preserving the `zh_cn` keys, variants, and order. Preserve the required `estrutura_hashes*.bin` sidecars alongside the working CSVs when repacking.
5. Translate or edit only the text fields in working CSVs. Preserve row IDs, variant types, ordering, and game tokens. Run the matching `repacker_*.py`; it creates an output ending in `_NOVO.bin`.
6. Remove `_NOVO.bin` and restore the target resource's original filename, then overwrite it in a full working extraction of the game PAK. Build a new archive from a build list containing the paths of the full extracted file set. The command format is `pakfilebuilder.exe -c <build-list.txt> <new-patch_0.pak>`. Validate the separate output before replacing the original PAK.

#### Script Changes and Validation

The upstream unpackers applied `chr()` to each input byte instead of decoding strings as UTF-8, corrupting smart quotes and Korean text. In the working copies under `tools/loc_toolset/`, all three unpackers were changed to decode UTF-8; the repackers were left unchanged. No-edit CSV round trips passed for all three resource types. A Korean string in a `base` CSV was also verified after binary repacking and re-extraction. The user reports normal Korean output in a test without the characterset or common font list, and the patch has been published as an official GitHub Release. That report does not claim comprehensive in-game testing.

#### Applying the Patch to the Game

The official `zh_cn` ZIP contains three localization binaries and 29 Noto font resources; it omits the characterset and `fontlist_common.koafontlist`. In the user's test, the font-free package rendered hyphens instead of Korean, so the Noto resources remain in the release package. The user separately confirmed Korean displayed in-game without the characterset or common font list. See [package validation notes](work/zh_cn/audit/pending-package-validation-20261014.md). This does not establish compatibility across other locales, all font roles, or later game versions.

The earlier Korean patches inspected here replace the `en_us` localization resources with Korean text, overwriting the English slot. This project uses the `zh_cn` slot instead so the original English resources remain available for troubleshooting and comparison. Select `Chinese Simplified` in Steam to use the Korean patch; if a problem occurs, switch back to English to compare against the original text.

The inspected original `patch_0.pak` came from the user's Steam installation; the game's main menu showed `Version: cs:15032`. Steam BuildID `10619381` from `appmanifest_1041720.acf` is secondary provenance information. The installer rebuilds the user's existing PAK, so changes in files outside the payload may remain; mods that alter the same payload files can conflict. Compatibility with later game versions is unverified.

The ZIP includes `RunKoreanPatch.bat`, `KoreanPatch.ps1`, instructions, checksums, and a `payload/` folder. It does not contain a complete PAK. On Windows, extract the entire ZIP and double-click `RunKoreanPatch.bat`; do not double-click the `.ps1` file, which may open in a text editor. If it is not already elevated, the script requests administrator access. It checks the default Steam directory first, followed by common GOG installation directories; it asks for a path only if neither contains a valid game installation. The supported baseline is game version `cs:15032`, as noted above. Once the game folder is available, the script proceeds automatically: it validates the package and game files, unpacks the user's original `data\patch_0.pak`, overlays the payload, builds and re-unpacks a separate candidate PAK, then verifies the backup before replacing the original. Set the Steam game language to `Chinese Simplified` after installation. The PowerShell window stays open at the end until a key is pressed, showing either the completion message or any error.

The user reports Korean output displaying normally without the characterset or common font list, and the package is published as an official release. The characterset remains omitted.
