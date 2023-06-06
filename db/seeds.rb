require 'faker'

# Seed pour les utilisateurs
User.create(email: 'user1@example.com', password: 'password1')
User.create(email: 'user2@example.com', password: 'password2')

# Seed pour les articles
30.times do
  user = User.all.sample
  Article.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraphs.join('\n'),
    user: user,
    private: [true, false].sample
  )
end

# Seed pour les commentaires
Article.all.each do |article|
  rand(0..5).times do
    user = User.all.sample
    article.comments.create(
      content: Faker::Lorem.sentence,
      user: user
    )
  end
end

# Seed pour les photos
User.all.each do |user|
  rand(1..5).times do
    user.photos.create(image: 'placeholder.jpg')
  end
end

