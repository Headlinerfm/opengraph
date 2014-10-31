module OpenGraph
  class Parser
    def initialize(html, strict)
      @html = html
      @strict = strict
    end

    def process
      doc = Nokogiri::HTML.parse(html)
      page = OpenGraph::Object.new
      doc.css('meta').each do |m|
        if m.attribute('property') && m.attribute('property').to_s.match(/^og:(.+)$/i)
          page[$1.gsub('-','_')] = m.attribute('content').to_s
        end
      end
      return false if page.keys.empty?
      return false unless page.valid? if strict
      page
    end

    private 

    attr_accessor :html, :strict
  end
end
