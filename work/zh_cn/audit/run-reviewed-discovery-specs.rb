#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

# Only explicit, source-reviewed specs belong here; this does not infer edits.
module ReviewedDiscoverySpecs
  module_function

  def run(d, title, specs, context, previous_marker, &transform)
    m = ReviewedNameBatches
    ReviewedProperNameDiscovery.ensure_unused_batch!(d)
    headers = m.table(File.join(__dir__, "proper-name-glossary.tsv")).headers
    definitions = specs.map do |s|
      headers.zip([s.fetch(:key), s.fetch(:english), s.fetch(:category),
                   s.fetch(:korean), s.fetch(:aliases, ""), s.fetch(:variants, ""),
                   "D-#{d}", "confirmed", s.fetch(:notes)]).to_h
    end
    inventory = m.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map { |v| OCCURRENCE_HEADERS.zip(v).to_h }
    expected = specs.to_h { |s| [s.fetch(:key), s.fetch(:count)] }
    actual = generated.group_by { |r| r["entity_key"] }.transform_values(&:length)
    raise "source coverage mismatch: #{actual.inspect}" unless expected == actual
    rows = generated.group_by { |r| m.key(r) }
    reviews = rows.keys.sort_by { |key| [m::RESOURCES.index(key[0]), key[1].to_i, key[2]] }.map do |key|
      source = inventory.fetch(key)
      old = source.fetch("work_text")
      new_text = old.dup
      dispositions = {}
      rows.fetch(key).each do |occurrence|
        spec = specs.find { |s| s[:key] == occurrence["entity_key"] }
        new_text, excluded = transform.call(spec, key, new_text, source)
        dispositions[spec.fetch(:key)] = excluded ? "excluded" : nil
      end
      status = if dispositions.values.all? { |s| s == "excluded" }
                 "excluded"
               elsif old == new_text
                 "not-an-issue"
               else
                 "accepted"
               end
      dispositions.transform_values! { |value| value || status }
      {
        "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
        "entity_key" => dispositions.keys.sort.join("|"), "status" => status,
        "old" => old, "new" => new_text,
        "evidence" => "D-#{d}: #{context} " + rows.fetch(key).map { |o| specs.find { |s| s[:key] == o["entity_key"] }.fetch(:notes) }.uniq.join(" "),
        "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
        "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
        "chinese" => source["zh_text"],
        "entity_dispositions_json" => JSON.generate(dispositions)
      }
    end
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
    raise "existing discovery files" if [definition_path, review_path].any? { |p| File.exist?(p) }
    m.write_table(definition_path, headers, definitions)
    m.write_table(review_path, m::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])
    counts = reviews.group_by { |r| r["status"] }.transform_values(&:length)
    note = <<~TEXT

    ## D-#{d}: #{title}

    Reviewed #{reviews.length} distinct resource/ID/variant keys and
    #{generated.length} entity matches: #{counts.inspect}.
    Canonical forms: #{specs.map { |s| s[:korean] }.join("; ")}.
    #{context}
    Exact English/Japanese/Chinese and old/new Korean cells are in the
    manifest. Existing reviewed holds and historical global totals are not
    reopened or recounted. Full proper-name discovery remains incomplete.
    TEXT
    %W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      text = File.read(path)
      raise "missing summary marker #{previous_marker}" unless text.include?(previous_marker)
      File.write(path, text.sub(previous_marker, note + "\n" + previous_marker))
    end
    puts note
  end
end
