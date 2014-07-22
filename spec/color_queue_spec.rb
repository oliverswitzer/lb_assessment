require 'rails_helper'

def reset_queue
  ColorQueue.queue = []
end

describe "ColorQueue" do
  describe ".get_color" do
    before do
      ColorQueue.queue = [[123, 221, 123]]
    end

    it "returns first element of queue as a string" do
      ColorQueue.get_color.should == "[123, 221, 123]"
    end

    after do
      reset_queue
    end
  end

  describe ".run" do
    let(:color) { [123, 123, 123] }

    before do
      ColorQueue.stub(:new_color).and_return(color)
    end

    it "pushes a new color to the queue" do
      ColorQueue.stub(:running).and_return(false)

      ColorQueue.run
      ColorQueue.queue.should include(color)
    end

    context "every 3 seconds" do
      before do
        ColorQueue.queue = []

        thread = Thread.new do
          ColorQueue.run
        end
      end

      it "pushes a new color to the queue" do
        sleep 0.1
        ColorQueue.queue.should include(color)
      end
    end

    after do
      reset_queue
    end
  end
end
