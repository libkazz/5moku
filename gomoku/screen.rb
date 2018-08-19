module Gomoku
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
