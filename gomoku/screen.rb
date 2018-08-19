module Gomoku
  class Screen
    SPACE  = 3
    STONES = { WHITE => '@', BLACK => 'o' }
    MARKS  = { yoko: '-' * SPACE, tate: '|', kouten: '+' }

    class << self
      def render(data)
        size_y = data.size
        size_x = data.first.size

        render_header(size_x)

        (0..size_y - 1).each do |y|
          render_row(data[y], y + 1, size_y == y + 1)
        end
      end

      def render_header(size_x)
        splitter = ' ' * (SPACE - 1)

        puts "    #{(1..size_x).map { |x_num| sprintf('%2d', x_num) }.join(splitter)}"
      end

      def render_row(row, y_num, last = false)
        size_x = row.size
        row_splitter = ' ' * SPACE

        row_header = "#{sprintf('%03d', y_num)}: "
        row_values = (1..size_x).map { |x| STONES[row[x]] || MARKS[:kouten] }
        puts "#{row_header}#{row_values.join(MARKS[:yoko])}"
        if last
          puts
        else
          puts "     #{row_values.map { MARKS[:tate] }.join(row_splitter)}"
        end
      end
    end
  end
end
