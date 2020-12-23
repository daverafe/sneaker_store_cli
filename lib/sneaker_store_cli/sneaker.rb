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

    #need to create new sneakers that assigned attributes with  scraped data 
    # def self.create_with_data
    #     sneaker = self.new()
    # end

    def self.find_sneaker_details(name)
        #finds sneaker by name and returns all details of that particular sneaker
    end

end