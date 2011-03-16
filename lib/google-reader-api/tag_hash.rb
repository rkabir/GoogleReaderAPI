module GoogleReaderApi

  class TagHash

    include GoogleReaderApi::RssUtils
    include Enumerable

    def initialize(subs, api)
      @api = api
      @hash = Hash.new([])
      @keys = []
      build_hash(subs)
    end

    def build_hash(subs)
      subs.each do |sub_hash|
        feed = GoogleReaderApi::Feed.new(sub_hash, @api)
        if sub_hash.categories.size == 0
          key = "none"
          @hash[key] += [feed]
        else
          sub_hash.categories.each do |category_hash|
            key = get_key(category_hash)
            key.add_feed(feed)
            @hash[key] += [feed]
          end
        end
      end
    end

    def get_key(category_hash)
      key = @keys.find{|x| x.id == category_hash.id}
      if key.nil?
        key = GoogleReaderApi::Tag.new(category_hash, @api)
        @keys << key
      end
      return key
    end

    def hash
      @hash
    end

    def tags
      @hash.keys.select{|x| x.class!=String}
    end

    def unread_tags
      mappings = tags.map do |t|
        Hashie::Mash.new(
          {:tag => t,
           :unread_count => t.feeds.map{|f| f.unread_count}.sum}
        )
      end
      mappings.sort{|a,b| a.unread_count<=>b.unread_count}.reverse
    end

    def tag_by_name(name)
      re = Regexp.new(name, true)
      tags.find{|x| x.label=~re}
    end

    def each
      tags.each {|tag| yield tag}
    end

  end

end