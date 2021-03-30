# Sprint 1: Build a newsfeed that displays the 3 most recently created petitions from the current week
# Network is out of scope here, you can display any petitions.
# Display the most recent ones from the past week
# Order by creation date desc
#
# Sprint 2: Improve your newsfeed, make it personalized: Only displays petitions that have been created by users
# you are following (ie: from your network)
# ● Use the Network Service endpoint to fetch the network
# /!\ The endpoint is currently being developed by another team, and it is not ready yet. Below is the contract
# provided by the external team.
# Network Service, REST API documentation
# Network Rest Endpoint documentation
# Network object
# Retrieve a list of users followed by a specific user.
# Root URL
# https://api.change.org (this is a fictive URL, only for the exercice)
# REST method
# GET /v1/network/:id
# Parameter
# Id
# An integer representing the user id.
# To keep it simple, we will skip any authentication/authorization constraints. Returns
# Returns a network object (as JSON) if a valid identifier was provided. The network object contains:
# ● User_id : The user id passed as a parameter
#
#
#
# ● Followed_petition_starters: an array of URNs (Ids) of followed users.
# To keep it simple, we will skip any content negotiation. By default, JSON format is returned.
# In practice
# Request
# curl https://api.change.org/v1/network/1234 Response
# {
# ] }
# In the above example, the user with id 1234 is following two petition starters with URN and
#   "user_id":1234,
#  "followed_petition_starters": [
#  {"starter_urn":"urn:changeorg:starter:6757e68c-8ac4-11eb-8dcd-0242ac130003"},
#  {"starter_urn":"urn:changeorg:starter:c6e83ee8-151b-4ac0-8e4a-b0dcc11a7f0d"}
#
# urn:changeorg:starter:6757e68c-8ac4-11eb-8dcd-0242ac13000
# urn:changeorg:starter:c6e83ee8-151b-4ac0-8e4a-b0dcc11a7f0d
#
# Sprint 3: Good job, your newsfeed has a lot of success, you now get thousands of users using it. But the newsfeed
# is getting slower. You are investigating. This is not the DB but the Network Rest Endpoint which is under
# pressure. It sometimes takes several seconds to retrieve user network information.
# You want to ensure your newsfeed can be displayed within 100ms.
# Write / update your code to fallback to the first use case (display 5 latest created petitions) in case the
# external endpoint is too slow
require 'net/http'
require 'date'

class PetitionsController < ApplicationController
  def index
  	  render json: Petition.all
  end

  def last3Petitions
      render json: Petition.getLastNPetitions
  end

  def personalizedPetitions
    uri = URI.parse("https://api.change.org/v1/network/:id")
    response = Net::HTTP::get(uri.request_uri)
    userIds = response['followed_petition_starters']['starter_urn'].values

    render json: Petition.getPersonalizedPetitions(userIds)
  end

  def personalizedPetitionsFast
    uri = URI.parse("https://api.change.org/v1/network/:id")
    response = Net::HTTP::get(uri.request_uri, null, 100)

    if response.nil?
      userIds = response['followed_petition_starters']['starter_urn'].values
      render json: Petition.getPersonalizedPetitions(userIds)
    end

    render json: Petition.getLastNPetitions(5)
  end
end