class Player
attr_accessor :name, :life_points

    def initialize (name, life_points)
        @name = name
        @life_points = life_points
        life_points = 10
    end