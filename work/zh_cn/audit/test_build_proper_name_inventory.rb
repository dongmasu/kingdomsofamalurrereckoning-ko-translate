#!/usr/bin/env ruby

require 'minitest/autorun'
require 'tempfile'
require_relative 'build-proper-name-inventory'

class ProperNameInventoryTest < Minitest::Test
  def test_read_rows_accepts_mixed_record_endings_and_preserves_quoted_newlines
    Tempfile.create('proper-name-inventory') do |file|
      file.binmode
      file.write(
        "\xEF\xBB\xBFID_Linha;Texto\r\n" \
        "1;first\r\n" \
        "2;\"line one\nline two\"\n" \
        "3;last\r\n"
      )
      file.flush

      rows = read_rows(file.path)

      assert_equal 3, rows.length
      assert_equal %w[1 2 3], rows.map { |row| row['ID_Linha'] }
      assert_equal "line one\nline two", rows[1]['Texto']
    end
  end
end
