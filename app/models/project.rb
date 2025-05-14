class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :milestones
  has_many :teams
 
  enum :status, [:pending, :ongoing, :completed]
end


