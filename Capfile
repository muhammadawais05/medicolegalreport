require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require 'rvm1/capistrano3'
require "capistrano/bundler"
install_plugin Capistrano::SCM::Git
require 'rvm1/capistrano3'
require "capistrano/bundler"
require "capistrano/rails/migrations"
require "capistrano/rails/assets"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
