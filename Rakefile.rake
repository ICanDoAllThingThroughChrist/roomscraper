require_relative './config/environment'

	def reload!
		load_all './lib'
	end

	task :console do
	  Pry.start
	end

	task :scrape_rooms do 
		#instantiate scraper, and find new rooms
		nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/mnh/roo')
		nyc_scaper.call
		#chicago_scraper = RoomScraper.new('https://chicago.craigslist.org/search/roo')
		#chicago_scraper.call
		#after this call, should say Room.all and have all rooms there.	
	end 