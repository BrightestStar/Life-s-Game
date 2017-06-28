# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "Life-s-Game"
set :repo_url, "git@github.com:BrightestStar/Life-s-Game.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/apps/Life-s-Game"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle')

set :passenger_restart_with_touch, true
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
namespace :rvm1 do # https://github.com/rvm/rvm1-capistrano3/issues/45
  desc "Setup bundle alias"
  task :create_bundle_alias do
    on release_roles :all do
      execute %Q{echo "alias bundle='#{fetch(:rvm1_auto_script_path)}/rvm-auto.sh . bundle'" > ~/.bash_aliases}
    end
  end
end
after "rvm1:install:rvm", "rvm1:create_bundle_alias"
