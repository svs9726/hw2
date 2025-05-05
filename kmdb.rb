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
# - Note rubric explanation for appropriate use of external resources.

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
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

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
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all
Character.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Creating Studio data
#Pre-count check
puts "Studios: #{Studio.all.count}"

new_studio = Studio.new
new_studio["studio_name"] = "Warner Bros."
new_studio.save

puts "Studios: #{Studio.all.count}"

#link to studio
wb = Studio.find_by({"studio_name" => "Warner Bros."}) 

#Creating Movie Data
puts "Movies: #{Movie.all.count}"

new_movie1 = Movie.new
new_movie1["title"] = "Batman Begins"
new_movie1["year_released"] = 2005
new_movie1["rated"] = "PG-13"
new_movie1["studio_id"] = wb["id"]
new_movie1.save

new_movie2 = Movie.new
new_movie2["title"] = "The Dark Knight"
new_movie2["year_released"] = 2008
new_movie2["rated"] = "PG-13"
new_movie2["studio_id"] = wb["id"]
new_movie2.save

new_movie3 = Movie.new
new_movie3["title"] = "The Dark Knight Rises"
new_movie3["year_released"] = 2012
new_movie3["rated"] = "PG-13"
new_movie3["studio_id"] = wb["id"]
new_movie3.save

puts "Movies: #{Movie.all.count}"

# Creating movie associations
bb = Movie.find_by({"title" => "Batman Begins"})
tdk = Movie.find_by({"title" => "The Dark Knight"})
tdkr = Movie.find_by({"title" => "The Dark Knight Rises"})

#Creating actor data and creating actor associations
puts "Actors: #{Actor.all.count}"

new_actor1 = Actor.new
new_actor1["name"] = "Christian Bale"
new_actor1.save
cb = Actor.find_by({"name" => "Christian Bale"})

new_actor2 = Actor.new
new_actor2["name"] = "Michael Caine"
new_actor2.save
mc = Actor.find_by({"name" => "Michael Caine"})

new_actor3 = Actor.new
new_actor3["name"] = "Liam Neeson"
new_actor3.save
ln = Actor.find_by({"name" => "Liam Neeson"})

new_actor4 = Actor.new
new_actor4["name"] = "Katie Holmes"
new_actor4.save
kh = Actor.find_by({"name" => "Katie Holmes"})

new_actor5 = Actor.new
new_actor5["name"] = "Gary Oldman"
new_actor5.save
gold = Actor.find_by({"name" => "Gary Oldman"})

new_actor6 = Actor.new
new_actor6["name"] = "Heath Ledger"
new_actor6.save
hl = Actor.find_by({"name" => "Heath Ledger"})

new_actor7 = Actor.new
new_actor7["name"] = "Aaron Eckhart"
new_actor7.save
aeck = Actor.find_by({"name" => "Aaron Eckhart"})

new_actor8 = Actor.new
new_actor8["name"] = "Maggie Gyllenhaal"
new_actor8.save
mg = Actor.find_by({"name" => "Maggie Gyllenhaal"})

new_actor9 = Actor.new
new_actor9["name"] = "Tom Hardy"
new_actor9.save
tom = Actor.find_by({"name" => "Tom Hardy"})

new_actor10 = Actor.new
new_actor10["name"] = "Joseph Gordon Levitt"
new_actor10.save
jo = Actor.find_by({"name" =>"Joseph Gordon Levitt"})

new_actor11 = Actor.new
new_actor11["name"] = "Anne Hathaway"
new_actor11.save
anne = Actor.find_by({"name"=>"Anne Hathaway"})

puts "Actors: #{Actor.all.count}"

#Creating roles data
puts "Characters: #{Character.all.count}"

new_character1 = Character.new
new_character1["character"] = "Bruce Wayne"
new_character1["movie_id"] = bb["id"]
new_character1["actor_id"] = cb["id"]
new_character1.save

new_character2 = Character.new
new_character2["character"] = "Alfred"
new_character2["movie_id"] = bb["id"]
new_character2["actor_id"] = mc["id"]
new_character2.save

new_character3 = Character.new
new_character3["character"] = "Ra's Al Ghul"
new_character3["movie_id"] = bb["id"]
new_character3["actor_id"] = ln["id"]
new_character3.save

new_character4 = Character.new
new_character4["character"] = "Rachel Dawes"
new_character4["movie_id"] = bb["id"]
new_character4["actor_id"] = kh["id"]
new_character4.save

new_character5 = Character.new
new_character5["character"] = "Commissioner Gordon"
new_character5["movie_id"] = bb["id"]
new_character5["actor_id"] = gold["id"]
new_character5.save

new_character6 = Character.new
new_character6["character"] = "Bruce Wayne"
new_character6["movie_id"] = tdk["id"]
new_character6["actor_id"] = cb["id"]
new_character6.save

new_character7 = Character.new
new_character7["character"] = "Joker"
new_character7["movie_id"] = tdk["id"]
new_character7["actor_id"] = hl["id"]
new_character7.save

new_character8 = Character.new
new_character8["character"] = "Harvey Dent"
new_character8["movie_id"] = tdk["id"]
new_character8["actor_id"] = aeck["id"]
new_character8.save

new_character9 = Character.new
new_character9["character"] = "Alfred"
new_character9["movie_id"] = tdk["id"]
new_character9["actor_id"] = mc["id"]
new_character9.save

new_character10 = Character.new
new_character10["character"] = "Rachel Dawes"
new_character10["movie_id"] = tdk["id"]
new_character10["actor_id"] = mg["id"]
new_character10.save

new_character11 = Character.new
new_character11["character"] = "Bruce Wayne"
new_character11["movie_id"] = tdkr["id"]
new_character11["actor_id"] = cb["id"]
new_character11.save

new_character12 = Character.new
new_character12["character"] = "Commissioner Gordon"
new_character12["movie_id"] = tdkr["id"]
new_character12["actor_id"] = gold["id"]
new_character12.save

new_character13 = Character.new
new_character13["character"] = "Bane"
new_character13["movie_id"] = tdkr["id"]
new_character13["actor_id"] = tom["id"]
new_character13.save

new_character14 = Character.new
new_character14["character"] = "John Blake"
new_character14["movie_id"] = tdkr["id"]
new_character14["actor_id"] = jo["id"]
new_character14.save

new_character15 = Character.new
new_character15["character"] = "Selina Kyle"
new_character15["movie_id"] = tdkr["id"]
new_character15["actor_id"] = anne["id"]
new_character15.save

puts "Characters: #{Character.all.count}"


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
for movie in Movie.all
    studio = Studio.find_by(id: movie.studio_id)
    puts "#{movie.title.ljust(25)} #{movie.year_released.to_s.ljust(20)} #{movie.rated.ljust(20)} #{studio.studio_name.ljust(25)}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
for character in Character.all
    actor = Actor.find_by(id: character.actor_id)
    movie = Movie.find_by(id: character.movie_id)

    puts "-- #{movie.title.ljust(25)} #{actor.name.ljust(25)} #{character.character.ljust(25)}"
end
