# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
60.times do
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
    description: Faker::Lorem.paragraph,
    price_per_day: rand(10..100),
    capacity: rand(1..11),
    housing_type: ['Flat', 'House', 'Castle'].sample,
    user_id: user.id
  )
  flat.save

    picture = Picture.new(
      flat_id: flat.id,
      seed_picture_url: [
        'http://www.nomeancity.net/wp-content/uploads/2013/03/house-donmills0228re02.jpg',
        'http://cdn.freshome.com/wp-content/uploads/2013/04/Modern-A-House-17.jpg',
        'http://www.mytickerz.com/wp-content/uploads/prairie-style-house-plans-2.jpg',
        'http://suburbanfinance.com/wp-content/uploads/2013/04/streetinfo.jpg',
        'http://idealog.co.nz/media/images/blog/2013/11/cb-10-5087-001_phil_benton_builders.jpg',
        'http://media-cdn.tripadvisor.com/media/photo-o/01/ca/eb/48/clenahoo-house.jpg',
        'http://upload.wikimedia.org/wikipedia/commons/6/6b/A._S._Bradford_House.JPG',
        'http://upload.wikimedia.org/wikipedia/commons/4/48/Hanover_House_(Clemson).JPG',
        'http://upload.wikimedia.org/wikipedia/commons/c/ce/James_Wadsworth_Rossetter_House_Front_1.jpg',
        'http://insolitebuzz.fr/wp-content/uploads/2014/10/19971.jpg',
        'http://simplediag.com/wp-content/uploads/2014/07/annonce_2.jpg',
        'http://www.abritel.fr/info/files/shared/banniere/guide/idees-vacances/divers/location-appartement.jpg',
        'http://www.it-immo.lu/wp-content/uploads/2014/09/location-appartement-voyage-abritel.jpg',
        'http://www.contactartisan.com/images/renov_appart_2230347_small.jpg',
        'http://www.meuble-appartement-location.com/decoh/custom/ebiz/img/homePagePictures/5-appartement-meuble-marseille-centre-ville.jpg',
        'http://blogs.cotemaison.fr/archiboom/wp-content/blogs.dir/853/files/2014/03/appartement-moscou-1.jpg',
        'http://www.journalduloft.com/wp-content/immobilier-loft/2008/09/aleph-appartement-loft-450x283.jpg',
        'http://referentiel.nouvelobs.com/file/5231909-a-vendre-bel-appartement-52-m-paris-viie-saint-dominique.jpg',
        'http://upload.wikimedia.org/wikipedia/en/0/0e/Morey_Mansion_in_Winter.jpg',
        'http://upload.wikimedia.org/wikipedia/commons/1/14/Gelbensande3.jpg',
        'http://historicproperties.ky.gov/NR/rdonlyres/988707C1-4174-4548-AB63-EE7CD7A3F635/0/BerryHillMansionSummer.jpg',
        'http://usbecouncil.org/night-of-stars/wp-content/uploads/2013/07/Mansion-with-palm-trees-and-double-pool_www.LuxuryWallpapers.net_.jpg',
        'http://upload.wikimedia.org/wikipedia/commons/1/19/NorwalkCTLockwoodMansionSoSide09032007.JPG',
        'http://media-cdn.tripadvisor.com/media/photo-s/03/33/90/56/the-mansion-at-mgm-grand.jpg',
        'http://upload.wikimedia.org/wikipedia/commons/1/12/Pittock_Mansion_(north_side).jpg',
        'http://2.bp.blogspot.com/_8355ZAyQQLI/TOsKaLi4LqI/AAAAAAAAABE/ZCLi5koGiV8/s1600/Faith+house+on+fire+003.jpg',
        'http://vinviral.com/wp-content/uploads/2014/07/fire.jpg',
        'http://www.fond-ecran-image.com/voir.php?photo=galerie-membre/france-haute-loire/chateau-de-leotoing-1.jpg',
        'http://leroannais.com/wp-content/uploads/noesit/medias/202133/sitrapcu394717-188521-chateau-de-la-roche-copie.jpg',
        'http://www.photo-evasion.com/images/photo_chateau_loire_blois_aile_louis_xii_gothique_410.jpg',
        'http://www.traveltour.fr/sites/default/files/imagecache/ci_gallery/val%20de%20loire%20ch%C3%A2teau%20de%20chenonceau%20vue.jpg',
        'http://www.tours-tourisme.fr/files/ot-tours/files/apigento2/46/46_chateau_sully_sur_loire.jpg',
        'http://static.businessinsider.com/image/4fe1f1adeab8eaf54e000012/image.jpg'
        ].sample
      )
    picture.save
  end