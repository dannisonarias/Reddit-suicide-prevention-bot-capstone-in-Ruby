#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'redd'
require_relative './lib/login.rb'
require_relative './lib/logic.rb'
require_relative './lib/text_file_creator.rb'

puts 'Hello! , Welcome to the suicide prevention ruby program'
puts 'Read the README file for a guide on how to help people.'
puts 'Getting Posts from reddit associated with people'
print ' who may have suicidal thoughts'
puts  'all post are from the last hour on reddit'
sleep(0.3)
puts '...loading please wait... a minimum of 1 minute...'

words_array_and_hash = APPVariables.new

words_array_and_hash.each_keyword

words_array_and_hash.print_titles

text_file = TextFile.new(words_array_and_hash.keyword_hash)

text_file.write_to_textfile

p ''
puts 'text file has been updated with urls other information from results'
p ''
puts 'Discern which posts are alarming'
print ' use the text file to find a link and post a reply.'
p ''
puts "do a manual search on reddit for the title if the url doesn't work"
