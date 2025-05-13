class Project < ApplicationRecord
  belongs_to :user

 
  enum :status, [:pending, :ongoing, :completed]
end


