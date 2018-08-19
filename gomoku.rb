require 'highline'
require 'tapp'

module Gomoku
  WHITE = :siro
  BLACK = :kuro
end

require './gomoku/interface'
require './gomoku/game'
require './gomoku/data'
require './gomoku/screen'

if __FILE__ == $0
  include Gomoku
  h = Interface.new
  puts h.color("hello", :green)

  game = Game.new
  game.data.override!([
    [nil,nil,nil,nil,nil,WHITE,BLACK,nil,nil,nil],
    [nil,nil,nil,nil,nil,WHITE,BLACK,nil,nil,nil],
    [nil,nil,nil,nil,nil,WHITE,BLACK,nil,nil,nil],
    [nil,nil,nil,nil,nil,WHITE,BLACK,nil,nil,nil],
    [nil,nil,nil,nil,nil,WHITE,BLACK,BLACK,nil,nil,nil],
    [nil,nil,nil,nil,nil,WHITE,BLACK,nil,nil,nil],
    [nil,nil,nil,nil,nil,WHITE,BLACK,nil,nil,nil],
    [nil,nil,nil,nil,nil,WHITE,BLACK,nil,nil,nil],
    [nil,nil,nil,nil,nil,WHITE,BLACK,nil,nil,nil],
  ])

  game.put!(WHITE, 0, 0)
  game.put!(BLACK, 1, 3)

  game.render
end
