#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module ProperNameTestReplay
  module_function

  # Later verified terminology edits may share a cell with an earlier test.
  # Reverse their exact manifests instead of treating those edits as drift.
  def inventory_at(last_d)
    m = ReviewedNameBatches
    inventory = m.table(m::INVENTORY).map(&:to_h).to_h { |row| [m.key(row), row] }
    stages = Dir.glob(File.join(m::AUDIT, 'proper-name-edits-D*.tsv')).map do |path|
      d = File.basename(path)[/\Aproper-name-edits-D(\d+)\.tsv\z/, 1].to_i
      [d, path] if d > last_d
    end.compact
    stages.sort_by(&:first).reverse_each do |d, path|
      m.table(path).each do |review|
        next if review['old'] == review['new']

        source = inventory.fetch(m.key(review))
        raise "later manifest drift D-#{d} #{m.key(review).inspect}" unless
          source.fetch('work_text') == review.fetch('new')
        source['work_text'] = review.fetch('old')
      end
    end
    inventory
  end
end
