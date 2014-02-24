class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if !user.confirmed_at
        link = "<a href= '#{reconfirm_path(id: user.id)}'>Click here to resend verification email.</a>" 
        flash[:error] = "Your email is not verified. Please verify before login. <br/> #{link}".html_safe
        redirect_to :back
      elsif user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to blogs_path, notice: "You are now logged in to Ruby on Rails Hacker."
      else
        flash[:alert] =  "Invalid user/password combination."
        render :new
      end
    else
      flash[:alert] =  "Invalid user/password combination."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are now logged out."
  end
end
