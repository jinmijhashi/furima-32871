class ItemsController < ApplicationController
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '1234'
    end
  end

  
end
