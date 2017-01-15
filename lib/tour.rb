class Tour

	attr_accessor :day, :day_descrip

	def self.scrape_tour(tour, number)
    	tindex=number.to_i-1
    	url = Scraper.tours[tour][tindex][:link]

    	puts "Pulling tour details for #{Scraper.tours[tour][tindex][:name]}"

    	details = []
    	html = Nokogiri::HTML(open(url))
    	if Scraper.tours[tour][tindex][:brand] == "Globus" || Scraper.tours[tour][tindex][:brand] == "Cosmos"
    		itinerary = html.css('.itinerary-day')
    		itinerary.each do |d|
        		details << {:day => d.css('h3').text, :day_descrip => d.css('p').text}
      		end
      	elsif
      		details << {:error => "Tour details not ready yet"}
      	end
      		

    	details 
	end

  	def self.print_tour (tour,number)
		details = self.scrape_tour(tour, number)
		puts "- - - - - - - - - - - - - - -"
		details.each do |t|
			t.each do |key, value|
				if key != :link
					puts "#{value}"
				end
			end
			puts "- - - - - - - - - - - - - - -"
		end
	end

end
