# RVM bootstrap
require 'rvm/capistrano'
# bundler bootstrap
require 'bundler/capistrano'
#Change to correct version!
set :rvm_ruby_string, 'ruby-2.0.0-p247'
set :rvm_type, :system

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/home/passenger/railsapps/biosql.scilifelab.se"
#set :deploy_via, :remote_cache
set :user, "passenger"
set :use_sudo, false
set :port, 50020 #specify a specific ssh port on the app.example.org

# Server names
set :application, "biosql.scilife.se"
role :web, "biosql.scilifelab.se"
role :app, "biosql.scilifelab.se"
role :db, "biosql.scilifelab.se", :primary => true

# Git repository stuff
set :scm, :git
set :repository, "https://github.com/erikrikarddaniel/sll-biosql.git"
set :branch, "stable"
set :git_enable_submodules, 1

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

#THIS links the database file which is stored locally on the application server to the current release.
namespace :db do
  task :db_config, :except => { :no_release => true }, :role => :app do
    run "ln -s ~/dbconfigs/biosql.scilifelab.se/database.yml #{release_path}/config/database.yml"
    run "ln -s ~/railsapps/biosql.scilifelab.se/shared/genbank_files/ #{release_path}/genbank_files"
  end
end

after "deploy:finalize_update", "db:db_config"

#This is neccessary, this will precompile assets. If this is missing we will get strange problems with no errors in the logs.
load 'deploy/assets'
