#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19889/locatexts_zh_cn.koalocatext_default.csv"
expected = "3f5ffd2a45e0e18f4b1986f0c6213a51726289fad8e9adba0d0b453a30e7b603"
range = 40701..40750
edits = {
  40704 => ["완벽한 미사란 연마 손잡이".b, "흠 없는 미타란 연마 손잡이".b],
  40721 => [
    "네가 가스크를 몰아내고 야영지를 비워준 덕분에, 이브닝타이드의 생존자들이 이곳에서 재건을 시작할 수 있을지도 몰라.".b,
    "네가 가스크를 몰아내고 야영지를 비워준 덕분에, 이븐타이드의 생존자들이 이곳에서 재건을 시작할 수 있을지도 몰라.".b
  ],
  40723 => [
    "사그렐, 우리 선택을 좀 도와줄래? 크레스와 난 누가 아가씨의 진정한 투사가 되어야 할지 다투고 있었어.".b,
    "사그렐, 우리 선택을 좀 도와줄래? 크레스와 난 누가 시녀의 진정한 수호자가 되어야 할지 다투고 있었어.".b
  ],
  40732 => [
    "해냈구나, 투사! 앞으로도 우리 가게를 애용해 주면 좋겠어. 네 칭호를 빼앗으려는 배고픈 도전자들이 얼마든지 기다리고 있을 테니까!".b,
    "해냈구나, 투사! 앞으로도 우리 가게를 애용해 주면 좋겠어. 네 칭호를 노리는 야심 찬 도전자들이 얼마든지 기다리고 있을 테니까!".b
  ],
  40735 => [
    "포모러스 휴그스 교수님! 영혼의 샘은 그분의 평생을 바친 연구입니다.".b,
    "포모러스 휴그 교수님! 영혼의 샘은 그분이 평생을 바친 연구입니다.".b
  ],
  40743 => [
    "자네는 미스로스에 온 지 얼마 안 됐구먼, 오랜 친구. 아니었다면 오렐라 액슬을 절대 믿지 않았겠지.".b,
    "오랜 친구, 자네는 미스로스에 온 지 얼마 안 됐구먼. 그렇지 않았다면 오렐라 액슬은 절대 믿지 않았을 테지.".b
  ]
}

abort "edit outside scope" unless edits.keys.all? { |id| range.cover?(id) }
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
abort "backup is not byte-identical" unless File.binread(backup) == source

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
original = shape.call(source)
abort "ID order differs" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  file = "src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv"
  ids = File.binread(file).scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  abort "#{locale} scope mismatch" unless ids.select { |id| range.cover?(id.to_i) } == range.map(&:to_s)
end

replace = lambda do |bytes, id, before, after|
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/nonunique row text #{id}" unless match && match[0].scan(before).size == 1
  bytes[match.begin(0)...match.end(0)] = match[0].sub(before, after)
end
updated = source.dup
edits.each { |id, (before, after)| replace.call(updated, id, before, after) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (before, after)| replace.call(inverse, id, after, before) }
abort "non-target byte/shape changed" unless inverse == source && shape.call(updated) == original

File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} inverse/BOM/endings/order/locale=OK"
