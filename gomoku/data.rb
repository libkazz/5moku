module Gomoku
  class Data < Array
    def initialize(size_x, size_y)
      (0..size_y-1).each do |y|
        self[y] = (0..size_x-1).reduce([]) { |a, x| a[x] = nil; a }
      end
    end

    def put!(color, x, y)
      raise 'Already exist' if self[y][x]

      self[y][x] = color
    end

    # For debug
    def override!(bulk_data)
      bulk_data.each.with_index do |row, y|
        row.each.with_index do |cell, x|
          self[y][x] = cell if cell
        end
      end
    end
  end
end
