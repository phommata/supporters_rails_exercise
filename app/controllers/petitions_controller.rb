class PetitionsController < ApplicationController
  def index
  	  render json: Petition.all 
  end
end
