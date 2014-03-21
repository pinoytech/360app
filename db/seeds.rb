# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#initialize company account
require 'open-uri'

Account.where(
    name: 'SourcePad',
    description: 'Lorem ipsum',
    email: 'info@sourcepad.com',
    address: '123 New York City',
    telephone: '123-456-789').first_or_create


#initialize users

#super admin
User.create(first_name: 'Ayra',
           last_name: 'Panganiban',
           email: 'ayrap@sourcepad.com',
           password: '12345678',
           account_id: Account.first.id,
           super_admin: 1)

#admin
User.create(first_name: 'Migz',
           last_name: 'Suelto',
           email: 'michaels@sourcepad.com',
           password: '12345678',
           account_id: Account.first.id,
           admin: 1)

#employee
User.create(first_name: 'Teejay',
            last_name: 'Obazee',
            email: 'tjo@sourcepad.com',
            password: '12345678',
            account_id: Account.first.id
            )

#employee
User.create(first_name: 'Gino',
            last_name: 'Cortez',
            email: 'ginoc@sourcepad.com',
            password: '12345678',
            account_id: Account.first.id)

#initialize badges
designs = [
    {
      url: "http://i.imgur.com/OD79Ok5.png",
      name: 'Client Honor Badge',
      description: 'Outstanding especially when dealing with clients'
    },
    {
      url: "http://i.imgur.com/BxiJWDu.png",
      name: 'Deep Thought Badge',
      description: 'For those who solves hard and complex questions'
    },
    {
      url: "http://i.imgur.com/BCvp6nT.png",
      name: 'Thank You Badge',
      description: 'A general \'thank you\' badge'
    },
    {
      url: "http://i.imgur.com/23HE5RM.png",
      name: 'Finisher Badge',
      description: 'For people who wrap things and get things done!'
    },
    {
      url: "http://i.imgur.com/FbAxD7E.png",
      name: 'Teamplayer Badge',
      description: 'Awesome teamplayer and help us succeed as a team'
    },
    {
      url: "http://i.imgur.com/yWV0Fk9.png",
      name: 'Innovator Badge',
      description: 'For people who come up with innovative solutions and insights'
    },
    {
      url: "http://i.imgur.com/J2FpJw6.png",
      name: 'Thumbs Up Badge',
      description: 'For people who come up with innovative solutions and insights'
    }
]

designs.each do |design|
    Badge.create(
      name: design[:name],
      description: design[:description],
      image: open(design[:url])
    )
end

#initialize message
badge_id = Badge.first.id
sender_id = User.first.id
receiver_id = User.last.id
Message.where(title: 'Hello World!',
              body: 'Please take time to praise someone.',
              badge_id: badge_id,
              from_id: sender_id,
              user_id: receiver_id).first_or_create

#start Feedback Cycle
Season.where(name: '360 Degree Feedback 2014', status: 'open').first_or_create

seed_file = File.join(Rails.root, 'config', 'seed.yml')
seed_yaml = YAML::load_file(seed_file)
seed_yaml["categories"].each do |cat|
  c = Category.find_or_initialize_by(name: cat["name"])  
  c.description = cat["description"]
  c.save!
end
seed_yaml["questions"].each do |question|
  q = Question.find_or_initialize_by(title: question["title"])
  q.description = question["description"]
  q.kind = question["kind"]
  q.category_id = Category.where(name: question["category"]).first.id
  q.save!
end

seed_yaml["exams"].each do |exam|
  e = Exam.find_or_initialize_by(name: exam["name"])
  e.description = exam["description"]
  e.season_id = Season.open.first.id
  e.questions << Question.all
  e.save!
end


