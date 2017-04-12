# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'testing1@nothing.com')
user2 = User.create(email: 'testing2@nothing.com')
user3 = User.create(email: 'testing3@nothing.com')
user4 = User.create(email: 'testing4@nothing.com')
user5 = User.create(email: 'testing5@nothing.com')
user6 = User.create(email: 'testing6@nothing.com')
user7 = User.create(email: 'testing7@nothing.com')


short1 = ShortenedUrl.shorten(user1, 'random1.com')
short2 = ShortenedUrl.shorten(user1, 'random2.com')
short3 = ShortenedUrl.shorten(user3, 'random3.com')
short4 = ShortenedUrl.shorten(user7, 'random4.com')
short5 = ShortenedUrl.shorten(user1, 'random5.com')
