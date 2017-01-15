require_relative '../config'


puts "Welcome to the Globus search gem"
puts "Enter the location you want to see tours for:"
input = gets.strip
while input != "exit" do
	if Scraper.tours.has_key?(input) == false
		Scraper.new(input)
	end
	Scraper.print_search(input)
	puts "Enter the number of the #{input} tour you want details for (or 'exit':)"
	tour=gets.strip
	while tour != "exit" do
		if tour == "r"
			Scraper.print_search(input)
		elsif
			Tour.print_tour(input, tour)
		end
		puts "Enter another #{input} tour, 'r' to reprint full list or 'exit':"
		tour = gets.strip
	end
	puts "Enter another location or 'exit':"
	input = gets.strip
end

puts "THANK YOU!"
