class Scraper

	attr_accessor :tours, :name, :link, :descrip, :price, :brand

	BASEURL= 'http://www.globusjourneys.com/Travel-Tour-Packages/Reservations/Vacation-Search/?keyword='

	@tours = []

	def initialize (keyword)
		@tours = self.scrape_main(keyword)
	end

	def scrape_main (keyword)
		scrape=[]
		url="#{BASEURL}#{keyword}"
		html= Nokogiri::HTML(open(url))
		products = html.css('.product-list-contain')
		products.each do |p|
      		link=p.css('a')[0]['href']
      		if link[0]=="/"
        		link = "http://www.globusjourneys.com#{link}"
        		brand = "Globus"
		    elsif link.include?("avalon")
		        brand="Avalon"
		    elsif link.include?("cosmos")
		        brand="Cosmos"
		    else
		        brand="Monograms"        	
      		end
      		 scrape << {:name => p.css('h3').text, :brand => brand, :link => link, :descrip =>p.css('h4').text, :price =>p.css('p.listing-price').text.split("\r\n")[1].strip}
      	end
      	scrape
	end
end