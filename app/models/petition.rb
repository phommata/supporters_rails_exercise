class Petition < ApplicationRecord
  def self.getLastNPetitions(limit = 3)
    Petition.where('created_at >= ?', 1.week.ago).order(created_at: :desc).limit(limit)
  end

  def self.getPersonalizedPetitions(userIds)
    Petition.find(followed_petition_starters.users IN userIds).order(created_at: :desc)
  end
end