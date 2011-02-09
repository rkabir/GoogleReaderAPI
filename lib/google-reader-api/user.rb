module GoogleReaderApi

  class User

    require "json"
    # maybe someone would like to access the api for a user
    attr_reader :api

    include GoogleReaderApi::RssUtils

    def initialize(email,password)
      @api = GoogleReaderApi::Api::new email,password
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

    def starred_items(count=20)
      create_entries get_user_items('starred',:n => count)
    end

    private

    def get_user_items(state,args={})
      @api.get_link "atom/user/-/state/com.google/#{state}" , args
    end

  end
end
