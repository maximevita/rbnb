# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  user = User.new(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(8),
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    # TODO profile_pic_url: Faker::Avatar.image
    )
  user.save

  2.times do
    flat = Flat.new(
      title: Faker::Address.city,
      address: Faker::Address.street_address,
      description: Faker::Company.bs,
      price_per_day: rand(10..100),
      capacity: rand(1..5),
      housing_type: ['flat', 'house', 'castle'].sample,
    )
    flat.save
  end
end