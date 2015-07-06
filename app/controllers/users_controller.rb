class UsersController < ApplicationController

  def show
    @user = get_user
    if @user.caseid
      @caseid = @user.caseid.to_s
      @match = get_caseid_matches(@caseid).first
    end
  end

  def edit
    @user = get_user
  end

  def update
    @user = get_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User settings updated.'
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :birthdate, :phone, :caseid)
  end

  def get_user
    User.find(params[:id])
  end

end
