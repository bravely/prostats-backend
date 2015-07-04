# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skt = Team.create!(name: 'SK Telecom T1', location: 'South Korea')

Player.create!([
  { handle: 'Faker', real_name: 'Lee Sang-hyeok', position: 'middle', season_wins: 3, season_losses: 0, team: skt },
  { handle: 'MaRin', real_name: 'Jang Gyeong-Hwan', position: 'top', season_wins: 5, season_losses: 1, team: skt },
  { handle: 'bengi', real_name: 'Im Jae-hyeon', position: 'jungle', season_wins: 3, season_losses: 0, team: skt },
  { handle: 'Bang', real_name: 'Bae Jun-sik', position: 'marksman', season_wins: 5, season_losses: 1, team: skt },
  { handle: 'Wolf', real_name: 'Lee Jae-wan', position: 'support', season_wins: 5, season_losses: 1, team: skt },
  { handle: 'Hai', real_name: 'Hai Du Lam', position: 'jungle', season_wins: 2, season_losses: 3 }
])
