class PagesController < ApplicationController
  def index
  end

  def new_color
    binding.pry
    color = ColorQueue.get_color

    respond_to do |format|
      format.json { color }
    end
  end
end
