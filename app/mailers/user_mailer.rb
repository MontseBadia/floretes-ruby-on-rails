class UserMailer < ApplicationMailer
  default from: 'aaa'

  def welcome_email
    mail(to: 'xxx', subject: 'Welcome to My Awesome Site')
  end
end
