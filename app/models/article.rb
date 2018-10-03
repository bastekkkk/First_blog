# frozen_string_literal: true

class Article < ApplicationRecord
	belongs_to :user
  validates :title, presence: true, length: { minimum: 1, maximum: 35 }
  validates :description, presence: true, length: { minimum: 5, maximum: 200 }
  validates :user_id, presence: true
end
