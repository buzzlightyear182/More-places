# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'places_together'
set :repo_url, 'git@github.com:buzzlightyear182/More-places.git'

# Default branch is :master
set :branch, 'master'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deployer/apps/#{fetch(:application)}'
set :deploy_via, :remote_cache
set :use_sudo, :false

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

before "deploy", "deploy:check_revision"
after "deploy:finalize_update", "deploy:symlink_config"

namespace :deploy do

  desc "start unicorn server"
  task :start do
    on roles(:app, except: {no_release: true}) do
      run "/etc/init.d/unicorn_#{application} start"
    end
  end

  desc "stop unicorn server"
  task :stop do
    on roles(:app, except: {no_release: true}) do
      run "/etc/init.d/unicorn_#{application} stop"
    end
  end

  desc "restart unicorn server"
  task :restart do
    on roles(:app, except: {no_release: true}) do
      run "/etc/init.d/unicorn_#{application} restart"
    end
  end

  task :setup_config do
    on roles(:app) do
      sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
      sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
      run "mkdir -p #{shared_path}/config"
      put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
      puts "Now edit the config files in #{shared_path}."
    end
  end

  task :symlink_config do
    on roles(:app) do
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end
  end


  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:web) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end
end
