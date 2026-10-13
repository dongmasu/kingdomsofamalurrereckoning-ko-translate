#!/usr/bin/env ruby
require "json"

root = File.expand_path("../..", __dir__)
register = File.join(__dir__, "decision-register-20261009.md")
numeric = Hash.new { |hash, key| hash[key] = [] }
unresolved = []
status_counts = Hash.new(0)

File.foreach(register).with_index(1) do |line, number|
  match = line.match(/^\| D-(\d+) \| `default` ([^|]+)\|/)
  next unless match && match[1].to_i <= 18156

  scope = match[2].strip
  columns = line.split(" | ")
  disposition = columns.find { |column| column.match?(/\A(?:accepted|uncertain|not an issue)(?:\s|\z)/) }
  next unless disposition

  status = disposition[/\A(?:accepted|uncertain|not an issue)/]
  status_counts[status] += 1
  if scope.match?(/\A[\d, -]+\z/)
    scope.split(",").each do |token|
      range = token.strip.match(/\A(\d+)(?:-(\d+))?\z/)
      abort "invalid scope on line #{number}" unless range
      first = range[1].to_i
      last = (range[2] || range[1]).to_i
      if last < first && range[2]
        power = 10**range[2].length
        last += (first / power) * power
      end
      abort "reversed scope on line #{number}" if first > last
      (first..last).each do |id|
        numeric[id] << { "decision" => match[1].to_i, "status" => status, "line" => number }
      end
    end
  else
    unresolved << { "decision" => match[1].to_i, "status" => status,
                    "scope" => scope, "line" => number }
  end
end

summary = {
  "phase" => "D-19742 diagnostic, decision numbers <= 18156 only",
  "register" => register,
  "parsed_rows_by_status" => status_counts,
  "explicit_numeric_ids" => numeric.size,
  "explicit_numeric_ids_with_multiple_records" => numeric.count { |_id, rows| rows.size > 1 },
  "non_numeric_scopes_by_status" => unresolved.group_by { |row| row["status"] }
                                              .transform_values(&:size),
  "non_numeric_uncertain_examples" => unresolved.select { |row| row["status"] == "uncertain" }
                                                .first(4),
  "non_numeric_uncertain_last_examples" => unresolved.select { |row| row["status"] == "uncertain" }
                                                     .last(4)
}
puts JSON.pretty_generate(summary)
