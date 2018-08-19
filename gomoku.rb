require 'highline'
require 'tapp'
require './gomoku/interface'
require './gomoku/store'
require './gomoku/screen'

module Gomoku; end

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
