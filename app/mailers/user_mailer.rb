class UserMailer < ApplicationMailer
default from: 'no-reply@jungle.com'

  def order_email(user)
    @user = user
    @url  = 'http://jungle.com/'
    mail(to: @user.email, subject: 'Thanks for your order')
  end

end
