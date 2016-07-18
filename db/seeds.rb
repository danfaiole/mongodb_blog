# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do
  Post.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraphs(3)
  )
end

Post.each do |post|
  12.times do
    post.comments.create(
      user_name: Faker::Name.name,
      content: Faker::Lorem.paragraphs
    )
  end
end
