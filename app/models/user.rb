class User < ApplicationRecord

  enum :role, [:manager, :developer]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :tasks
  has_many :teams


end
