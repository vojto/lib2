set :application, 'lib2'
set :repo_url, 'git@github.com:vojto/lib2.git'
set :scm, :git
set :deploy_to, '/var/apps/lib2'
set :user, 'edukit'

set :use_sudo, false

# This is a Rails-specific param, just want to disable the functionality
set :normalize_asset_timestamps, false

set :shared_children, %w(log public)

# Set this to 'mrt' if you want to use Meteorite
set :meteor, 'mrt'

# set :format, :pretty
# set :log_level, :debug
set :pty, true

# set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{public/photos}

set :default_env, {
  :root_url => "http://libko.edukit.eu",
  :mongo_url => "mongodb://localhost/lib2",
  :port => "8010",
  :public_path => "#{fetch(:deploy_to)}/current/public"
}
set :keep_releases, 5

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within current_path do
        execute "pm2", "sendSignal", "SIGINT", fetch(:application)
        # execute "pm2", "delete", fetch(:application)
        # execute "pm2", "start", "#{current_path}/bundle/main.js", "-f", "-n", fetch(:application)
      end
    end
  end
end

after 'deploy:updated', :meteor_bundle do
  on roles(:app), in: :sequence, wait: 5 do
    execute "cd #{release_path}; #{fetch(:meteor)} bundle bundle.tgz"
    execute "cd #{release_path}; tar xvf #{File.join(release_path, "bundle.tgz")}"
    execute "rm -rf #{File.join(release_path, "bundle.tgz")}"
  end
end


after 'deploy:publishing', 'deploy:restart'