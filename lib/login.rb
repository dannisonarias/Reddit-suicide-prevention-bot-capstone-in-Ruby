require 'bundler/setup'
require 'redd'

class RedditInfo
    attr_reader :reddit
    def initialize()
        @reddit = Redd.it(
            user_agent: 'Redd:MyFancyBot:v1.2.3',
            client_id: 'q7TcxkxX4Y7c9w',
            secret: 'PjK9Osf1qyri0job2JpfV96iNyQ',
            username: 'inspiredBySpirit',
            password: '=.dQ{zRmE@[PU8E2"9."&'
          )
    end
end