require 'open-uri'
require 'json'
require 'uri'

puts "Enter an origin address: "
origin = gets
origin = origin.chomp

puts "Enter a destination address: "
destination = gets
destination = destination. chomp

#encode for url
uri = URI.parse('http://maps.googleapis.com/maps/api/directions/json')
uri.query = URI.encode_www_form(
  "origin" => origin,
  "destination" => destination,
  "sensor" => "false"
  )
json_data = open(uri.to_s).read
data = JSON.parse(json_data)

#parse JSON
travel_time =  data["routes"][0]["legs"][0]["duration"]["text"]
distance = data["routes"][0]["legs"][0]["distance"]["text"]

puts "Total travel time driving: #{travel_time}"
puts "Total distance traveled: #{distance}"


