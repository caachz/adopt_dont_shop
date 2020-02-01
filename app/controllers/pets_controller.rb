class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show_index
    @available_pets = Pet.where(shelter_id: params[:id])
  end

  def show
     @pet = Pet.find(params[:id])
  end
end
