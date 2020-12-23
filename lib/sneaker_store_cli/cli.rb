class CLI 
    def call
       puts "Welcome to Dave's Sneaker Store!"
       puts "What's your name?"
       Scraper.create_sneakers
       input = gets.strip
       greeting(input)
    end

    def greeting(name)
        input = name
        puts "Hey #{input}! Let's find some cool sneakers!"
        menu
    end

    def list_sneakers
        Sneaker.all.each.with_index(1) do |sneaker, i|
            puts "#{i}. #{sneaker.name}"
        end
    end

    def find_sneaker_details(input)
       sneaker = Sneaker.find_sneaker_details(input)
       binding.pry 
       show_sneaker_details(sneaker)
    end

    def show_sneaker_details(sneaker)
        puts "Name: #{sneaker.name}"
        puts "Color: #{sneaker.color}"
        puts "Description: #{sneaker.description}"
    end

    def goodbye
        puts "Hope to see you again soon!"
    end

    def menu 
        input = nil 
        while input != "exit"
            puts "To look at sneakers type 'list sneakers'."
            puts "To take a closer look at a sneaker, enter the number of the sneaker you want more info on."
            puts "If you're done, type 'exit'."
            input = gets.strip 
       
            if input.to_i > 0
                puts "**********"
                find_sneaker_details(input)
                puts "**********"
            elsif input == "list sneakers"
                puts "~~~~~~~~~~~~"
                list_sneakers
                puts "~~~~~~~~~~~~"
            elsif input == "exit"
                goodbye 
            else
                puts "Not sure what that means, please enter the number of the sneaker you want, list sneakers, or exit"
            end
        end
    end
end