#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'redd'
require './lib/login.rb'
require './lib/logic.rb'
require './lib/textfilecreator.rb'

puts "Hello! , Welcome to the suicide prevention ruby program \n"
puts 'It can be scary when a friend or loved one is thinking about suicide.'
puts "It's hard to know how a suicidal crisis feels and how to act."
puts "let's help our fellow human friends, sometimes all they need is a chat or someone to aknowledge them. \n"
puts "We're going to search reddit for words that have been associated with people who have suicidal thoughts"
puts 'Here are some postings with matching keywords from reddit in the last hour...'
sleep(0.3)
puts '...loading please wait...'

words_array_and_hash = APPVariables.new

words_array_and_hash.each_keyword

words_array_and_hash.print_titles

text_file = TextFile.new(words_array_and_hash.keyword_hash)

text_file.write_to_textfile

p ''
puts 'text file has been updated to include links for above posts and other information '
p ''
puts "It's your job to discern which posts are alarming, use the text file to find a link and post a reply."
p ''
puts "if the url isn't working , copy the title string from the text file and do a manual search on reddit"
