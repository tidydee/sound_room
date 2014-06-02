Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider "soundcloud", ENV["SOUNDCLOUD_CLIENT_ID"], ENV["SOUNDCLOUD_SECRET"]
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
