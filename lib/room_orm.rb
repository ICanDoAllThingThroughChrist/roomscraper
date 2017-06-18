# class Room

# 	attr_accessor :id, :title, :date_created, :price, :url

# 	def self.create_from_hash(hash)#instantiate and save
# 		new_from_hash(hash).save
#	end 

# 	def self.new_from_hash(hash)#just instantiating
# 		room = self.new 
# 		room.title = hash[:title]
# 		room.date_created = hash[:date_created]
# 		room.price = hash[:price]
# 		room.url = hash[:url]
# 		#binding.pry
		
# 		room#dangling return value
# 	end

# 	def self.by_price(order = "ASC")
# 		sql = <<-SQL
# 		 SELECT * FROM rooms ORDER BY price #{order}
# 	    SQL
#         rows = DB[:connection].execute(sql)
# 	    self.new_from_rows(rows)
# 	end 

# 	#Room.by_price("ASC")
# 	#Room.by_price("DESC")

# 	def self.new_from_rows(rows)
# 		rows.collect do |row|
# 	    	self.new_from_db(row)
# 		end 
# 	end 


# 	def self.new_from_db(row)
#        self.new.tap do |room|
#        	room.id = row[0]
#        	room.title = row[1]
#        	room.date_created = row[2]
#        	room.price = row[3]
#        	room.url = row[4]
#        	end 
# 	end 

# 	def save 
# 		insert
# 	end 

# 	def self.all 
# 		sql = <<-SQL
# 		SELECT * FROM rooms;
# 	    SQL
#         rows = DB[:connection].execute(sql)
# 	    self.new_from_rows(rows)
# 	end 

# 	def insert  
# 		puts "about to save #{self}"
#         sql = <<-SQL 
#         INSERT INTO rooms (title, date_created, price, url) VALUES (?,?,?,?)
#         SQL
#         DB[:connection].execute(sql, self.title, self.date_created, self.price, self.url)
# 	end

# 	def self.create_table
# 		sql = <<-SQL 
#           CREATE TABLE IF NOT EXISTS rooms (
#           	id INTEGER PRIMARY KEY,
#           	title TEXT,
#           	date_created DATETIME,
#           	price TEXT,
#           	url TEXT
#           	)
# 		SQL

# 		DB[:connection].execute(sql)
# 	end 
# end 