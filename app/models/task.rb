class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

 
  enum :status, [:todo, :in_progress, :completed]
  enum :priority, [:low, :medium, :high]

end
