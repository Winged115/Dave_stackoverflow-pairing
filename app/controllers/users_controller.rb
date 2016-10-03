class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
  end

  def create
  end
end
