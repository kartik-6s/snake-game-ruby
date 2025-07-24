module SnakeGame
  module Config
    # Configuration options
    attr_writer :width, :height, :sleep_time, :head, :tail, :food, :body

    def width
      @width ||= 40
    end

    def height
      @height ||= 20
    end

    def sleep_time
      @sleep_time ||= 0.125
    end

    def head
      @head.to_s.chars[0] ||= 'H'
    end

    def tail
      @tail.to_s.chars[0] ||= 'T'
    end

    def food
      @food.to_s.chars[0] ||= 'o'
    end

    def body
      @body.to_s.chars[0] ||= '*'
    end
  end
end
