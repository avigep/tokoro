module PlacesHelper
  def places_map_builder
    @places.map do |place|
        {
          lat: place.lat,
          lng: place.lng,
          infowindow: "Title : #{place.name}<br><br> Note: #{place.note}"
        }
      end.to_json
  end
end
