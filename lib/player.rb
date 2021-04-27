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

class HumanPlayer < Player
attr_accessor :weapon_level

    def initialize(name, life_points = 100, weapon_level = 1)
        @weapon_level = weapon_level
        super(name,life_points)
    end

    def show_state
        "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end
 
    def search_weapon
        find_weapon = rand (1..6)
        p "Tu as trouvé une arme de niveau #{find_weapon}"
            if find_weapon > @weapon_level
                @weapon_level = find_weapon * @weapon_level
                p "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
            else
                p "Dommage, ton ancienne arme est meilleur !"
            end
    end

    def search_health_pack
        find_health_pack = rand(1..6)
        if find_health_pack == 1
            p "Tu n'as rien trouvé... "
        elsif find_health_pack >= 2 && find_health_pack <= 5
            @life_points = @life_points + 50
                if @life_points > 100
                    @life_points = 100
                end
            p "Bravo, tu as trouvé un pack de +80 points de vie, tu as desormais #{@life_points}!"
        elsif find_health_pack == 6
            @life_points = @life_points + 80
                if @life_points > 100
                    @life_points = 100
                end
            p "Waow, tu as trouvé un pack +80 points de vie, tu as desormais #{@life_points}!"
        end
    end
end