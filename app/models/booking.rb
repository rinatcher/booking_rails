# frozen_string_literal: true

class Booking < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_one :room

  validates :name, :email, :start_date, :end_date, presence: true
  validates :email, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  validates :start_date, date: { before: :end_date }

  before_save { self.email = email.downcase }

  def self.to_csv
    BookingStats.new.perform(all)
  end
end
