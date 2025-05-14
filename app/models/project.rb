class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :milestones
  has_many :teams

  enum :status, [:pending, :ongoing, :completed]

 
  def self.ransackable_attributes(auth_object = nil)
    %w[id name description]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user tasks milestones teams]
  end
end
