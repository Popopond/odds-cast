class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true
  has_one_attached :photo
  enum state: {draft: 0, in_review: 1, published: 2}

  state_machine :state, initial: :draft do
    event :submit_for_review do
      transition draft: :in_review
    end

    event :approve do
      transition in_review: :published
    end

    event :reject do
      transition in_review: :draft
    end

end
