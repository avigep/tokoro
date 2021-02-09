module PlacesHelper
  def build_google_maps_marker
    @places.map do |place|
        {
          lat: place.lat,
          lng: place.lng,
          infowindow: "Title : #{place.name}<br><br> Note: #{place.note}"
        }
      end.to_json
  end
end
