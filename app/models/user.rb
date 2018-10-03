# frozen_string_literal: true

class User < ApplicationRecord
	has_many :articles
	before_save {self.email = email.downcase}
  validates :name, presence: true, length: { minimum: 5, maximum: 10 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 5, maximum: 10 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end
