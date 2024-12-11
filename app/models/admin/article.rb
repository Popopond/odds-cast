class Admin::Article < ApplicationRecord
  has_one_attached :photo
  has_one :content, as: :contentable, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :content
  delegate :title, :description, to: :content, allow_nil: true
  
  validates_with ProfanityValidator
end
