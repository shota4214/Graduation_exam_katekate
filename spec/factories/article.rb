FactoryBot.define do
  factory :article do
    type { 0 }
    title { 'article_title' }
    content { 'article_content' }
    association :user
  end
  factory :second_article, class: Article do
    type { 0 }
    title { 'second_article_title' }
    content { 'second_article_content' }
    draft { 'true' }
    association :user
  end
  factory :article_draft, class: Article do
    type { 0 }
    title { 'article_title_draft' }
    content { 'article_content_draft' }
    draft { 'true' }
    association :user
  end
  factory :question, class: Article do
    type { 1 }
    title { 'question_title' }
    content { 'question_content' }
    association :user
  end
  factory :question_draft, class: Article do
    type { 1 }
    title { 'question_title_draft' }
    content { 'question_content_draft' }
    draft { 'true' }
    association :user
  end
end