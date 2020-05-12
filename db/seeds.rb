# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Sed ut perspiciatis unde omnis iste natus error sit 
    voluptatem accusantium doloremque laudantium, totam rem aperiam, 
    eaque ipsa quae ab illo inventore veritatis et quasi architecto 
    beatae vitae dicta sunt explicabo."
  )
end

puts "10 blogs created"


5.times do |skl|
  Skill.create!(
    title: "Rail Skill #{skl}",
    percent_utilized: 15
  )
end

puts "5 skills created"

9.times do |port|
  Portfolio.create!(
    title: "Portfolio Title #{port}",
    subtitle: 'My great service',
    body: 'Quis autem vel eum iure',
    main_image: "http://placehold.it/600x400",
    thumb_image:"http://placehold.it/350x200"
  )
end

puts "9 portfolio items created"