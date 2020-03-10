# frozen_string_literal: true

class APPVariables
  require './lib/login.rb'

  attr_accessor :prevention_keywords, :keyword_hash
  attr_reader :subreddit, :searchquery
  def initialize
    @keyword_hash = {}
    @prevention_keywords = ['tragedy', 'dissatisfaction', 'stress',
                            'exhausted', 'anxiey', 'suffering', 'despair', 'pain', 'worry',
                            'fear', 'hope', 'happy', 'feel lonely', 'feel sad', 'be happy',
                            'go crazy', 'feel alone', 'my life', 'kill', 'kill myself']
    @login = RedditInfo.new
    @subreddit = @login.reddit.subreddit('All')
  end

  def select_subreddit(subreddit)
    @subreddit = login.reddit.subreddit(subreddit) # 'All' is the subreddit to search inside
  end

  def print_titles
    @keyword_hash.each_with_index { |i, index| p "#{index}. #{i[1][:title]}" }
  end

  def set_query(keyword)
    @searchquery = @subreddit.search(keyword, limit: 2, time: 'hour') # search post from last 'hour' only
  end

  def each_search_query(word)
    @searchquery.each do |post|
      create_hash(word)
      hash_title(word, post)
      hash_author(word, post)
      hash_url(word, post)
      hash_comments(word, post)
      hash_subreddit(word, post)
    end
  end

  def create_hash(word)
    @keyword_hash[word.to_sym] = {}
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
    unless post.comments[0].nil?
      @keyword_hash[word.to_sym][:comments] = post.comments[0].body
        end
  end

  def hash_subreddit(word, post)
    @keyword_hash[word.to_sym][:subreddit_name] = post.subreddit_name_prefixed
  end

  def each_keyword
    @prevention_keywords.each do |word|
      set_query(word)
      each_search_query(word)
    end
  end
end
