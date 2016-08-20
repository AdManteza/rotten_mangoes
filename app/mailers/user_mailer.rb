class UserMailer < ApplicationMailer

  default from: 'notifications@example.com'
 
  def delete_email(user)
    @user = user
    mail(to: @user.email, subject: 'You have been deleted')
  end
  
end
