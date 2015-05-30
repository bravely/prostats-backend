# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create!([
  { handle: 'Faker', real_name: 'Lee Sang-hyeok', position: 'middle', season_wins: 3, season_losses: 0 }
])
