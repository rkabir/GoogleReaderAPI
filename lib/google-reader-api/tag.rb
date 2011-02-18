module GoogleReaderApi

  class Tag

    include GoogleReaderApi::RssUtils

    def initialize(hash,api)
      @id = hash.id
      @label = hash.label
      @api = api
      @feeds = []
    end

    def id
      @id
    end

    def feeds
      @feeds
    end

    def sorted_feeds
      feeds.sort{|a,b| a.unread_count <=> b.unread_count}.reverse
    end

    def label
      @label
    end

    def add_feed(feed)
      @feeds << feed
      @feeds.uniq!
    end

    def items(count=20)
      @items ||= get_items
    end

    def get_items(count=20)
      create_entries get_feed_items(:n => count)
    end

    def unread_items(count=20)
      @unread_items ||= get_unread_items
    end

    def get_unread_items(count=20)
      create_entries get_feed_items(:n => count,:xt => 'user/-/state/com.google/read')
    end

    def inspect
      to_s
    end

    def refresh
      @items = create_entries get_feed_items(:n => count)
      @unread_items = create_entries get_feed_items(:n => count,:xt => 'user/-/state/com.google/read')
    end

    def to_s
      "<<Tag: #{@label}>>"
    end

    def get_feed_items(args={})
      @api.get_link "atom/#{URI.escape(@id)}" , args
    end

  end
end