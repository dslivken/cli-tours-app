class Scraper

	attr_accessor :tours, :name, :link, :descrip, :price

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

	def print_search
	    puts "- - - - - - - - - - - - - - -"
	    @tours.each_with_index do |t, i|
	    	puts "TOUR # #{i+1}"
	    	t.each do |key, value|
	        	if key != :link
	          		puts "#{key}: #{value}"
	        	end
	      	end
	      	puts "- - - - - - - - - - - - - - -"
	    end
	end
end