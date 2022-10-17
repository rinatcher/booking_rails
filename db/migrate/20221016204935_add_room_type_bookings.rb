# frozen_string_literal: true

class AddRoomTypeBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :room, polymorphic: true
  end
end
