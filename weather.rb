require 'open-uri'
require 'json'
require 'uri'

puts "Please enter an address: "
address = gets
address = address.chomp

#encode for url
uri = URI.parse('http://api.openweathermap.org/data/2.5/weather')
uri.query = URI.encode_www_form(
  "q" => address
  )
json_data = open(uri.to_s).read
data = JSON.parse(json_data)

kelvin = data["main"]["temp"]
fahrenheit = (kelvin-273.15)*1.8 + 32

puts '%.1f' % fahrenheit.to_f + "f"

