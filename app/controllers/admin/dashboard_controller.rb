class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_BASIC_AUTH_NAME'], password: ENV['HTTP_BASIC_AUTH_PWD']
#  before_filter :authorize

  def show
  end
end
