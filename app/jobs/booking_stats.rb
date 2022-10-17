# frozen_string_literal: true

class BookingStats < ApplicationJob
  require 'csv'
  queue_as :default

  def perform(all)
    CSV.generate(col_sep: ';') do |csv|
      csv << all.attribute_names
      all.each do |booking|
        csv << booking.attributes.values
      end
    end
  end
end
