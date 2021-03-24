class NetworkController < ApplicationController

  def index
  	render json: File.read("./app/mocks/network-mock.json")
  end
end
