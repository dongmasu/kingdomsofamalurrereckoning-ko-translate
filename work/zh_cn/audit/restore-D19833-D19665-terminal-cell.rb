#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19833/locatexts_zh_cn.koalocatext_default.csv"
expected = "d43cccfcee720fb3a221ba73032fb692d3d9ecb2ff744cc1ced8e74b714de433"
expected_backup = "8863b53c9c7e16d048067581c2cee7f961a17511dbe3f51e823b12737ca567b7"
id = 35836
edited = "복역하기".b
terminal = "형기 집행".b

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
original = File.binread(backup)
abort "backup hash differs" unless Digest::SHA256.hexdigest(original) == expected_backup

match = source.match(/^#{id};.*?(?=^\d+;|\z)/nm)
backup_match = original.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "target row missing" unless match && backup_match
row = match[0]
abort "D-19833 text missing or duplicated" unless row.scan(edited).length == 1
abort "backup terminal text mismatch" unless backup_match[0].scan(terminal).length == 1

restored = source.dup
restored[match.begin(0)...match.end(0)] = row.sub(edited, terminal)
abort "restore does not match pre-edit backup" unless restored == original

File.binwrite(path, restored)
puts "restored=#{id} sha256=#{Digest::SHA256.hexdigest(restored)} byte-equal-to-backup=OK"
