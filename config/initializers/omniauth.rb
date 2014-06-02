Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider "soundcloud", "d8eeb9848b095ce9d0e77eeb9d6f360a", "3f6c773c7605625ea6e4a3b264688261"
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
