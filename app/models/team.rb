class Team < ApplicationRecord
  belongs_to :project
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
end
