module ApplicationHelper
  def google_api_key
    ENV.fetch('GOOGLE_MAPS_API_KEY')  { raise "Maps API key not found" }
  end
end
