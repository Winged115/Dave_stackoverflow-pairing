class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
