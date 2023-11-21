server '34.239.142.37', user: 'deployer', roles: %w[app web db]

set :branch, 'main'

namespace :deploy do
  after :finished, 'app:restart'
end
