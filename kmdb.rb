# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
# Studio Model

Studio.destroy_all
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save
#sanity check
#all_studios = Studio.all
#puts all_studios.inspect

# Movie Model

Movie.destroy_all
studio = Studio.find_by({"name" => "Warner Bros."})
movie = Movie.new
movie ["title"] = "Batman Begins"
movie ["year_released"] = 2005
movie ["rated"] = "PG-13"
movie ["studio_id"] = studio["id"]
movie.save

movie = Movie.new
movie ["title"] = "The Dark Knight"
movie ["year_released"] = 2008
movie ["rated"] = "PG-13"
movie ["studio_id"] = studio["id"]
movie.save

movie = Movie.new
movie ["title"] = "The Dark Knight Rises"
movie ["year_released"] = 2012
movie ["rated"] = "PG-13"
movie["studio_id"] = studio["id"]
movie.save


# Movie Sanity Check
# all_movies = Movie.all
# puts all_movies.inspect

# Actor Model

Actor.destroy_all
actor = Actor.new
actor ["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor ["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor ["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor ["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor ["name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor ["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor ["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor ["name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor ["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor ["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor ["name"] = "Anne Hathaway"
actor.save



# Role Model

Role.destroy_all
# query to find movie title
batmanbegins = Movie.find_by({"title" => "Batman Begins"})
darkknight = Movie.find_by({"title" => "The Dark Knight"})
darkknightrises = Movie.find_by({"title" => "The Dark Knight Rises"})

# query to find actor title
christian_bale = Actor.find_by({"name" => "Christian Bale"})
michael_caine = Actor.find_by({"name" => "Michael Caine"})
liam_neeson = Actor.find_by({"name" => "Liam Neeson"})
katie_holmes = Actor.find_by({"name" => "Katie Holmes"})
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})
heath_ledger = Actor.find_by({"name" => "Heath Ledger"})
aaron_eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
maggie_gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
tom_hardy = Actor.find_by({"name" => "Tom Hardy"})
gordon_levitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
anne_hathaway = Actor.find_by({"name" => "Anne Hathaway"})

# insert new row to Role table
role = Role.new
role ["movie_id"] = batmanbegins["id"]
role ["actor_id"] = christian_bale["id"]
role ["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role ["movie_id"] = batmanbegins["id"]
role ["actor_id"] = michael_caine["id"]
role ["character_name"] = "Alfred"
role.save

role = Role.new
role ["movie_id"] = batmanbegins["id"]
role ["actor_id"] = liam_neeson["id"]
role ["character_name"] = "Ra's Al Ghul"
role.save

role = Role.new
role ["movie_id"] = batmanbegins["id"]
role ["actor_id"] = katie_holmes["id"]
role ["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role ["movie_id"] = batmanbegins["id"]
role ["actor_id"] = gary_oldman["id"]
role ["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role ["movie_id"] = darkknight["id"]
role ["actor_id"] = christian_bale["id"]
role ["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role ["movie_id"] = darkknight["id"]
role ["actor_id"] = heath_ledger["id"]
role ["character_name"] = "Joker"
role.save

role = Role.new
role ["movie_id"] = darkknight["id"]
role ["actor_id"] = aaron_eckhart["id"]
role ["character_name"] = "Harvey Dent"
role.save

role = Role.new
role ["movie_id"] = darkknight["id"]
role ["actor_id"] = michael_caine["id"]
role ["character_name"] = "Alfred"
role.save

role = Role.new
role ["movie_id"] = darkknight["id"]
role ["actor_id"] = maggie_gyllenhaal["id"]
role ["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role ["movie_id"] = darkknightrises["id"]
role ["actor_id"] = christian_bale["id"]
role ["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role ["movie_id"] = darkknightrises["id"]
role ["actor_id"] = gary_oldman["id"]
role ["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role ["movie_id"] = darkknightrises["id"]
role ["actor_id"] = tom_hardy["id"]
role ["character_name"] = "Bane"
role.save

role = Role.new
role ["movie_id"] = darkknightrises["id"]
role ["actor_id"] = gordon_levitt["id"]
role ["character_name"] = "John Blake"
role.save

role = Role.new
role ["movie_id"] = darkknightrises["id"]
role ["actor_id"] = anne_hathaway["id"]
role ["character_name"] = "Selina Kyle"
role.save

# Role Sanity Check
#all_roles = Role.all
# puts all_roles.inspect

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# query for all rows in the movies table
all_movies = Movie.all

# loop through array of all_movies rows
for movie in all_movies
  # read the relevant columns from the movie row
  title = movie ["title"]
  year_released = movie ["year_released"]
  rating = movie ["rated"]

  # query to find the studio title
  studio = Studio.find_by({"id" => movie["studio_id"]})

  # read the studio title
   studio_title = studio["name"]

  puts "#{title} #{year_released} #{rating} #{studio_title}"
  
end

# Sample output:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""


# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# query for all casts in the Cast table
all_casts = Role.all

# loop through array of all_casts rows
for cast in all_casts
  # read all the cast
  char_name = cast ["character_name"]

  # query to find the movie for this cast
  movie = Movie.find_by({"id" => cast["movie_id"]})
  
  # read the movie title from the movie row
  movie_title = movie ["title"]

  # query to find the actor name for this character
  actor = Actor.find_by({"id" => cast["actor_id"]})

  # read the actor name from the character row
  actor_name = actor ["name"]
 
  puts "#{movie_title} #{actor_name} #{char_name} "
end
