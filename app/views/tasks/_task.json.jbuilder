json.extract! task, :id, :title, :description, :status, :due_date, :priority, :project_id, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
