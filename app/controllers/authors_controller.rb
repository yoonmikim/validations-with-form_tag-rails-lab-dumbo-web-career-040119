class AuthorsController < ApplicationController
  
  before_action :get_author, only: [:show, :edit, :update]
  
  def index 
    @authors = Author.all
  end
  
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid? 
      redirect_to author_path(@author)
    else 
      render :new
    end
  end
  
  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.valid?
      @author.update(author_params)
      redirect_to author_path(@author)
    else 
      render :edit
    end
  end

  private

  def get_author 
    @author = Author.find(params[:id])
  end 
  
  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
