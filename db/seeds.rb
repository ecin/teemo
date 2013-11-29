# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
george = User.create name: "George Tang", email: "george.tang727@gmail.com", password: "welcome", password_confirmation: "welcome"
nelson = User.create name: "Nelson Crespo", email: "nel@copypastel.com", password: "welcome", password_confirmation: "welcome"

# Activities
tennis = Activity.create name: "Tennis"
cooking = Activity.create name: "Cooking"
rock_climbing = Activity.create name: "Rock Climbing"
dancing = Activity.create name: "Dancing"
movies = Activity.create name: "Movies"

# Which activities do users like
george.activities << [tennis, cooking, dancing]
nelson.activities << [tennis, rock_climbing, movies]

# Allies (what do you want to do, and with whom)
Ally.create captain: nelson, user: george, activity: tennis
Ally.create captain: nelson, user: george, activity: movies

Ally.create captain: george, user: nelson, activity: tennis
Ally.create captain: george, user: nelson, activity: cooking