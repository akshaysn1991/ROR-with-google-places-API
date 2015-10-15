class CitylookupController < ApplicationController
  def index
  	@city = City.where(:id => params[:city_id].to_i).first
    # response = HTTParty.get('https://maps.googleapis.com/maps/api/place/search/json?location=#{city.latitude},#{city.longitude}&radius=50000&sensor=true&key=AIzaSyCdNPoetyp3Fqto7Bo0bgBHrSklDCPsAtI')
    # json = JSON.parse(response.body)
    @client = GooglePlaces::Client.new('AIzaSyCdNPoetyp3Fqto7Bo0bgBHrSklDCPsAtI')
    places = @client.spots(@city.latitude, @city.longitude, :radius => 50000)
    places_array = Array.new()
     places.each do |place|
        unless place.rating.blank?
          places_array << place
        end
     end  
    @places = places_array.sort_by { |s| -s.rating }
    # @places.sort_by(&:rating)
    # binding.pry
    @geo_city = CommonUtils.get_gmap_city_marker(@city)
    @geo_hash = CommonUtils.get_gmap_hash(@places)
    @types = @places.collect{|place| place.types}.flatten.uniq
  end

  def types_filter
  	@city = City.where(:id => params[:city_id].to_i).first
    @client = GooglePlaces::Client.new('AIzaSyCdNPoetyp3Fqto7Bo0bgBHrSklDCPsAtI')
    selected_types =  params[:selected_types].split(',')
  	@geo_city = CommonUtils.get_gmap_city_marker(@city)
    places = @client.spots(@city.latitude, @city.longitude, :radius => 50000)
    @places = Array.new
    places.each do |place|
       place_types = place.types
       if (selected_types - place_types).empty?
       	 @places << place
       end
    end 
    @geo_hash = CommonUtils.get_gmap_hash(@places)
  end
end
