class Sneaker 
    @@all = []
    attr_accessor :name, :color, :description

    def initialize(name, color, description)
        @name = name
        @color = color
        @description = description
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end