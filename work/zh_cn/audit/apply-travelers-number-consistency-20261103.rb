#!/usr/bin/env ruby

ROOT = File.expand_path("..", __dir__)
PATH = File.join(ROOT, "locatexts_zh_cn.koalocatext_default.csv")

CHANGES = {
  669 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  930 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  1206 => ["트래블러(The Travelers)들", "트래블러(The Travelers)"],
  1816 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  3689 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  7540 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  10252 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  16562 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  21528 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  21638 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  32698 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  46484 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  51845 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  52970 => ["트래블러(Travelers)들", "트래블러(Travelers)"],
  27134 => [
    "트래블러(Traveler)들의 야영지 중에선 태양 야영지가 가장 커. 아르진(Argine)이 육십여 년 전에 세웠다고 하더군.",
    "트래블러(Traveler) 야영지 중에선 태양 야영지가 가장 커. 아르진(Argine)이 육십여 년 전에 세웠다고 하더군."
  ],
  30280 => [
    "하! 트래블러(Traveler)들의 말재주를 내가 모를 줄 알았나?",
    "하! 트래블러(Traveler)의 말재주를 내가 모를 줄 알았나?"
  ],
  54294 => [
    "이안류가 트래블러(Traveler)들의 배 한 척을 우리에게 떠밀어 왔어. 트래블러(Travelers)가 있다면 건져 올릴 식량도 있겠지.",
    "이안류가 트래블러(Traveler)의 배 한 척을 우리에게 떠밀어 왔어. 트래블러(Travelers)가 있다면 건져 올릴 식량도 있겠지."
  ],
  55399 => [
    "이제 사라졌어. 완전히 사라져서 다시는 돌아오지 않겠지. 그 자리가 어떻게 될지는 아무도 몰라. 하지만 더는 트래블러(Traveler)들의 것이 아니야.",
    "이제 사라졌어. 완전히 사라져서 다시는 돌아오지 않겠지. 그 자리가 어떻게 될지는 아무도 몰라. 하지만 더는 트래블러(Traveler)의 것이 아니야."
  ]
}.transform_values { |old_text, new_text| [old_text.b, new_text.b] }.freeze

def line_ending_counts(bytes)
  crlf = bytes.scan("\r\n").length
  [crlf, bytes.count("\n") - crlf]
end

original = File.binread(PATH)
endings = line_ending_counts(original)
seen = Hash.new(0)

updated = original.each_line.map do |line|
  ending = if line.end_with?("\r\n".b)
    "\r\n".b
  elsif line.end_with?("\n".b)
    "\n".b
  else
    "".b
  end
  body = line.byteslice(0, line.bytesize - ending.bytesize)
  id, delimiter, text = body.partition(";".b)
  next line unless CHANGES.key?(id.to_i)
  raise "unexpected row format for ID #{id}" unless delimiter == ";".b

  old_text, new_text = CHANGES.fetch(id.to_i)
  if text == new_text
    seen[id.to_i] += 1
    next line
  end
  raise "unexpected current text for ID #{id}" unless text == old_text

  seen[id.to_i] += 1
  "#{id};".b + new_text + ending
end.join

missing = CHANGES.keys - seen.keys
duplicates = seen.select { |_id, count| count != 1 }.keys
raise "missing target IDs: #{missing.join(', ')}" unless missing.empty?
raise "duplicate target IDs: #{duplicates.join(', ')}" unless duplicates.empty?
raise "line endings changed" unless line_ending_counts(updated) == endings
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b) == original.start_with?("\xEF\xBB\xBF".b)

File.binwrite(PATH, updated) unless updated == original
puts "Verified #{seen.length} ID-scoped Travelers consistency edits."
