Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_client_id'], ENV['facebook_secret'], :image_size => 'large'
end