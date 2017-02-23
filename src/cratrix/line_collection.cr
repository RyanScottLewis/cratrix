require "termbox"
require "./line"

module Cratrix
  class LineCollection

    def initialize(@window : Termbox::Window)
      @lines = [] of Line
    end

    def update
      @lines.each do |line|
        @lines.delete(line) if line.y - line.size > @window.height
      end

      add_line

      @lines.each(&.update)
    end

    def render
      @lines.each(&.render)
    end

    def add_line
      random = Random.new
      x      = random.rand(@window.width)
      size   = random.rand(5..50)

      @lines << Line.new(@window, x, size)
    end

  end
end
