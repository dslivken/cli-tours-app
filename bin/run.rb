require_relative '../config'


puts "Welcome to the Globus search gem"
puts "Enter the location you want to see tours for:"
input = gets.strip
while input != "exit" do
	list=Scraper.new(input)
	Scraper.print_search(input)
	Tour.scrape_tour(input, "7")
	puts "Enter another location or 'exit':"
	input = gets.strip
end

puts "THANK YOU!"

binding.pry