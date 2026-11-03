# frozen_string_literal: true

path = File.expand_path("../locatexts_zh_cn.koalocatext_default.csv", __dir__)
replacement = "동전의 잭 크릴가린(Crilgarin, Knave of Coins)".b

changes_by_id = {}
%w[
  12388 14181 14630 14680 16110 16849 16890 18512 21264 23460
  26496 28374 29873 32244 49361 51009 53769 55915 62179 64624
].each do |id|
  changes_by_id[id] = ["동전의 잭, 크릴가린(Crilgarin)".b, replacement]
end
changes_by_id["12443"] = ["동전의 건달 크릴가린(Crilgarin, Knave of Coins)".b, replacement]
changes_by_id["18580"] = ["금화의 건달 크릴가린(Crilgarin, Knave of Coins)".b, replacement]
changes_by_id["38270"] = ["동전의 잭 크릴가린(Crilgarin, Knave of Coins)".b, replacement]
changes_by_id["40661"] = ["크릴가린(Crilgarin), 동전의 잭".b, replacement]
changes_by_id["58850"] = ["크릴가린(Crilgarin), 동전의 잭".b, replacement]
changes_by_id["60793"] = ["크릴가린(Crilgarin), 동전의 잭(Knave of Coins)".b, replacement]

changes_by_id["8269"] = [
  "크릴가린(Crilgarin)은 별 야영지(Star Camp)의 훌륭한 지도자야. 여기 있는 대부분은 트래블러(Travelers)에 갓 들어온 사람들이고, 그녀는 그들을 위험에서 이끌어 주지.".b,
  "크릴가린(Crilgarin)은 별 야영지(Star Camp)의 훌륭한 지도자야. 여기 있는 대부분은 트래블러(Travelers)에 갓 들어온 사람들이고, 그녀는 그들이 위험에 빠지지 않도록 이끌어 주지.".b
]
changes_by_id["12905"] = [
  "난 잠시 자리를 비울게, 친구. 하지만 머지않아 다시 보게 될 거야. 두고 봐. 크릴가린(Crilgarin)에게 안부 전해 줘.".b,
  "난 잠시 잠적할게, 친구. 하지만 머지않아 다시 보게 될 거야. 두고 봐. 크릴가린(Crilgarin)에게 안부 전해 줘.".b
]
changes_by_id["14740"] = [
  "트래블러(Travelers)들에 날 끌어들인 크릴가린(Crilgarin)이 그림 온위그(Grim Onwig)가 임무 중 실종됐다고 알려 왔다. 그의 마지막 행적을 찾아 무슨 일이 있었는지 알아보고, 필요하면 돕라는 임무를 받았다.".b,
  "트래블러(Travelers)에 나를 영입한 그림 온위그(Grim Onwig)가 임무 중 실종됐다고 크릴가린(Crilgarin)이 알려 왔다. 그의 마지막 행적을 찾아 무슨 일이 있었는지 알아보고, 필요하면 도우라는 임무를 받았다.".b
]
changes_by_id["17971"] = [
  "크릴가린(Crilgarin)과 대화".b,
  "크릴가린(Crilgarin)과 대화하기".b
]
changes_by_id["24134"] = [
  "아르진(Argine)이 아무런 경비도 없이 날 초대했을 리 없어. 크릴가린(Crilgarin)이 경비를 지나도록 도와줄 테니, 그 틈에 서신(Missives)을 그녀에게 몰래 심어.".b,
  "아르진(Argine)이 아무런 경비도 없이 날 초대했을 리 없어. 크릴가린(Crilgarin)이 경비를 지나도록 도와줄 테니, 그 틈에 그녀의 소지품에 서신(Missives)을 몰래 넣어 둬.".b
]
changes_by_id["43767"] = [
  "크릴가린(Crilgarin)으로 돌아가기".b,
  "크릴가린(Crilgarin)에게 돌아가기".b
]
changes_by_id["49052"] = [
  "태양 야영지(Sun Camp)에서 일어난 참사가 우리에게 닥치지 않도록 하러 왔다고 하더군. 하지만 그녀는 크릴가린(Crilgarin)이 아니야.".b,
  "태양 야영지(Sun Camp)에서 일어난 참사가 우리에게 닥치지 않도록 하러 왔다고 하더군. 하지만 그녀는 크릴가린과는 달라.".b
]
changes_by_id["62283"] = [
  "당분간 지하로 갈 거야. 그래도 머지않아 다시 볼 테니 믿어. 아, 부탁 좀 하자. 크릴가린(Crilgarin)에게 내가 나갔다고 전해 줘. 잘 부탁해.".b,
  "당분간 잠적할게. 그래도 머지않아 다시 볼 테니 믿어. 아, 부탁 좀 하자. 크릴가린(Crilgarin)에게 내가 나갔다고 전해 줘. 잘 부탁해.".b
]

original = File.binread(path)
seen = Hash.new(0)
updated_lines = original.each_line.map do |line|
  ending = if line.end_with?("\r\n".b)
    "\r\n".b
  elsif line.end_with?("\n".b)
    "\n".b
  else
    "".b
  end
  body = line.byteslice(0, line.bytesize - ending.bytesize)
  id, delimiter, text = body.partition(";".b)
  next line unless changes_by_id.key?(id)

  raise "unexpected row format for ID #{id}" unless delimiter == ";".b
  expected, new_text = changes_by_id.fetch(id)
  if text == new_text
    seen[id] += 1
    next line
  end
  raise "unexpected current text for ID #{id}" unless text == expected

  seen[id] += 1
  "#{id};".b + new_text + ending
end

missing = changes_by_id.keys - seen.keys
duplicates = seen.select { |_id, count| count != 1 }.keys
raise "missing target IDs: #{missing.join(', ')}" unless missing.empty?
raise "duplicate target IDs: #{duplicates.join(', ')}" unless duplicates.empty?

File.binwrite(path, updated_lines.join)
puts "Updated #{seen.length} ID-validated Crilgarin rows."
