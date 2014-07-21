class PagesController < ApplicationController
  def index
  end

  def new_color
    color = ColorQueue.get_color

    render :json => color
  end

  def end_thread
    @@thread.kill
    render nothing: true
  end
end
