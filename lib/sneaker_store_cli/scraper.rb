class Scraper

    @@sneakers = []
    @@links = ["https://www.nike.com/t/air-max-90-mens-shoe-6n3vKB/CN8490-001", 
    "https://www.nike.com/t/air-force-1-07-mens-shoe-5QFp5Z/CW2288-111", 
    "https://www.nike.com/t/air-max-1-mens-shoe-05Lwrg/CZ8140-001", 
    "https://www.nike.com/t/air-jordan-3-retro-se-shoe-gt1c9k/CV3583-003",
    "https://www.nike.com/t/air-huarache-mens-shoe-eoToq9X2/318429-003",
    "https://www.nike.com/t/air-jordan-13-retro-shoe-zp4pp0/414571-108",
    "https://www.nike.com/t/cortez-basic-shoe-345sdw/819719-100",
    "https://www.nike.com/t/air-jordan-1-mid-shoe-MVp2kJ/554724-141",
    "https://www.nike.com/t/sky-force-3-4-mens-shoe-JJ2Kf2/CZ7872-001",
    "https://www.nike.com/t/roshe-one-mens-shoe-MkTmzjJv/511881-010"]

    def self.sneaker_page
        @@links.each do |link|
            sneaker = Nokogiri::HTML(URI.open(link, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
            @@sneakers << sneaker
        end
        self.sneaker_scraper 
    end 

    def self.sneaker_scraper
        counter = 0
        @@sneakers.each do |page|
                info_hash = {
                    name:  page.css(".headline-2.css-zis9ta").text,
                    color:  page.css(".description-preview__color-description.ncss-li").text.gsub("Shown:", ""),
                    description: if page.css(".description-preview.body-2.css-1pbvugb p").text.include?("â\u0080\u0099")
                                    page.css(".description-preview.body-2.css-1pbvugb p").text.gsub("â\u0080\u0099", "'")
                                else
                                    page.css(".description-preview.body-2.css-1pbvugb p").text
                                end,
                    url: @@links[counter] 
                }
            Sneaker.new(info_hash)
            counter += 1
        end

    end

end

