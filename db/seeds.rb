# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rooms = Room.create([{name: 'First Room'},{name: 'Second Room'}, {name: 'Third Room'}])

# song1 = Song.create([{user_id: 1},{title: 'mojo so dope'}, {artist: 'Kid cudi'}, {duration: 300000}, {url: 'https://soundcloud.com/elephanttribe/kid-cudi-mojo-so-dope-elephant'}, room_id: 1])

require 'populator'
require 'faker'

Song.populate(10) do |song|
  song.user_id = 1
  song.title = Faker::Commerce.color
  song.artist = Faker::Name.first_name
  song.duration = 200000
  song.url = Faker::Internet.url
  song.room_id = 1
end