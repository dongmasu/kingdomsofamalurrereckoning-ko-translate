# Kingdoms of Amalur: Re-Reckoning

## 한국어

- Steam: [Kingdoms of Amalur: Re-Reckoning](https://store.steampowered.com/app/1041720/Kingdoms_of_Amalur_ReReckoning/)

### 작업 배경과 감사

Nexus Mods의 [Amalur PT-BR 번역 및 추출·재패킹 스크립트](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67)를 보고 용기를 얻어 한글화 작업을 시작했습니다. 먼저 배포된 [zxcv3428님의 한글화 패치](https://zxcv3428.tistory.com/215)에도 감사드립니다. 다만 패치가 1GB가 넘는 완성형 PAK으로 배포되는 점을 보고, 번역문을 참고하기보다는 필요한 리소스만 공유하고 각자 보유한 게임 파일로 패키지를 재구성하는 방식을 만들어보고자 했습니다. 기존 *Kingdoms of Amalur: Reckoning*을 화면 캡처와 캡션 형식으로 번역한 자료가 [카테고리 26](https://blog.naver.com/PostList.naver?blogId=leejez&from=postList&categoryNo=26&parentCategoryNo=26)과 [카테고리 100](https://blog.naver.com/PostList.naver?blogId=leejez&from=postList&categoryNo=100&parentCategoryNo=100)에 각각 있어 확인했지만, 두 카테고리의 자료를 포함해 기존 번역문은 이번 번역의 참고 자료로 사용하지 않았습니다. 실제 번역은 영어 원문을 기준으로 새로 작업했습니다.

번역 초안을 마치고 통합 검수만 남았을 때 [커뮤니티 교정 패치](https://gall.dcinside.com/mgallery/board/view/?id=rpgundivded&no=66527)가 올라온 것을 확인했습니다. 기존 한글화의 번역 품질을 높인 교정 작업을 반갑게 생각하며, 제 초안도 계획한 검수까지 마무리하려 합니다. 이 프로젝트를 GitHub에 공개하려는 이유도 번역 파일뿐 아니라 추출·번역·재패킹 방법을 남겨 다른 분들께 도움이 되기를 바라기 때문입니다.

오랜만에 *World of Warcraft* 공개 베타 시절도 떠올리며, 요즘은 이 게임을 즐겁게 플레이하고 있습니다.

### 관련 자료

- [Amalur PT-BR 번역 및 추출·재패킹 스크립트](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67)
- [기존 한글화 패치 - zxcv3428님](https://zxcv3428.tistory.com/215)
- 같은 블로그에서 제공한 별개의 자료: 기존작 *Kingdoms of Amalur: Reckoning* 화면 캡처 번역 [카테고리 26](https://blog.naver.com/PostList.naver?blogId=leejez&from=postList&categoryNo=26&parentCategoryNo=26), [카테고리 100](https://blog.naver.com/PostList.naver?blogId=leejez&from=postList&categoryNo=100&parentCategoryNo=100)
- [커뮤니티 교정 패치](https://gall.dcinside.com/mgallery/board/view/?id=rpgundivded&no=66527)
- [나무위키 「킹덤 오브 아말러」 문서](https://namu.wiki/w/%ED%82%B9%EB%8D%A4%20%EC%98%A4%EB%B8%8C%20%EC%95%84%EB%A7%90%EB%9F%AC) - 세계관과 용어 맥락을 확인하기 위한 보조 참고자료

### 기존 한글 패치 아카이브

한글화 아카이브는 게임 `data/` 디렉터리의 `patch_0.pak`으로 설치된다. 조사에 사용하는 사본은 블로그에서 받은 `references/data/(ko_kr)(zxcv3428)patch_0.pak`이다.

### 원본 아카이브 구조

원본 아카이브는 `references/data/patch_0.pak`이고, 한글 수정 아카이브 사본은 `references/data/(ko_kr)(zxcv3428)patch_0.pak`이다. 원본은 Windows에서 게임 설치 폴더의 `modding/pakfileunpacker.exe`로 풀었다. 현재 작업 사본은 `tools/modding/pakfileunpacker.exe`에 있다. 추출 파일은 `references/data/unpacked/`, 한글 아카이브 추출 파일은 `references/data/(ko_kr)(zxcv3428)unpacked/`에 있다.

- 원본 아카이브 크기는 1,119,582,387바이트다.
- 원본 추출본에는 약 2.24GB에 해당하는 파일 12,337개가 있다.
- 추출 결과는 폴더 계층이 아니라 이름이 붙은 게임 리소스의 평면 디렉터리다. 주요 파일 유형은 `.bundle` 5,980개, `.collision_set_bin` 591개, `.quest_bxml` 530개, `.interaction_bxml` 517개다.

#### 원본 `patch_0.pak`의 현지화 리소스

원본에는 8개 로케일(`de_de`, `en_us`, `es_es`, `fr_fr`, `it_it`, `ja_jp`, `ru_ru`, `zh_cn`)마다 세 가지 유형(`base`, `default`, `affix`)이 있어 현지화 리소스가 총 24개 있다. 원본 아카이브에는 `ko_kr` 리소스가 없다.

파일명 형식은 `locatexts_<locale>.koalocatext_<type>`이다. 영문 리소스에는 `base` 항목 4,844개, `default` 항목 65,135개, `affix` 항목 586개가 있다. PT-BR 스크립트는 `base`와 `default` 파일의 첫 4바이트를 항목 수가 아니라 매직값으로 취급하고, 그 뒤에서 오름차순 4바이트 절대 오프셋 배열을 추정한다. 배열과 첫 문자열 오프셋 사이의 바이트는 스크립트가 `hash`로 부르는 불투명 데이터로 분리해 재패킹 시 보존한다. 따라서 스크립트는 포인터와 텍스트 위치는 이용하지만 이 불투명 영역의 필드별 의미까지 해독하지는 않는다. `base`의 각 항목은 스크립트상 variant-type 바이트와 UTF-8 문자열로 읽히며, `0x11`은 문자열 본문이 아니라 문자열 앞의 타입 바이트로 CSV에 따로 기록된다. 타입 바이트의 게임 내 의미는 아직 확인되지 않았다.

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

`affix`는 `en_us`에서 ID마다 `FF` variant 한 개만 있지만, 다른 언어는 상당수 ID에 성·수 등에 따른 variant가 여러 개 있다. 예를 들어 `es_es`는 대부분의 ID에 4개 variant가 있고, `de_de`는 대부분 6개다. Nexus 모드 제작자도 PT-BR 번역에 스페인어 리소스를 사용한 이유로 성별·문법 변형을 들었다. 언어별 텍스트와 타입 코드를 대조해 일부 코드 의미를 추정했지만, 게임의 공식 코드 정의와 variant 선택 규칙은 확인하지 못했다.

CSV의 `Tipo_Variante`는 언패커가 각 문자열 앞의 1바이트를 2자리 16진수로 기록한 열이다. 번역문이나 `ID_Linha`가 아니므로 재패킹 시 코드와 variant별 행을 보존해야 한다. 현재 가장 유력한 추정은 `0x1?`가 단수 슬롯, `0x2?`가 복수 슬롯이며, 끝자리 `1`, `2`, `4`가 각각 남성·여성·중성 계열을 나타낸다는 것이다. 예를 들어 스페인어 `affix` ID 0은 `11=motivador`, `12=motivadora`, `21=motivadores`, `22=motivadoras`이고, 독일어 ID 0의 `14=Sammelndes`는 중성 단수 형태다. `14`는 중성 계열 단수, `24`는 그 계열의 복수 슬롯으로 추정된다. 러시아어 `base`에서도 `14`가 중성 단수 명사(예: `зелье`), `24`가 중성 명사의 복수형(예: `Лезвия`, 단수 `лезвие`)에 붙는 사례가 이를 뒷받침한다. 스페인어 `affix` ID 563의 `14=Prismátique`, `24=Prismátiques`도 제3의 중성/포괄적 형태로 보인다. 다만 `base` ID 1531의 문장 전체가 모든 언어에서 `14`로 표시되고, 일부 문구는 여러 코드에서 동일하므로 각 코드가 텍스트 표면형의 문법 성을 항상 직접 나타내는 것은 아니다. 정확한 게임 내 선택 규칙과 공식 코드 의미표는 미확인이고, 영어 `affix`의 `FF` 의미도 모른다.

`default`의 CSV 레코드는 모든 언어에서 65,135개로 같다. `wc -l` 수가 다른 것은 CSV 필드 안의 대사에 포함된 줄바꿈도 물리 줄로 세기 때문이다. 따라서 이 파일은 단순 물리 줄 수가 아니라 CSV 파서가 읽은 레코드 수로 비교해야 한다.

#### 블로그에서 내려받은 파일의 추출본

한글 아카이브 추출본 `references/data/(ko_kr)(zxcv3428)unpacked/`에는 파일 12,338개가 있다. 원본 추출본의 12,337개보다 하나 많다. 한글 아카이브는 `ko_kr` 로케일을 새로 만들지 않고 `en_us` 파일명을 유지하지만, 세 `en_us` 문자열 리소스의 내용은 한국어다.

- `locatexts_en_us.koalocatext_base`: 항목 4,844개. 한글 아카이브 164,182바이트, 원본 151,212바이트.
- `locatexts_en_us.koalocatext_default`: 항목 65,135개. 한글 아카이브 6,722,251바이트, 원본 5,529,052바이트.
- `locatexts_en_us.koalocatext_affix`: 항목 586개. 한글 아카이브 16,321바이트, 원본 15,915바이트.

한글 추출본에는 원본에 없는 `locatexts_en_us.characterset`도 있다. macOS `file` 도구는 이 파일을 xBase compound index 형식으로 식별하지만, 인덱스가 담은 데이터의 의미와 생성 도구는 아직 확인하지 못했다. 현재 확인한 언패커·재패커는 이 파일을 생성하지 않으며, Builder 문서도 파일 목록을 PAK으로 묶는 기능만 설명한다. 전체 바이트 단위 비교 자료는 Git에서 제외되는 로컬 참고자료 `references/data/PAK_DIFF.md`에 보관되어 있어 공개 저장소에는 포함되지 않는다.

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
| Ljosalfar / Dokkalfar | 료스알브 / 도크알브 |
| Might / Finesse / Sorcery | 힘 / 재주 / 마법 |
| Detect Hidden / Mercantile / Sagecraft | 숨겨진 물건 찾기 / 상술 / 마법물품 제작 |

위 표기는 프로젝트의 기준 용어다. 번역 대상의 문맥에 맞춰 활용하되, 같은 개념에는 매뉴얼의 한국어 표기를 일관되게 사용한다. 매뉴얼에 없는 용어는 이 기준 용어와 세계관 맥락에 맞춰 정한다.

나무위키 문서는 인물·세력·사건의 배경 맥락을 파악하는 보조 자료로 활용한다. 커뮤니티 편집 문서이므로 번역의 사실 근거나 공식 용어표로 단정하지 않으며, 번역은 영어 원문을 기준으로 하고 공식 매뉴얼과 게임 내 근거를 우선한다.

### 모딩 및 한글화 작업

현지화 형식의 핵심 참고 자료는 [Amalur PT-BR 번역 및 추출·재패킹 스크립트](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67)다. 이 자료는 `affix`, `base`, `default` 리소스별 CSV 추출·재패킹 스크립트를 제공한다. 스크립트 사본은 `tools/loc_toolset/`에 두었으며, UTF-8 문자열 디코딩을 수정했다. 세 유형 모두 무수정 CSV 왕복 검사를 통과했다. 사용자는 시험 패치에서 문자셋 파일 없이 약 5분간 한글 출력이 정상인 것을 확인했으며, 전체 PAK 빌드와 게임 내 검증은 계속 진행 중이다.

#### Nexus 게시글 참고사항

제작자는 게시글에서 PT-BR 번역에 `es_es`의 `affix`, `base`, `default`를 사용했고, 게임 언어도 Spanish로 설정해야 한다고 안내했다. 영어를 그대로 두고 스페인어 슬롯을 대체한 이유는 성별·복수형에 따른 문법 변형을 활용하기 위해서라고 설명한다. 이는 PT-BR 패치의 방식이며, 블로그에서 받은 한글 패치가 어떤 언어 슬롯을 썼는지는 별도로 추출한 파일을 기준으로 판단해야 한다.

제작자는 `---- ---` 출력의 원인을 글꼴 글리프나 UTF-8 인코딩이 아니라 ID/텍스트 포인터 정렬 문제로 진단했다. 이는 해당 제작자의 진단으로 기록하며, 모든 문자 표시 문제에서 글꼴·문자셋 문제를 배제하는 근거로 일반화하지 않는다. 다른 사용자가 무수정 CSV 왕복 후 `<Invalid Loc Key>`를 보고한 사례도 있으므로, 번역 전 선택 로케일별 무수정 왕복과 게임 내 검증이 필요하다.

게시글의 제작자는 수정하지 않은 스크립트를 Steam 및 GOG에서 시험했다고 말했지만, 댓글에는 특정 게임 버전에서 메뉴의 `$Button Title` 키가 노출되는 호환성 문제가 보고되어 있다. 따라서 게임 버전 호환은 자동으로 보장된다고 보지 않는다. 또한 댓글에는 CSV 구분자를 comma라고 언급한 부분이 있지만, 이 저장소의 `tools/loc_toolset/` 스크립트는 세미콜론(`;`)을 사용한다. 이 작업에서는 실제 스크립트와 CSV 헤더 형식을 따른다. 게시글은 AI 번역 API 스크립트는 공개하지 않았고, 추출·재패킹용 Python 스크립트를 제공했다고 설명한다.

#### 작업 순서

번역·검수·수정·검증 역할과 권한 경계는 [번역 역할 문서](TRANSLATION-ROLE.md)를 따른다.

1. Windows의 게임 설치 폴더에서 원본 `data/patch_0.pak`을 백업한다. 게임 폴더의 `modding/pakfileunpacker.exe`로 별도 작업 폴더에 언팩한다. 추출 대상 폴더는 먼저 만들어 둔다.
2. 추출본에서 `locatexts_<locale>.koalocatext_{affix,base,default}` 파일을 찾는다. 원본에는 8개 기존 로케일이 있고 `ko_kr`은 없다.
3. 새 로케일 추가 방법은 아직 확인되지 않았다. 한글 패치는 `en_us` 파일명을 유지한다. PT-BR 배포 안내는 `patch_0.pak`을 교체하고 게임 언어를 스페인어로 바꾸라고 하므로 `es_es` 슬롯을 사용하는 것으로 보인다. Thai 모드 v1.1은 Steam 언어를 Japanese로 설정하도록 안내하므로 `ja_jp` 슬롯을 대체하는 것으로 보인다. 다만 Thai 패키지 내부 파일명은 아직 직접 확인하지 않았다. 새 로케일을 추가한다고 가정하지 말고 기존 슬롯 하나를 대상으로 정한다.
4. `src/csv/<locale>/`의 기준 CSV는 수정하지 않는다. 선택한 로케일의 리소스를 `tools/loc_toolset/`의 `unpacker_base.py`, `unpacker_default.py`, `unpacker_affix.py`로 각각 CSV로 추출한다. 현재 한글 작업본은 `work/zh_cn/`이며, `zh_cn` 리소스의 키·variant·순서를 유지하고 기존 일본어 기반 한국어 초안을 ID별로 이식했다. `affix`의 추가 140개 variant는 같은 ID의 기존 한국어를 임시 후보로 넣었으며 `work/zh_cn/audit/affix-extra-variant-review.tsv`에서 다른 언어의 같은 variant와 함께 검토해야 한다. 사용자는 문자셋 없이 약 5분간 한글 출력이 정상인 것을 확인했다. 이는 초기 확인이며 전체 게임 내 로케일·글꼴·PAK 검증은 계속 진행 중이다. 이전 `work/ja_jp/` 작업본은 사용자의 요청으로 2026-10-14에 삭제했다. 재패킹에 필요한 `estrutura_hashes*.bin` 보조 파일도 같은 작업 폴더에 보존한다.
5. 작업용 CSV의 텍스트 필드만 번역·수정한다. 행 ID, variant type, 순서, 게임 토큰은 보존한다. 대응하는 `repacker_*.py`로 다시 바이너리화하면 `_NOVO.bin` 파일이 생성된다.
6. `_NOVO.bin` 접미사를 제거해 대상 리소스의 원래 파일명으로 맞춘 뒤, 게임 PAK의 전체 추출 작업본에 덮어쓴다. 전체 추출 파일 경로가 들어 있는 빌드 목록으로 새 아카이브를 만든다. 명령 형식은 `pakfilebuilder.exe -c <build-list.txt> <new-patch_0.pak>`이다. 원본 PAK을 바로 덮어쓰지 말고 별도 출력본을 먼저 검증한 다음 교체한다.

#### 스크립트 수정 및 검증

Nexus 원본 언패커는 UTF-8 디코딩 대신 각 입력 바이트에 `chr()`를 적용해 스마트 따옴표와 한글 문자열을 깨뜨렸다. `tools/loc_toolset/`의 작업 사본에서는 세 언패커를 UTF-8 디코딩 방식으로 수정했고, 재패커는 수정하지 않았다. 영어·한글 아카이브의 세 리소스 유형에서 무수정 CSV 왕복을 확인했으며, `base` CSV의 한국어 문자열이 바이너리 재패킹 후에도 유지되는 것을 검증했다. 사용자는 문자셋 없는 시험 패치에서 약 5분간 한글 출력이 정상인 것을 확인했으나, 전체 PAK 및 게임 동작 검증은 아직 완료되지 않았다.

#### 배포 파일로 게임에 적용하기

원본과 블로그에서 받은 한글 PAK의 비교에서는 공통 파일 33개가 변경되고 `locatexts_en_us.characterset` 1개가 추가됐다. 그 비교에 포함된 변경분은 현지화 바이너리 3개, 폰트 파일 30개, 문자셋 1개다. 이번 `zh_cn` 시험 ZIP은 그 문자셋을 의도적으로 제외하고 `zh_cn` 현지화 바이너리 3개와 폰트 파일 30개만 담는다. 사용자는 문자셋 없이 약 5분간 시험했을 때 한글 출력이 정상이라고 보고했다. 현재까지는 문자셋을 추가할 이유가 없지만, 더 긴 플레이나 다른 화면에서 표시 문제가 발견되면 별도로 시험할 수 있다.

확인한 기존 한글 패치들은 `en_us` 현지화 리소스를 한글 텍스트로 교체해 영어 슬롯을 덮어쓴다. 이 프로젝트는 번역이나 게임 적용에 문제가 생겼을 때 영어 원문을 확인하고 비교할 수 있도록 `zh_cn` 슬롯을 사용하며, `en_us` 리소스는 보존한다. 한글 패치를 사용할 때는 Steam 언어를 중국어(간체)로 설정하고, 문제를 확인할 때는 영어로 바꿔 원문과 비교할 수 있다.

조사한 원본 PAK의 게임 버전은 메인 메뉴에서 `Version: cs:15032`로 확인했으며, Steam BuildID `10619381`은 출처를 확인하는 보조 정보다. ZIP에는 완성된 PAK이 아니라 Windows 적용 스크립트와 필요한 변경 파일만 들어 있다. 스크립트는 사용자의 원본 PAK 전체를 풀고 파일을 덮어써 별도 PAK을 만든 뒤, 검증에 성공하면 원본을 백업하고 교체한다. 이후 게임 버전과의 호환성은 검증하지 않았다.

1. ZIP 전체를 Windows PC의 한 폴더에 압축 해제한다. `KoreanPatch.ps1`, `README.txt`, `SHA256SUMS.txt`, `payload/`가 함께 있어야 한다.
2. PowerShell에서 `KoreanPatch.ps1`을 실행한다. 관리자 권한이 없으면 경로를 묻기 전에 UAC 권한 요청이 표시된다. 승인한 관리자 창에서 기본 경로를 사용하거나 다른 게임 폴더를 한 번 입력한다.
3. 게임 폴더를 확인하면 이후 절차는 자동으로 진행된다. 스크립트는 ZIP 체크섬과 게임 파일을 확인하고, 언팩 대상 파일명·명령·출력 폴더와 빌드 목록을 게임 도구에 전달한다. 원본 PAK을 풀고 ZIP의 `payload/`를 덮어써 별도 PAK을 만든 뒤 재추출하여 검증한다. 완료 또는 오류 메시지를 보여준 후 아무 키나 누를 때까지 창을 유지한다.
4. 검증이 끝난 경우에만 기존 `data\patch_0.pak`을 시간표시가 붙은 `.backup-` 파일로 보관하고 새 PAK으로 교체한다. 실패 시 원본은 교체하지 않는다. 문제가 있으면 안내된 백업본을 복원한다.
5. 적용 후 Steam 게임 언어를 중국어(간체)로 설정한다. 사용자는 `locatexts_en_us.characterset` 없이 약 5분간 한글 출력이 정상임을 확인했다. 이는 초기 스모크 테스트이며, 번역 검수와 전체 UI·대사·장시간 플레이 검증은 아직 완료되지 않았다.

## English

- Steam: [Kingdoms of Amalur: Re-Reckoning](https://store.steampowered.com/app/1041720/Kingdoms_of_Amalur_ReReckoning/)

### Project Background and Acknowledgements

I was encouraged to start this Korean localization after finding the [Amalur PT-BR translation and its extraction/repacking scripts](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67). I am also grateful for the earlier [Korean patch by zxcv3428](https://zxcv3428.tistory.com/215). Since that patch is distributed as a complete archive larger than 1 GB, I initially wanted to explore a different approach: share only the required resources and let players rebuild the package using files already in their own game installation. I also found two distinct sets of Naver Blog materials by the same blogger translating the original *Kingdoms of Amalur: Reckoning* through captions over screenshots: [category 26](https://blog.naver.com/PostList.naver?blogId=leejez&from=postList&categoryNo=26&parentCategoryNo=26) and [category 100](https://blog.naver.com/PostList.naver?blogId=leejez&from=postList&categoryNo=100&parentCategoryNo=100). I did not use either set, or any other existing translated text, as a source. This draft was translated anew from the English original.

When my translation draft was complete and only consolidated review remained, I learned about a [community correction patch](https://gall.dcinside.com/mgallery/board/view/?id=rpgundivded&no=66527). I welcome the work to improve the earlier Korean localization, and intend to complete the planned review of this independent draft as well. I plan to publish this project on GitHub not only to share translation files, but also to document an extraction, translation, and repacking workflow that may help others.

It has been a long time since the *World of Warcraft* open beta, and this game has brought back some of those memories. I am enjoying playing it again.

### Related Resources

- [Amalur PT-BR translation and extraction/repacking scripts](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67)
- [Earlier Korean patch by zxcv3428](https://zxcv3428.tistory.com/215)
- Separate materials from the same blog: screenshot-caption translations for the original *Kingdoms of Amalur: Reckoning*, [category 26](https://blog.naver.com/PostList.naver?blogId=leejez&from=postList&categoryNo=26&parentCategoryNo=26) and [category 100](https://blog.naver.com/PostList.naver?blogId=leejez&from=postList&categoryNo=100&parentCategoryNo=100)
- [Community correction patch](https://gall.dcinside.com/mgallery/board/view/?id=rpgundivded&no=66527)
- [Namu Wiki article on Kingdoms of Amalur](https://namu.wiki/w/%ED%82%B9%EB%8D%A4%20%EC%98%A4%EB%B8%8C%20%EC%95%84%EB%A7%90%EB%9F%AC) - secondary context for setting and terminology

### Korean Localization

The Korean localization archive is installed as `patch_0.pak` in the game's `data/` directory. The inspection copy downloaded from the blog is `references/data/(ko_kr)(zxcv3428)patch_0.pak`.

### Original Archive Structure

The original archive is `references/data/patch_0.pak`; the Korean-modified archive copy is `references/data/(ko_kr)(zxcv3428)patch_0.pak`. The original was unpacked on Windows using the `modding/pakfileunpacker.exe` included in the game installation. The working copy is at `tools/modding/pakfileunpacker.exe`. The extracted files are in `references/data/unpacked/`; the Korean archive's extracted files are in `references/data/(ko_kr)(zxcv3428)unpacked/`.

- The original archive is 1,119,582,387 bytes.
- The original extraction contains 12,337 files, about 2.24 GB in total.
- The extraction is a flat directory of named game resources rather than a hierarchy of folders. Major file groups include 5,980 `.bundle` files, 591 `.collision_set_bin` files, 530 `.quest_bxml` files, and 517 `.interaction_bxml` files.

#### Localization Resources in the Original `patch_0.pak`

The original contains 24 localization resources: three resource types (`base`, `default`, and `affix`) for each of eight locales (`de_de`, `en_us`, `es_es`, `fr_fr`, `it_it`, `ja_jp`, `ru_ru`, and `zh_cn`). There is no `ko_kr` localization resource in the original archive.

Files follow the pattern `locatexts_<locale>.koalocatext_<type>`. The English resources contain 4,844 `base` entries, 65,135 `default` entries, and 586 `affix` entries. The PT-BR scripts treat the first four bytes of `base` and `default` files as magic values, not entry counts, then infer an ascending array of 4-byte absolute offsets. Bytes between that array and the first string offset are separated as opaque data, called `hash` by the scripts, and preserved during repacking. Thus, the scripts use the pointers and locate the text, but do not decode the individual fields in that opaque region. In `base`, each entry is parsed by the scripts as a variant-type byte followed by a UTF-8 string; `0x11` is recorded separately in the CSV as the type byte before the string, not as part of the string itself. The game's semantic meaning of this type byte remains unknown.

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

In `en_us`, each `affix` ID has one `FF` variant. Other locales have multiple variants for many IDs, reflecting language-specific grammatical forms such as gender and number. For example, most `es_es` IDs have four variants, while most `de_de` IDs have six. The Nexus mod author also cited grammatical inflections as the reason for using Spanish resources for the PT-BR translation. Some type-code meanings are inferred by comparing localized text, but the game's official code definitions and variant-selection rules are unknown.

`Tipo_Variante` is a CSV column added by the unpacker: it records the one-byte value immediately before each string as two-digit hexadecimal. It is not the text or the `ID_Linha`, so preserve the original code and every variant row when repacking. The current best hypothesis is that `0x1?` denotes singular slots and `0x2?` plural slots, while final digits `1`, `2`, and `4` denote masculine, feminine, and neuter classes respectively. Spanish `affix` ID 0 has `11=motivador`, `12=motivadora`, `21=motivadores`, and `22=motivadoras`; German ID 0 has `14=Sammelndes`, a neuter singular form. Thus `14` appears to be a neuter-class singular slot and `24` its plural counterpart. Russian `base` examples support this: `14` occurs on neuter singular nouns such as `зелье`, while `24` occurs on plurals of neuter nouns such as `Лезвия` (singular `лезвие`). Spanish `affix` ID 563 has `14=Prismátique` and `24=Prismátiques`, apparently a third, neutral/inclusive form. However, the full sentence at `base` ID 1531 is tagged `14` in every locale, and some texts are identical across multiple codes; codes therefore do not always map directly to the visible grammatical form. The game's exact selection rules and an official code map remain unknown. The meaning of `FF`, used by every English `affix` ID, is also unknown.

Every `default` CSV has 65,135 parsed records. The differing `wc -l` totals count embedded line breaks inside quoted dialogue fields as physical lines. Compare CSV records with a CSV parser rather than raw line counts.

#### Extraction of the Blog-Downloaded File

The Korean archive has also been unpacked to `references/data/(ko_kr)(zxcv3428)unpacked/`. It contains 12,338 files, compared with 12,337 in the original extraction. Its localization resources keep the `en_us` filenames rather than introducing a `ko_kr` locale, but the three `en_us` string resources contain Korean text.

- `locatexts_en_us.koalocatext_base`: 4,844 entries; 164,182 bytes in the Korean archive versus 151,212 bytes in the original.
- `locatexts_en_us.koalocatext_default`: 65,135 entries; 6,722,251 bytes versus 5,529,052 bytes.
- `locatexts_en_us.koalocatext_affix`: 586 entries; 16,321 bytes versus 15,915 bytes.

The Korean extraction also contains `locatexts_en_us.characterset`, which is absent from the original. macOS `file` identifies it as an xBase compound index, but the meaning of its indexed data and the tool that created it are unknown. The inspected unpacker/repacker scripts do not create it, and the Builder documentation describes packing a file list into a PAK. The full byte-level comparison is kept in the local, Git-ignored `references/data/PAK_DIFF.md` and is not included in the public repository.

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
| Ljosalfar / Dokkalfar | 료스알브 / 도크알브 |
| Might / Finesse / Sorcery | 힘 / 재주 / 마법 |
| Detect Hidden / Mercantile / Sagecraft | 숨겨진 물건 찾기 / 상술 / 마법물품 제작 |

These are the project's standard Korean terms. Apply them consistently to the corresponding concepts in Re-Reckoning; for terms not covered by the manual, choose wording consistent with this glossary and the game's world context.

The Namu Wiki article may help clarify character, faction, and event context. It is community-maintained and is not an authoritative translation source or glossary; use the English source and in-game evidence for translation decisions, with the official Korean manual taking precedence for established Korean terms.

### Modding and Localization Workflow

The primary localization-format reference is the [Amalur PT-BR Translation and its unpacker/repacker scripts](https://www.nexusmods.com/kingdomsofamalurrereckoning/mods/67). It provides CSV unpacker/repacker scripts for the `affix`, `base`, and `default` resources. Copies of the scripts are kept in `tools/loc_toolset/`; UTF-8 string decoding was fixed in the unpackers. No-edit CSV round-trip checks passed for all three resource types. The user later reported normal Korean output during an approximately five-minute test without the characterset; full PAK and in-game validation remain pending.

#### Notes from the Nexus Posts

The author says the PT-BR translation uses the `es_es` `affix`, `base`, and `default` resources, and instructs users to set the game language to Spanish. The stated reason for replacing the Spanish slot while leaving English intact is to use grammatical variants such as gender and plural forms. This describes the PT-BR patch; determine which slot the downloaded Korean patch uses from its extracted files rather than assuming it uses the same one.

The author attributes `---- ---` output to misaligned string IDs/text pointers rather than missing font glyphs or UTF-8 encoding. Record this as the author's diagnosis, not as proof that font or character-set issues can never cause display problems. Another user reported `<Invalid Loc Key>` after an unedited CSV round trip, so perform a no-edit round-trip and in-game check for the selected locale before translating.

The author reports testing the unmodified scripts on Steam and GOG, but comments also report `$Button Title` menu failures associated with game-version compatibility. Do not assume compatibility is guaranteed across builds. A comment mentions comma-delimited CSV, while the scripts in this repository use semicolons (`;`); follow the actual local scripts and CSV headers. The author says the AI translation API script was not published; the provided Python scripts are for extraction and repacking.

#### Workflow

Translation, review, editing, and verification permissions are defined in [TRANSLATION-ROLE.md](TRANSLATION-ROLE.md).

1. Back up the original `data/patch_0.pak` in the Windows game installation. Use the game's `modding/pakfileunpacker.exe` to unpack it into a separate working directory. Create the destination directory first.
2. Find the `locatexts_<locale>.koalocatext_{affix,base,default}` files. The original has eight existing locales and no `ko_kr` locale.
3. Adding a new locale has not been verified. The Korean patch keeps the `en_us` filenames. The PT-BR distribution instructs users to replace `patch_0.pak` and switch the game to Spanish, suggesting it uses the `es_es` slot. Thai mod v1.1 instructs users to set the Steam language to Japanese, suggesting it replaces the `ja_jp` slot; the package's internal filenames have not been inspected directly. Do not assume a new locale can be added; choose an existing slot.
4. Keep the reference CSVs in `src/csv/<locale>/` unchanged. Extract each selected resource to CSV with `unpacker_base.py`, `unpacker_default.py`, or `unpacker_affix.py` from `tools/loc_toolset/`. The active Korean draft is now in `work/zh_cn/`, preserving the `zh_cn` keys, variants, and order; Japanese-derived Korean text was mapped by ID. The 140 extra `affix` variants use provisional same-ID Korean candidates and must be reviewed in `work/zh_cn/audit/affix-extra-variant-review.tsv` against other locales. The user confirmed an in-game test in the `zh_cn` setup rendered Korean without the characterset or the added `fontlist_common.koafontlist`; the `zh_cn` font list already references `notosanscjksc_regular.font`. The current test package omits the common font list and retains the Noto font resources. This verifies the tested setup; broader locale/font-role and PAK compatibility remain outstanding. The prior `work/ja_jp/` draft was deleted at the user's request on 2026-10-14. Preserve the corresponding `estrutura_hashes*.bin` sidecars in the same working directory for repacking.
5. Translate or edit only the text fields in working CSVs. Preserve row IDs, variant types, ordering, and game tokens. Run the matching `repacker_*.py`; it creates an output ending in `_NOVO.bin`.
6. Remove `_NOVO.bin` and restore the target resource's original filename, then overwrite it in a full working extraction of the game PAK. Build a new archive from a build list containing the paths of the full extracted file set. The command format is `pakfilebuilder.exe -c <build-list.txt> <new-patch_0.pak>`. Validate the separate output before replacing the original PAK.

#### Script Changes and Validation

The upstream unpackers applied `chr()` to each input byte instead of decoding strings as UTF-8, corrupting smart quotes and Korean text. In the working copies under `tools/loc_toolset/`, all three unpackers were changed to decode UTF-8; the repackers were left unchanged. No-edit CSV round trips were checked for all three resource types from both the English and Korean archives. A Korean string in a `base` CSV was also verified after binary repacking and re-extraction. The user reports normal Korean output in a brief in-game test without the characterset; full PAK building and systematic in-game testing remain incomplete.

#### Applying the Patch to the Game

The comparison between the original and blog-downloaded Korean PAK found 33 changed files shared by both archives and one Korean-only addition: three localization binaries, 30 font files, and `locatexts_en_us.characterset`. The current `zh_cn` test ZIP omits the characterset and `fontlist_common.koafontlist`; it contains the three localization binaries and 29 Noto font resources (the font plus 28 glyph pages). The user confirmed Korean displayed in-game without either omitted file in the tested setup. The refreshed ZIP has an ASCII-only English installer and passed build-time round-trip and archive checks, but has not itself been installed and retested. This does not establish compatibility across other locales, all font roles, or later game versions.

The earlier Korean patches inspected here replace the `en_us` localization resources with Korean text, overwriting the English slot. This project uses the `zh_cn` slot instead so the original English resources remain available for troubleshooting and comparison. Select Chinese (Simplified) in Steam to use the Korean patch; if a problem occurs, switch back to English to compare against the original text.

The inspected original `patch_0.pak` came from the user's Steam installation; the game's main menu showed `Version: cs:15032`. Steam BuildID `10619381` from `appmanifest_1041720.acf` is secondary provenance information. Compatibility with later game versions is unverified.

The ZIP includes `KoreanPatch.ps1`, instructions, checksums, and a `payload/` folder. It does not contain a complete PAK. On Windows, extract the entire ZIP and run the PowerShell script. If it is not already elevated, it requests administrator access before asking for the game directory once. The supported baseline is game version `cs:15032`, as noted above. The default game directory is `C:\Program Files (x86)\Steam\steamapps\common\Kingdoms of Amalur Re-Reckoning`; press Enter to use it or enter another path. Once the game folder is confirmed, the script proceeds automatically: it validates the package and game files, unpacks the user's original `data\patch_0.pak`, overlays the payload, builds and re-unpacks a separate candidate PAK, then verifies the backup before replacing the original. Set the Steam game language to Chinese (Simplified) after installation. The PowerShell window stays open at the end until a key is pressed, showing either the completion message or any error.

The ZIP was generated on 2026-10-07. The three binaries passed CSV -> binary -> CSV content comparisons (`affix` 3,451 rows, `base` 4,844, `default` 65,135). The user reports a brief in-game test with Korean output displaying normally for about five minutes without the characterset; full installer, UI, and gameplay validation remain incomplete. Translation review is also pending; the 140 extra `affix` variants remain provisional. The characterset remains omitted and should be added only if later testing shows it is needed.
