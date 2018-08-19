module Gomoku
  class Store
    attr_accessor :data
    attr_reader :size_x, :size_y

    def initialize(size_x: 19, size_y: 19)
      @size_x = size_x
      @size_y = size_y
    end

    def put(color, x, y)
      raise 'already exist' if data[y][x]

      data[y][x] = color
    end

    def check
      [:siro, :kuro].each do |color|
        dupped = data.dup.map do |row|
          row.map { |cell| cell == color }
        end

        # TODO
      end
    end
  end
end
