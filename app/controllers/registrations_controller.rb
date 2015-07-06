class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      UserMailer.signup_alert(@user).deliver_now
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
  end

end
