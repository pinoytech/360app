# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: 'Ayra', last_name: 'Panganiban', email: 'ayrap@sourcepad.com', password: '12345678')
User.create(first_name: 'Admin', last_name: 'User', email: 'admin@sourcepad.com', password: '12345678', admin: 1)

Message.create(title: 'Hello World!', body: 'Please take time to praise someone.', badge_id: 1, from_id: 2, user_id: 1)
