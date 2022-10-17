# frozen_string_literal: true

module Admin
  class RoomsController < ApplicationController
    before_action :set_room, only: %i[edit update destroy]
    before_action :authenticate_user!

    def index
      @rooms = Room.paginate(page: params[:page], per_page: 4).order(updated_at: :desc)
    end

    def new
      @room = Room.new
    end

    def create
      @room = Room.new(room_params)
      if @room.save
        flash[:success] = 'Room was successfully created!'
        redirect_to admin_rooms_path(@room)
      else
        flash[:alert] = 'Error! Room was not created'
        render :new
      end
    end

    def edit; end

    def update
      if @room.update(room_params)
        flash[:notice] = 'Room was updated'
        redirect_to admin_rooms_path
      else
        flash[:alert] = 'Room was not updated'
        render :edit
      end
    end

    def destroy
      @room.destroy
      flash[:notice] = 'Room was deleted'
      redirect_to admin_rooms_path
    end

    private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :description, :price, images: [])
    end
  end
end
