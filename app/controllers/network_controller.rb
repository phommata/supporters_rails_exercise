class NetworkController < ApplicationController

  def index
  	render json: File.read("./app/network-mock.json")
  end
end
