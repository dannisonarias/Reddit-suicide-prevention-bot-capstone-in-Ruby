require_relative '../lib/logic.rb'

RSpec.describe APPVariables do
  let(:test1) { APPVariables.new }

  describe 'APPvariables' do
    it 'method keyword_hash.each_with_index with no errors' do
      expect(test1.print_titles).to eql(true)
    end

    it 'public method  each_keyword to call other methods' do
      expect(test1.each_keyword).to eql(true) # test takes one minute to load
    end

    it 'Initializing an instance class of APPvariables' do
      expect(test1.keyword_hash).to eql({})
    end

    it 'checking that the keywords are set' do
      expect(test1.prevention_keywords.length).to eql(20)
    end

    it 'checking if instance variable @login is instaniated' do
      expect(test1.login.class).to eql(RedditInfo)
    end

    it 'checking if subreddit is set successfully' do
      expect(test1.subreddit.class).to eql(Redd::Models::Subreddit)
    end
  end
end
