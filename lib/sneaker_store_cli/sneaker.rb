class Sneaker 
    @@all = []
    attr_accessor :name, :color, :description, :url 

    def initialize(sneaker_hash)
       sneaker_hash.each do |k, v|
        self.send("#{k}=", v)
       end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_sneaker_details(index)
        #finds sneaker by index and returns all details of that particular sneaker
        self.all.find do |sneaker| 
            if self.all.index(sneaker) == index.to_i - 1
                sneaker 
            end
        end
    end

end