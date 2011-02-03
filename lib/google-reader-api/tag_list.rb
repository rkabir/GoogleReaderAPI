module GoogleReaderApi

  class TagList

    include GoogleReaderApi::RssUtils
    include Enumerable

    def initialize(api)
      @api = api
      update
    end

    def tags
      @feeds
    end

    def each
      @tags.each {|tag| yield tag}
    end

    def update
      fetch_list
    end

    private

    def fetch_list
      json = JSON[user.api.get_link "api/0/tag/list", :output => :json]["tags"]
      @tags = json.map {|hash| GoogleReaderApi::Tag.new(hash,@api) }
    end

  end

end