class Admin::ObjectivesController < ApplicationController

  layout "admin"
  def index
    @objectives = Objective.all
  end

  def new
    @objective = Objective.new
  end

  def create
    @objective = Objective.new(objective_params)

    if @objective.save
      redirect_to admin_objective_path
    else
      render :new
    end
  end

  def show
    @objective = Objective.find(params[:id])
  end

  def edit
    @objective = Objective.find(params[:id])
  end

  def update
    @objective = Objective.find(params[:id])

    if @objective.update(objective_params)
      redirect_to admin_objective_path
    else
      render :edit
    end
  end

  def destroy
    @objective = Objective.find(params[:id])
    @objective.destroy
    redirect_to admin_objectives_path
  end

  private

  def objective_params
    params.require(:objective).permit(:name, :task, :second, :third)
  end
end
