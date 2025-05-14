class MilestonesController < ApplicationController
  before_action :set_milestone, only: %i[ show edit update destroy ]

  
  def index
    @milestones = Milestone.all
  end

  def show
  end

  def new
    @milestone = Milestone.new
  end

  def edit
  end

  def create
    @milestone = Milestone.new(milestone_params)

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to @milestone, notice: "Milestone was successfully created." }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to @milestone, notice: "Milestone was successfully updated." }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @milestone.destroy!

    respond_to do |format|
      format.html { redirect_to milestones_path, status: :see_other, notice: "Milestone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_milestone
      @milestone = Milestone.find(params.expect(:id))
    end

    def milestone_params
      params.expect(milestone: [ :name, :description, :due_date, :project_id ])
    end
end
