require_relative '../config'


puts "Welcome to the Globus search gem"
puts "Enter the location you want to see tours for:"
input = gets.strip
while input != "exit" do
	if Scraper.tours.has_key?(input) == false
		Scraper.new(input)
	end
	Scraper.print_search(input)
	puts "Enter the number of the tour you want details for (or 'exit':)"
	tour=gets.strip
	while tour != "exit" do
		Tour.print_tour(input, tour)
		puts "Enter another tour or 'exit':"
		tour = gets.strip
	end
	puts "Enter another location or 'exit':"
	input = gets.strip
end

puts "THANK YOU!"
