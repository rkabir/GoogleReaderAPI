module GoogleReaderApi

  class User

    require "json"
    # maybe someone would like to access the api for a user
    attr_reader :api

    include GoogleReaderApi::RssUtils

    def initialize(email="", password="", oauth=nil)
      @api = GoogleReaderApi::Api::new email,password, oauth
    end

    def info
      JSON[api.get_link "api/0/user-info"]
    end

    def subscriptions
      @subscriptions ||= GoogleReaderApi::SubscriptionList.new @api
    end

    def feeds
      subscriptions.feeds
    end

    def categories
      @categories ||= subscriptions.categories
    end

    def unread
      subscriptions.unread_items
    end

    def kept_unread(count=20)
      @kept_unread ||= get_state 'kept-unread', count
    end

    # didn't return anything in my testing
    def fresh_items(count=20)
      @fresh ||= get_state 'fresh', count
    end

    def starred_items(count=20)
      @starred ||= get_state 'starred', count
    end

    def broadcasted(count=20)
      @broadcasted ||= get_state 'broadcast', count
    end

    # didn't return anything in my testing.
    def reading_list(count=20)
      @reading_list ||= get_state 'reading_list', count
    end

    def clicked_body(count=20)
      @clicked_body ||= get_state 'tracking-body-link-used', count
    end

    def emailed(count=20)
      @emailed ||= get_state 'tracking-emailed', count
    end

    def clicked_item(count=20)
      @clicked_item ||= get_state 'tracking-item-link-used', count
    end

    def tracking_kept_unread(count=20)
      @tracking_kept_unread ||= get_state 'kept-unread', count
    end

    def get_state(state, count=20)
      create_entries get_user_items(state,:n => count)
    end

    private

    def get_user_items(state,args={})
      @api.get_link "atom/user/-/state/com.google/#{state}" , args
    end

  end
end
