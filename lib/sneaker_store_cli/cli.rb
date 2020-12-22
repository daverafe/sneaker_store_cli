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
    end
end