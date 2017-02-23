require "termbox"

module Cratrix
  class Line

    CHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*~`_-+={[()]}|:;',./<>?\"\\｡｢｣､･ｦｧｨｩｪｫｬｭｮｯｰｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜﾝ"

    def initialize(@window : Termbox::Window, @x : Int32, @size : Int32)
      @y     = -1
      @chars = [] of Char
    end

    getter x
    getter y
    getter size

    def update
      @y += 1

      @chars << CHARS[Random.rand(CHARS.size - 1)]
      @chars.shift if @chars.size > @size
    end

    def render
      clear_last_char
      draw_chars
    end

    protected def clear_last_char
      y = @y - @size
      return if y < 0

      position = Termbox::Position.new(@x, y)

      @window.put_raw(position, Termbox::CHAR_BLANK, Termbox::COLOR_WHITE, Termbox::COLOR_DEFAULT)
    end

    protected def draw_chars
      y = @y - @chars.size
      @chars.each.with_index do |char, index|
        y += 1
        next if y < 0 || y > @window.height

        position = Termbox::Position.new(@x, y)
        color = index == @chars.size - 1 ? Termbox::COLOR_WHITE : Termbox::COLOR_GREEN

        @window.put_raw(position, char, color, Termbox::COLOR_DEFAULT)
      end
    end

  end
end
