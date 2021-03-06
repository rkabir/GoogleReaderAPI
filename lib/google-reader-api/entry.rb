module GoogleReaderApi
  class Entry

    attr_reader :entry

    def initialize(api,entry)
      @api, @entry = api, entry
    end

    def mark_read
      edit_tag 'user/-/state/com.google/read'
    end

    def toggle_like
      edit_tag 'user/-/state/com.google/like'
    end

    def toggle_star
      edit_tag 'user/-/state/com.google/starred'
    end

    def to_s
      "<<Entry: #{@entry.title.content} >>"
    end

    def url
      @entry.link.href
    end

    # CAUTION: experimental!
    def feed_url
      if !@entry.source.id.content.include?("source")
        "http" + @entry.source.id.content.split("http").last
      end
    end

    def source_link
      @entry.source.link.href
    end

    private

    def get_token
      @token ||= @api.get_link "api/0/token"
    end

    def edit_tag(tag_identifier)
      @api.post_link "api/0/edit-tag" , :a => tag_identifier,
                                        :i => entry.id.content,
                                        :T => get_token,
                                        :ac => "edit"
    end
  end
end
