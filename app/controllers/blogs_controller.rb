class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_sidebar_topics, except: [:create, :update, :destroy, :toggle_status]

  layout 'blog'

  authorize_resource

  def index
    if current_user.admin?
      @blogs = Blog.recent.page(params[:page]).per(5)
    else
      @blogs = Blog.recent.published.page(params[:page]).per(5)
    end

    @page_title = 'My portfolio blog'
  end

  def show
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Your post is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post was removed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end

    redirect_to blogs_url, notice: 'Post status has been updated'
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id)
  end
end
