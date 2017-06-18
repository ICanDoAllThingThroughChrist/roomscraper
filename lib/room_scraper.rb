class RoomScraper

	def initialize(index_url)
		@index_url = index_url
		@doc = Nokogiri::HTML(open(index_url))
		#binding.pry
	end 

	def call
		rows.each do|row_doc|
			Room.create_from_hash(scrape_row(row_doc))
			#room.save#should put room in my db.
			#binding.pry
		end 
	end 

	private
		def rows
	       @row ||= @doc.search(".result-info")
		end 

		def scrape_row(row)
		#scrape individual row
		{:date_created =>row.search(".result-date").text,
		:title => row.search(".hdrlnk").text,
		:url => "#{@index_url}#{row.search("a.hdrlnk").attribute("href").value}",
		:price => row.search(".result-price").text
		}
		end 
end 