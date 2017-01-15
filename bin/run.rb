require_relative '../config'


puts "Welcome to the Globus search gem"
puts "Enter the location you want to see tours for:"
input = gets.strip
while input != "exit" do
	if Scraper.tours.has_key?(input) == false
		Scraper.new(input)
	end
	Scraper.print_search(input)
	puts Tour.scrape_tour(input, "2")
	puts "Enter another location or 'exit':"
	input = gets.strip
end

puts "THANK YOU!"

binding.pry