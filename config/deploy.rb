# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "Life-s-Game"
set :repo_url, "https://github.com/BrightestStar/Life-s-Game.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/apps/Life-s-Game"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby

# in case you want to set ruby version from the file:
# set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/local/Cellar/rbenv/0.4.0 exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default valuey

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_files, 'config/database.yml', 'config/secrets.yml'
# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

set :passenger_restart_with_touch, true
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :default_env, { rvm_bin_path: '~/.rvm/bin' }
SSHKit.config.command_map[:rake] = "#{fetch(:default_env)[:rvm_bin_path]}/rvm ruby-#{fetch(:rvm_ruby_version)} do bundle exec rake"

# Default value for keep_releases is 5
set :keep_releases, 5
