require 'cocoapods'
require 'pod/src/rewriter'

module Pod
  module Downloader
    # Reopening the Git downloader class
    class Git
      alias_method :github_token_http_rewriter_url, :url
      def url
        source_url_rewriter.url_for(github_token_http_rewriter_url)
      end

      def source_url_rewriter
        @source_url_rewriter ||= SourceURLRewriter::Rewriter.new
      end
    end
  end
end
