require 'open-uri'
require 'json'
require 'uri'


puts "Enter an address, city, or zip code: "
word = gets
word = word.chomp

#encode for url
uri = URI.parse('http://maps.googleapis.com/maps/api/geocode/json')
uri.query = URI.encode_www_form(
  "address" => word,
  "sensor" => "false"
  )
json_data = open(uri.to_s).read
data = JSON.parse(json_data)

#parse JSON
results = data["results"][0]["geometry"]["location"]
puts "Latitude: #{results["lat"]}"
puts "Longitude: #{results["lng"]}"
