class Scraper

	attr_accessor :products

	BASEURL= 'http://www.globusjourneys.com/Travel-Tour-Packages/Reservations/Vacation-Search/?keyword='

	@tours = []

	def initialize (keyword)
		self.scrape_main(keyword)
	end

	def scrape_main (keyword)
		scrape=[]
		url="#{BASEURL}#{keyword}"
		html= Nokogiri::HTML(open(url))
		products = html.css('.product-list-contain')
		@products = products
	end
end