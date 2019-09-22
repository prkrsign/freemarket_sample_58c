class CardsController < ApplicationController
  def new
    @card = Card.new
  end
  def create
    render 'step5'
  end

  def step5
  end
end
