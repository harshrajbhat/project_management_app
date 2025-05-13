class HomeController < ApplicationController
  def index
    if current_user.manager?
      @projects = Project.all
    else
      @projects = current_user.projects
    end
  
    @tasks = Task.where(user: current_user)
    @milestones = Milestone.joins(:project).where(projects: { user_id: current_user.id })
  end
  
end