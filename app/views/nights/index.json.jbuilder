json.array!(@nights) do |night|
  json.extract! night, :id, :count, :status
  json.url night_url(night, format: :json)
end
