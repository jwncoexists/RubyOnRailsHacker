class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    #if params[:query].present?
      #@blogs = Blog.search(params[:query, load: true]).records
    #else
      @blogs = Blog.all.order(updated_at: :desc)
    #end
    # blogs = Blog.all.order(updated_at: :desc)
  end

# GET /blogs/search
  def search
    if params[:q].present?
      @blogs = Blog.search(params[:q]).records.order(updated_at: :desc)
    else
      @blogs = Blog.all.order(updated_at: :desc)
    end

    render action: "index"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments
    @comment = Comment.new
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
    if (!current_user)
      flash[:notice] = "No current user is active"
      redirect_to blogs_path
    end
    @blog = Blog.new(blog_params)
    # @blog = current_user.blogs.build(blog_params)
    @blog.user_id = current_user.id
    authorize! :create, @blog, message: "You don't have access to create this blog." 
    
    if @blog.save
      flash[:notice] = "Blog was created successfully."
      redirect_to @blog
    else

      flash[:error] = "Error creating blog. Please try again. #{@blog.errors.full_messages.first}"
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
