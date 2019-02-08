class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def published
    @posts = Post.where(published: true)
    render action: "index"
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

  def publish
    @post = Post.find(params[:id])
    if @post.toggle(:published).save
      flash[:notice] = "Record updated!"
      redirect_to posts_path
    else
      flash[:alert] = "Oops problem"
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Record deleted!"
      redirect_to posts_path
    else
      flash[:alert] = "Oops problem"
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body, :published)
  end

end
