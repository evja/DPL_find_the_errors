class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params) # Changed (params[:id]) to (post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.' #changed @path to posts_path(@post)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post was successfully updated.' #changed @path to posts_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.delete #added Delete to
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :author, :body)
    end
end
