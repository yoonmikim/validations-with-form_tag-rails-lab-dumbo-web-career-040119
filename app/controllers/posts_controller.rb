class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update]
  
  def index 
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid? 
      redirect_to post_path(@post)
    else 
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.valid?
      @post.update(post_params)
      redirect_to post_path(@post)
    else 
      render :edit
    end
  end

  private
  
  def get_post 
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :category, :content)
  end
end
