json.extract! place, :id, :name, :note, :lat, :lng, :user_id, :created_at, :updated_at
json.url place_url(place, format: :json)