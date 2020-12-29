class Scraper

    #method that scrapes data for name, color, description, and url 
    #one method that handles scraping for name color description and url
    #then another method for inputing the page url, takes an argument of the page url, and 
    #runs the other method inside it
   

    def self.sneaker_data 
        #gets data
        
        sneakers = []

        sneaker_1 = Nokogiri::HTML(open("https://www.nike.com/t/air-force-1-07-mens-shoe-5QFp5Z/CW2288-111", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
        sneaker_1_hash = {
            :name => sneaker_1.css(".headline-2.css-zis9ta").text,
            :color => sneaker_1.css(".description-preview__color-description.ncss-li").text,
            :description => sneaker_1.css(".description-preview.body-2.css-1pbvugb p").text.gsub("â\u0080\u009907", "'07"),
            :url => "https://www.nike.com/t/air-force-1-07-mens-shoe-5QFp5Z/CW2288-111"
        }
        sneakers << sneaker_1_hash

        sneaker_2 = Nokogiri::HTML(open("https://www.nike.com/t/air-max-1-mens-shoe-05Lwrg/CZ8140-001", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
        sneaker_2_hash = {
            :name => sneaker_2.css(".headline-2.css-zis9ta").text,
            :color => sneaker_2.css(".description-preview__color-description.ncss-li").text,
            :description => sneaker_2.css(".description-preview.body-2.css-1pbvugb p").text,
            :url => "https://www.nike.com/t/air-max-1-mens-shoe-05Lwrg/CZ8140-001"
        }
        sneakers << sneaker_2_hash

        sneaker_3 = Nokogiri::HTML(open("https://www.nike.com/t/air-jordan-3-retro-se-shoe-gt1c9k/CV3583-003", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
        sneaker_3_hash = {
            :name => sneaker_3.css(".headline-2.css-zis9ta").text,
            :color => sneaker_3.css(".description-preview__color-description.ncss-li").text,
            :description => sneaker_3.css(".description-preview.body-2.css-1pbvugb p").text,
            :url => "https://www.nike.com/t/air-jordan-3-retro-se-shoe-gt1c9k/CV3583-003"
        }
        sneakers << sneaker_3_hash

        sneakers
    end

    

    # def self.sneaker_page 
    #     sneaker_1 = Nokogiri::HTML(open("https://www.nike.com/t/air-force-1-07-mens-shoe-5QFp5Z/CW2288-111", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
    #     sneaker_2 = Nokogiri::HTML(open("https://www.nike.com/t/air-max-1-mens-shoe-05Lwrg/CZ8140-001", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
    #     sneaker_3 = Nokogiri::HTML(open("https://www.nike.com/t/air-jordan-3-retro-se-shoe-gt1c9k/CV3583-003", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
    # end

    # def self.sneaker_scraper
    #     sneakers =[]
    #     self.sneaker_page.each do |page|
    #         sneaker_hash = {
    #         :name => page.css(".headline-2.css-zis9ta").text,
    #         :color => page.css(".description-preview__color-description.ncss-li").text,
    #         :description => page.css(".description-preview.body-2.css-1pbvugb p").text,
    #         :url => page 
    #     }
    #         sneakers << sneaker_hash 
    #     end
    #     sneakers 
    # end
    
    def self.create_sneakers
        #instantiates new sneaker objects
        self.sneaker_data.each do |sneaker|
           Sneaker.new(sneaker)
        end
    end

end