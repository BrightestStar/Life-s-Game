class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @objective = Objective.find(params[:objective_id])
    @comment = @objective.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to objective_path(@objective)
    else
      render :new
    end


  end

  def destroy
    @objective = Objective.find(params[:objective_id])
    @comment = @objective.comments.find(params[:id])
    @comment.destroy

    if current_user != @comment.user
      redirect_to root_path
    end

    redirect_to objective_path(@objective)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :objective_id, :user_id)
  end

end
