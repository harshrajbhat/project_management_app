class HomeController < ApplicationController
  def index
    @projects = Project.all
    @tasks = Task.all
    @milestones = Milestone.all
    @users = User.all
  end
end