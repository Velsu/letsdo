json.array!(@places) do |place|
  json.extract! place, :id, :title, :s_description, :l_description, :cost, :address, :phone, :outdoor, :website, :picture, :min_age, :verified, :l_time, :op_hours
  json.url place_url(place, format: :json)
end
