class SessionsController < ApplicationController
  def new; end

  def create
    if user = User.authenticate(params[:email], params[:password])
      # UserMailer.welcome_email.deliver_now
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to current_user
    else
      flash.now[:alert] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
