class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
  end

  UserMailer.confirmation_email(user).deliver_now
end
