class CardsController < ApplicationController
  before_action :authenticate_user!
  def new
    @card = Card.new
  end
  def create
    @card = card.new
    if @card.save
      redirect_to step5_cards_path
    else
      render 'new'
    end
  end

  def step5
  end
end
