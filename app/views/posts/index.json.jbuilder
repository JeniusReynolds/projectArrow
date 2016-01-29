json.array!(@posts) do |post|
  json.extract! post, :id, :caption
  json.url post_url(post, format: :json)
end
