class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
    @user = get_user
  end

  def update
    @user = get_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User settings updated.'
    else
      render 'edit', notice: 'There were one or more errors with your update. Please change them and try again.'
    end
  end

  def show
    @user = get_user
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :birthdate, :phone)
  end

  def get_user
    User.find(params[:id])
  end
end
