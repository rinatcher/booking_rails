# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
