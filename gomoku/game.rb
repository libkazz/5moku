module Gomoku
  class Game
    attr_reader :size_x, :size_y, :data

    def initialize(size_x: 19, size_y: 19)
      @size_x = size_x
      @size_y = size_y
      @data = Data.new(size_x, size_y)
    end

    def put!(color, x, y)
      data.put!(color, x, y)
    end

    def check
      Checker.check(data)
    end

    def render
      Screen.render(data)
    end
  end
end
