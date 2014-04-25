# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :soundcloud, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'user, repo, gist'
# end

# use OmniAuth::Builder do
#     provider "soundcloud", "173c1924dc4e55b0db3b89a45bb71561", "11c7bc108ece108b7be66575583486b2"
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider "soundcloud", "173c1924dc4e55b0db3b89a45bb71561", "11c7bc108ece108b7be66575583486b2"
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
