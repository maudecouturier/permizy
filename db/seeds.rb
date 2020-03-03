Slot.destroy_all
Booking.destroy_all
User.destroy_all


puts 'Creating users'
julien = User.create(first_name: 'Julien', teacher: true, email: 'julien@gmail.com', password: '123456')
thomas = User.create(first_name: 'Thomas', teacher: true, email: 'thomas@gmail.com', password: '123456')
cecile = User.create(first_name: 'Cecile', teacher: true, email: 'cecile@gmail.com', password: '123456')
peach = User.create(first_name: 'Peach', teacher: false, email: 'peach@gmail.com', password: '123456')
luigi = User.create(first_name: 'Luigi', teacher: false, email: 'luigi@gmail.com', password: '123456')
puts 'Done creating users'

puts 'Attaching photos'
file_julien = URI.open("https://avatars3.githubusercontent.com/u/11377783?v=4")
julien.photo.attach(io: file_julien, filename: 'julien.jpg')
file_thomas = URI.open("https://avatars3.githubusercontent.com/u/16384238?v=4")
thomas.photo.attach(io: file_thomas, filename: 'thomas.jpg')
file_cecile = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1539599254/janttrofl6xagki5zk6g.jpg")
cecile.photo.attach(io: file_cecile, filename: 'cecile.jpg')
file_peach = URI.open("https://f0.pngfuel.com/png/807/610/princess-pitch-png-clip-art.png")
peach.photo.attach(io: file_peach, filename: 'peach.jpg')
file_luigi = URI.open("https://static.wikia.nocookie.net/8f7a639f-6db3-4a43-a32b-5a680133b02b")
luigi.photo.attach(io: file_luigi, filename: 'luigi.jpg')
puts 'Done attaching photos'


puts 'Creating past bookings'
booking1 = Booking.create!(student: peach,
  review_evaluation: 'Premier cours satisfaisant, le démarrage est assimilé ainsi que la gestion de la vitesse. Attention à bien anticiper le freinage en regardant au loin',
  review_content: 'Démarrage turbo, accélération en ligne droite, freinage d\'urgence, évitement',
  review_to_improve: 'Porter le regard plus loin pour mieux anticiper.',
  respect_rating: 3,
  share_rating: 5,
  control_rating: 3)

booking2 = Booking.create!(student: peach,
  review_evaluation: 'Premier contact avec les bananes avec un peu d\'appréhension, ce n\'est qu\'un fruit !',
  review_content: 'Démarrage turbo, dérapage turbo, lancer de bananes, évitement de banane',
  review_to_improve: 'Maniement des armes basiques, en particulier des bananes.',
  respect_rating: 2,
  share_rating: 4,
  control_rating: 4)
booking3 = Booking.create!(student: peach,
  review_evaluation: 'Le lancer de carapace verte n\'est pas encore maitrisé, c\'est mieux sur le freinage, continue comme ça.' ,
  review_content: 'Marche arrière, lancer de carapace verte, lancer arrière, freinage d\'urgence',
  review_to_improve: 'Anticipation des trajectoires pour lancer des carapaces.',
  respect_rating: 3,
  share_rating: 3,
  control_rating: 5)
booking4 = Booking.create!(student: peach,
  review_evaluation: 'Il faut être plus concentrée lorsque tu as l\'étoile et augmenter les distances de sécurité. Le dérapage frein à main n\'est pas encore bien réalisé',
  review_content: 'Conduite avec étoile, virage à gauche, virage à droite, dérapage frein à main',
  review_to_improve: 'Conduite à haute vitesse, et dérapage frein à main.',
  respect_rating: 3,
  share_rating: 3,
  control_rating: 5)
booking5 = Booking.create!(student: peach,
  review_evaluation: 'Cours dédié à l\'utilisation des armes, il faut être plus agressive sur la route. Attention à tes propres carapaces vertes :)',
  review_content: 'Dépose faux bonus, choix de bonus rapide, lancer de carapace rouge, lancer de banane',
  review_to_improve: 'Maniement des armes plus évoluées, et partage de la route.',
  respect_rating: 4,
  share_rating: 5,
  control_rating: 3)
booking6 = Booking.create!(student: peach,
  review_evaluation: 'Cours dans le désert de Kalimari, il faut bien penser à dégonfler tes pneus. La carapace bleue doit être utulisée à bon escient.',
  review_content: 'Lancer de caparace bleue, conduite sur sable, conduite avec étoile, dérapage turbo',
  review_to_improve: 'Refaire un cours de conduite dans le désert pour bien assimiler.',
  respect_rating: 5,
  share_rating: 4,
  control_rating: 4)

puts 'Creating bookings to come'
booking9 = Booking.create(student: peach)
booking10 = Booking.create(student: peach)
booking11 = Booking.create(student: luigi)
booking12 = Booking.create(student: luigi)
booking13 = Booking.create(student: luigi)
booking14 = Booking.create(student: luigi)
booking15 = Booking.create(student: luigi)

puts 'Done creating bookings'

puts 'Creating slots'

User.teachers.each do |teacher|
  starting_date = DateTime.now() - 5
  day = DateTime.new(starting_date.year, starting_date.month, starting_date.day)
  6.times do
      time = 8
      6.times do
        start_time = DateTime.new(day.year, day.month, day.day, time)
        end_time = start_time + 2.hours
        Slot.create!(teacher: teacher, start: start_time, end: end_time)
        time = time + 2
      end
    day += 1
  end
end
puts 'Done creating slots'

past_bookings = [booking1, booking2, booking3, booking4, booking5, booking6]
past_bookings.each do |book|
  slot = Slot.past.sample
  slot.booking = book
  slot.save!
end

future_bookings = [booking9, booking10]
future_bookings.each do |book|
  slot = Slot.future.sample
  slot.booking = book
  slot.save!
end
puts 'Done attributing bookings'


puts 'Creating coordinates'

coordinate_array = [[-122.48369693756104, 37.83381888486939],
[-122.48348236083984, 37.83317489144141],
[-122.48339653015138, 37.83270036637107],
[-122.48356819152832, 37.832056363179625],
[-122.48404026031496, 37.83114119107971],
[-122.48404026031496, 37.83049717427869],
[-122.48348236083984, 37.829920943955045],
[-122.48356819152832, 37.82954808664175],
[-122.48507022857666, 37.82944639795659],
[-122.48610019683838, 37.82880236636284],
[-122.48695850372314, 37.82931081282506],
[-122.48700141906738, 37.83080223556934],
[-122.48751640319824, 37.83168351665737],
[-122.48803138732912, 37.832158048267786],
[-122.48888969421387, 37.83297152392784],
[-122.48987674713133, 37.83263257682617],
[-122.49043464660643, 37.832937629287755],
[-122.49125003814696, 37.832429207817725],
[-122.49163627624512, 37.832564787218985],
[-122.49223709106445, 37.83337825839438],
[-122.49378204345702, 37.83368330777276]]

categories = ['ok', 'nok', 'no_display']

i = 1
coordinate_array.map do |coordinate|
  Coordinate.create!(order: i, longitude: coordinate[0] , latitude:coordinate[1] , booking_id: booking1.id, incident_category: categories.sample)
  i += 1
end

puts 'Done creating coordinates'

