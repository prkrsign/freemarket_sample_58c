class CardsController < ApplicationController
  before_action :set_current_user
  def new
  end
  
  def create
  end

  def complete
  end

  private
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
