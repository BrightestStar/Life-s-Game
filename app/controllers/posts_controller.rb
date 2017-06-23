class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def edit
    @objective = Objective.find(params[:objective_id])
    @post = Post.find(params[:id])
    if current_user != @objective.user
      redirect_to root_path
    end
  end

  def update
    @objective = Objective.find(params[:objective_id])
    @post = Post.find(params[:id])

    if current_user != @objective.user
      redirect_to root_path
    end

    if @post.update(post_params)
      redirect_to objective_posts_path(@post)
    else
      render :edit
    end
  end

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

  def destroy
    @objective = Objective.find(params[:objective_id])
    @post = Post.find(params[:id])

    if current_user != @objective.user
      redirect_to root_path
    end

    @post.destroy
    redirect_to objective_path(@objective)
  end

  private

  def post_params
    params.require(:post).permit(:objective_id, :first, :second, :third)
  end

end
