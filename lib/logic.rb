class APPVariables
    require './lib/login copy.rb'

    attr_accessor :prevention_keywords, :keyword_hash
    attr_reader :subreddit, :searchquery
    def initialize
        @keyword_hash = Hash.new 
        @prevention_keywords = ['tragedy', 'dissatisfaction', 'stress',
         'exhausted', 'anxiey', 'suffering', 'despair', 'pain', 'worry', 
         'fear', 'hope', 'happy', 'feel lonely' , 'feel sad', 'be happy', 
         'go crazy', 'feel alone','my life', 'kill', 'kill myself',]
        @login = RedditInfo.new()
        @subreddit = @login.reddit.subreddit('All')
    end

    def select_subreddit(subreddit)
        @subreddit = login.reddit.subreddit(subreddit) # 'All' is the subreddit to search inside
    end



    
end