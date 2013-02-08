class UserMailer < ActionMailer::Base
  # See Amazon Developer Guide for important advice
  # regarding 'from' email address
  default :from => "from@example.com"

  def welcome_email(user)
    @user = user
    @url = "http://example.com"
    mail(:to => user.email, :subject => "Welcome to Chirp")
  end
end
