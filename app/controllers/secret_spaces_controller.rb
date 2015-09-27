class SecretSpacesController < ApplicationController
  acts_as_token_authentication_handler_for User
  skip_before_filter :authenticate_user_from_token!, only: [:new]
end
