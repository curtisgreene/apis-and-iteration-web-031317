require 'rest-client'
require 'json'
require 'pry'
require_relative "../lib/command_line_interface.rb"

def search_character(character)  # pulling out this helper method to return the search character's hash
  url = "http://www.swapi.co/api/people/?search=#{character}"  #interpolate the character name to access api data directly (all characters)
  character_info = RestClient.get(url)
  character_hash = JSON.parse(character_info)
end

def get_character_movies_from_api(character)
  #make the web request
  character_hash = search_character(character)
  films = []
  character_hash["results"].each do |person|
    if person["name"].downcase == character
      person["films"].collect do |film|
        films << JSON.parse(RestClient.get(film))
      end
    else
      puts "Please use a valid character. Goodbye."
      break
    end
  end
  films
end

def search_movie(movie_title)  # pulling out this helper method to return the search character's hash
  url = "http://www.swapi.co/api/films/?search=#{movie_title}"
  movie_info = RestClient.get(url)
  puts JSON.parse(movie_info)["results"]
end


# iterate over the character hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `parse_character_movies`
#  and that method will do some nice presentation stuff: puts out a list
#  of movies by title. play around with puts out other info about a given film.

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  film_names = []
  films_hash.each do |film|
    film_names << film["title"]
  end
  puts film_names.uniq
end



def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
