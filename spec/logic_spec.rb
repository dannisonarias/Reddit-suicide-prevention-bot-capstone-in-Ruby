# frozen_string_literal: true

require_relative '../lib/logic.rb'

RSpec.describe APPVariables do
  let(:array1) { format(w, 'dog', 'cat', 'bird') }
  let(:test1) { APPVariables.new }

  describe 'APPvariables initialize ' do
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
