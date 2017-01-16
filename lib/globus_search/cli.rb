class CLI

	def call
		#welcome
		puts "Welcome to the Globus search gem"
		#get_location
		puts "Enter the location you want to see tours for:"
		input = gets.strip
		while input != "exit" do
			#check new_search?
			#if Scraper.tours.has_key?(input) == false
			#	Scraper.new(input)
			#end
			new_search?(input)
			if Scraper.tours[input].size == 0
				#search_not_found
				puts "Sorry, nothing found!!"
			elsif
				#print_location_results
				Scraper.print_search(input)
				#get_tour
				puts "Enter the number of the #{input} tour you want details for (or 'exit':)"
				tour=gets.strip
				while tour != "exit" do
					if tour == "r"
						Scraper.print_search(input)
					elsif tour.to_i.between?(1,Scraper.tours[input].size)
						Tour.print_tour(input, tour)
					else puts "Input not recognized, try again."
					end
					puts "Enter another #{input} tour, 'r' to reprint full list or 'exit':"
					tour = gets.strip
				end
			end
			puts "Enter another location or 'exit':"
			input = gets.strip
		end

		puts "THANK YOU!"
	end

	def new_search?(input)
		if Scraper.tours.has_key?(input) == false
			Scraper.new(input)
		end
	end

end