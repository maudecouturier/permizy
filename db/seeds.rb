Booking.destroy_all
User.destroy_all


puts 'Creating users'
michelin = User.create(first_name: 'Michelin', last_name: 'Gauthier', teacher: true, email: 'michelingauthier@hotmail.com', password: '123456' )
ginette = User.create(first_name: 'Ginette', last_name: 'Tremblay', teacher: false, email: 'ginettetremblay@gmail.com', password: '123456')
maude = User.create(first_name: 'Maude', last_name: 'Couturier', teacher: false, email: 'maudecouturier@gmail.com', password: '123456')
puts 'Done creating users'

puts 'Creating bookings'
Booking.create(student: ginette, teacher: michelin, review_evaluation: 'tres bien', review_content: 'tres bien', review_to_improve: 'ta conduite', respect_rating: 4, share_rating: 5, control_rating: 3)
Booking.create(student: ginette, teacher: michelin, review_evaluation: 'tres bien', review_content: 'tres bien', review_to_improve: 'ta conduite', respect_rating: 5, share_rating: 4, control_rating: 4)
Booking.create(student: maude, teacher: michelin, review_evaluation: 'tres bien', review_content: 'tres bien', review_to_improve: 'ta conduite', respect_rating: 3, share_rating: 3, control_rating: 5)
puts 'Done creating bookings'
