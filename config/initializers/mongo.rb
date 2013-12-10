# Be sure to restart your server when you modify this file.

MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = '#scavenger-#{Rails.env}'

# If using Passenger, add this code
#if defined?(PhusionPassenger)
#	PhusionPassenger.on_event(:starting_worker_process) do |forked|
# 		MongoMapper.connection.connect if forked
# 	end
#end