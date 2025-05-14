puts "🌱 Seeding the database..."

# Clear existing records
Milestone.destroy_all
Task.destroy_all
Team.destroy_all
Project.destroy_all
User.destroy_all

# --- Users ---
puts "Creating users..."

manager = User.create!(
  name: "Manager User",
  email: "manager@example.com",
  password: "password",
  role: :manager
)

developers = 10.times.map do |i|
  User.create!(
    name: "Dev #{i + 1}",
    email: "dev#{i + 1}@example.com",
    password: "password",
    role: :developer
  )
end

# --- Projects ---
puts "Creating projects..."

projects = 20.times.map do |i|
  owner = developers[i % developers.length] # Rotate through developers
  Project.create!(
    name: "Project #{i + 1}",
    description: "Description for project #{i + 1}",
    start_date: Time.now,
    end_date: Time.now + (15 + i).days,
    status: i % 3, # 0 = todo, 1 = in_progress, 2 = completed
    user: owner
  )
end

# --- Teams ---
puts "Creating teams..."

projects.each_with_index do |project, i|
  team = Team.create!(name: "Team #{i + 1}", project: project)
  # Add 2–3 developers to each team
  team_members = developers.sample(3)
  team.users << team_members
end

# --- Tasks ---
puts "Creating tasks..."

projects.each_with_index do |project, i|
  task_owner = project.user
  3.times do |j|
    Task.create!(
      title: "Task #{j + 1} for #{project.name}",
      description: "Do work #{j + 1}",
      status: [:todo, :in_progress, :completed].sample,
      due_date: Time.now + (j + 1).days,
      priority: [:low, :medium, :high].sample,
      project: project,
      user: task_owner
    )
  end
end

# --- Milestones ---
puts "Creating milestones..."

projects.each_with_index do |project, i|
  Milestone.create!(
    name: "Milestone for #{project.name}",
    description: "Important checkpoint for #{project.name}",
    due_date: Time.now + (10 + i).days,
    project: project
  )
end

puts "✅ Done seeding!"
