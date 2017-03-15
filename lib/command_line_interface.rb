require 'pry'

def welcome
  # puts out a welcome message here!
  puts "Welcome! I'll show you Starwars movie titles based on a character!"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
  user_input = user_input.downcase
end


# def get_movie_name
#   puts "please enter a Starwars movie name"
#   user_input = gets.chomp
#   user_input = user_input.downcase
# end
