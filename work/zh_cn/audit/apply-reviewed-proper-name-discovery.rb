#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

# Registration gate for independently reviewed discovery manifests.
module ReviewedProperNameDiscovery
  M = ReviewedNameBatches
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  DISCOVERY_CANDIDATES = File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv')
  CATEGORIES = ['person', 'place', 'faction', 'organization', 'people', 'item',
                'deity', 'monster', 'skill', 'quest', 'unique item',
                'named work', 'title', 'lore term', 'named event', 'creature',
                'resource', 'gameplay mechanic'].freeze
  OPAQUE = /\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/
  # {*1...} is translated display text. Protect its prefix/braces and any
  # embedded variables/tags, rather than freezing the display text itself.
  STRUCTURAL = /\$[^$]*\$|<[^>\r\n]*>|\{\*\d+|\{[^{}\r\n]*\}|[{}]/

  module_function

  def validate!(definitions, reviews, generated, glossary, index)
    raise 'duplicate existing glossary entity' unless
      glossary.map { |row| row.fetch('entity_key') }.uniq.length == glossary.length
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'duplicate existing occurrence key' unless existing.uniq.length == existing.length
    entities = definitions.map { |row| row.fetch('entity_key') }
    raise 'empty or duplicate discovery entities' if entities.empty? || entities.uniq != entities
    definitions.each do |row|
      raise 'blank discovery English canonical' if row.fetch('english_canonical').strip.empty?
      raise "unconfirmed discovery #{row['entity_key']}" unless row['status'] == 'confirmed'
      raise "invalid category #{row['category']}" unless CATEGORIES.include?(row['category'])
      raise 'non-bilingual discovery canonical' unless
        row.fetch('korean_canonical').match?(/[가-힣]/) &&
        row['korean_canonical'].include?("(#{row.fetch('english_canonical')})")
      raise "entity already registered #{row['entity_key']}" if
        glossary.any? { |old| old['entity_key'] == row['entity_key'] }
    end
    owners = Hash.new { |hash, term| hash[term] = [] }
    (glossary + definitions).each do |row|
      ([row.fetch('english_canonical')] + row['english_aliases'].to_s.split('|')).reject(&:empty?).each do |term|
        owners[term.downcase] << row.fetch('entity_key')
      end
    end
    definitions.each do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|')).reject(&:empty?).each do |term|
        raise "discovery English term collision #{term}" unless
          owners[term.downcase].uniq == [row['entity_key']]
      end
    end
    raise 'duplicate discovery row' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    expected = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'duplicate generated discovery key' unless expected.uniq.length == expected.length
    raise 'discovery entity has no source matches' unless
      generated.map { |row| row['entity_key'] }.uniq.sort == entities.sort
    reviewed = reviews.flat_map do |row|
      required = %w[resource ID_Linha Tipo_Variante entity_key status old new evidence english japanese chinese entity_dispositions_json]
      raise 'missing discovery manifest field' unless required.all? { |field| !row[field].nil? }
      # Chinese is supplementary and may be blank in the aligned source CSV.
      raise 'missing discovery evidence' if %w[evidence english japanese].any? { |field| row[field].strip.empty? }
      dispositions = JSON.parse(row.fetch('entity_dispositions_json'))
      raise 'discovery entities/dispositions differ' unless
        dispositions.keys.sort == row.fetch('entity_key').split('|').sort
      raise 'non-accepted discovery edit' if row['status'] != 'accepted' && row['old'] != row['new']
      raise 'accepted discovery has no approved text change' if
        row['status'] == 'accepted' &&
        (row['old'] == row['new'] || !dispositions.value?('accepted'))
      raise 'discovery changes opaque tokens or line breaks' unless
        row.fetch('old').scan(STRUCTURAL) == row.fetch('new').scan(STRUCTURAL) &&
        row['old'].scan(/\r\n|\r|\n/) == row['new'].scan(/\r\n|\r|\n/)
      raise 'invalid discovery status' unless
        ([row['status']] + dispositions.values).all? { |status| %w[accepted not-an-issue excluded uncertain].include?(status) }
      expected_status = if row['old'] != row['new']
                          'accepted'
                        elsif dispositions.value?('uncertain')
                          'uncertain'
                        elsif dispositions.values.all? { |status| status == 'excluded' }
                          'excluded'
                        else
                          'not-an-issue'
                        end
      raise 'discovery aggregate disposition differs' unless row['status'] == expected_status
      raise 'accepted entity has no text change' if row['old'] == row['new'] && dispositions.value?('accepted')
      dispositions.keys.map { |entity| [entity, *M.key(row)] }
    end
    raise 'reviewed discovery/source-key coverage differs' unless reviewed.sort == expected.sort
    raise 'discovery key already registered' unless (existing & expected).empty?
  end

  def ensure_unused_batch!(d, audit = __dir__, backups = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}")
    paths = [
      File.join(audit, "named-scope-review-D#{d}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(audit, "named-scope-edit-addendum-D#{d}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(audit, "proper-name-edits-D#{d}.tsv")
    ]
    paths.concat(Dir.glob(File.join(audit, "named-scope-*-D#{d}-*.md")))
    raise "D-#{d} artifacts already exist" if paths.any? { |path| File.exist?(path) }

    backup_dir = File.join(backups, "before-proper-name-D#{d}")
    return unless File.exist?(backup_dir)
    raise "D-#{d} backup is not a directory" unless File.directory?(backup_dir)

    entries = Dir.children(backup_dir)
    allowed = M::RESOURCES.to_h do |resource|
      ["locatexts_zh_cn.koalocatext_#{resource}.csv", resource]
    end
    valid = !entries.empty? && entries.all? do |name|
      resource = allowed[name]
      resource && File.file?(File.join(backup_dir, name)) &&
        File.binread(File.join(backup_dir, name)) == File.binread(M.csv_path(resource))
    end
    raise "D-#{d} backup does not match active CSV bytes" unless valid
  end

  def validate_sources!(reviews, inventory)
    reviews.each do |row|
      source = inventory.fetch(M.key(row))
      %w[english japanese].zip(%w[en ja]).each do |field, locale|
        texts = JSON.parse(source.fetch("#{locale}_texts_json")).compact
        expected = [texts.join("\n"), texts.join("\n---\n")]
        raise "discovery #{field} evidence differs from source #{M.key(row).inspect}" unless
          expected.include?(row.fetch(field))
      end
      raise "discovery Chinese evidence differs from source #{M.key(row).inspect}" unless
        row.fetch('chinese') == source.fetch('zh_text')
    end
  end

  def run(argv)
    abort 'usage: apply-reviewed-proper-name-discovery.rb DEFINITIONS.tsv REVIEWED.tsv START_D' unless argv.length == 3
    definition_path, review_path, start = argv
    start_d = Integer(start)
    raise 'START_D must be positive' unless start_d.positive?
    definitions = M.table(definition_path).map(&:to_h)
    reviews = M.table(review_path).map(&:to_h)
    glossary = M.table(GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    validate!(definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    validate_sources!(reviews, inventory)
    edits = reviews.each_with_object([]) do |row, result|
      current = inventory.fetch(M.key(row)).fetch('work_text')
      rebased = M.rebase_review(row.fetch('old'), row.fetch('new'), current)
      result << row.merge('old' => current, 'new' => rebased) if rebased != current
    end
    edits.group_by { |row| row.fetch('resource') }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
    end
    reviews.each_slice(50).with_index do |_batch, ordinal|
      ensure_unused_batch!(start_d + ordinal)
    end
    M.write_table(GLOSSARY, glossary.headers, glossary.map(&:to_h) + definitions)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    candidates = M.table(DISCOVERY_CANDIDATES)
    normalize = lambda do |term|
      term.to_s.downcase.gsub(/[^a-z0-9]+/, ' ').strip.gsub(/\s+/, ' ')
    end
    registered_terms = (glossary.map(&:to_h) + definitions).select do |row|
      row.fetch('status') == 'confirmed'
    end.flat_map do |row|
      [row.fetch('english_canonical'), *row['english_aliases'].to_s.split('|')]
    end.flat_map do |term|
      normalized = normalize.call(term)
      [normalized, normalized.sub(/\A(?:the|a|an)\s+/, '')]
    end.to_set
    candidates.each do |row|
      next unless row['status'] == 'heuristic-not-reviewed'
      normalized = normalize.call(row['english_candidate'])
      if registered_terms.include?(normalized) ||
         registered_terms.include?(normalized.sub(/\A(?:the|a|an)\s+/, ''))
        row['status'] = 'registered-reviewed'
      end
    end
    M.write_table(DISCOVERY_CANDIDATES, candidates.headers, candidates.map(&:to_h))
    M.run(review_path, start_d, nil)
  end
end

ReviewedProperNameDiscovery.run(ARGV) if $PROGRAM_NAME == __FILE__
