# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 15 }
  validates :description, presence: true, length: { minimum: 5, maximum: 200 }
end
