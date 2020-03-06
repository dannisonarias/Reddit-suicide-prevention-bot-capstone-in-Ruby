require 'bundler/setup'
require 'redd'

reddit = Redd.it(
    user_agent: 'Redd:MyFancyBot:v1.2.3',
    client_id: '8beXORcwaZHvUw',
    secret: 'LMWij9QR-znxDuOYyLMjwTbmE-A',
    username: 'danny-dev-ops',
    password: 'Conker34'
  )

# r_all = reddit.subreddit('all')
# post = r_all.hot.first
# puts post.title

test1 = reddit.subreddit('Redd').comment_stream do |comment|
  binding.pry
  if comment.body.include?('learn')
    p comment.body
  end
end

test1
# reddit.subreddit('Redd').comment_stream { |i| p i}
