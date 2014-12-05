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
      # seed_picture_url: 'http://lorempixel.com/250/250/city/'
      seed_picture_url: [
        'http://www.linternaute.com/actualite/argent/06/chateaux-a-vendre/0606/images/chateau-fort1.jpg',
        'http://www.lesandelys-tourisme.fr/wp-content/uploads/krea3medias/chateau-gaillard-304.jpg',
        'http://www.coupsdecoeurpourlemonde.com/wp-content/uploads/2012/02/Chateau_Frontenac-M_Julien-.jpg',
        'http://blog.idphys.fr/wp-content/uploads/2011/03/Maison.jpg'
      ].sample
      )
    picture.save
  end