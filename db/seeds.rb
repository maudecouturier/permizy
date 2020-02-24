User.destroy_all
Booking.destroy_all


puts 'Creating users'
michelin = User.create(first_name: 'Michelin', last_name: 'Gauthier', teacher: true, email: 'michelingauthier@hotmail.com', password: '123456' )
ginette = User.create(first_name: 'Ginette', last_name: 'Tremblay', teacher: false, email: 'ginettetremblay@gmail.com', password: '123456')
puts 'Done creating users'

puts 'Creating bookings'
Booking.create(student: ginette, teacher: michelin)
puts 'Done creating bookings'
