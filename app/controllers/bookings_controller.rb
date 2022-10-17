# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_room, only: %i[new]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = 'Номер забронирован! Ожидайте подтверждения администратора'
      redirect_to rooms_path
    else
      flash[:alert] = 'Неверно введены данные'
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :start_date, :end_date, :room_id)
  end
end
