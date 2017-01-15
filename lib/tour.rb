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
    	elsif Scraper.tours[tour][tindex][:brand] == "Avalon"
      		itinerary = html.css('#itinerary h4')
      		itinerary.each do |d|
        		full = d.text
        		day = d.css('span').text
        		fix_day = full.sub(day,"#{day} ")
        		details << {:day => fix_day, :day_descrip => d.css('+p').text}
      		end
      	elsif Scraper.tours[tour][tindex][:brand] == "Monograms"
    		itinerary = html.css('.itineraryday')
      		itinerary.each do |d|
        		day = d.css('.number_day').text.split("\r\n")[1].strip
        		number = d.css('.number_number').text.split("\r\n")[1].strip
        		city = d.css('.city').text.split("\r\n")[1].strip
        		combined_day = "#{day} #{number} #{city}"
        		details << {:day => combined_day, :day_descrip => d.css('p').text.split("\r\n")[1].strip}
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
