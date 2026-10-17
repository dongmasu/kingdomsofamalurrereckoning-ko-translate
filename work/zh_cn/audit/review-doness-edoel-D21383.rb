#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English default:8925/45983 and base:2128 provide the complete personal
  name Doness Vere, including Templar Doness Vere and the named storage
  label; Japanese ドネス・ベレ and Chinese 多尼斯·维内 corroborate.
  English default:8965/14145 provides Edoel Brelt and Scout Edoel Brelt;
  Japanese エドエル・ブレルト and Chinese 爱德华·布雷特/艾多尔·布瑞特
  corroborate the paired source rows, with Japanese supporting the existing
  Korean 에도엘 브렐트 rather than deriving a name from Chinese alone.
  Reuse 도네스 베레(Doness Vere) and 에도엘 브렐트(Edoel Brelt).
  Preserve existing complete covering role/storage annotations and only add
  the missing English pairs to the two bare full-name labels. The isolated
  short Doness at default:9437 is outside this full-name-only registration;
  no global short-name or surname identity is inferred. Official Korean
  manual PDF pp. 7-8 explains quest contacts and repeated dialogue topics,
  not these individual character names. All three resources were searched.
TEXT
specs = [
  {
    key: 'person:doness-vere', english: 'Doness Vere', category: 'person',
    korean: '도네스 베레(Doness Vere)', variants: '도네스 베레',
    count: 3, notes: context
  },
  {
    key: 'person:edoel-brelt', english: 'Edoel Brelt', category: 'person',
    korean: '에도엘 브렐트(Edoel Brelt)', variants: '에도엘 브렐트',
    count: 2, notes: context
  }
]
ReviewedDiscoverySpecs.run(
  21_383, 'Doness Vere And Edoel Brelt Full Names', specs, context,
  '### D-21375: Jakin Short Alias'
) do |spec, key, text, _source|
  if key == ['default', '8925', ''] || key == ['default', '8965', '']
    raise "changed bare name #{key.inspect}" unless text == spec[:variants]
    [spec[:korean], false]
  else
    raise "missing covering full name #{key.inspect}" unless text.include?(spec[:english])
    [text, false]
  end
end
