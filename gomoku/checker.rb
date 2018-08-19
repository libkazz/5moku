module Gomoku
  class Checker
    def self.check(data)
      [WHITE, BLACK].each do |color|
        dupped = data.dup.map do |row|
          row.map { |cell| cell == color }
        end

        # TODO
      end
    end
  end
end
