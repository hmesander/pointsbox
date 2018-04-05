# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command !(or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
User.create!(username: 'Santa', password: 'admin', role: 1)
User.create!(username: 'Dasher', password: 'test')
User.create!(username: 'Dancer', password: 'test')
User.create!(username: 'Prancer', password: 'test')
User.create!(username: 'Vixen', password: 'test')
User.create!(username: 'Comet', password: 'test')
User.create!(username: 'Cupid', password: 'test')
User.create!(username: 'Donner', password: 'test')
User.create!(username: 'Blitzen', password: 'test')

Reward.create!(title: 'Carrots', description: 'Orange and Energizing!', value: 5)
Reward.create!(title: 'Reindeer Sweater', description: 'Tacky but oh so warm!', value: 20)
Reward.create!(title: 'Cookies', description: 'Much more delicious than carrots.', value: 7)
Reward.create!(title: 'How to Win Friends and Influence People', description: 'A book for the recovering bully.', value: 15)
Reward.create!(title: 'Coal', description: 'Dirty.', value: 0)
Reward.create!(title: '364 Days PTO', description: 'Reindeer R&R', value: 30)
