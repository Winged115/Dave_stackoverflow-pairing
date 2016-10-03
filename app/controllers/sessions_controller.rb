class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to :root
      else
        @errors = ["Wrong email or password"]
        render :new
      end
    else
      @errors = ["Wrong email or password"]
      render :new
    end
  end

  def destroy
    if session
      session.delete(:user_id)
      redirect_to :root
    end
  end
end
