json.array!(@searcheats) do |searcheat|
  json.extract! searcheat, :id, :name, :price, :location, :people, :kind
  json.url searcheat_url(searcheat, format: :json)
end
