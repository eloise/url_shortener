json.array!(@urls) do |url|
  json.extract! url, :id, :short, :long, :visit_counter, :user_id
  json.url url_url(url, format: :json)
end
