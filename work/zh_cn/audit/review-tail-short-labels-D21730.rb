#!/usr/bin/env ruby

require_relative 'run-short-label-proposals-20261018'

if $PROGRAM_NAME == __FILE__
  mode = ARGV == ['--apply']
  abort 'usage: review-tail-short-labels-D21730.rb [--apply]' unless ARGV.empty? || mode
  ShortLabelProposals20261018.run(
    File.join(__dir__, 'proper-name-short-label-proposals-D21730.tsv'),
    21_730, apply: mode
  )
end
