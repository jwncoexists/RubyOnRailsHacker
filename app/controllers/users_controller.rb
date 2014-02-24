class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if (!can? :view_account, @user)
      redirect_to root_path, notice: "You don't have access to view that information. Please select from menu options above."
    end  
  end

  # GET /users/new
  def new
    @user = User.new
    @account = params[:account]
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if (!can? :edit_account, @user)
      redirect_to root_path, notice: "You don't have access to view that information. Please select from menu options above."
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      RegistrationMailer.registration_confirmation(@user, 
        new_email_confirmation_url(token: @user.token)).deliver
      redirect_to login_path, notice: "A confirmation email has been sent!! Click link in the email to verify address, then log in below."
    else
      if @user.errors.any?
        flash[:error] = "Error creating new user. Please try again. #{@user.errors.full_messages.first}."
      else
        flash[:error] = "Error creating new user. Please try again." 
      end
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
     @user = User.find(params[:id])
     # @user = User.find(params[:id])
     # merge default value with params so if no collaborators checked, will erase
     if @user.update_attributes(user_params_nopw)
       redirect_to @user
     else
       flash[:error] = "Error saving user.  Please try again. #{@user.errors.full_messages.first}."
       render :edit
     end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    authorize! :destroy, @user, message: "You don't have acccess to delete this user."
    name = @user.name
    if @user.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to videos_path
    else
      flash[:error] = "There was an error deleting the user"
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :token, :account, :confirmed_at, :password, :password_confirmation, :name)
    end
end
