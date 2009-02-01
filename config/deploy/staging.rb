set :application, "staging.ventwits.com"

set :user, "deploy"
set :use_sudo, false
set :scm, :git
 
set :repository, "git://github.com/svc/social-venture-commons.git"
 
set :deploy_to, "/var/www/applications/#{application}"
set :deploy_via, :remote_cache
set :copy_exclude, [".git"]

 
set   :domain, 'ventwits.com'

role  :app, domain
role  :web, domain
role  :db, domain, :primary => true
 
set :runner, "nginx"
 
namespace :deploy do
  task :start, :roles => [:app] do
    run "cd #{deploy_to}/current && nohup thin -C config/thin_staging_config.yml start"
  end
 
  task :stop, :roles => [:app] do
    run "cd #{deploy_to}/current && nohup thin -C config/thin_staging_config.yml stop"
  end
 
  task :restart, :roles => [:app] do
    run "cd #{deploy_to}/current && nohup thin -C config/thin_staging_config.yml restart"
  end
  
  task :create_sockets_dir, :roles=>[:app] do
    run "cd #{deploy_to}/shared && mkdir sockets"
  end
  
  task :copy_database_yml, :roles => :app do
    db_config = "/var/www/applications/#{application}/shared/database.yml"
    run "cp #{db_config} #{release_path}/config/database.yml"
  end  
  
  task :copy_twitter_login, :roles => :app do
    twitter_login = "/var/www/applications/#{application}/shared/twitter_login.rb"
    run "cp #{db_config} #{release_path}/config/initializers/twitter_login.rb"
  end
  
  task :before_finalize_update, :roles=>[:app] do
    copy_database_yml
    copy_twitter_login
  end
  
  task :after_deploy, :roles=>[:app] do
    cleanup    
  end
end

