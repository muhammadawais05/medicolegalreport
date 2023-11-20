server '50.17.132.241', user: 'deployer', roles: %w[app web db]

set :branch, 'main'

namespace :deploy do
  after :finished, 'app:restart'
end
