# //user create//
7.times do |n|
  User.create!(name: "テストユーザー#{n + 1}", email: "test#{n + 1}@test.com", password: "12345678")
end
User.create!(name: "テスト管理者", email: "admin@test.com", password: "12345678", admin: "true")
User.guest
User.admin_guest

User.all.each do |user|
  image = File.open("./public/seed_user_images/animal#{user.id}.png")
  if user.id.even?
    user.update!(
      prefectures: rand(1..47),
      image: image,
      twitter_url: "https://www.twitter.com",
      tiktok_url: "https://www.tiktok.com",
      youtube_url: "https://www.youtube.com",
    )
  else
    user.update!(
      prefectures: rand(1..47),
      image: image,
      instagram_url: "https://www.instagram.com",
      facebook_url: "https://www.facebook.com",
      website_url: "https://diveintocode.jp/",
    )
  end
end

# //article create//
User.all.each do |user|
  image = File.open("./public/seed_article_images/article#{user.id}.png")
  user.articles.create!(type: 0, title: "記事タイトル", content: "#{user.name}が書いた記事です")
  user.articles.create!(type: 1, title: "質問タイトル", content: "#{user.name}が書いた質問です", image: image)
end

# //favorite create//
3.times do |n|
  User.all.ids.each do |user_id|
    Favorite.create(user_id: user_id, article_id: rand(1..20))
  end
end

# //like create//
3.times do |n|
  User.all.ids.each do |user_id|
    Like.create(user_id: user_id, article_id: rand(1..20))
  end
end

# //comment create//
3.times do |n|
  User.all.each do |user|
    Comment.create(user_id: user.id, article_id: rand(1..20), content: "#{user.name}さんの記事にコメントさせていただきます")
  end
end

# //follow create//
User.all.ids.each do |following_id|
  if following_id == 10
    follower_id = "9"
  else
    follower_id = "10"
  end
  Relationship.create(following_id: following_id, follower_id: follower_id)
end

# //massage create//
Conversation.create(sender_id: 9, recipient_id: 10)
Conversation.find(1).messages.create(user_id: 10, conversation_id: 1, body:"ゲストさんへのメッセージを送ります")
Conversation.find(1).messages.create(user_id: 9, conversation_id: 1, body:"メッセージありがとうございます")
Conversation.find(1).messages.create(user_id: 10, conversation_id: 1, body:"お元気ですか？")
Conversation.find(1).messages.create(user_id: 9, conversation_id: 1, body:"はいとても元気です")
Conversation.find(1).messages.create(user_id: 10, conversation_id: 1, body:"一緒に頑張りましょう")