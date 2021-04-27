require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1.name, player2.name]
user =
puts ""
puts "           <----------D-E-A-T-H----------->"
puts ""
puts "            Welcome sur LAST_SURVIVE 2 !!              "
puts "  Le but comme tu le sais est d'être the LAST SURVIVOR !"
puts ""
puts "               <-------------------->"
puts ""
puts "  >Pour commencer entre ton pseudo :"
player3_name = gets.chomp.to_s
user = HumanPlayer.new("#{player3_name}")
  puts " "
  while user.life_points >0 && (player1.life_points > 0 || player2.life_points > 0)
    puts " "
    puts ""
    puts user.show_state
    puts ">Quelle action veux-tu effectuer ?"
    puts "   a - chercher une arme "
    puts "   s - chercher à se soigner "
    puts " "
    puts "attaquer un joueur en vue :"
    puts " "
      if player1.life_points > 0
        puts "   0 - #{player1.name} a #{player1.life_points} points de vie"
      elsif player1.life_points <= 0
        puts "   0 - #{player1.name} est K.O"
      end
      if player2.life_points > 0
        puts "   1 - #{player2.name} a #{player2.life_points} points de vie"
      elsif player1.life_points <= 0
        puts "   1 - #{player2.name} est K.O"
      end
    user_choice = gets.chomp
    puts " "
      if user_choice == "a" 
          user.search_weapon
        elsif user_choice == "b" 
          user.search_health_pack
        elsif user_choice == "0"
          user.attacks(player1)
        elsif user_choice == "1"
          user.attacks(player2)
      end
    puts " "
    puts "Les autres joueurs t'attaquent !"
    puts " "
      if player1.life_points > 0
          player1.attacks(user)
      elsif player1.life_points < 0
        p "#{player1.name} est DEAD, elle ne peut pas attaquer !"
      end
      if player2.life_points > 0
        player2.attacks(user)
      elsif player2.life_points < 0
      p "#{player2.name} est DEAD, elle ne peut pas attaquer !"
      end
      p"Appuie sur enter pour continuer ..."
      gets.chomp
  end
puts "La partie est finie"
puts "BRAVO"

binding.pry
