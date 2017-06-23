class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @objective = Objective.find(params[:objective_id])
    @posts = @objective.posts
  end

  def new
    @objective = Objective.find(params[:objective_id])
    @post = Post.new
  end

  def create
    @objective = Objective.find(params[:objective_id])
    @post = Post.new(post_params)
    @post.objective = @objective

    if @post.save
      redirect_to objective_path(@objective)
    end
  end

  private

  def post_params
    params.require(:post).permit(:objective_id, :first, :second, :third)
  end

end
