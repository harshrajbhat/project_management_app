class User < ApplicationRecord

  enum :role, [:manager, :developer]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :tasks
  has_many :teams, through: :team_users
  has_many :team_users, dependent: :destroy
 
  
end

