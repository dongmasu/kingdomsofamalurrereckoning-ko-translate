#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

# Apply evidence manifests prepared by a separate bounded review, not heuristics.
module PreparedNameStages20261018
  extend self
  M = ReviewedNameBatches
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze

  def refresh_checkpoint(d, title)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    snapshot_name = "proper-name-short-label-discovery-D#{d}.tsv"
    path = File.join(__dir__, snapshot_name)
    raise 'preserve existing discovery snapshot' if File.exist?(path)
    M.write_table(path, ShortLabelDiscovery20261018::HEADERS, snapshot)
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'prepared-stage residual validation failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    checks = residual.lines.grep(/\A(?:Source\/|Terminal matches)/).map(&:strip)
    note = "\n## D-#{d}: #{title}\n\nPrepared, source-reviewed manifests applied. Active data validation: #{validation.strip}\nResidual audit: PASS; #{checks.join('; ')}\nNext batch D-#{d + 1}; bounded short-label snapshot `#{snapshot_name}` contains #{snapshot.length} groups. This is not an exhaustive universe or an overall completion estimate. Published ZIP unchanged.\n"
    %W[named-scope-review-D#{d}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{d}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      report_path = File.join(__dir__, name)
      File.write(report_path, File.read(report_path) + note)
    end
    M::DOCS.each do |document|
      text = File.read(document)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
      raise "current checkpoint missing #{document}" unless text.match?(marker)
      text.sub!(marker) do |block|
        block.sub(/Next batch: D-#{d + 1};[^\n]*/,
                  "Next batch: D-#{d + 1}; continue from `#{snapshot_name}` (#{snapshot.length} bounded groups; not exhaustive or a completion estimate).")
      end
      text += note if [M::DOCS[2], M::DOCS[3]].include?(document)
      File.write(document, text)
    end
    puts "D-#{d}: active data/residual PASS; #{snapshot.length} bounded groups remain."
  end

  def run(start_d, stages)
    d = start_d
    stages.each do |stage|
      reviews = stage.fetch(:reviews)
      raise 'prepared stage must contain distinct reviewed cells' unless
        !reviews.empty? && reviews.map { |r| M.key(r) }.uniq.length == reviews.length
      ReviewedProperNameDiscovery.ensure_unused_batch!(d)
      definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
      review_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
      raise "prepared stage outputs already exist D-#{d}" if
        [definition_path, review_path].any? { |path| File.exist?(path) }
      definitions = stage.fetch(:definitions).map do |definition|
        definition.merge('evidence_ids' => ["D-#{d}", definition['evidence_ids']].compact.join('|'))
      end
      M.write_table(definition_path, DEFINITION_HEADERS, definitions)
      M.write_table(review_path, REVIEW_HEADERS, reviews)
      # The registration gate applies and checkpoints at most 50 rows per D.
      ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])
      last_d = d + (reviews.length / 50.0).ceil - 1
      refresh_checkpoint(last_d, stage.fetch(:name))
      d = last_d + 1
    end
    d
  end
end
