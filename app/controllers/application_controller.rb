class ApplicationController < ActionController::Base
  get 'items', to: 'items#index'
end
