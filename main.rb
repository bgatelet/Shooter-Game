# Main file to start game.

require_relative 'player'

player = Human.new('Bob')
comp = Computer.new

begin
  player.game(player, comp)
  puts "#{player.name}: #{player.health}hp, #{player.bullets} bullets."
  puts "#{comp.name}: #{comp.health}hp, #{comp.bullets} bullets."
end while player.health > 0 && comp.health > 0

if player.health == 0
  puts "Player lost."
elsif comp.health == 0
  puts "Computer lost."
else
  puts "Error?"
end
