require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "new_color" do
    let(:color) { "[100, 0, 208]" }

    before do
      ColorQueue.stub(:get_color).and_return(color)
    end

    it "fetches a new color from the ColorQueue class" do
      ColorQueue.should_receive(:get_color)
      get :new_color
    end

    it "assigns color" do
      get :new_color
      assigns(:color).should == color
    end

    it "should render color json" do
      get :new_color
      response.body.should == color
    end
  end
end
