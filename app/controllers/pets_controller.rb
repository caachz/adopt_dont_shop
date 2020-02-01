class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @available_pets = Pet.where(shelter_id: params[:id])
  end
end
