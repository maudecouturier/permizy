Booking.destroy_all
User.destroy_all


puts 'Creating users'
mario = User.create(first_name: 'Mario', teacher: true, email: 'mario@hotmail.com', password: '123456' )
yoshi = User.create(first_name: 'Yoshi', teacher: true, email: 'yoshi@gmail.com', password: '123456')
wario = User.create(first_name: 'Wario', teacher: true, email: 'wario@gmail.com', password: '123456')
luigi = User.create(first_name: 'Luigi', teacher: true, email: 'luigi@gmail.com', password: '123456')
peach = User.create(first_name: 'Peach', teacher: false, email: 'peach@gmail.com', password: '123456')
puts 'Done creating users'

puts 'Creating past bookings'
Booking.create(student: peach, teacher: yoshi,
  review_evaluation: 'Premier cours satisfaisant, le démarrage est assimilé ainsi que la gestion de la vitesse. Attention à bien anticiper le freinage en regardant au loin',
  review_content: 'Démarrage turbo, accélération en ligne droite, freinage d\'urgence, évitement',
  review_to_improve: 'Porter le regard plus loin pour mieux anticiper.',
  respect_rating: 3,
  share_rating: 5,
  control_rating: 3,
  slot: DateTime.new(2020,2,3,10,0,0))

Booking.create(student: peach, teacher: yoshi,
  review_evaluation: 'Premier contact avec les bananes avec un peu d\'appréhension, ce n\'est qu\'un fruit !',
  review_content: 'Démarrage turbo, dérapage turbo, lancer de bananes, évitement de banane',
  review_to_improve: 'Maniement des armes basiques, en particulier des bananes.',
  respect_rating: 2,
  share_rating: 4,
  control_rating: 4,
  slot: DateTime.new(2020,2,3,10,0,0))

Booking.create(student: peach, teacher: yoshi,
  review_evaluation: 'La lancer de carapace verte n\'est pas encore maitrisé, c\'est mieux sur le freinage, continue comme ça.' ,
  review_content: 'Marche arrière, lancer de carapace verte, lancer arrière, freinage d\'urgence',
  review_to_improve: 'Anticipation des trajectoires pour lancer des carapaces.',
  respect_rating: 3,
  share_rating: 3,
  control_rating: 5,
  slot: DateTime.new(2020,2,5,12,0,0))

Booking.create(student: peach, teacher: mario,
  review_evaluation: 'Il faut être plus concentrée lorsque tu as l\'étoile et augmenter les distances de sécurité. Le dérapage frein à main n\'est pas encore bien réalisé',
  review_content: 'Conduite avec étoile, virage à gauche, virage à droite, dérapage frein à main',
  review_to_improve: 'Conduite à haute vitesse, et dérapage frein à main.',
  respect_rating: 3,
  share_rating: 3,
  control_rating: 5,
  slot: DateTime.new(2020,2,7,10,0,0))

Booking.create(student: peach, teacher: mario,
  review_evaluation: 'Cours dédié à l\'utilisation des armes, il faut être plus agressive sur la route. Attention à tes propres carapaces vertes :)',
  review_content: 'Dépose faux bonus, choix de bonus rapide, lancer de carapace rouge, lancer de banane',
  review_to_improve: 'Maniement des armes plus évoluées, et partage de la route.',
  respect_rating: 4,
  share_rating: 5,
  control_rating: 3,
  slot: DateTime.new(2020,2,15,16,0,0))

Booking.create(student: peach, teacher: luigi,
  review_evaluation: 'Cours dans le désert de Kalimari, il faut bien penser à dégonfler tes pneus. La carapace bleue doit être utulisée à bon escient.',
  review_content: 'Lancer de caparace bleue, conduite sur sable, conduite avec étoile, dérapage turbo',
  review_to_improve: 'Refaire un cours de conduite dans le désert pour bien assimiler.',
  respect_rating: 5,
  share_rating: 4,
  control_rating: 4,
  slot: DateTime.new(2020,2,19,18,0,0))

Booking.create(student: peach, teacher: luigi,
  review_evaluation: 'Cours sur la banquise arctique, bonne gestion de l\'adhérence. attention tout de même aux chutes dans l\'océan, l\'eau peut être froide',
  review_content: 'Conduite sur glace, virage sur glace, freinage sur glace',
  review_to_improve: 'Les virages sur glace doivent être retravaillés.',
  respect_rating: 3,
  share_rating: 3,
  control_rating: 5,
  slot: DateTime.new(2020,2,22,12,0,0))

puts 'Creating bookings to come'
Booking.create(student: peach, teacher: mario,
  slot: DateTime.new(2020,3,10,16,0,0))

Booking.create(student: peach, teacher: yoshi,
  slot: DateTime.new(2020,3,12,10,0,0))

puts 'Done creating bookings'
