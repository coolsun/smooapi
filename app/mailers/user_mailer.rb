class UserMailer < ApplicationMailer
  default from: 'support@101moo.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to 101Moo Site')
  end
end
