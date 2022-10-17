# frozen_string_literal: true

module Admin
  class BookingsController < ApplicationController
    before_action :set_booking, only: %i[update destroy]
    before_action :authenticate_user!

    def index
      @bookings = Booking.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
      @bookings_approved = Booking.where(approved: 1)
      respond_to do |format|
        format.html
        format.csv do
          send_data @bookings_approved.to_csv,
                    filename: "bookings-#{Time.zone.today}.csv"
        end
        format.xlsx
      end
    end

    def update
      @booking.update(approved: 1)
      redirect_to admin_bookings_path
      flash[:success] = 'Бронь подтверждена'
    end

    def destroy
      @booking.destroy
      flash[:success] = 'Бронь удалена'
      redirect_to admin_bookings_path
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
end
