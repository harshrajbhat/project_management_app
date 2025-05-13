puts "🌱 Seeding the database..."

# Clear data in dependency-safe order
Milestone.destroy_all
Task.destroy_all
Team.destroy_all
Project.destroy_all
User.destroy_all

# --- Users ---
puts "Creating users..."
admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password",
  role: :admin
)

manager = User.create!(
  name: "Manager User",
  email: "manager@example.com",
  password: "password",
  role: :manager
)

developer1 = User.create!(
  name: "Dev One",
  email: "dev1@example.com",
  password: "password",
  role: :developer
)

developer2 = User.create!(
  name: "Dev Two",
  email: "dev2@example.com",
  password: "password",
  role: :developer
)

# --- Projects ---
puts "Creating projects..."
project1 = Project.create!(
  name: "Project Alpha",
  description: "First sample project",
  start_date: Time.now,
  end_date: Time.now + 30.days,
  status: 0, 
  user: manager
)

project2 = Project.create!(
  name: "Project Beta",
  description: "Second sample project",
  start_date: Time.now,
  end_date: Time.now + 45.days,
  status: 1,
  user: admin
)

# --- Teams ---
puts "Creating teams..."
Team.create!(name: "Alpha Team", project: project1, user: manager)
Team.create!(name: "Alpha Team", project: project1, user: developer1)

Team.create!(name: "Beta Team", project: project2, user: admin)
Team.create!(name: "Beta Team", project: project2, user: developer2)

# --- Tasks ---
puts "Creating tasks..."
Task.create!(
  title: "Set up project structure",
  description: "Initialize with Rails",
  status: 0, 
  due_date: Time.now + 7.days,
  priority: 1,
  project: project1,
  user: developer1
)

Task.create!(
  title: "Add Devise",
  description: "Authentication for users",
  status: 0,
  due_date: Time.now + 5.days,
  priority: 2,
  project: project2,
  user: developer2
)

# --- Milestones ---
puts "Creating milestones..."
Milestone.create!(
  name: "Phase 1 Complete",
  description: "Basic features implemented",
  due_date: Time.now + 20.days,
  project: project1
)

Milestone.create!(
  name: "Launch Beta",
  description: "First public release",
  due_date: Time.now + 30.days,
  project: project2
)

puts "✅ Done seeding!"
