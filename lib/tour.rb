class Tour

	def self.scrape_tour(tour, number)
    	tindex=number.to_i-1
    	url = Scraper.tours[tour][tindex][:link]

    	puts "Pulling tour details for #{Scraper.tours[tour][tindex][:name]}"
	end


end
