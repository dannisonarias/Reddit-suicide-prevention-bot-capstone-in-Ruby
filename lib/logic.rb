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

    def print_titles()
        @keyword_hash.each_with_index {|i,index|  p "#{index}. #{i[1][:title]}"}
      end

      def set_query(keyword)
        @searchquery = @subreddit.search(keyword,limit:2, :time => 'hour') #search post from last 'hour' only
      end
      def create_hash(word)
        @keyword_hash[word.to_sym] = Hash.new
      end



    
end