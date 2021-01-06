class CLI 
    def call
       @favorites_array = []
       self.sneaker_art
       puts "Welcome to Dave's Sneaker Store!"
       puts "What's your name?"
       Scraper.sneaker_page 
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
            puts "#{i}. #{sneaker.name}".red 
        end
    end

    def find_sneaker_details(input)
       sneaker = Sneaker.find_sneaker_details(input)
       show_sneaker_details(sneaker)
    end

    def show_sneaker_details(sneaker)
        puts "Name: #{sneaker.name}"
        puts "Color: #{sneaker.color}"
        puts "Description: #{sneaker.description}"
        puts "Link to buy!: #{sneaker.url}"
    end

    def favorites
        puts "Enter sneaker name:"
        name = gets.strip
        favorite_sneaker = Sneaker.all.find{|sneaker| sneaker.name == name} 
        @favorites_array << favorite_sneaker.name
        puts "............"
        puts "Favorites: #{@favorites_array.join(", ")}"
        puts "............"
    end

    def sneaker_art
        art = <<-'ARTWORK'
                           _                 
                          | |                
      ___ _ __   ___  __ _| | _____ _ __ ___ 
     / __| '_ \ / _ \/ _` | |/ / _ \ '__/ __|
     \__ \ | | |  __/ (_| |   <  __/ |  \__ \
     |___/_| |_|\___|\__,_|_|\_\___|_|  |___/
        ARTWORK
        print art.blue 
    end 

    def goodbye
        puts "Hope to see you again soon!"
    end

    def menu 
        input = nil 
        while input != "exit"
            puts "To look at the sneakers we currently have type 'list sneakers'."
            puts "To take a closer look at a specific sneaker, enter the number of the sneaker you want more info on."
            puts "To save a sneaker to your favorites: type 'save', hit enter, then type a sneaker name when prompted."
            puts "If you're done, type 'exit'."
            input = gets.strip 
       
            if input.to_i > 0
                puts "************"
                find_sneaker_details(input)
                puts "************"
            elsif input == "list sneakers"
                puts "~~~~~~~~~~~~"
                list_sneakers
                puts "~~~~~~~~~~~~"
            elsif input == "save"
                favorites
            elsif input == "exit"
                goodbye 
            else
                puts "Not sure what that means, please enter the number of the sneaker you want, list sneakers, or exit"
            end
        end
    end
end