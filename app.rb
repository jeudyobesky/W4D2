require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts ">Bienvenue dans LAST_SURVIVE"
puts "============================"
puts "Tu l'auras compris le but du jeu est de ... survivre!"
while player1.life_points >= 0 || player2.life_points >= 0
  if player1.life_points <= 0 || player2.life_points <= 0
    break
  end
puts ""
puts "Voici l'état de chaque joueur:"
puts "#{player1.show_state}"
puts "#{player2.show_state}"
puts ""
puts "---------------------"
puts "Passons à la phase d'attaque:"
puts ""
player1.attacks(player2)
  if player2.life_points <= 0
    puts "le joueur #{player2.name} a été tué !"
    break
  end

  player2.attacks(player1)
  if player1.life_points <= 0
    puts "le joueur #{player1.name} a été tué !"
    break
  end
  puts "-------------------"

end
puts ""
puts "Fin du LAST_SURVIVE"
puts "==================="





