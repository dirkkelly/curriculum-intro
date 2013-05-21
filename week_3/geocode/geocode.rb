require 'crack'
require 'rest-client'
require 'awesome_print'

#iteration 1 (procedural)

url = "http://maps.googleapis.com/maps/api/geocode/xml?address=841+Broadway,+New+York,+NY&sensor=false"

xml_response = RestClient.get(url)
parsed_xml = Crack::XML.parse(xml_response)
lat = parsed_xml["GeocodeResponse"]["result"]['geometry']['location']["lat"]
lng = parsed_xml["GeocodeResponse"]["result"]['geometry']['location']["lng"]
lat_and_lng = {"lat" => lat, "lng" => lng}
puts lat_and_lng

#Iteration 2 (methods)

url = "http://maps.googleapis.com/maps/api/geocode/xml?address=841+Broadway,+New+York,+NY&sensor=false"

def geolocate(url)
  RestClient.get(url)
end

def parse_xml(xml)
  Crack::XML.parse(xml.body)
end

def lat_and_lng(parsed_xml)
  lat = parsed_xml["GeocodeResponse"]["result"]['geometry']['location']["lat"]
  lng = parsed_xml["GeocodeResponse"]["result"]['geometry']['location']["lng"]
  { :lat => lat, :lng => lng }
end

parsed_xml = parse_xml(geolocate(url))
puts lat_and_lng(parsed_xml)

#Iteration 3 (class)

class Geocode
  BASE_URL = "http://maps.googleapis.com/maps/api/geocode/xml?address="

  def initialize(address)
    @address = address
    @url = URI.encode(BASE_URL + address + "&sensor=false")
  end

  def geolocate
    @xml_response ||= RestClient.get(@url)
  end

  def parse_xml
    Crack::XML.parse(geolocate)
  end

  def lat_and_lng
    lat = parse_xml["GeocodeResponse"]["result"]['geometry']['location']["lat"]
    lng = parse_xml["GeocodeResponse"]["result"]['geometry']['location']["lng"]
    { :lat => lat, :lng => lng }
  end
end

g = Geocode.new("841 Broadway, New York, NY")
puts g.lat_and_lng

