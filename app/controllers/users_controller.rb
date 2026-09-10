class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])

    if @user.save
      redirect_to @user

    else
      render "new"
    end
  end

  def index
    @users = User.all
  end

  def update
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def user_params
    params.expect(:email, :encrypted_password, :first_name, :last_name)
  end
end
