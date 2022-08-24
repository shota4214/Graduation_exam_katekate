User.create!(name: "テスト管理者", email: "admin@test.com", password: "12345678", admin: "true")
10.times do |n|
  User.create!(name: "テストユーザー#{n + 1}", email: "test#{n + 1}@test.com", password: "12345678")
end

User.all.each do |user|
  user.articles.create!(type: 0, title: "記事タイトル", content: "article_content(#{user.name})")
  user.articles.create!(type: 1, title: "質問タイトル", content: "question_content(#{user.name})")
end

10.times do |n|
  Favorite.create!(following_id: 1, follower_id: (n + 1))
end