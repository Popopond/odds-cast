class Video < ApplicationRecord
  has_one_attached :cover
  has_one :content, as: :contentable
  accepts_nested_attributes_for :content
  delegate :title, :description, to: :content, allow_nil: true
end
