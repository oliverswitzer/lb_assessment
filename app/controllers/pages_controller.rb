class PagesController < ApplicationController
  def index
  end

  def new_color
    @color = ColorQueue.get_color

    render :json => @color
  end
end
