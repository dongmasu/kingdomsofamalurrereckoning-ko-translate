#!/usr/bin/env ruby

require "digest"

changes = {
  "default" => {
    "743" => [["오드위그(Odwig)", "오드윅(Odwig)"]],
    "5960" => [["성 오드윅 선교원", "성 오드윅 선교원(St. Odwig's Mission)"]],
    "6261" => [["성 오드윅 성소", "성 오드윅 성소(St. Odwig's Shrine)"]],
    "8217" => [
      ["성 오드위그의 영구 선교회", "성 오드윅 영구 선교회"],
      ["형제들은", "수도사들은"]
    ],
    "9758" => [["성 오드윅 선교회", "성 오드윅 선교회(St. Odwig's Mission)"]],
    "15715" => [["성 오드윅 선교회", "성 오드윅 선교회(St. Odwig's Mission)"]],
    "17477" => [["성 오드위그 선교회", "성 오드윅 선교회(St. Odwig's Mission)"]],
    "19920" => [["성 오드윅 선교회", "성 오드윅 선교회(St. Odwig's Mission)"]],
    "21035" => [["성 오드위그 영구 선교원", "성 오드윅 영구 선교원(St. Odwig's Perpetual Mission)"]],
    "22396" => [["성 오드위그 수도원", "성 오드윅 수도원(St. Odwig's Mission)"]],
    "24370" => [["성 오드윅 선교원", "성 오드윅 선교원(St. Odwig's Mission)"]],
    "24472" => [["성 오드윅 영구 선교원", "성 오드윅 영구 선교원(St. Odwig's Perpetual Mission)"]],
    "24853" => [["성 오드윅 영구 선교원", "성 오드윅 영구 선교원(St. Odwig's Perpetual Mission)"]],
    "25145" => [["성 오드윅 수도원의 형제들은 믿지 않아.", "성 오드윅(St. Odwig)의 수도사들은 믿지 않아."]],
    "28186" => [["성 오드윅의 형제들은", "성 오드윅(St. Odwig)의 수도사들은"]],
    "30862" => [["성 오드윅 선교원", "성 오드윅 선교원(St. Odwig's Mission)"]],
    "30932" => [["성 오드윅 선교원의 수도자들과", "성 오드윅 선교원(St. Odwig's Mission)의 수도자들과"]],
    "31115" => [["성 오드윅 선교원의 형제들도", "성 오드윅 선교원(St. Odwig's Mission)의 수도사들도"]],
    "31222" => [["성 오드윅 수도회 사람들을", "성 오드윅(St. Odwig)의 수도사들을"]],
    "32815" => [["성 오드윅 교단에", "성 오드윅(St. Odwig)의 교단에"]],
    "32930" => [["성 오드윅 측에", "성 오드윅(St. Odwig) 측에"]],
    "33395" => [["오드위그(Odwig) 수도원", "오드윅(Odwig) 수도원"]],
    "33567" => [["성 오드위그 선교원의", "성 오드윅 선교원(St. Odwig's Mission)의"]],
    "35652" => [["오드위그(Odwig)의 선교원", "오드윅(Odwig) 선교원"]],
    "36137" => [["성 오드윅 선교소", "성 오드윅 선교소(St. Odwig's Mission)"]],
    "36414" => [["성 오드윅의 숙소", "성 오드윅의 숙소(St. Odwig's Bunks)"]],
    "37257" => [
      ["성 오드위그(Odwig)", "성 오드윅(St. Odwig)"],
      ["성 오드윅(St. Odwig)가 전한", "성 오드윅(St. Odwig)이 전한"]
    ],
    "40168" => [["성 오드윅의 영구 선교원", "성 오드윅 영구 선교원(St. Odwig's Perpetual Mission)"]],
    "40592" => [["성 오드윅 선교관", "성 오드윅 선교관(St. Odwig's Mission)"]],
    "40975" => [["성 오드윅의", "성 오드윅(St. Odwig)"]],
    "41033" => [["성 오드윅 선교관", "성 오드윅 선교관(St. Odwig's Mission)"]],
    "42404" => [["성 오드윅 선교원의", "성 오드윅 선교원(St. Odwig's Mission)의"]],
    "42599" => [["성 오드윅 선교회 사람들은", "성 오드윅 선교회(St. Odwig's) 사람들은"]],
    "43429" => [["성 오드윅 영속 수도회의", "성 오드윅 영속 수도회(St. Odwig's Perpetual)의"]],
    "44292" => [["성 오드윅 예배당", "성 오드윅 예배당(St. Odwig's Chapel)"]],
    "44436" => [["성 오드윅 수도사들이", "성 오드윅(St. Odwig)의 수도사들이"]],
    "44623" => [["성 오드윅 영구 선교회의", "성 오드윅 영구 선교회(St. Odwig's Perpetual Mission)의"]],
    "48799" => [["오드위그(Odwig)", "오드윅(Odwig)"]],
    "50175" => [["세인트 오드윅의 수도사들은", "성 오드윅(St. Odwig)의 수도사들은"]],
    "51259" => [["세인트 오드윅 선교원(St. Odwig's Mission)", "성 오드윅 선교원(St. Odwig's Mission)"]],
    "56104" => [["성 오드위그(St. Odwig)", "성 오드윅(St. Odwig)"]],
    "57837" => [["성 오드윅의 벽돌", "성 오드윅(St. Odwig)의 벽돌"]],
    "59008" => [["성 오드윅 선교소에", "성 오드윅 선교소(St. Odwig's Mission)에"]],
    "59170" => [["성 오드윅 상설 선교소", "성 오드윅 상설 선교소(St. Odwig's Perpetual Mission)"]],
    "62500" => [
      ["성 오드위그(Odwig)", "성 오드윅(Odwig)"],
      ["성 오드윅(Odwig)와", "성 오드윅(Odwig)과"],
      ["성 해드윈(Hadwin)", "성 하드윈(Hadwin)"]
    ],
    "62667" => [
      ["성인 오드위그(Odwig)", "성인 오드윅(Odwig)"],
      ["오드윅(Odwig)가", "오드윅(Odwig)이"]
    ],
    "63298" => [["성 오드위그 선교회", "성 오드윅 선교회(St. Odwig's Mission)"]],
    "5734" => [["성 하드윈의 가르침", "성 하드윈(St. Hadwyn)의 가르침"]],
    "9342" => [["성 하드윈뿐이다", "성 하드윈(St. Hadwyn)뿐이다"]],
    "10609" => [["성 하드윈 불멸 선교회", "성 하드윈 불멸 선교회(St. Hadwyn's Undying Mission)"]],
    "14818" => [["하드윈이 이렇게 썼다는", "하드윈(Hadwyn)이 이렇게 썼다는"]],
    "17250" => [["해드윈(Hadwyn)의 심장을 지녔어.", "하드윈(Hadwyn) 못지않은 마음씨를 지녔어."]],
    "17362" => [["- 미사루(Mitharu)의 해드윈", "- 미사루(Mitharu)의 하드윈(Hadwyn)"]],
    "17626" => [["성 하드윈(St. Hadwyn)의 상설 선교회", "성 하드윈 상설 선교회(St. Hadwyn's Perpetual Mission)"]],
    "19862" => [["성 하드윈", "성 하드윈(St. Hadwyn)"]],
    "20461" => [["성 하드윈의 성소", "성 하드윈 성소(St. Hadwyn's Shrine)"]],
    "22462" => [["세인트 해드윈(St. Hadwyn's)", "성 하드윈(St. Hadwyn)"]],
    "24677" => [["성 하드윈(St. Hadwyn)이요?", "성 하드윈 선교회(St. Hadwyn's Mission)이요?"]],
    "31368" => [["성 하드윈 선교원에", "성 하드윈 선교원(St. Hadwyn's Mission)에"]],
    "32556" => [["성 하드윈의 불멸 선교원 가미안 수사(Brother Gamian) 기록", "성 하드윈 불멸 선교원(St. Hadwyn's Undying Mission)의 가미안 수사(Brother Gamian)가 기록하기를,"]],
    "39296" => [
      ["성 해드윈 수도원이", "성 하드윈(St. Hadwyn) 선교원이"],
      ["정직한 형제들이", "정직한 수도사들이"]
    ],
    "41687" => [["성 하드윈 선교관에서", "성 하드윈 선교관(St. Hadwyn's Mission)에서"]],
    "46365" => [
      ["성 하드윈 수도원이", "성 하드윈(St. Hadwyn) 선교원이"],
      ["그곳의 형제들은", "그곳의 수도사들은"]
    ],
    "54031" => [["성 하드윈(St. Hadwyn)은 글렌다라(Glendara)를 지나 북쪽에 있어.", "성 하드윈 선교회(St. Hadwyn's Mission)는 글렌다라(Glendara)를 지나 북쪽에 있어."]],
    "56293" => [["성 하드윈 선교회(St. Hadwin's)는", "성 하드윈 선교회(St. Hadwyn's)는"]],
    "56392" => [["성 하드윈의 성유물", "성 하드윈(St. Hadwyn)의 성유물"]],
    "59678" => [["성 하드윈 선교소에", "성 하드윈 선교소(St. Hadwyn's Mission)에"]],
    "59722" => [["성스러운 하드윈은", "의로운 성 하드윈(St. Hadwyn)은"]],
    "60814" => [["해드윈(Hadwyn)", "하드윈(Hadwyn)"]],
    "45117" => [["우도에게", "우도(Udo)에게"]],
    "11672" => [["브라더 안셀(Brother Ansel)", "안셀 수사(Brother Ansel)"]],
    "35754" => [["브라더 오드", "오드 수사(Brother Ode)"]],
    "47100" => [["브라더 울프(Wulf)", "울프 수사(Brother Wulf)"]],
    "2592" => [["울프(Wulf) 수사", "울프 수사(Brother Wulf)"]],
    "3017" => [["울프(Wulf) 수사가", "울프 수사(Brother Wulf)가"]],
    "6182" => [["가렉 형제(Brother Garek)", "가렉 수사(Brother Garek)"]],
    "13815" => [["울프(Wulf) 형제가", "울프 수사(Brother Wulf)가"]],
    "16993" => [["옥티엔(Octienne) 형제라고?", "옥티엔 형제(Brother Octienne)라고?"]],
    "21596" => [["울프(Wulf) 형제에", "울프 수사(Brother Wulf)에"]],
    "45307" => [["제자 울프(Wulf) 수사에게도", "제자 울프 수사(Brother Wulf)에게도"]],
    "57474" => [["보터 형제", "보터 수사(Brother Borter)"]],
    "57606" => [["울프(Wulf) 수사", "울프 수사(Brother Wulf)"]],
    "51594" => [
      ["브라더 안셀(Brother Ansel)", "안셀 수사(Brother Ansel)"],
      ["안셀 수사(Brother Ansel)과 나는", "안셀 수사(Brother Ansel)와 나는"]
    ]
  },
  "base" => {
    "3424" => [["성 오드위그(St. Odwig)", "성 오드윅(St. Odwig)"]],
    "3589" => [["성 오드위그(St. Odwig)", "성 오드윅(St. Odwig)"]],
    "3976" => [["오드위그(Odwig)", "오드윅(Odwig)"]],
    "1464" => [["성자 하드윈", "성 하드윈(Saint Hadwyn)"]],
    "4294" => [["성 하드윈(Hadwyn)", "성 하드윈(St. Hadwyn)"]]
  }
}

def records(bytes)
  bytes.split(/(?=^\d+;)/)
end

updated_files = {}
changes.each do |resource, by_id|
  path = "work/zh_cn/locatexts_zh_cn.koalocatext_#{resource}.csv"
  original = File.binread(path)
  abort "missing UTF-8 BOM: #{path}" unless original.start_with?("\xEF\xBB\xBF".b)
  rows = records(original)
  seen = {}
  updated = rows.map do |row|
    id = row[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]
    next row unless by_id.key?(id)
    abort "duplicate target row #{resource}:#{id}" if seen[id]
    seen[id] = true
    by_id.fetch(id).each do |old, replacement|
      old_bytes = old.encode("UTF-8").b
      replacement_bytes = replacement.encode("UTF-8").b
      old_count = row.scan(Regexp.new(Regexp.escape(old_bytes))).length
      new_count = row.scan(Regexp.new(Regexp.escape(replacement_bytes))).length
      suffix = replacement_bytes.start_with?(old_bytes) ? replacement_bytes.byteslice(old_bytes.bytesize..) : nil
      duplicate = suffix && !suffix.empty? ? replacement_bytes + suffix : nil
      if duplicate && row.include?(duplicate)
        row = row.sub(duplicate, replacement_bytes)
      elsif new_count.positive?
        next
      elsif old_count == 1
        row = row.sub(old_bytes, replacement_bytes)
      else
        abort "expected one match #{resource}:#{id}: #{old}"
      end
    end
    row
  end.join
  missing_ids = by_id.keys - seen.keys
  abort "missing target rows #{resource}: #{missing_ids.join(",")}" unless missing_ids.empty?
  abort "BOM changed: #{path}" unless updated.start_with?("\xEF\xBB\xBF".b)
  updated_files[path] = [original, updated]
end

updated_files.each do |path, (original, updated)|
  File.binwrite(path, updated)
  abort "write mismatch: #{path}" unless File.binread(path) == updated
  puts "#{path}: #{Digest::SHA256.hexdigest(original)} -> #{Digest::SHA256.hexdigest(updated)}"
end
