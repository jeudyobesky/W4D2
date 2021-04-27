class Player
attr_accessor :name, :life_points

    def initialize (name, life_points = 10)
        @name = name
        @life_points = life_points
    end

    def show_state
        "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage)
        player_with_damage = @life_points - damage
        @life_points = player_with_damage
    end

    def attacks(players)
        players.life_points > 0
        puts "#{self.name} attaque #{players.name} "
        damage = self.compute_damage
        players.gets_damage(damage)
        puts" #{self.name} inflige #{damage} points de domages"
    end

    def compute_damage
        return rand(1..6)
    end
end