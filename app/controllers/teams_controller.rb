class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]


  def index
    @teams = Team.all
  end


  def show
  end


  def new
    @team = Team.new
  end


  def edit
  end


  def create
    @team = Team.new(team_params)

    # Remove blank IDs and associate users
    user_ids = params[:team][:user_ids].reject(&:blank?)
    @team.users = User.where(id: user_ids)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: "Team was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    user_ids = params[:team][:user_ids].reject(&:blank?)
    @team.users = User.where(id: user_ids)

    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @team.destroy!

    respond_to do |format|
      format.html { redirect_to teams_path, status: :see_other, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_team
      @team = Team.find(params.expect(:id))
    end

    def team_params
      params.require(:team).permit(:name, :project_id, user_ids: [])
    end
end
