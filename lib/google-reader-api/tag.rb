module GoogleReaderApi

  class Tag

    include GoogleReaderApi::RssUtils

    def initialize(hash,api)
      # strip the first 5 characters of the url (they are 'feed/')
      @id = hash.id
      @label = hash.label
      @api = api
    end

    def id
      @id
    end

    def label
      @label
    end

    def items(count=20)
      create_entries @api.get_link "atom/#{@id}"
    end

    def inspect
      to_s
    end

    def to_s
      "<<Tag: #{@label}>>"
    end
  end
end