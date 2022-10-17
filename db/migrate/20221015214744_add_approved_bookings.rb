# frozen_string_literal: true

class AddApprovedBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :approved, :integer, default: 0
  end
end
