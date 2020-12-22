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
        #numbered list of all sneakers by name
    end

    def sneaker_details(name)
        #finds sneaker by name and returns all details of that particular sneaker
    end

    def menu
        input = nil 
        while input != "exit"
            puts "Take a look at what we have, then enter the number of the sneaker you want more info on."
            puts "To look at more sneakers, type 'list sneakers'."
            puts "If you're done, type 'exit'."
            list_sneakers
            input = gets.strip.to_i - 1 
       
            if input > 0
                sneaker_details(input.name)
            elsif input == "list sneakers"
                list_sneakers
            else
                puts "Not sure what that means, please enter the number of the sneaker you want, list sneakers, or exit"
            end
        end
    end
end