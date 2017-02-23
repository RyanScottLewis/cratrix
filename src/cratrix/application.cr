module Cratrix
  class Application

    def self.run
      new.run
    end

    def initialize
      @window = Termbox::Window.new
      @lines  = LineCollection.new(@window)
    end

    def run
      @window.clear

      loop do
        # -- Event -----------------------------------------------------------------------------------------------------------
        event = @window.peek(100)

        if event.type == Termbox::EVENT_KEY
          break if event.key != 0 || event.ch != 0
        end

        # -- Update ----------------------------------------------------------------------------------------------------------
        @lines.update

        # -- Render ----------------------------------------------------------------------------------------------------------
        # window.clear
        @lines.render
        @window.render
      end

      @window.shutdown
    end

  end
end
