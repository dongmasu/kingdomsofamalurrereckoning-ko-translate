#!/usr/bin/env ruby

require_relative 'review-candidate-only-batches-20261018'

module ErathellArticleLabelD21779
  extend self
  GROUPS = {
    'The Plains of Erathell' => {
      keys: [['base', '2597', '11'], ['default', '54451', '']],
      disposition: 'not-an-issue',
      evidence: 'Both exact English standalone labels name the already registered Plains of Erathell region reviewed source-wide in D-21775/D-21776. Japanese エラセル平原 and Chinese 伊拉塞尔平原 corroborate. Base:2597 already preserves the article-bearing English label, while default:54451 pairs the complete region name Plains of Erathell without the optional article. Both identify the same region and require no separate entity, speculative alias, or duplicate disposition. Preserve the existing canonical Korean name and prior place:erathell/place:plains-of-erathell findings.'
    }
  }.freeze

  def run
    CandidateOnlyBatches20261018.run(
      21_779, GROUPS, 'Article-Bearing Erathell Region Labels',
      candidate_path: File.join(__dir__, 'proper-name-short-label-discovery-D21778.tsv')
    )
  end
end

ErathellArticleLabelD21779.run if $PROGRAM_NAME == __FILE__
