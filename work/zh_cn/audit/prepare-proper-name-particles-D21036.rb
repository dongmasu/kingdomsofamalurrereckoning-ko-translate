#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module ProperNameParticlesD21036
  M = ReviewedNameBatches
  TARGET_PARTICLES = {
    '614' => { '을' => '를' },
    '8645' => { '을' => '를' },
    '9081' => { '을' => '를' },
    '10491' => { '을' => '를' },
    '38799' => { '을' => '를' },
    '19228' => { '을' => '를' },
    '39195' => { '을' => '를' },
    '27852' => { '을' => '를' },
    '43844' => { '을' => '를' },
    '62527' => { '을' => '를' },
    '1393' => { '이' => '가' },
    '7429' => { '이' => '가' },
    '12503' => { '이' => '가' },
    '24168' => { '이' => '가' },
    '23452' => { '이' => '가' },
    '46156' => { '이' => '가' },
    '53093' => { '이' => '가' },
    '57245' => { '이' => '가' },
    '14182' => { '으로' => '로' },
    '57331' => { '으로' => '로' },
    '1480' => { '으로' => '로' },
    '43535' => { '으로' => '로' },
    '8188' => { '으로' => '로' },
    '11110' => { '으로' => '로' },
    '33979' => { '는' => '은' },
    '50020' => { '는' => '은' },
    '3770' => { '가' => '이' },
    '24276' => { '가' => '이' },
    '11895' => { '가' => '이' },
    '35560' => { '가' => '이' },
    '62263' => { '과' => '와' },
    '17926' => { '로' => '으로' },
    '35512' => { '를' => '을' },
    '45743' => { '와' => '과' },
    '63494' => { '와' => '과' },
    '46259' => { '과' => '와' },
    '56726' => { '과' => '와' },
    '62480' => { '은' => '는' },
    '63633' => { '은' => '는' }
  }.freeze
  PARTICLES = {
    '을' => %w[을 를], '를' => %w[을 를],
    '이' => %w[이 가], '가' => %w[이 가],
    '은' => %w[은 는], '는' => %w[은 는],
    '과' => %w[과 와], '와' => %w[과 와],
    '으로' => %w[으로 로], '로' => %w[으로 로]
  }.freeze

  module_function

  def expected_particle(last_hangul, pair)
    final = last_hangul.ord - 0xAC00
    has_batchim = final % 28 != 0
    batchim_liquid = final % 28 == 8
    if pair == %w[으로 로]
      has_batchim && !batchim_liquid ? '으로' : '로'
    else
      has_batchim ? pair.first : pair.last
    end
  end

  def run
    output = '/private/tmp/proper-name-reviewed-D21036-expanded.tsv'
    raise "already exists: #{output}" if File.exist?(output)
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    label_owners = Hash.new { |hash, key| hash[key] = [] }
    glossary.each do |entry|
      ([entry.fetch('english_canonical')] + entry['english_aliases'].to_s.split('|'))
        .reject(&:empty?).each { |term| label_owners[term.downcase] << entry.fetch('entity_key') }
    end

    edits = []
    TARGET_PARTICLES.each do |id, rules|
      key = ['default', id, '']
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      indexed = index.select { |row| M.key(row) == key }
      found_spans = []
      updated = old.dup
      # Each bilingual English label and following particle is checked against
      # the final Hangul syllable of the immediately preceding Korean name.
      old.to_enum(:scan, /\((?<english>[^()\r\n]+)\)(?<particle>으로|[을를이가은는과와로])/).each do
        match = Regexp.last_match
        english = match[:english]
        particle = match[:particle]
        pair = PARTICLES[particle]
        next unless pair && rules.key?(particle)
        before_label = old[0...match.begin(0)]
        korean_prefix = before_label[/([\p{Hangul}][\p{Hangul} ]{0,60})[ \t]*\z/, 1]&.strip
        next unless korean_prefix && expected_particle(korean_prefix[-1], pair) != particle
        owners = label_owners.fetch(english.downcase, []).dup
        # Some accepted compound labels are indexed atomically under their
        # established place stem, e.g. Gravehal Keep -> Gravehal.
        glossary.each do |entry|
          terms = [entry.fetch('english_canonical'), *entry['english_aliases'].to_s.split('|')]
          korean = entry.fetch('korean_canonical')
            .sub(/\(#{Regexp.escape(entry.fetch('english_canonical'))}\)\z/, '')
          next unless terms.any? do |term|
            english_match = english.downcase.start_with?("#{term.downcase} ") ||
              english.downcase.end_with?(" #{term.downcase}")
            english_match && (korean_prefix.include?("#{korean} ") ||
              korean_prefix.end_with?(korean))
          end
          owners << entry.fetch('entity_key')
        end
        owners.uniq!
        terminal = indexed.select do |row|
          owners.include?(row.fetch('entity_key')) &&
            %w[accepted not-an-issue excluded].include?(row.fetch('status'))
        end
        raise "no terminal glossary occurrence for #{id}: #{english}" if terminal.empty?
        raise "unconfirmed source occurrence for #{id}: #{english}" unless
          JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
            text.match?(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i)
          end
        next_particle = expected_particle(korean_prefix[-1], pair)
        found_spans << {
          start: match.end(0) - particle.length,
          finish: match.end(0),
          old: particle, new: next_particle,
          entities: terminal.map { |row| row.fetch('entity_key') }.uniq
        }
      end
      expected_count = rules.fetch(:count, rules.length)
      raise "expected #{expected_count} particle errors at #{id}, found #{found_spans.length}" unless
        found_spans.length == expected_count
      found_spans.reverse_each do |span|
        updated[span[:start]...span[:finish]] = span[:new]
      end
      raise "particle correction failed at #{id}" if updated == old
      entities = found_spans.flat_map { |span| span[:entities] }.uniq
      previous = index.select { |row| entities.include?(row['entity_key']) && M.key(row) == key }
      raise "missing prior accepted disposition at #{id}" unless
        entities.all? do |entity|
          previous.any? do |row|
            row['entity_key'] == entity &&
              %w[accepted not-an-issue].include?(row['status'])
          end
        end
      labels = found_spans.map { |span| "#{span[:old]}→#{span[:new]}" }.uniq.join(', ')
      prior_statuses = entities.to_h do |entity|
        [entity, previous.find { |row| row['entity_key'] == entity }.fetch('status')]
      end
      edits << {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => entities.join('|'),
        'status' => if prior_statuses.value?('accepted')
                      'accepted'
                    elsif prior_statuses.value?('not-an-issue')
                      'not-an-issue'
                    else
                      'excluded'
                    end,
        'old' => old, 'new' => updated,
        'evidence' => "Corrective particle-only residual audit. A source-aligned bilingual proper-name span in this row was checked against Korean allomorphy and the registered label: #{labels}. Changed only the particle after the name label; preserved its name, every other name and all surrounding text. Existing accepted entity/row dispositions are retained, not re-opened or re-counted. English source confirms the named referent; Japanese and Chinese were checked as supporting context. No manual no-hit was used as evidence.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(prior_statuses),
        'previous_status' => JSON.generate(prior_statuses),
        'previous_evidence' => JSON.generate(entities.to_h do |entity|
          [entity, previous.find { |row| row['entity_key'] == entity }.fetch('evidence')]
        end)
      }
    end
    distinct_spans = edits.sum do |row|
      old_particles = row['old'].scan(/\(([^()]+)\)(으로|[을를이가은는과와로])/)
      new_particles = row['new'].scan(/\(([^()]+)\)(으로|[을를이가은는과와로])/)
      old_particles.zip(new_particles).count { |old, new| old != new }
    end
    raise "expected exactly 39 corrected spans, found #{distinct_spans}" unless distinct_spans == 39
    M.write_table(output, M::HEADERS, edits)
    puts "Prepared #{edits.length} previously-reviewed row keys / #{distinct_spans} particle spans; no index additions."
    puts edits.map { |row| "default:#{row['ID_Linha']} #{row['evidence'].split('Changed only')[0].split('checked against Korean allomorphy and the registered label: ')[1]}" }
  end
end

ProperNameParticlesD21036.run if $PROGRAM_NAME == __FILE__
