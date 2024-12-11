# spec/factories/admin_articles.rb
FactoryBot.define do
    factory :admin_article, class: 'Admin::Article' do
      association :content, factory: :content, strategy: :build
    end
  end
  