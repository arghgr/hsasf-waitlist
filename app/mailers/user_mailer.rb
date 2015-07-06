class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.waitlist_alert.subject
  #
  def waitlist_alert(user)
    @user = user
    @email = @user.email
    @greeting = "Hi"

    mail to: @user.email, subject: "Waitlist"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_alert.subject
  #
  def signup_alert
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
