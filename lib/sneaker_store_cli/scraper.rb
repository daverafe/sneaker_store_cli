class Scraper

    #method that scrapes data for name, color, and description 
   

    def self.sneaker_data 
        #gets data
        
        sneakers = []

        sneaker_1 = Nokogiri::HTML(open("https://www.nike.com/t/air-force-1-07-mens-shoe-5QFp5Z/CW2288-111", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
        sneaker1_name = sneaker_1.css(".headline-2.css-zis9ta").text
        sneaker1_color = sneaker_1.css(".description-preview__color-description.ncss-li").text
        sneaker1_description = sneaker_1.css(".description-preview.body-2.css-1pbvugb p").text.gsub("â\u0080\u009907", "'07")
        sneaker_1_hash = {
            :name => sneaker_1.css(".headline-2.css-zis9ta").text,
            :color => sneaker_1.css(".description-preview__color-description.ncss-li").text,
            :description => sneaker_1.css(".description-preview.body-2.css-1pbvugb p").text.gsub("â\u0080\u009907", "'07")
        }
        sneakers << sneaker_1_hash

        sneaker_2 = Nokogiri::HTML(open("https://www.nike.com/t/air-max-1-mens-shoe-05Lwrg/CZ8140-001", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
        sneaker2_name = sneaker_2.css(".headline-2.css-zis9ta").text
        sneaker2_color = sneaker_2.css(".description-preview__color-description.ncss-li").text
        sneaker2_description = sneaker_2.css(".description-preview.body-2.css-1pbvugb p").text
        sneaker_2_hash = {
            :name => sneaker_2.css(".headline-2.css-zis9ta").text,
            :color => sneaker_2.css(".description-preview__color-description.ncss-li").text,
            :description => sneaker_2.css(".description-preview.body-2.css-1pbvugb p").text
        }
        sneakers << sneaker_2_hash

        sneakers
    end

    def self.create_sneakers
        #instantiates new sneaker objects
        self.sneaker_data.each do |sneaker|
           Sneaker.new(sneaker)
        end
    end
end