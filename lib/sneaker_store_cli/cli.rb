class CLI 
    def call
       puts "Welcome to Dave's Sneaker Store!"
       puts "What's your name?"
       input = gets.strip
       greeting(input)
    end

    def greeting(name)
        input = name
        puts "Hey #{input}! Let's find some cool sneakers!"
        menu
    end

    def list_sneakers

    end

    def menu
        puts "Take a look at what we have, then enter the number of the sneaker you want more info on."
        list_sneakers
        input = gets.strip.to_i - 1 
    end
end