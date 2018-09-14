class OrderMailer < ApplicationMailer
  def order_confirmation_email
    puts "hey man, I'm in order_confirmation_email now.  what is params?"
    p params
    @user = params[:user]
    @url  = 'http://example.com/login'
    @orderId = params[:order]
    mail(to: @user.email, subject: 'Order ID:' @orderId)
  end
end
