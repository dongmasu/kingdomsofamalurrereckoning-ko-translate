#!/usr/bin/env ruby

require_relative 'proper-name-cell-editor'

def assert(value, message)
  raise message unless value
end

def edit(id, old, text, variant = '')
  { 'ID_Linha' => id, 'Tipo_Variante' => variant, 'old' => old, 'new' => text }
end

def fails(message)
  begin
    yield
  rescue RuntimeError
    return
  end
  raise message
end

bytes = "\xEF\xBB\xBFID_Linha;Texto\r\n0;\"old; \"\"quote\"\"\n{TOKEN}\"\r\n1;Keep\r\n2;Last".b
changed, count = ProperNameCellEditor.prepare(
  bytes, [edit('0', "old; \"quote\"\n{TOKEN}", "new; \"quote\"\n{TOKEN}"),
          edit('2', 'Last', 'End')]
)
assert(count == 3, 'rows preserved including no final newline')
assert(changed == bytes.sub('old', 'new').sub('Last', 'End'), 'only target bytes change')
fails('stale manifest accepted') { ProperNameCellEditor.prepare(bytes, [edit('1', 'Wrong', 'Next')]) }
fails('token removal accepted') do
  ProperNameCellEditor.prepare(bytes, [edit('0', "old; \"quote\"\n{TOKEN}", "new\n")])
end
fails('duplicate target accepted') do
  ProperNameCellEditor.prepare(bytes, [edit('1', 'Keep', 'Next'), edit('1', 'Keep', 'Other')])
end
variants = "ID_Linha;Tipo_Variante;Texto\n1;11;One\n1;12;Two\n"
changed, = ProperNameCellEditor.prepare(variants.b, [edit('1', 'Two', 'Next', '12')])
assert(changed == variants.sub('Two', 'Next'), 'variant-scoped change')
styled = "ID_Linha;Texto\r\n1;{*1old} {LINE_LEFT} {1}\r\n".b
changed, = ProperNameCellEditor.prepare(styled, [edit('1', '{*1old} {LINE_LEFT} {1}', '{*1new} {LINE_LEFT} {1}')])
assert(changed == styled.sub('old', 'new'), 'localized styled payload can change')
fails('style prefix changed') do
  ProperNameCellEditor.prepare(styled, [edit('1', '{*1old} {LINE_LEFT} {1}', '{*2new} {LINE_LEFT} {1}')])
end
duplicates = "ID_Linha;Tipo_Variante;Texto\n1;11;One\n1;11;Other\n"
fails('ambiguous duplicate accepted') do
  ProperNameCellEditor.prepare(duplicates.b, [edit('1', 'One', 'Next', '11')])
end
puts 'PASS: byte-preserving proper-name cell editor fixtures'
