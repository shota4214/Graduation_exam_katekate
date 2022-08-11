User.create!(name: "admin", email: "admin@admin.com", password: "12345678", admin: "true")
10.times do |n|
  User.create!(name: "test_user#{n + 1}", email: "test#{n + 1}@test.com", password: "12345678")
end

User.all.each do |user|
  user.articles.create!(type: 0, title: "article_title", content: "article_content(#{user.name})")
  user.articles.create!(type: 1, title: "question_title", content: "question_content(#{user.name})")
end
