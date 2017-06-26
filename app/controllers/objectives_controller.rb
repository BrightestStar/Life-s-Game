class ObjectivesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @objectives = Objective.all
  end

  def new
    @objective = Objective.new
  end

  def create
    @objective = Objective.new(objective_params)
    @objective.user = current_user

    if @objective.save
      redirect_to objective_path(@objective)
    else
      render :new
    end
  end

  def show
    @objective = Objective.find(params[:id])
    @posts = @objective.posts
  end

  def edit
    @objective = Objective.find(params[:id])

    if current_user != @objective.user
      redirect_to root_path
    end

  end

  def update
    @objective = Objective.find(params[:id])

    if current_user != @objective.user
      redirect_to root_path
    end

    if @objective.update(objective_params)
      redirect_to objective_path(@objective)
    else
      render :edit
    end
  end

  def destroy
    @objective = Objective.find(params[:id])

    if current_user != @objective.user
      redirect_to root_path
    end

    @objective.destroy
    redirect_to objectives_path
  end

  private

  def objective_params
    params.require(:objective).permit(:name, :task, :second, :third, :user_id, :f_date)
  end
end
