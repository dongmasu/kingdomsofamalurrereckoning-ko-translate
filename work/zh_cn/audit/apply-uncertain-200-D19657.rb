#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-200-D6464-D7031-20261012.jsonl"
expected = "f74359151fd8a7af569d3de96d80642898608d3c0e4006b95c362dbea19ebed6"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19657/locatexts_zh_cn.koalocatext_default.csv"

# Each replacement is confined to a source-keyed Texto cell.
edits = {
  21047 => [["용맹의 검투사들", "용맹의 집 검투사들", 1]],
  21053 => [["전쟁맹세단이여", "워스원이여", 1]],
  21055 => [["발굴자는", "탐구자는", 1]],
  21176 => [["여행자들 사이에", "트래블러들 사이에", 1]],
  21219 => [["콜로세 민족", "콜로사이족", 1]],
  21302 => [["전쟁맹세단", "워스원", 1]],
  21376 => [["전쟁맹세단", "워스원", 2]],
  21458 => [["홀의 충격파", "셉터의 충격파", 1]],
  21463 => [["자비로우신 벨렌이여", "너그러우신 벨렌이여", 1]],
  21576 => [["콜로세(Kollossae)", "콜로사이(Kollossae)", 1]],
  21609 => [["페이의 홀은", "페이의 셉터는", 1]],
  21621 => [["여행자였고", "트래블러였고", 1]],
  21634 => [["모든 여행자가", "모든 트래블러가", 1]],
  21652 => [["아르카나 학술원(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)", 1]],
  21768 => [["여행자 스토리라인", "트래블러 스토리라인", 1]],
  21891 => [["이 정교한 장부에는", "이 정교한 기록부에는", 1]],
  22220 => [["근위병", "프레토리안", 1]],
  22322 => [["탐굴자", "탐구자", 2]]
}.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }

if ENV["REVIEW_BATCH"] == "D19658"
  snapshot = "work/zh_cn/audit/uncertain-200-D7032-D8935-20261012.jsonl"
  expected = "bd60da4a965f02e5480932ee3d1dd5f4fad1a0b958f9cb7a63be5f051db2b748"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19658/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    22400 => [["선택받은 자여", "부름받은 자여", 1],
              ["콜로세(Kollossae)", "콜로사이(Kollossae)", 1]],
    22701 => [["아리오페(Ariope) 주문을 외웠어", "아리오페(Ariope) 역을 맡길 사람을 정했어", 1]],
    22781 => [["전쟁맹의 서약방패", "워스원의 서약방패병", 1]],
    22812 => [["콜로세(Kollossae)족", "콜로사이(Kollossae)족", 1]],
    23178 => [["선택받은 자여", "부름받은 자여", 1]],
    23200 => [["여행자단", "트래블러", 1]],
    23851 => [["비둘기야", "친구", 1]],
    24202 => [["교수대 끝에", "갤로우즈 엔드에", 1]],
    24716 => [["대사제의 임무 보상은 받았겠지?", "대사제의 임무를 받았겠지?", 1]],
    25450 => [["프라이드 가문과 벤전스 가문", "교만의 집과 복수의 집", 1]],
    26680 => [["콜로새의 마법", "콜로사이족의 마법", 1]],
    27560 => [["도브(Dove)", "친구", 1]],
    28170 => [["학자들(Savants)", "사반트들(Savants)", 1]],
    28307 => [["콜로새(Kollossae)", "콜로사이(Kollossae)", 1]],
    28479 => [["여행자들", "트래블러", 1]],
    28522 => [["여행자들이", "트래블러들이", 1]],
    28563 => [["비탄", "비탄의 힘", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19659"
  snapshot = "work/zh_cn/audit/uncertain-200-D8936-D9399-20261012.jsonl"
  expected = "7f1e86457949512a4f368232ab0ba6973882a3c95eea77235d4b3c8cff9ec162"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19659/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    28622 => [["도슨트(Docent)", "강사(Docent)", 1]],
    28654 => [["동료 여행자여", "동료 트래블러여", 1]],
    28827 => [["긍지의 가문(House of Pride)", "교만의 집(House of Pride)", 1]],
    28836 => [["그 더러운 여행자는", "그 더러운 트래블러는", 1]],
    28878 => [["메스그라", "미스그라", 1]],
    28883 => [["보기트(Boggart)", "보가트(Boggart)", 1],
              ["보기트가", "보가트가", 1]],
    28919 => [["여행자들(Travelers)", "트래블러(Travelers)", 1],
              ["여행자 야영지", "트래블러 야영지", 1]],
    29014 => [["워스워른(Warsworn)", "워스원(Warsworn)", 1],
              ["선서자들의 전당", "첫서약자 전당", 1]],
    29109 => [["여행자 이야기를", "트래블러 이야기를", 1]],
    29182 => [["아가씨?", "친구?", 1]],
    29205 => [["워스워른은", "워스원은", 1]],
    29243 => [["용맹의 가문(House of Valor)", "용맹의 집(House of Valor)", 1]],
    29432 => [["지팡이와 홀의", "지팡이와 셉터의", 1]],
    29481 => [["내 휘하 사람과", "내 지위의 사람과", 1]],
    29517 => [["여행자다운", "트래블러다운", 1]],
    29529 => [["슈올리아 아르카나", "스콜리아 아르카나", 1]],
    29540 => [["아가씨.", "친구.", 1]],
    29635 => [["불려온 자가", "부름받은 자가", 1]],
    29660 => [["불려온 자", "부름받은 자", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19660"
  snapshot = "work/zh_cn/audit/uncertain-200-D9400-D9820-20261012.jsonl"
  expected = "2a095c21414ea7ed74897d93b5a97ec3ebb10fa0b3ec966d728e4249798e411a"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19660/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    29685 => [["갤로스 엔드", "갤로우즈 엔드", 1]],
    29767 => [["여행자야", "트래블러야", 1]],
    29774 => [["여행자들", "트래블러들", 2]],
    29798 => [["불려온 자였어", "부름받은 자였어", 1]],
    29888 => [["클레란의 홀", "클레란의 셉터", 1]],
    29923 => [["맹세검보다", "맹세의 칼날보다", 1]],
    30058 => [["씨플랙스(1)", "시 플랙스(1)", 1]],
    30105 => [["프리즈미어 성소", "프리즈미어 예배당", 1]],
    30111 => [["콜로세는", "콜로사이족은", 1]],
    30123 => [["갤로스 엔드", "갤로우즈 엔드", 1]],
    30146 => [["발러 가문", "용맹의 집", 1]],
    30216 => [["비탄(Sorrows)", "비탄의 힘(Sorrows)", 1]],
    30233 => [["고문(Counsel)", "조언자(Counsel)", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19661"
  snapshot = "work/zh_cn/audit/uncertain-200-D9821-D10208-20261012.jsonl"
  expected = "ef0c3928aef7a95149887a0d49e4caba009a96d5656a5367c6586cf1da525ab2"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19661/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    30342 => [["여행자들", "트래블러", 1]],
    30407 => [["새터닌", "사투르닌", 1]],
    30409 => [["유언단이", "테스타먼트가", 1]],
    30452 => [["임무 현장을", "선교원을", 1]],
    30471 => [["고문관을", "조언자를", 1]],
    30479 => [["메아리돌로", "메아리석으로", 1]],
    30913 => [["서약검 커비", "맹세의 칼날 커비", 1]],
    31021 => [["도슨트야", "강사야", 1]],
    31120 => [["그의 집에", "스칼드의 집에", 1]],
    31140 => [["장로님을", "엘더스트를", 1]],
    31262 => [["회계관이", "회계원이", 1]],
    31295 => [["장로는 둘이지만", "엘더스트는 둘이지만", 1]],
    31301 => [["여행자여", "트래블러여", 1]],
    31327 => [["초대받은 자", "부름받은 자", 1]],
    31336 => [["교차점", "크로싱", 1]],
    31403 => [["오스블레이드 켄트", "맹세의 칼날 켄트", 1]],
    31430 => [["프라이토리언이", "프레토리안이", 1]],
    31492 => [["소로우즈를", "비탄의 힘을", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19662"
  snapshot = "work/zh_cn/audit/uncertain-200-D10209-D10562-20261012.jsonl"
  expected = "327493049286b34b340bd694a471e15098e4912ad7b58184da779f0276bba616"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19662/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    31496 => [["트래블러스", "트래블러", 1]],
    31549 => [["갤로스 엔드", "갤로우즈 엔드", 1]],
    31685 => [["석학들", "사반트들", 1]],
    31705 => [["하우스 오브 발라드", "발라드의 집", 1]],
    31710 => [["프라이토리언", "프레토리안", 1]],
    31747 => [["앨린 시어", "앨린 셔", 1]],
    31814 => [["여보,", "친구,", 1]],
    31853 => [["교차점의 흐름", "크로싱의 흐름", 1]],
    31883 => [["문 캠프", "문다운 야영지", 2]],
    31885 => [["하우스 오브 소로우즈", "비탄의 집", 1]],
    31902 => [["벨렌의 유언 검객", "벨렌의 테스타먼트 소속 검객", 1]],
    31919 => [["트래블러스가", "트래블러가", 1]],
    32101 => [["황금 기도용 관", "황금 기도용 서클릿", 1]],
    32147 => [["근위병은", "프레토리안은", 1]],
    32211 => [["근위대가", "프레토리안이", 1]],
    32362 => [["초대받은 자라", "부름받은 자라", 1]],
    32367 => [["갓플로", "가드플로", 1]],
    32402 => [["트래블러스인", "트래블러인", 1]],
    32426 => [["초대받은 자", "부름받은 자", 1]],
    32496 => [["비탄의 사람들을", "비탄의 힘을", 1],
              ["새터닌", "사투르닌", 2]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19663"
  snapshot = "work/zh_cn/audit/uncertain-200-D10563-D10896-20261012.jsonl"
  expected = "474edf245ee9f28d40a28ee01eafe0fe4b8a22a418c4fb911c72e85d0443be8e"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19663/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    32582 => [["초대받은 자여", "부름받은 자여", 1]],
    32720 => [["수도원 주변에서", "선교원 주변에서", 1]],
    32721 => [["초대받은 자여", "부름받은 자여", 1]],
    32740 => [["갤러스 엔드", "갤로우즈 엔드", 1]],
    32784 => [["맹세방패 페넌", "서약방패병 페난", 1]],
    32825 => [["아르케스의 머리장식", "아르케스의 서클릿", 1]],
    32923 => [["복수의 가문", "복수의 집", 1]],
    32960 => [["초대받은 자의", "부름받은 자의", 1]],
    33057 => [["복수의 가문", "복수의 집", 1]],
    33095 => [["슬픔은", "비탄의 힘은", 1]],
    33150 => [["슈콜리아 아르카나", "스콜리아 아르카나", 1]],
    33316 => [["장로가", "엘더스트가", 1]],
    33317 => [["성약단은", "테스타먼트는", 1]],
    33338 => [["슬픔의 가문으로 가는 열쇠", "비탄의 힘으로 통하는 열쇠", 1]],
    33344 => [["용맹의 가문", "용맹의 집", 1]],
    33473 => [["슬픔들이", "비탄의 힘이", 1]],
    33491 => [["갤러스 엔드", "갤로우즈 엔드", 1]],
    33498 => [["슈콜리아 아르카나", "스콜리아 아르카나", 1]],
    33503 => [["여행자들에게는", "트래블러들에게는", 1]],
    33739 => [["문 야영지에는", "달빛 야영지에는", 1]],
    33750 => [["머간이", "머건이", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19664"
  snapshot = "work/zh_cn/audit/uncertain-200-D10899-D11251-20261012.jsonl"
  expected = "e6888ce786da8cde9c3e6f6bef5f147f397b7705f54e77d7171b44d6037c0f39"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19664/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    33756 => [["계승자의 임무", "사이온의 임무", 1]],
    33778 => [["티린의 쉼터", "티린의 안식처", 1]],
    33851 => [["발라드 가문", "발라드의 집", 1]],
    33898 => [["비탄의 가문", "비탄의 집", 1]],
    33900 => [["발라드 가문", "발라드의 집", 1]],
    33921 => [["워스워른", "워스원", 1]],
    33938 => [["교차의 앰풀라", "크로싱의 앰풀라", 1]],
    33993 => [["숨은 것 탐지 기술", "숨겨진 물건 찾기 기술", 1]],
    33995 => [["그 두건", "그 천", 1]],
    34133 => [["긍지의 집(House of Pride)", "교만의 집(House of Pride)", 1],
              ["프라이드의 건달", "교만의 시종", 1]],
    34291 => [["비탄의 가문에", "비탄의 힘에", 1]],
    34295 => [["갤로우스 엔드", "갤로우즈 엔드", 1]],
    34297 => [["앨린 시어", "앨린 셔", 1]],
    34299 => [["슈콜리아 아르카나", "스콜리아 아르카나", 1]],
    34329 => [["맹세의 검", "맹세의 칼날", 1]],
    34391 => [["비탄의 가문", "비탄의 집", 1]],
    34411 => [["슈콜리아 아르카나", "스콜리아 아르카나", 1]],
    34462 => [["발라드 가문", "발라드의 집", 1]],
    34501 => [["워스워른", "워스원", 1],
              ["맹세의 검(Oathblade)", "맹세의 칼날(Oathblade)", 1]],
    34573 => [["갤로우스 엔드", "갤로우즈 엔드", 1]],
    34584 => [["비탄의 위치", "비탄의 힘이 있는 곳", 1]],
    34622 => [["플레지실드", "서약방패병", 1]],
    34636 => [["초대받은 자여", "부름받은 자여", 1]],
    34642 => [["하우스 오브 발라드", "발라드의 집", 1]],
    34649 => [["용맹의 하우스", "용맹의 집", 1]],
    34700 => [["여행자들에게 네 정체를", "트래블러들에게 아르진의 정체를", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19665"
  snapshot = "work/zh_cn/audit/uncertain-200-D11253-D11741-20261012.jsonl"
  expected = "04949e3c45bae1c2ff46a2de6a4831394053af0124c1f9de5f89ca756aba8024"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19665/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    34718 => [["귀빈을 소개합니다! 운명의 뮤즈, 각하께서 오셨습니다!",
               "존귀한 손님, 운명의 뮤즈님을 소개합니다!", 1]],
    34790 => [["연금술사는 거의 한 달 전에 떠났어.",
               "연금술사를 잃은 지도 거의 한 달 됐어.", 1]],
    34817 => [["그 성스러운 성소", "그 성스러운 곳", 1]],
    34843 => [["히에로펀트", "대사제", 1]],
    34928 => [["대부분의 탐험꾼은", "대부분의 탐구자들은", 1]],
    34957 => [["소로우즈는", "비탄의 힘은", 1]],
    35006 => [["워스워른 견습 용병으로서", "워스원 용병으로서", 1]],
    35011 => [["히에로펀트의", "대사제의", 1]],
    35027 => [["썩 꺼져, 이방인.", "이방인, 저리 가.", 1]],
    35179 => [["까마귀가 돼", "크로우가 돼", 1]],
    35219 => [["정해진 자와의 만남", "정해진 만남", 1]],
    35373 => [["검 메리", "검객 메리", 1]],
    35553 => [["미타루께서", "미사루께서", 2]],
    35567 => [["비일반", "흔하지 않음", 1]],
    35752 => [["해질녘", "이븐타이드(Eventide)", 1]],
    35764 => [["불멸자여", "늙지 않는 이여", 1]],
    35843 => [["긍지의 잭", "교만의 시종", 1]],
    36143 => [["갤로우스 엔드", "갤로우즈 엔드", 1]],
    36188 => [["근위병", "프레토리안", 1]],
    36347 => [["콜로세 경비대원", "콜로사이 경비대원", 1]],
    36380 => [["선택받은 자여", "부름받은 자여", 1],
              ["콜로세", "콜로사이", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19666"
  snapshot = "work/zh_cn/audit/uncertain-200-D11743-D12177-20261012.jsonl"
  expected = "ae73f0a6c47cb64564f71fed8fb2d0efc9d2521db99d2d24f864c351f149c232"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19666/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    36487 => [["미타루 사람들은", "미사루 신도들은", 1]],
    36542 => [["은신 탐지 기술", "숨겨진 물건 찾기 기술", 1]],
    36609 => [["슐리아 아르카나", "스콜리아 아르카나", 1]],
    36648 => [["하우스 오브 발라드", "발라드의 집", 1]],
    36655 => [["콜로세가", "콜로사이족이", 1]],
    36763 => [["갤로스 엔드", "갤로우즈 엔드", 1]],
    36767 => [["발라드 가문의", "발라드의 집의", 1]],
    36838 => [["미타루께", "미사루께", 1]],
    36938 => [["여행자들", "트래블러", 1]],
    36973 => [["콜로세에게", "콜로사이족에게", 1]],
    36993 => [["미타루가", "미사루가", 1]],
    37033 => [["여행자 야영지", "트래블러 야영지", 1]],
    37035 => [["미타루 신도", "미사루 신도", 1]],
    37138 => [["콜로세다운", "콜로사이족다운", 1]],
    37217 => [["우리 현자들을", "우리 사반트들을", 1]],
    37257 => [["미타루의", "미사루의", 1]],
    37415 => [["교수대 끝 주민들은", "갤로우즈 엔드 주민들은", 1]],
    37417 => [["발라드의 전당 사람들은", "발라드의 집 사람들은", 1]],
    37432 => [["긍지의 수호자", "교만의 수호자", 1]],
    37464 => [["여행자들 가운데", "트래블러 가운데", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19667"
  snapshot = "work/zh_cn/audit/uncertain-200-D12178-D12542-20261012.jsonl"
  expected = "58e2eb44354d3511ca231390e690c21d2407e11e2dcd37a9c1c3eab59724332d"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19667/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    37728 => [["미타루의 사제", "미사루의 사제", 1]],
    37880 => [["까마귀(Crows)", "크로우(Crows)", 1],
              ["까마귀들을", "크로우들을", 1]],
    37961 => [["내 사랑!", "친구!", 1]],
    38082 => [["발라드 가문과", "발라드의 집과", 1],
              ["메아리돌과", "메아리석과", 1]],
    38128 => [["갤로우스 엔드", "갤로우즈 엔드", 1]],
    38139 => [["라시르의", "라시어의", 1]],
    38235 => [["복수의 가문도", "복수의 집도", 1]],
    38241 => [["복수의 가문은", "복수의 집은", 1],
              ["복수의 가문에서", "복수의 집에서", 1]],
    38300 => [["초대받은 자여", "부름받은 자여", 1]],
    38382 => [["까마귀는", "크로우는", 1]],
    38744 => [["까마귀들이", "크로우들이", 1]],
    38799 => [["갤로우스 엔드", "갤로우즈 엔드", 1]],
    38845 => [["여행자들에게", "트래블러들에게", 2]],
    38934 => [["소로우즈(House of Sorrows)를", "비탄의 힘(Sorrows)을", 1]],
    39022 => [["여행자 여자", "트래블러 여자", 1]],
    39131 => [["서약방패 그룬베르크", "서약방패병 그룬베르크", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19668"
  snapshot = "work/zh_cn/audit/uncertain-200-D12543-D13086-20261012.jsonl"
  expected = "4e5ef51a298d4c94b86b48c623026bc3d1e9732be1e53d904f5ab88b5b717cfd"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19668/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    39317 => [["내 사랑.", "친구.", 1]],
    39521 => [["라시르 이쪽에서", "라시어 이쪽에서", 1]],
    39544 => [["가로우즈 엔드", "갤로우즈 엔드", 1]],
    39700 => [["복수의 가문에", "복수의 집에", 1]],
    39723 => [["용맹의 가문 챔피언", "용맹의 집 챔피언", 1]],
    39884 => [["미사란 신성의 손아귀", "미사루식 신성의 손아귀", 1]],
    39910 => [["용맹의 가문은", "용맹의 집은", 1]],
    40089 => [["플레지실드", "서약방패병", 1]],
    40370 => [["미사란 수선 안감", "미사루식 수선 안감", 1]],
    42460 => [["그림 온위그라는 여행자가", "트래블러 그림 온위그가", 1],
              ["여행자 야영지를", "트래블러 야영지를", 1]],
    42554 => [["노움 근위병들이", "노움 프레토리안들이", 1]],
    42707 => [["투아타가", "투아사가", 1],
              ["하우스 오브 소로우즈는", "비탄의 집은", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19669"
  snapshot = "work/zh_cn/audit/uncertain-200-D13087-D13409-20261012.jsonl"
  expected = "52b1d3cd174daec6e30f4c65e7d939cc1a7b93f865f927ba26076c1c3f3f3f84"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19669/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    42824 => [["상담자가 사실", "조언자가 사실", 1],
              ["콜로새의 전 프리모스", "콜로사이족의 전 프리모스", 1]],
    42882 => [["투아타는 어째서", "투아사는 어째서", 1]],
    42922 => [["교수대 끝", "갤로우즈 엔드", 1]],
    42970 => [["미사란 강화 안감", "미사루식 강화 안감", 1]],
    43094 => [["맹세검", "맹세의 칼날", 1]],
    43158 => [["선택받은 자여", "부름받은 자여", 1]],
    43168 => [["미사란 고통의 손잡이", "미사루식 고통의 손잡이", 1]],
    43232 => [["선택받은 자여", "부름받은 자여", 1]],
    43396 => [["투아타의", "투아사의", 2]],
    43468 => [["고대 미사란어", "고대 미사루어", 1]],
    43502 => [["갤로우스 엔드", "갤로우즈 엔드", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19672"
  snapshot = "work/zh_cn/audit/uncertain-200-D13410-D13763-20261012.jsonl"
  expected = "b3b7d7922b9587b5d87e4c092dd4eb8fd0c7d4ca3281b6ab7b4768de7166f119"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19672/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    43739 => [["여보.", "친구.", 1]],
    43893 => [["갈로우스 엔드", "갤로우즈 엔드", 1]],
    43964 => [["갈로우스 엔드", "갤로우즈 엔드", 1]],
    44194 => [["투아타가", "투아사가", 1]],
    44231 => [["첫 맹세자들의 전당", "첫서약자 전당", 1]],
    44259 => [["명예로운 근위병", "명예로운 프레토리안", 1]],
    44562 => [["진료 구역", "병원 구역", 1]],
    44627 => [["벨렌의 성약이", "테스타먼트가", 1]],
    44816 => [["망자 켈", "데드 켈", 1]],
    44844 => [["교수대 끝에는", "갤로우즈 엔드에는", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19673"
  snapshot = "work/zh_cn/audit/uncertain-200-D13765-D14079-20261012.jsonl"
  expected = "a44a29d2195137b56389d70343e3d813afa7996204a7b24db414b95e9706a7d8"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19673/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    45034 => [["진료 구역", "병원 구역", 1]],
    45060 => [["여행자를 봤나요", "트래블러를 봤나요", 1],
              ["여행자는 처음 봐서요", "트래블러는 처음 봐서요", 1]],
    45114 => [["히에로판트 신전", "대사제 성소", 1]],
    45127 => [["초대 서약자들의 전당", "첫서약자 전당", 1]],
    45167 => [["비탄의 가문", "비탄의 집", 1]],
    45173 => [["교차로를 찾아", "크로싱을 찾아", 1]],
    45215 => [["은신 감지 기술", "숨겨진 물건 찾기 기술", 1]],
    45222 => [["도둑맞은 물건을 사 주는 상인은", "훔친 물건을 사 주는 상인은", 1],
              ["여행자들 중", "트래블러 중", 1]],
    45305 => [["여행자들을 떠났어", "트래블러를 떠났어", 1],
              ["히에로판트의", "대사제의", 1]],
    45395 => [["히에로판트", "대사제", 3]],
    45470 => [["히에로판트", "대사제", 2]],
    45604 => [["선택받은 자여", "부름받은 자여", 1]],
    45608 => [["가 봐, 선택받은 자. 아니면", "가 봐. 아니면", 1]],
    45713 => [["발라드 가문의", "발라드의 집의", 1]],
    45739 => [["교차점은", "크로싱은", 1]],
    45768 => [["선택받은 자여", "부름받은 자여", 1]],
    45873 => [["달지는 야영지", "문다운 야영지", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19674"
  snapshot = "work/zh_cn/audit/uncertain-200-D14080-D14340-20261012.jsonl"
  expected = "4c8aff3c0a2e28f14ac355da123a92d3aa509f52a608ea2bce7285636a876b86"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19674/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    46099 => [["발라드 가문의", "발라드의 집의", 1]],
    46155 => [["지팡이와 홀 사용 시", "지팡이와 셉터 사용 시", 1]],
    46210 => [["히에로판트에게", "대사제에게", 1]],
    46271 => [["교차점은 아래에", "크로싱은 아래에", 1]],
    46279 => [["교차점에 쓰려는", "크로싱에 쓰려는", 1]],
    46652 => [["플레지실드 페넌", "서약방패병 페넌", 1]],
    46662 => [["라시르 시민", "라시어 시민", 1]],
    46666 => [["베렌의 성약은", "벨렌의 테스타먼트는", 1]],
    46803 => [["플레지실드 볼턴", "서약방패병 볼턴", 1]],
    46826 => [["교수대 끝에서의", "갤로우즈 엔드에서의", 1]],
    46887 => [["장인의 곡괭이", "명인의 자물쇠따개", 1]],
    46936 => [["초대받은 자여", "부름받은 자여", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19675"
  snapshot = "work/zh_cn/audit/uncertain-200-D14341-D14601-20261012.jsonl"
  expected = "3c0c9de36f8ad11550aca6adaafbc8fccd229195d042b571bc673fb83b230e2f"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19675/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    46986 => [["초대받은 자는", "부름받은 자는", 3]],
    47066 => [["프라에토리안 병사들이", "프레토리안들이", 1]],
    47154 => [["영리한 여행자의", "영리한 트래블러의", 1]],
    47165 => [["라시르의 자매", "라시어의 자매", 1]],
    47168 => [["여행자의 슬루프선", "트래블러의 슬루프선", 1]],
    47215 => [["완벽한 미사루 마법 결속구", "완벽한 미타란 마법 결속구", 1]],
    47456 => [["라시르에서는", "라시어에서는", 1]],
    47618 => [["위대한 콜로세들이야", "위대한 콜로사이족이야", 1]],
    47752 => [["콜로세의", "콜로사이족의", 1],
              ["콜로세가", "콜로사이족이", 1]],
    47788 => [["선택받은 자여", "부름받은 자여", 1]],
    47790 => [["발러 투기장", "용맹 투기장", 1]],
    47813 => [["시데에", "시드에", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19676"
  snapshot = "work/zh_cn/audit/uncertain-200-D14604-D14882-20261012.jsonl"
  expected = "71486bee8158b2a50522eb3561cf9e06c68575f80a33f3e196c7b4cddc1b9f78"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19676/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    48025 => [["라시르에서", "라시어에서", 1]],
    48040 => [["선택받은 자여", "부름받은 자여", 1]],
    48047 => [["교수대 끝에", "갤로우즈 엔드에", 1]],
    48054 => [["여행자들", "트래블러", 1]],
    48069 => [["콜로세가", "콜로사이족이", 1]],
    48313 => [["교차로", "크로싱", 1]],
    48330 => [["첫 서약자들의 전당", "첫서약자 전당", 1]],
    48400 => [["갤로스 엔드에서", "갤로우즈 엔드에서", 1]],
    48511 => [["고대 미사루어", "고대 미타란어", 1]],
    48521 => [["선택받은 자에게", "부름받은 자에게", 1]],
    48529 => [["선택받은 자.", "부름받은 자.", 1]],
    48592 => [["선택받은 자야", "부름받은 자야", 1]],
    48628 => [["모든 여행자가", "모든 트래블러가", 1]],
    48667 => [["라시르를", "라시어를", 1]],
    48690 => [["명인의 곡괭이", "명인의 자물쇠따개", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19677"
  snapshot = "work/zh_cn/audit/uncertain-200-D14883-D15163-20261012.jsonl"
  expected = "efd24ede4ad31e6359d333ff06739c974febd229b3d8b281e3019fabacc97837"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19677/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    48727 => [["미사루 신비 결속구", "미타란 신비 결속구", 1]],
    48866 => [["서약검으로서", "맹세의 칼날로서", 1]],
    48988 => [["여행자 슬루프선", "트래블러 슬루프선", 1]],
    49038 => [["첫 번째 검 브론웬", "제일검 브론웬", 1]],
    49045 => [["교차점에서", "크로싱에서", 1]],
    49085 => [["케이프 솔러스", "케이프 솔라스", 1]],
    49280 => [["미사루 신비 결속구", "미타란 신비 리벳", 1]],
    49526 => [["미사루 경화 손잡이", "미타란 경화 손잡이", 1]],
    49565 => [["현자들에게", "사반트들에게", 1]],
    49583 => [["투아타 사이에", "투아사 사이에", 1],
              ["하우스 오브 소로우를", "비탄의 집을", 1],
              ["새터닌이", "사투르닌이", 1]],
    49616 => [["히에로판트가", "대사제가", 1]],
    49623 => [["근위병", "프레토리안", 1]],
    49639 => [["케이프 솔러스", "케이프 솔라스", 1]],
    49724 => [["케이프 솔러스", "케이프 솔라스", 1]],
    49773 => [["히에로판트는", "대사제는", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19678"
  snapshot = "work/zh_cn/audit/uncertain-200-D15164-D15421-20261012.jsonl"
  expected = "69c9653b0e7383cdb3d10cb10f837130eaf9022b0fcd50c549570593df73dbd2"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19678/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    49794 => [["콜로세 극작가", "콜로사이 극작가", 1]],
    49831 => [["워스워른에게", "워스원에게", 1]],
    49901 => [["서약검이여", "맹세의 칼날이여", 1]],
    50118 => [["히에로판트의", "대사제의", 1],
              ["선캠프로", "태양 야영지(Sun Camp)로", 2],
              ["여행자들과", "트래블러들과", 1]],
    50148 => [["선택받은 자여", "부름받은 자여", 1]],
    50162 => [["새터닌이", "사투르닌이", 1]],
    50193 => [["선택받은 자는", "부름받은 자는", 1]],
    50204 => [["친위병", "프레토리안", 1]],
    50253 => [["불려온 자인", "부름받은 자인", 1]],
    50331 => [["여행자에", "트래블러에", 1]],
    50342 => [["완벽한 미사루제 파괴형 손잡이", "흠 없는 미타란 피해 손잡이", 1]],
    50363 => [["워스워른은", "워스원은", 1]],
    50506 => [["트래블러스의", "트래블러의", 1]],
    50508 => [["불려온 자여", "부름받은 자여", 1],
              ["아르케스의 관", "아르케스의 서클릿", 1]],
    50544 => [["트래블러스", "트래블러", 1]],
    50563 => [["콜로세(Kollossae)", "콜로사이(Kollossae)", 1],
              ["불려온 자(Beckoned)", "부름받은 자(Beckoned)", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19679"
  snapshot = "work/zh_cn/audit/uncertain-200-D15422-D15669-20261012.jsonl"
  expected = "fb0b1e332fc51a0521e3358e892a16eafd736ab2097bd9ecfd1d384c67b33413"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19679/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    50794 => [["미사루 흑단", "미타란 흑단", 1]],
    50891 => [["완벽한 미사란", "완벽한 미타란", 1]],
    50902 => [["미사란 사람", "미타란 사람", 1]],
    50935 => [["콜로세에 관하여", "콜로사이에 관하여", 1]],
    50949 => [["콜로세 수습생", "콜로사이 대역", 1]],
    51018 => [["완벽한 미사란", "완벽한 미타란", 1]],
    51031 => [["플레지실드(Pledgeshield)", "서약방패병(Pledgeshield)", 1]],
    51107 => [["진실한 맹세자(Truesworn)", "트루스원(Truesworn)", 1]],
    51330 => [["여행자(Traveler)", "트래블러(Traveler)", 1]],
    51335 => [["초대받은 자(Beckoned)", "부름받은 자(Beckoned)", 1]],
    51339 => [["워스워른", "워스원", 2]],
    51350 => [["워스워른(Warsworn)", "워스원(Warsworn)", 1],
              ["여행자(Travelers)", "트래블러(Travelers)", 1]],
    51422 => [["히에로판트(Hierophant)", "대사제(Hierophant)", 1]],
    51424 => [["여행자의 슬루프선", "트래블러 슬루프선", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19680"
  snapshot = "work/zh_cn/audit/uncertain-200-D15670-D15918-20261012.jsonl"
  expected = "e5d252ffa220e785100a636f85f6caaee35200b9aacbc36f775be8e488d7f4ab"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19680/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    51447 => [["여행자(Traveler)", "트래블러(Traveler)", 1]],
    51478 => [["비탄(Sorrows)", "비탄의 힘(Sorrows)", 1]],
    51492 => [["미사루(Mitharu)", "미타란(Mitharan)", 1]],
    52155 => [["불려온 자(The Beckoned)", "부름받은 자(The Beckoned)", 1]],
    52221 => [["불려온 자여", "부름받은 자여", 1]],
    52234 => [["여행자들(Travelers)", "트래블러들(Travelers)", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19681"
  snapshot = "work/zh_cn/audit/uncertain-200-D15919-D16178-20261012.jsonl"
  expected = "85e53ebddbeb39f676949ca542353907e71df47aad2b0603d482fe17d148bb87"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19681/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    52430 => [["불려온 자여", "부름받은 자여", 1]],
    52479 => [["불려온 자", "부름받은 자", 1]],
    52546 => [["불려온 자가", "부름받은 자가", 1]],
    52911 => [["맹세의 검(Oathblade)", "맹세의 칼날(Oathblade)", 1]],
    53083 => [["플레지실드(Pledgeshield)", "서약방패병(Pledgeshield)", 1]],
    53218 => [["여행자였지", "트래블러였지", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19682"
  snapshot = "work/zh_cn/audit/uncertain-200-D16179-D16431-20261012.jsonl"
  expected = "abbb7510955d0cf437dafa785ca09670f3ca04c5c08fa499b0ddab2e9783140c"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19682/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    53370 => [["플레지실드(Pledgeshields)", "서약방패병(Pledgeshields)", 1]],
    53390 => [["여행자로", "트래블러로", 2]],
    53538 => [["우리 사명이 다시 온전해졌다", "우리 선교회가 다시 온전해졌다", 1]],
    53542 => [["홀(Sceptres)", "셉터(Sceptres)", 1]],
    53738 => [["유언단(Testament)", "테스타먼트(Testament)", 1]],
    53904 => [["맹세의 검(Oathblade)", "맹세의 칼날(Oathblade)", 1]],
    54069 => [["교수대 끝(Gallows End)", "갤로우즈 엔드(Gallows End)", 1]],
    54080 => [["고대 페이 순례자 조직", "고대 페이 숙련자 조직", 1]],
    54082 => [["학자 에이선 엔가르(Savant Aethan Engar)",
               "사반트 에이선 엔가르(Savant Aethan Engar)", 1]],
    54092 => [["이 홀을 증류기", "이 셉터를 증류기", 1]],
    54101 => [["콜로사이(Kollossae)는", "콜로사이족(Kollossae)은", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19683"
  snapshot = "work/zh_cn/audit/uncertain-200-D16432-D16680-20261012.jsonl"
  expected = "510e2de5eec3d3f70ecd22c480768fedf639a1544604c652d6105000d271e6d0"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19683/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    54202 => [["설교당(Oratory)", "기도소(Oratory)", 1]],
    54204 => [["자, 가자.", "자, 가자, 친구.", 1]],
    54250 => [["여행자들(Travelers)", "트래블러들(Travelers)", 1]],
    54254 => [["기꺼이 택하는 수단", "즐겨 택하는 수단", 1]],
    54262 => [["+1 상업", "+1 상술", 1]],
    54294 => [["여행자(Traveler)들의", "트래블러(Traveler)들의", 1],
              ["여행자가 있다면", "트래블러가 있다면", 1]],
    54331 => [["줏대 없는 여행자(Travelers) 너희", "줏대 없는 트래블러들(Travelers)인 너희", 1]],
    54391 => [["모든 여행자(Travelers)", "모든 트래블러(Travelers)", 1],
              ["모든 여행자를", "모든 트래블러를", 1]],
    54468 => [["여행자 야영지", "트래블러 야영지", 1]],
    54507 => [["트루스워른(Truesworn)", "트루스원(Truesworn)", 1]],
    54520 => [["마법부여 법정(Court of Enchantments)", "마법부여 궁정(Court of Enchantments)", 1]],
    54541 => [["어둠 속에서 우리를 바라보며 미소 지었다", "어둠 속에서 바라보며 미소를 짓곤 했다", 1]],
    54628 => [["크레이오스가 처음으로 콜로새(Kollossae)에게 그들의 운명을 보여 준 이래",
               "크레이오스가 처음으로 콜로사이족(Kollossae)의 운명을 백성에게 보여 준 이래", 1]],
    54657 => [["여행자(Travelers)", "트래블러(Travelers)", 1]],
    54670 => [["도크알파르(Dokkalfar)", "도크알브(Dokkalfar)", 1]],
    54678 => [["여행자들", "트래블러들", 1]],
    54764 => [["콜로새(Kollossae)", "콜로사이(Kollossae)", 1]],
    54765 => [["상업 기술(Mercantile)", "상술 기술(Mercantile)", 1]],
    54788 => [["도크알파르(Dokkalfar)", "도크알브(Dokkalfar)", 1]],
    54808 => [["슬픔의 집(House of Sorrows)", "비탄의 힘(Sorrows)", 1]],
    54820 => [["콜로새(Kollossae)의 생명", "콜로사이족(Kollossae)의 생명", 1],
              ["콜로새의 운명 자체에", "콜로사이족의 운명 자체에", 1],
              ["불려온 자와", "부름받은 자와", 1]],
    54863 => [["불려온 자(Beckoned)", "부름받은 자(Beckoned)", 1]],
    54886 => [["비자레인(Bisarane)이 비애의 집(the Sorrows)을 찾는 데 필요한 열쇠",
               "비자레인(Bisarane)이 비탄의 힘(Sorrows)을 찾는 데 필요한 열쇠", 1]],
    54962 => [["콜로새(Kollossae)의 정수", "콜로사이족(Kollossae)의 정수", 1]],
    55063 => [["완벽한 미사루의 경화된 결속구(Flawless Mitharan Hardened Bindings)",
               "흠 없는 미타란 경화 결속구(Flawless Mitharan Hardened Bindings)", 1]],
    55090 => [["히에로판트(Hierophant)", "대사제(Hierophant)", 1],
              ["히에로판트가", "대사제가", 1],
              ["여행자들(Travelers)", "트래블러들(Travelers)", 1],
              ["선 캠프(Sun Camp)", "태양 야영지(Sun Camp)", 1]],
    55119 => [["베렌의 유언(Belen's Testament)", "벨렌의 테스타먼트(Belen's Testament)", 1]],
    55124 => [["여행자들(Travelers)", "트래블러들(Travelers)", 1]],
    55151 => [["워스워른(Warsworn)", "워스원(Warsworn)", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19684"
  snapshot = "work/zh_cn/audit/uncertain-200-D16681-D16924-20261012.jsonl"
  expected = "57e68ffa0dc9e2e5e8601bd7dca04e9b8b6d2ebd049a5d3c3c143c910c4562e0"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19684/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    55237 => [["워스워른(Warsworn)", "워스원(Warsworn)", 1],
              ["워스워른이", "워스원이", 1],
              ["트루스워른(Truesworn)", "트루스원(Truesworn)", 1]],
    55280 => [["여행자들(Travelers)", "트래블러들(Travelers)", 1]],
    55295 => [["전쟁의 맹세자들(Warsworn)", "워스원(Warsworn)", 1]],
    55311 => [["프레토리안 근위대(Praetorians)", "프레토리안(Praetorians)", 1]],
    55343 => [["운명의 직조망(The Weave)", "운명의 태피스트리(The Weave)", 1]],
    55386 => [["완벽한 미사루", "흠 없는 미타란", 1]],
    55444 => [["갤로스 엔드(Gallows End)", "갤로우즈 엔드(Gallows End)", 1]],
    55464 => [["벨렌의 성약 소환사", "벨렌의 테스타먼트 소환사", 1]],
    55542 => [["워스워른(Warsworn)", "워스원(Warsworn)", 1]],
    55578 => [["플레지실드(Pledgeshield)", "서약방패병(Pledgeshield)", 1]],
    55627 => [["완벽한 미사란", "흠 없는 미타란", 1]],
    55715 => [["후계자(Scion)", "사이온(Scion)", 1]],
    55739 => [["여행자들의 달빛 야영지(Travelers Moon Camp)",
               "트래블러 달빛 야영지(Travelers Moon Camp)", 1]],
    55846 => [["벨렌의 성약(Belen's Testament)",
               "벨렌의 테스타먼트(Belen's Testament)", 1]],
    55851 => [["미사란", "미타란", 1]],
    55857 => [["성약의 교단(Testament)", "테스타먼트 교단(Testament)", 1]],
    55862 => [["퍼스트스원의 회관(Hall of the Firstsworn)",
               "첫서약자 전당(Hall of the Firstsworn)", 1]],
    55927 => [["히에로판트 성소(Hierophant Shrine)",
               "대사제 성소(Hierophant Shrine)", 1]],
    55933 => [["베일러(Balor)", "발로르(Balor)", 1]],
    55963 => [["워스워른 계급", "워스원 계급", 1]],
    55978 => [["내 사랑.", "친구.", 1]],
    55981 => [["워스워른(Warsworn)", "워스원(Warsworn)", 1],
              ["워스워른의 이름", "워스원의 이름", 1],
              ["플레지실드(Pledgeshield)", "서약방패병(Pledgeshield)", 1]],
    56009 => [["히에로판트(Hierophant)", "대사제(Hierophant)", 1]],
    56015 => [["호스피탈리스 병영(Hospitalis Quarters)",
               "호스피탈리스 병원 구역(Hospitalis Quarters)", 1]],
    56025 => [["프라이토리안(Praetorian)", "프레토리안(Praetorian)", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19685"
  snapshot = "work/zh_cn/audit/uncertain-200-D16925-D17195-20261012.jsonl"
  expected = "1ee407c121e5e51e8ee8402264a4a7c875b95293cd7137ec5754af97e3a6a820"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19685/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    56278 => [["저 상자들 결계를 해제해 볼 생각", "저 상자들의 마법을 해제해 볼 생각", 1]],
    56279 => [["도칼파르 마법사", "도크알브 마법사", 1]],
    56303 => [["여보.", "친구.", 1]],
    56344 => [["부활", "리바이벌(Revival)", 1]],
    56351 => [["교수대 끝자락(Gallows End)", "갤로우즈 엔드(Gallows End)", 1]],
    56400 => [["슬픔의 무리(the Sorrows)", "비탄의 힘(the Sorrows)", 1]],
    56402 => [["용맹의 전당 페이 챔피언", "페이 용맹의 챔피언", 1]],
    56423 => [["전쟁맹세단의 첫 일원", "워스원의 첫 일원", 1]],
    56475 => [["전쟁맹세단 열쇠", "워스원 열쇠", 1]],
    56521 => [["슬픔의 전당", "비탄의 집", 1]],
    56537 => [["후계자(Scion)", "사이온(Scion)", 1]],
    56551 => [["후계자(Scion)", "사이온(Scion)", 1]],
    56588 => [["전쟁맹세단", "워스원", 1]],
    56638 => [["새 후계자", "새 사이온", 1]],
    56648 => [["여행자 등급", "트래블러 계급", 1]],
    56657 => [["계절의 전당 안내자", "계절의 집 안내자", 1]],
    56668 => [["퍼스트스원(Firstsworn)", "첫서약자(Firstsworn)", 1]],
    56704 => [["전쟁맹세단 영웅들", "워스원 영웅들", 1]],
    56749 => [["조툰 룬로드", "요툰 룬로드", 1]],
    56782 => [["퍼스트스원의 전당", "첫서약자 전당", 1]],
    56826 => [["후계자(Scion)", "사이온(Scion)", 1]],
    56869 => [["여행자의 적", "트래블러의 적", 1]],
    56963 => [["완벽한 미사란", "흠 없는 미타란", 1]],
    57068 => [["워스워른 전사", "워스원 전사", 1],
              ["플레지실드 맥고완(Pledgeshield McGowan)",
               "서약방패병 맥고완(Pledgeshield McGowan)", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19686"
  snapshot = "work/zh_cn/audit/uncertain-200-D17196-D17460-20261012.jsonl"
  expected = "951e5eb51c80b3210737c435b1a94c20fb4fbc1638022f64566b9378b38b54ff"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19686/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    57100 => [["벨렌의 유언장", "벨렌의 테스타먼트", 1]],
    57153 => [["완벽한 미사란", "흠 없는 미타란", 1]],
    57159 => [["소로우즈(Sorrows)", "비탄의 힘(Sorrows)", 1]],
    57209 => [["후계자가", "사이온이", 1]],
    57231 => [["소로우즈", "비탄의 힘", 1]],
    57253 => [["고대 미사란어", "고대 미타란어", 1]],
    57306 => [["교수대 끝자락 섬", "갤로우즈 엔드 섬", 1]],
    57337 => [["기도원의 북동쪽", "기도소의 북동쪽", 1]],
    57416 => [["교수대 끝자락", "갤로우즈 엔드", 1]],
    57497 => [["교수대 끝자락", "갤로우즈 엔드", 1]],
    57548 => [["타이레니움", "티레니움", 1]],
    57553 => [["완벽한 미사란", "흠 없는 미타란", 1]],
    57593 => [["서약 방패단의 갑옷", "서약방패병들의 갑옷", 1]],
    57628 => [["프리맨이", "프리맨(Freemen)이", 1]],
    57705 => [["서약 방패의 계급", "서약방패병 계급", 1]],
    57737 => [["새로운 이야기의 계절", "새로운 전승의 계절", 1]],
    57792 => [["까마귀단이", "크로우즈(The Crows) 팀이", 1]],
    57883 => [["모든 여행자 위에", "모든 트래블러 위에", 1]],
    57907 => [["도칼파르", "도크알브", 1]],
    57909 => [["후계자라", "사이온이라", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

if ENV["REVIEW_BATCH"] == "D19687"
  snapshot = "work/zh_cn/audit/uncertain-200-D17461-D17707-20261012.jsonl"
  expected = "d473eca9ecfee850deeb8b512542467af7f5f8ad6b120f738d5c460267b6e63e"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19687/locatexts_zh_cn.koalocatext_default.csv"
  edits = {
    57932 => [["페이랜드", "패란즈", 1]],
    57933 => [["버언에는", "번(The Burn)에는", 1]],
    57937 => [["모든 여행자가", "모든 트래블러가", 1]],
    57947 => [["까마귀단에", "크로우즈(The Crows) 팀에", 1]],
    58002 => [["너는 후계자다", "너는 사이온(Scion)이다", 1]],
    58032 => [["까마귀단은", "크로우즈(The Crows) 팀은", 1]],
    58177 => [["베니스", "벤리스", 2]],
    58186 => [["앨린 쉬어", "앨린 시어", 1]],
    58209 => [["서약방패 계급", "서약방패병 계급", 1]],
    58269 => [["여행자 야영지", "트래블러 야영지", 1]],
    58270 => [["도칼파르", "도크알브", 1]],
    58384 => [["완벽한 미사루식", "흠 없는 미타란", 1]],
    58482 => [["비탄의 가문", "비탄의 집", 1]],
    58490 => [["콜로새", "콜로사이족", 1]],
    58499 => [["도슨트", "강사", 1]],
    58512 => [["자유민", "프리맨(Freemen)", 1]],
    58518 => [["완벽한 미사루식", "흠 없는 미타란", 1]],
    58546 => [["트래블러스가 되는 법", "트래블러가 되는 법", 1]],
    58555 => [["베일렌 결사", "벨렌의 테스타먼트", 1]],
    58575 => [["발러의 정수", "용맹의 정수", 1]],
    58579 => [["교수대의 끝", "갤로우즈 엔드", 1]]
  }.transform_values { |pairs| pairs.map { |old, new_text, count| [old.b, new_text.b, count] } }
end

def records(bytes)
  header = +"".b
  rows = []
  bytes.each_line do |line|
    id = line[/\A(\d+);/n, 1]&.to_i
    if id
      rows << [id, line.dup]
    elsif rows.empty?
      header << line
    else
      rows.last[1] << line
    end
  end
  [header, rows]
end

def texto(record)
  CSV.parse_line(record.dup.force_encoding("UTF-8"), col_sep: ";", row_sep: :auto).fetch(1)
rescue CSV::MalformedCSVError
  raw = record.sub(/\A\d+;/n, "").sub(/\r?\n\z/n, "")
  raw = raw[1...-1].gsub('""', '"') if raw.start_with?('"') && raw.end_with?('"')
  raw.force_encoding("UTF-8")
end

def transform(bytes, edits)
  header, rows = records(bytes)
  header + rows.map do |id, record|
    next record unless edits.key?(id)
    edits.fetch(id).each do |old, new_text, count|
      abort "occurrence count mismatch #{id}" unless record.scan(old).size == count
      record = record.gsub(old, new_text)
    end
    record
  end.join
end

source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
entries = File.foreach(snapshot).map { |line| JSON.parse(line) }
abort "snapshot keys mismatch" unless entries.size == 200 &&
  entries.map { |entry| entry.fetch("id") }.uniq.size == 200 &&
  (edits.keys - entries.map { |entry| entry.fetch("id") }).empty?
{
  "en" => "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "ja" => "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "zh" => "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
  "ko" => path
}.each do |locale, source_path|
  indexed = records(File.binread(source_path))[1].to_h
  mismatches = entries.reject do |entry|
    row = indexed[entry.fetch("id")]
    row && texto(row) == entry.fetch(locale)
  end
  abort "#{locale} key mismatch: #{mismatches.first&.fetch("id")}" unless mismatches.empty?
end
FileUtils.mkdir_p(File.dirname(backup))
if File.exist?(backup)
  abort "backup mismatch" unless File.binread(backup) == source
else
  File.binwrite(backup, source)
end
abort "backup mismatch" unless File.binread(backup) == source
updated = transform(source, edits)
inverse = edits.transform_values { |pairs| pairs.map { |old, new_text, count| [new_text, old, count] } }
abort "inverse failed" unless transform(updated, inverse) == source
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
shape = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size, records(bytes)[1].map(&:first)] }
abort "CSV shape changed" unless shape.call(source) == shape.call(updated)
old_rows = records(source)[1].to_h
new_rows = records(updated)[1].to_h
old_rows.each do |id, record|
  expected_record = edits.key?(id) ? transform(record, { id => edits.fetch(id) }) : record
  abort "unexpected row change #{id}" unless expected_record == new_rows.fetch(id)
end
File.binwrite(path, updated)
puts "checked=200 accepted=#{edits.size}"
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup}"
puts "four_locale_exact=200 each inverse/BOM/endings/order/untouched_bytes=OK"
