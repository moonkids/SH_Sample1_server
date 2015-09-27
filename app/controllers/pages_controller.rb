class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show,:json]
  def index
  end

  def show
  end
  
  def json
    personal = {'name' => 'Yamada', 'old' => 28}

    render :json => personal
  end
end
