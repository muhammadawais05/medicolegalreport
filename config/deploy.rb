# config valid for current version and patch releases of Capistrano
lock "~> 3.18.0"

set :application, "medicolegalreport"
set :repo_url, "git@github.com:muhammadawais05/medicolegalreport.git"

set :use_sudo, true
set :deploy_via, :rsync_with_remote_cache
set :keep_releases, 5

set :ssh_options, { forward_agent: false, config: false }
set :log_level, :debug
set :pty, false

set :deploy_to, '/home/deployer/www/medicolegalreport'
set :linked_files, %w[ config/puma.rb ]
append :linked_files, "config/credentials/#{RAILS_ENV=fetch(:stage)}.key"
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle shared/bundle shared/config/credentials]

set :rvm1_ruby_version, 'ruby-3.1.2'
set :rvm_type, :user
set :default_env, { rvm_bin_path: '~/.rvm/bin' }
set :rvm1_map_bins, -> { fetch(:rvm_map_bins).to_a.concat(%w[rake gem bundle ruby]).uniq }

# before 'deploy:assets:precompile', 'deploy:load_translations'
# after 'deploy:updated', invoke!('assets:precompile')

namespace :deploy do
  desc 'Load I18n JS translations'
  task :load_translations do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :"rake i18n:js:export RAILS_ENV=#{fetch(:stage)}"
        execute :bundle, :exec, :"rake tmp:cache:clear RAILS_ENV=#{fetch(:stage)}"
      end
    end
  end
end

# namespace :deploy do
#   desc 'Uploads required config files'
#   task :upload_configs do
#     on roles(:all) do
#       # upload!('config/credentials/staging.key', "#{deploy_to}/shared/config/credentials/staging.key")
#       # upload!('config/credentials', "#{deploy_to}/shared/config/")
#     end
#   end
# end


namespace :app do
  desc 'Start application'
  task :start do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :"puma -C config/puma.rb"
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :'pumactl -F config/puma.rb stop'
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current/" do
        if test("[ -f #{deploy_to}/current/tmp/pids/puma.pid ]")
          execute :bundle, :exec, :'pumactl -F config/puma.rb stop'
        end

        execute :bundle, :exec, :"puma -C config/puma.rb"
      end
    end
  end
end

# namespace :deploy do
#   namespace :assets do
#     desc 'Precompile assets locally and then rsync to remote servers'
#     task :precompile do
#       local_manifest_path = %x{ls public/assets/manifest*}.strip

#       %x{bundle exec rake assets:precompile assets:clean}

#       on roles(fetch(:assets_roles)) do |server|
#         rsync_host = server.hostname
#         rsync_user = server.user
#         rsync_options = ""
#         rsync_port = 22
#         release_path = '/home/deployer/www/hr-system'

#         rsync_options_escaped = Shellwords.escape(rsync_options)
#         command = "rsync -e 'ssh -p 22' ./public/assets/ #{rsync_user}@#{rsync_host}:#{release_path}/public/assets/"
#         %x{#{command}}

#         command = "rsync -e 'ssh -p #{rsync_port}' ./#{local_manifest_path} #{rsync_user}@#{rsync_host}:#{release_path}/assets_manifest#{File.extname(local_manifest_path)}"
#         %x{#{command}}
#       end

#       %x{bundle exec rake assets:clobber}
#     end
#   end
# end
