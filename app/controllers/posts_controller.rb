class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Record added!"
      redirect_to posts_path
    else
      flash[:alert] = "Oops problem"
      render action: "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Record updated!"
      redirect_to posts_path
    else
      flash[:alert] = "Oops problem"
      render action: "edit"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body, :published)
  end

end
