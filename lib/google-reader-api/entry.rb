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

    private

    def edit_tag(tag_identifier)
      token = @api.get_link "api/0/token"
      @api.post_link "api/0/edit-tag" , :a => tag_identifier,
                                        :i => entry.id.content,
                                        :T => token,
                                        :ac => "edit"
    end
  end
end
