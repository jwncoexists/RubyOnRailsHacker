class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
    respond_with Blog.all

  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
    respond_with @blog
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    authorize! :create, @blog, message: "You don't have access to create this blog." 
    
    if @blog.save
      flash[:notice] = "Blog was created successfully."
      redirect_to @blog
    else
      flash[:error] = "Error creating blog. Please try again."
      render :new
    end
    # respond_with Blog.create(blog_params)
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
     @blog = Blog.find(params[:id])
     authorize! :update, @blog, message: "You don't have access to update this blog."
     
     if @blog.update_attributes(blog_params)
       redirect_to @blog, notice: "Blog has been updated."
     else
       flash[:error] = "Error saving blog.  Please try again."
       render :edit
     end
    # respond_with Blog.update(params[:id], params[:blog])
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    respond_with Blog.destroy(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:id, :title, :image, :intro, :user_id, 
                                   :body, :released, :created_at, :updated_at )
    end
end
