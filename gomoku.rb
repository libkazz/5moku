require 'highline'

module Gomoku
  class Interface < HighLine
  end

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

  class Screen
    SPACE  = 3
    STONES = {siro: '@', kuro: 'o'}
    MARKS  = {yoko: '-' * SPACE, tate: '|', kouten: '+'}

    def refresh(store)
      x = store.size_x
      y = store.size_y
      data = store.data

      print "    "
      print Array.new(x).map.with_index {|_, i| sprintf('%2d', i) }.join(' ' * (SPACE - 1))
      print "\n"
      y.times do |ny|
        print "#{sprintf('%03d', ny)}: "
        print(Array.new(x).map.with_index do |_, i|
          row = data[ny]
          n = row ? data[ny][i] : nil
          STONES[n] || MARKS[:kouten]
        end.join(MARKS[:yoko]))
        print "\n"

        print "     "
        print Array.new(x).map { MARKS[:tate] }.join('   ')
        print "\n"
      end
    end
  end
end

if __FILE__ == $0
  include Gomoku
  h = Interface.new
  puts h.color("hello", :green)

  store = Store.new
  store.data = [
    [nil,nil,nil,nil,nil,:siro,:kuro,nil,nil,nil],
    [nil,nil,nil,nil,nil,:siro,:kuro,nil,nil,nil],
    [nil,nil,nil,nil,nil,:siro,:kuro,nil,nil,nil],
    [nil,nil,nil,nil,nil,:siro,:kuro,nil,nil,nil],
    [nil,nil,nil,nil,nil,:siro,:kuro,:kuro,nil,nil,nil],
    [nil,nil,nil,nil,nil,:siro,:kuro,nil,nil,nil],
    [nil,nil,nil,nil,nil,:siro,:kuro,nil,nil,nil],
    [nil,nil,nil,nil,nil,:siro,:kuro,nil,nil,nil],
    [nil,nil,nil,nil,nil,:siro,:kuro,nil,nil,nil],
  ]

  store.put(:siro, 0, 0)
  store.put(:kuro, 1, 3)

  screen = Screen.new
  screen.refresh(store)
end
