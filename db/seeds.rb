# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command !(or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
User.create!(username: 'Admin', password: 'admin', role: 1)
User.create!(username: 'Haley', password: 'test')
User.create!(username: 'Bob', password: 'test')
User.create!(username: 'Henry', password: 'test')
User.create!(username: 'John', password: 'test')
User.create!(username: 'Peter', password: 'test')
User.create!(username: 'Mary', password: 'test')
User.create!(username: 'Lox', password: 'test')
User.create!(username: 'Bagel', password: 'test')

Reward.create!(title: 'Thing1', description: 'Description1', value: 20, image: 'public/phone.jpeg')
Reward.create!(title: 'Thing2', description: 'Description2', value: 20, image: 'public/phone.jpeg')
Reward.create!(title: 'Thing3', description: 'Description3', value: 20, image: 'public/phone.jpeg')
Reward.create!(title: 'Thing4', description: 'Description4', value: 20, image: 'public/phone.jpeg')
Reward.create!(title: 'Thing5', description: 'Description5', value: 20, image: 'public/phone.jpeg')
Reward.create!(title: 'Thing6', description: 'Description6', value: 20, image: 'public/phone.jpeg')
Reward.create!(title: 'Thing7', description: 'Description7', value: 20, image: 'public/phone.jpeg')
