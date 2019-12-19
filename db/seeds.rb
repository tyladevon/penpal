# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'roundhouse@kickit.com', google_token: ENV['GOOGLE_TEST_TOKEN'] )
user_2 = User.create(first_name: 'Clark', last_name: 'Kent', email: 'lasereyes@heroes.com', google_token: ENV['GOOGLE_TEST_TOKEN'] )
user_3 = User.create(first_name: 'Santa', last_name: 'Clause', email: 'jollynick@christmas.com', google_token: ENV['GOOGLE_TEST_TOKEN'] )

sad_user_1 = user_1.feelings.create(feeling: 'sad')
upset_user_1 = user_1.feelings.create(feeling: 'upset')

alone_user_2 = user_1.feelings.create(feeling: 'alone')
unmotivated_user_2 = user_1.feelings.create(feeling: 'unmotivated')

stuck_user_3 = user_1.feelings.create(feeling: 'stuck')
upset_user_3 = user_1.feelings.create(feeling: 'upset')
happy_user_3 = user_1.feelings.create(feeling: 'happy')

sad_user_1.categories.create(category: 'music' )
upset_user_1.categories.create(category: 'activity' )
alone_user_2.categories.create(category: 'connect' )
unmotivated_user_2.categories.create(category: 'journal' )
stuck_user_3.categories.create(category: 'music' )
upset_user_3.categories.create(category: 'activity' )
happy_user_3.categories.create(category: 'music' )
