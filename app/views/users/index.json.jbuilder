json.array!(@users) do |user|
  json.extract! user, :id, :name, :organization, :uid, :provider, :oauth_token, :oauth_expires_at, :image_url
  json.url user_url(user, format: :json)
end
