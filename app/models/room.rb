# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :bookings
  has_many_attached :images

  validates :name, :description, :price, presence: true
end
