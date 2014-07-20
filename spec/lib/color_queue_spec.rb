require 'rails_helper'
require "#{Rails.root}/lib/color_queue.rb"

describe "ColorQueue" do
  describe ".get_color" do
    let(:colors) { double(Array) }

    before do
      ColorQueue.queue = colors
    end

    it "should call shift on the queue class variable" do
      colors.should_recieve(:shift)
      ColorQueue.get_color
    end

    after do
      ColorQueue.queue = []
    end
  end
end
