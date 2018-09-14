class OrderMailer < ApplicationMailer
  def order_confirmation_email user, order
    @user = user
    @url  = 'http://example.com/login'
    orderId = order
    mail(to: @user.email, subject: 'Order ID:')
  end
end
