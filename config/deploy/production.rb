server '34.201.155.63', user: 'deployer', roles: %w[app web db]

set :branch, 'main'

namespace :deploy do
  after :finished, 'app:restart'
end
