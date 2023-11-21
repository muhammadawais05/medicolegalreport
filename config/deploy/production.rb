server '54.242.152.189', user: 'deployer', roles: %w[app web db]

set :branch, 'main'

namespace :deploy do
  after :finished, 'app:restart'
end
