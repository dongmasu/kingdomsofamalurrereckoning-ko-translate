#!/usr/bin/env ruby

require "csv"
require "json"

ROOT = File.expand_path("../../..", __dir__)
REPORT = File.join(__dir__, "mission-site-consistency-20261103.json")
SITE_IDS = {
  "base" => %w[3433 3459 3863 4050 4401],
  "default" => %w[
    81 109 1374 2185 3003 3388 3498 3726 3913 4065 4523 4990 5273 5758
    5960 5974 7130 7242 7421 8217 8398 9325 9446 9526 9758 9828 10609
    10723 11145 11179 12141 12235 12252 12373 13815 13988 15366 15715
    16063 17477 17626 17679 18186 18421 19638 19915 19920 21035 22396
    23386 23539 24099 24365 24370 24472 24681 24853 25145 25329 25468
    26544 27390 27485 28186 28446 29112 30452 30862 30932 31368 32182
    32556 32720 33209 33395 33567 35652 35872 35937 36137 37082 37374
    37728 37916 39689 40168 40531 40592 41033 41051 41263 41367 41401
    41415 41529 41687 41995 42206 42404 44024 44623 45303 46311 48417
    51259 51678 53444 53538 53793 54024 54166 54708 54959 55288 55671
    56293 57307 57692 58713 59008 59170 59251 59444 59479 59678 59782
    59891 60857 63292 63298 63653
  ]
}.freeze
FRAGMENT_IDS = %w[
  12427 24677 31115 39195 39296 42122 42599 46365 49413 50589 54031 55595
].freeze
KOREAN_NAMES = { "Odwig" => "오드윅", "Eadric" => "이드릭", "Hadwyn" => "하드윈" }.freeze
QUALIFIERS = { "Perpetual" => "영구", "Undying" => "불멸" }.freeze
SPECIAL = {
  ["base", "4050"] => ["수도원 샘", "선교원 우물(Mission Well)"],
  ["default", "41529"] => ["선교원의 우물", "선교원 우물(Mission Well)"],
  ["default", "5758"] => [
    "내가 선교지에 들어가 감옥 대신 수도원을 택하게 될 줄 누가 알았겠나?",
    "내가 선교원에 들어와 감옥 대신 수도 생활을 택하게 될 줄 누가 알았겠나?"
  ],
  ["default", "9325"] => ["이 임무가 내 삶에 의미를 주지.", "이 선교원에서의 삶이 내게 의미를 주지."],
  ["default", "12141"] => ["근처 예배당에서", "근처 선교원에서"],
  ["default", "37728"] => ["미사루(Mitharu)의 사제인", "미사루(Mitharu)의 신부인"],
  ["default", "39689"] => ["바로 교단이 두려워하는", "바로 선교원이 두려워하는"],
  ["default", "57692"] => [
    "그들을 선교원로 돌려보내 줬으면 해. 부탁이야.",
    "그 염주를 선교원에 돌려줬으면 해. 부탁이야."
  ],
  ["default", "63292"] => [
    "그래, 임무 본부로 돌려보내고 싶어. 그리해 준다면 고맙겠네.",
    "그래, 선교원에 돌려주었으면 해. 그리해 준다면 고맙겠네."
  ]
}.freeze

def parse(bytes)
  CSV.parse(bytes.dup.force_encoding("UTF-8").sub(/\A\uFEFF/, "").gsub("\r\n", "\n"),
            headers: true, col_sep: ";", row_sep: "\n").reject { |row| row["ID_Linha"].nil? }
end

def key(row)
  [row["ID_Linha"], row["Tipo_Variante"].to_s]
end

def load_rows(locale, resource)
  path = File.join(ROOT, "src/csv/#{locale}/locatexts_#{locale}.koalocatext_#{resource}.csv")
  parse(File.binread(path))
end

def normalize_mission_particles(text)
  text.gsub(/선교원(\([^()\n]*\))?(으로|로|은|는|이|가|을|를|과|와)/) do
    english, particle = Regexp.last_match(1), Regexp.last_match(2)
    normalized = { "로" => "으로", "는" => "은", "가" => "이", "를" => "을", "와" => "과" }
      .fetch(particle, particle)
    "선교원#{english}#{normalized}"
  end
end

source_inventory = []
site_reviews = []
pending_writes = {}
previous_reviews = if File.exist?(REPORT)
  JSON.parse(File.read(REPORT)).fetch("site_reviews", []).map do |review|
    [[review["resource"], review["id"], review["variant"]], review]
  end.to_h
else
  {}
end
%w[affix base default].each do |resource|
  refs = %w[en_us ja_jp zh_cn].map do |locale|
    [locale, load_rows(locale, resource).map { |row| [key(row), row["Texto"]] }.to_h]
  end.to_h
  site_ids = SITE_IDS.fetch(resource, [])
  target_ids = site_ids + (resource == "default" ? FRAGMENT_IDS : [])
  path = File.join(ROOT, "work/zh_cn/locatexts_zh_cn.koalocatext_#{resource}.csv")
  original = File.binread(path)
  before_rows = parse(original)
  before = before_rows.map { |row| [key(row), row["Texto"]] }.to_h
  references = refs.fetch("en_us")
  site_ids.each do |id|
    english = references.find { |(source_id, _), _| source_id == id }&.last
    abort "missing source Mission at #{resource}:#{id}" unless english&.match?(/\bmissions?\b/i)
  end
  expected = {}
  updated = original.split(/(?=^\d+;)/n).map do |record|
    id = record[/\A(\d+);/n, 1]
    next record unless target_ids.include?(id)

    source_key = before.keys.find { |source_id, _| source_id == id }
    abort "missing working row #{resource}:#{id}" unless source_key
    text = before.fetch(source_key).dup
    english = references.fetch(source_key)
    text.gsub!(/선교관|선교소|선교회|선교단/, "선교원")
    text.gsub!("수도원", "선교원") unless id == "5758"
    english.scan(/St\. (Odwig|Eadric|Hadwyn)'s (?:(Perpetual|Undying) )?Mission/).each do |name, qualifier|
      korean = KOREAN_NAMES.fetch(name)
      full_title = "St. #{name}'s #{qualifier ? qualifier + ' ' : ''}Mission"
      label = "성 #{korean} #{qualifier ? QUALIFIERS.fetch(qualifier) + ' ' : ''}선교원(#{full_title})"
      pattern = /성 #{korean}(?:\(St\. #{name}\))?(?:의)? (?:(?:영구|영원한|상설|종신|불멸) )?선교원(?:\(#{Regexp.escape(full_title)}\))?/
      abort "missing named site #{resource}:#{id}: #{full_title}" unless text.match?(pattern)
      text.sub!(pattern, label)
    end
    if SPECIAL.key?([resource, id])
      old, replacement = SPECIAL.fetch([resource, id])
      # The well's initial word has already been normalized above.
      old = old.gsub("수도원", "선교원") if id == "4050"
      unless text.include?(replacement)
        abort "expected reviewed text #{resource}:#{id}" unless text.scan(Regexp.new(Regexp.escape(old))).length == 1
        text.sub!(old, replacement)
      end
    end
    text = normalize_mission_particles(text)
    expected[source_key] = text
    old_text = before.fetch(source_key)
    unless old_text == text
      old_text.split("\n", -1).zip(text.split("\n", -1)).each do |old_line, new_line|
        next if old_line == new_line
        abort "line count changed #{resource}:#{id}" unless new_line
        old_bytes = old_line.b
        abort "raw field match #{resource}:#{id}" unless record.scan(Regexp.new(Regexp.escape(old_bytes))).length == 1
        record.sub!(old_bytes, new_line.b)
      end
    end
    record
  end.join
  after_rows = parse(updated)
  after = after_rows.map { |row| [key(row), row["Texto"]] }.to_h
  abort "row fields/order changed #{resource}" unless
    before_rows.map { |row| row.to_h.reject { |field, _| field == "Texto" } } ==
      after_rows.map { |row| row.to_h.reject { |field, _| field == "Texto" } }
  abort "BOM changed #{resource}" unless original.byteslice(0, 3) == updated.byteslice(0, 3)
  abort "line endings changed #{resource}" unless original.scan(/\r\n|\n|\r/n) == updated.scan(/\r\n|\n|\r/n)
  after.each do |source_key, text|
    old = before.fetch(source_key)
    abort "text outside review #{resource}:#{source_key}" unless text == expected.fetch(source_key, old)
    abort "newlines/markup changed #{resource}:#{source_key}" unless
      old.to_s.count("\n") == text.to_s.count("\n") &&
      old.to_s.scan(/\{[^}]*\}/) == text.to_s.scan(/\{[^}]*\}/)
  end
  references.each do |source_key, english|
    next unless english.to_s.match?(/\bmissions?\b/i)
    id = source_key.first
    source_inventory << {
      resource: resource, id: id, variant: source_key.last, en: english,
      disposition: site_ids.include?(id) ? "religious site/community" :
        id == "30627" ? "held: English is ambiguous; Japanese and Chinese read a task" : "task, expedition, or purpose: unchanged"
    }
  end
  expected.each do |source_key, text|
    review_key = [resource, source_key.first, source_key.last]
    historical_before = previous_reviews.fetch(review_key, {})["before"] || before.fetch(source_key)
    site_reviews << {
      resource: resource, id: source_key.first, variant: source_key.last,
      before: historical_before, after: text, changed: historical_before != text,
      en: references.fetch(source_key), ja: refs.fetch("ja_jp").fetch(source_key),
      zh: refs.fetch("zh_cn").fetch(source_key)
    }
  end
  pending_writes[path] = updated if updated != original
end
abort "source Mission inventory changed" unless source_inventory.length == 257
report = {
  date: "2026-11-03",
  standard: {
    "religious site/community Mission" => "선교원",
    "Perpetual Mission" => "영구 선교원",
    "Undying Mission" => "불멸 선교원",
    "Mission Well" => "선교원 우물(Mission Well)"
  },
  rationale: "Editorial consistency with established Korean site labels, not a claim of an official institutional category. Use English ID/variant context; Japanese/Chinese corroborate religious-site meaning. Preserve ordinary mission/task/purpose and distinct monastery/cloister references.",
  exclusions: [
    "Do not add institutions to isolated saint-name fragments such as default:40975.",
    "Keep ordinary mission, diplomatic mission, scouting mission and religious purpose as tasks/purposes.",
    "Keep the ambiguous task reading at default:30627; both Japanese and Chinese support it.",
    "Nyxaros, Lyria's cloister, abbots, and the separate fragment St. Odwig's Perpetual are not Mission-site terminology."
  ],
  source_inventory: source_inventory,
  site_reviews: site_reviews
}
File.write(REPORT, JSON.pretty_generate(report) + "\n")
pending_writes.each { |path, bytes| File.binwrite(path, bytes) }
puts "PASS: #{source_inventory.length} English Mission rows; #{site_reviews.length} site rows checked; #{site_reviews.count { |row| row[:changed] }} changed; structure/BOM/EOL/newlines/markup preserved."
