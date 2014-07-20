class ColorQueue
  @queue = []
  @running = true

  class << self
    attr_accessor :queue, :running

    def get_color
      @queue.first.to_s
    end

    def run
      queue << new_color
      while running
        push_color(new_color)
        shift_old_color
        sleep 3
      end
    end

    private

    def shift_old_color
      @queue.shift
    end

    def new_color
      [rand(255), rand(255), rand(255)]
    end

    def push_color(color)
      @queue.push(color)
    end
  end
end