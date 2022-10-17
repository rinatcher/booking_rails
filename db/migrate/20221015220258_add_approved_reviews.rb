# frozen_string_literal: true

class AddApprovedReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :approved, :integer, default: 0
  end
end
