require 'open-uri'

Slot.destroy_all
Booking.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
Flashcard.destroy_all
Coordinate.destroy_all



puts 'Creating users'
  # TEACHERS
  edouard = User.create(first_name: 'Edouard', teacher: true, email: 'edouard@gmail.com', password: '123456')
  damien = User.create(first_name: 'Damien', teacher: true, email: 'damien@gmail.com', password: '123456')
  julien = User.create(first_name: 'Julien', teacher: true, email: 'julien@gmail.com', password: '123456')
  thomas = User.create(first_name: 'Thomas', teacher: true, email: 'thomas@gmail.com', password: '123456')
  cecile = User.create(first_name: 'Cecile', teacher: true, email: 'cecile@gmail.com', password: '123456')
  # louis = User.create(first_name: 'Louis', teacher: true, email: 'louis@gmail.com', password: '123456')
  # STUDENTS
  peach = User.create(first_name: 'Peach', teacher: false, email: 'peach@gmail.com', password: '123456')
  luigi = User.create(first_name: 'Luigi', teacher: false, email: 'luigi@gmail.com', password: '123456')
puts 'Done creating users'



puts 'Attaching photos to users'
  file_julien = URI.open("https://avatars3.githubusercontent.com/u/11377783?v=4")
  julien.photo.attach(io: file_julien, filename: 'julien.jpg')
  file_thomas = URI.open("https://avatars3.githubusercontent.com/u/16384238?v=4")
  thomas.photo.attach(io: file_thomas, filename: 'thomas.jpg')
  file_cecile = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1539599254/janttrofl6xagki5zk6g.jpg")
  cecile.photo.attach(io: file_cecile, filename: 'cecile.jpg')
  file_edouard = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/u51ojdkeciv4pr6lqzy5.jpg")
  edouard.photo.attach(io: file_edouard, filename: 'edouard.jpg')
  file_damien = URI.open("https://avatars0.githubusercontent.com/u/37899667?s=460&v=4")
  damien.photo.attach(io: file_damien, filename: 'damien.jpg')
  # file_louis = URI.open("https://fr.web.img6.acsta.net/pictures/15/11/23/10/22/340988.jpg")
  # louis.photo.attach(io: file_louis, filename: 'louis.jpg')
  # STUDENTS
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
  respect_rating: 2,
  share_rating: 3,
  control_rating: 0)
booking2 = Booking.create!(student: peach,
  review_evaluation: 'Premier contact avec les bananes avec un peu d\'appréhension, ce n\'est qu\'un fruit !',
  review_content: 'Démarrage turbo, dérapage turbo, lancer de bananes, évitement de banane',
  review_to_improve: 'Maniement des armes basiques, en particulier des bananes.',
  respect_rating: 3,
  share_rating: 3,
  control_rating: 2)
booking3 = Booking.create!(student: peach,
  review_evaluation: 'Le lancer de carapace verte n\'est pas encore maitrisé, c\'est mieux sur le freinage, continue comme ça.' ,
  review_content: 'Marche arrière, lancer de carapace verte, lancer arrière, freinage d\'urgence',
  review_to_improve: 'Anticipation des trajectoires pour lancer des carapaces.',
  respect_rating: 1,
  share_rating: 1,
  control_rating: 3)
booking4 = Booking.create!(student: peach,
  review_evaluation: 'Il faut être plus concentrée lorsque tu as l\'étoile et augmenter les distances de sécurité. Le dérapage frein à main n\'est pas encore bien réalisé',
  review_content: 'Conduite avec étoile, virage à gauche, virage à droite, dérapage frein à main',
  review_to_improve: 'Conduite à haute vitesse, et dérapage frein à main.',
  respect_rating: 4,
  share_rating: 4,
  control_rating: 3)
booking5 = Booking.create!(student: peach,
  review_evaluation: 'Cours dédié à l\'utilisation des armes, il faut être plus agressive sur la route. Attention à tes propres carapaces vertes :)',
  review_content: 'Dépose faux bonus, choix de bonus rapide, lancer de carapace rouge, lancer de banane',
  review_to_improve: 'Maniement des armes plus évoluées, et partage de la route.',
  respect_rating: 4,
  share_rating: 4,
  control_rating: 3)
booking6 = Booking.create!(student: peach,
  review_evaluation: 'Cours dans le désert de Kalimari, il faut bien penser à dégonfler tes pneus. La carapace bleue doit être utulisée à bon escient.',
  review_content: 'Lancer de caparace bleue, conduite sur sable, conduite avec étoile, dérapage turbo',
  review_to_improve: 'Refaire un cours de conduite dans le désert pour bien assimiler.',
  respect_rating: 4,
  share_rating: 4,
  control_rating: 4)

puts 'Creating bookings to come'

  # booking10 = Booking.create!(student: peach)

  luigi_bookings = []
  40.times do |i|
    booking = Booking.create!(student: luigi)
    luigi_bookings << booking
  end
puts 'Done creating bookings'


puts 'Creating random slots'
# 6 slots per day starting at 8am starting at j-5 for 30 days, for each teacher
User.teachers.each do |teacher|
  starting_date = DateTime.now() - 5
  day = DateTime.new(starting_date.year, starting_date.month, starting_date.day)
  30.times do
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

puts 'Done creating random slots'

puts 'Attributing slots to bookings'

# BOOKINGS IN THE PAST (TO DISPLAY GRAPHS)
# past_bookings = [booking1, booking2, booking3, booking4, booking5]
# booking1.slot =
# past_bookings.each do |book|
#   slot = Slot.past.sample
#   slot.booking = book
#   slot.save!
# end

# BOOKING 1
starting_date = DateTime.now() - 60
slot = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 10)
slot_booking = Slot.create!(teacher: edouard, start: slot, end: slot + 2.hours)
booking1.slot = slot_booking
booking1.save!

# BOOKING 2
starting_date = DateTime.now() - 46
slot = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 12)
slot_booking = Slot.create!(teacher: edouard, start: slot, end: slot + 2.hours)
booking2.slot = slot_booking
booking2.save!

# BOOKING 3
starting_date = DateTime.now() - 32
slot = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 18)
slot_booking = Slot.create!(teacher: edouard, start: slot, end: slot + 2.hours)
booking3.slot = slot_booking
booking3.save!

# BOOKING 4
starting_date = DateTime.now() - 16
slot = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 18)
slot_booking = Slot.create!(teacher: edouard, start: slot, end: slot + 2.hours)
booking4.slot = slot_booking
booking4.save!

# BOOKING 5
starting_date = DateTime.now() - 8
slot = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 18)
slot_booking = Slot.create!(teacher: edouard, start: slot, end: slot + 2.hours)
booking5.slot = slot_booking
booking5.save!



# DERNIER COURS TO DISPLAY IN THE CARD
booking6.slot = Slot.past[-24]
booking6.save!

# PEACH FUTURE BOOKING
starting_date = DateTime.now() + 30
slot_future = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 10)
slot_exam = Slot.create!(teacher: edouard, start: slot_future, end: slot_future + 2.hours)
booking9 = Booking.create!(student: peach)
booking9.slot = slot_exam
booking9.save!


# SLOTS QUI SONT DEJA PRIS DANS LA SEMAINE
luigi_bookings.each do |booking|
  slot_future = Slot.future.sample
  slot_future.teacher = User.teachers.sample
  booking.slot = slot_future
  booking.save!
end


# starting_date = DateTime.now() + 1
# slot_tomorrow1 = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 10)
# slot1 = Slot.ceate!(teacher: edouard, start: slot_tomorrow1, end: slot_tomorrow1 + 2.hours)

# starting_date = DateTime.now() + 1
# slot_tomorrow2 = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 12)
# slot2 = Slot.ceate!(teacher: edouard, start: slot_tomorrow2, end: slot_tomorrow1 + 2.hours)

# starting_date = DateTime.now() + 2
# slot_tomorrow3 = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 14)
# slot3 = Slot.ceate!(teacher: edouard, start: slot_tomorrow2, end: slot_tomorrow1 + 2.hours)

# starting_date = DateTime.now() + 2
# slot_tomorrow3 = DateTime.new(starting_date.year, starting_date.month, starting_date.day, 18)
# slot3 = Slot.ceate!(teacher: edouard, start: slot_tomorrow2, end: slot_tomorrow1 + 2.hours)

puts 'Done attributing bookings'

puts 'Creating flashcards'
  secours = Flashcard.create!(question: "Hors autoroute ou endroit dangereux, en cas de panne ou d’accident, où doit être placé le triangle de pré-signalisation ?",
    answer: "Le triangle de pré-signalisation doit être placé à une distance d’environ 30 m de la panne ou de l’accident, ou avant un virage, ou un sommet de côte.")
  manoeuvre = Flashcard.create!(question: "Listez les 4 grandes étapes nécessaires à la réussite d'un créneau.", answer: "Étape 1 : Mettez votre clignotant et placez-vous
  \n Étape 2 : Reculez et braquez
  \n Étape 3 : Contre-braquez
  \n Étape 4 : Finissez votre créneau en centrant votre véhicule")
  partage = Flashcard.create!(question: "Sur quelle voie doit-on circuler et quels sont les espaces de sécurités à respecter ?", answer: "Même quand plusieurs voies empruntent la même direction, chaque conducteur devra circuler sur la voie qui se trouve la plus à droite.
  \n L’usager doit impérativement veiller à laisser une distance de sécurité minimum sur les côtés qui varie entre 1 et 1,5 m s’il circule en agglomération ou en dehors.")
  espace = Flashcard.create!(question: "En quelles circonstances doivent être maintenus les espaces de sécurité ? ", answer: "En toutes circonstances, le candidat maintient des intervalles de sécurité suffisante autour de son véhicule. Il est capable de moduler la distance de sécurité en fonction de sa vitesse et des conditions de circulation. Il augmente cet intervalle lorsque la signalisation, les conditions climatiques ou la situation l'exigent. Il s'assure de ne jamais heurter ou accrocher les obstacles fixes ou mobiles et tient particulièrement compte des usagers vulnérables.")
puts 'Done creating flashcards'

puts 'Creating circuit and coordinates'

trajet_paris = [[2.324615, 48.843578],
[2.329615, 48.841954],
[2.325602, 48.855891],
[2.319637, 48.862216],
[2.320259, 48.864178],
[2.336778, 48.859368],
[2.342536, 48.8585591],
[2.360842, 48.852181],
[2.361443, 48.8497275],
[2.388441, 48.828488],
[2.390434, 48.826913],
[2.401436, 48.829695],
[2.410685, 48.834576],
[2.415309, 48.851576],
[2.413954, 48.854304],
[2.413236, 48.870984],
[2.407416, 48.879426],
[2.398805, 48.884092],
[2.392666, 48.899556],
[2.371219, 48.900657],
[2.359021, 48.900971],
[2.322585, 48.900552],
[2.297391, 48.889649],
[2.280489, 48.877748],
[2.295194, 48.874278],
[2.309975, 48.869052],
[2.319808, 48.865916],
[2.319353, 48.865001],
[2.319418, 48.864710],
[2.320276, 48.864428],
[2.318989, 48.862641],
[2.313452, 48.862842],
[2.312962, 48.858852],
[2.305990, 48.854676],
[2.314054, 48.849210],
[2.315407, 48.846459]]

categories = ['ok', 'Manoeuvre', '1e Secours', 'Partage de la chaussée', 'Maintien des espaces de sécurité' 'no_display']
  i = 1
  trajet_paris.map do |coordinate|
    Coordinate.create!(order: i, longitude: coordinate[0] , latitude:coordinate[1] , booking_id: booking1.id, incident_category: 'no_display', flashcard_id: Flashcard.all.sample.id)
    i += 1
  end
puts 'Done creating coordinates with defined circuit'

puts 'Attributing incident categories to coordinates'
  c3 = Coordinate.all[3]
  c3.incident_category = 'ok'
  c3.save
  c5 = Coordinate.all[5]
  c5.incident_category = 'ok'
  c5.save
  c7 = Coordinate.all[7]
  c7.incident_category = 'ok'
  c7.save
  c_6 = Coordinate.all[-6]
  c_6.incident_category = 'ok'
  c_6.save
  c_7 = Coordinate.all[-7]
  c_7.incident_category = 'ok'
  c_7.save
  c_1 = Coordinate.all[-1]
  c_1.incident_category = 'Manoeuvre'
  c_1.save
  c14 = Coordinate.all[14]
  c14.incident_category = '1e Secours'
  c14.save
  c17 = Coordinate.all[17]
  c17.incident_category = 'Partage de la chaussée'
  c17.save
  c_4 = Coordinate.all[-4]
  c_4.incident_category = 'Maintien des espaces de sécurité'
  c_4.save
puts 'Aone attributing incident categories to coordinates'

puts 'Attributing flashcards'
  Coordinate.all[-1].flashcard_id = manoeuvre.id
  Coordinate.all[14].flashcard_id = secours.id
  Coordinate.all[17].flashcard_id = partage.id
  Coordinate.all[-4].flashcard_id = espace.id
puts 'Done attributing flashcards'







