# frozen_string_literal: true

class Review < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

  before_save { self.email = email.downcase }
end
