class ApplicationController < ActionController::Base
  Payjp.api_key = Rails.application.credentials.payjp_secret_key
end
