# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E"
movies_api = URI.open(url).read
movies_seed = JSON.parse(movies_api)
movies_results = movies_seed["results"]

movies_results.each do |m|
  Movie.create(
  title: m["original_title"],
  overview: m["overview"],
  poster_url: "https://image.tmdb.org/t/p/w500" + m["poster_path"],
  rating: m["vote_average"].to_f
)
end
