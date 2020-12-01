# frozen_string_literal: true

require_relative 'game'
require_relative 'player'
require_relative 'board'
require 'colorize'

mode = nil
loop do
  puts 'Would you like to?'
  puts '1. Load a game'
  puts '2. Play new game'
  mode = gets.chomp
  break if /^[12]$/ =~ mode

  puts 'Invalid!'.red
end

player1 = nil
player2 = nil
if mode == '2'
  loop do
    puts 'Pick a game mode(select 1 or 2)'
    puts <<-OPTIONS
    1. Human vs Computer
    2. Human vs Human
    OPTIONS
    game_options = gets.chomp

    next unless /^[12]$/ =~ game_options

    game = Game.new
    player1 = game.player1
    player2 = game.player2
    break
  end
else
  loop do
    puts 'Choose a game mode'
    puts '1. canyoubeatme'
    puts '2. check'
    puts '3. youarerooked'
    puts '4. yourgame'
    game_choice = gets.chomp
    break if /^[1234]$/ =~ game_choice

    puts 'Invalid!'.red
  end
end

loop do
  break unless player1.move
  break unless player2.move
end
