json.array!(@podcasts) do |podcast|
  json.extract! podcast, :id, :name, :about, :slug
  json.url podcast_url(podcast, format: :json)
end
