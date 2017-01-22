require 'random_data'

 50.times do
   User.create!(
     name: RandomData.random_sentence
   )
 end
 users = User.all

 100.times do
   Item.create!(
     name: RandomData.random_paragraph
   )
 end

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Item.count} items created"
