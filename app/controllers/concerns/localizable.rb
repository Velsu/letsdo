# Module responsible for parsing data and calculating distance and time travel, based on active record object "self", after beign included in a proper Model

module Localizable
    
    
    require "net/http"
    require "uri"
    require "json"
    
    def uri_location
        uri = URI.parse("https://maps.googleapis.com/maps/api/directions/json?units=imperial&origin=davie,fl&destination=#{self.address.gsub(/\s+/, "")}&key=AIzaSyAhvCRuzyRnVMc4kCahnEJ8XynbnJTTMTw")

        response = Net::HTTP.get_response(uri)
  
        @data = JSON.parse(response.body)
    end
        
    def calc_distance
        uri_location
        
        @data['routes'][0]['legs'][0]['distance']['text']
        
    
    end
    
    def calc_time
        uri_location
        
        @data['routes'][0]['legs'][0]['duration']['text']
    end
    
    
    
    
    
    
    
    
    
    
end
