class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTHORIZATION_USERNAME'], password: ENV['HTTP_AUTHORIZATION_PASSWORD']
# username == ENV['HTTP_AUTHORIZATION_USERNAME'] && password == ENV['HTTP_AUTHORIZATION_PASSWORD']
  def index
    render plain: "Everyone can see me!"
  end

  def edit
    render plain: "I'm only accessible if you know the password"
  end
end
