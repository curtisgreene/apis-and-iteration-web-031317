#!/usr/bin/env ruby
require 'pry'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)

# welcome
# movie_title = get_movie_name
# search_movie(movie_title)
