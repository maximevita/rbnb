# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do
  user = User.new(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(8),
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    # TODO profile_pic_url: Faker::Avatar.image
    )
  user.save

  flat = Flat.new(
    title: Faker::Address.city,
    address: ['Paris', 'Berlin', 'Madrid', 'London', 'Rome'].sample,
    description: Faker::Company.bs,
    price_per_day: rand(10..100),
    capacity: rand(1..5),
    housing_type: ['Flat', 'House', 'Castle'].sample,
    user_id: user.id
  )
  flat.save

    picture = Picture.new(
      flat_id: flat.id,
      seed_picture_url: 'http://lorempixel.com/640/480/city/'
      )
    picture.save
  end