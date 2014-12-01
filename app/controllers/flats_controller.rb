class FlatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @flats = Flat.all
  end
end
