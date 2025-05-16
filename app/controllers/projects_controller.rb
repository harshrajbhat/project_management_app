class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  
  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).page(params[:page]).per(6)
  end
  

  def show
    if current_user.manager?
      @tasks = @project.tasks
    else
      @tasks = @project.tasks.where(user_id: current_user.id)
    end
  end


  def new
    @project = Project.new
  end


  def edit
  end


  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_path, status: :see_other, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_project
      @project = Project.find(params.expect(:id))
    end

    def project_params
      params.expect(project: [ :name, :description, :start_date, :end_date, :status, :user_id ])
    end
end