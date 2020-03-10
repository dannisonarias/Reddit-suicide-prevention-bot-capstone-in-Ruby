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
      def hash_title(word, post)
        @keyword_hash[word.to_sym][:title] = post.title
      end
      def hash_author(word, post)
        @keyword_hash[word.to_sym][:author_id] = post.author_fullname
      end
      def hash_url(word, post)
        @keyword_hash[word.to_sym][:url] = post.url
      end
      def hash_comments(word, post)
        @keyword_hash[word.to_sym][:comments] = post.comments[0].body unless post.comments[0].nil?
      end
      def hash_subreddit(word, post)
        @keyword_hash[word.to_sym][:subreddit_name] = post.subreddit_name_prefixed
      end


    
end