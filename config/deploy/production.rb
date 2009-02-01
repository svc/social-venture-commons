set :application, "www.ventwits.com"

set :user, "deploy"
set :use_sudo, false
set :scm, :git
 
set :repository, "git://github.com/svc/social-venture-commons.git"
 
set :deploy_to, "/var/www/applications/#{application}"
set :deploy_via, :remote_cache
set :copy_exclude, [".git"]

 
set   :domain, 'ventwits.com'

role  :app, domain
role  :db, domain, :primary => true
 
set :runner, "nginx"
 
namespace :deploy do
  task :start, :roles => [:app] do
    run "cd #{deploy_to}/current && nohup thin -C config/thin_config.yml start"
  end
 
  task :stop, :roles => [:app] do
    run "cd #{deploy_to}/current && nohup thin -C config/thin_config.yml stop"
  end
 
  task :restart, :roles => [:app] do
    run "cd #{deploy_to}/current && nohup thin -C config/thin_config.yml restart"
  end
  
  task :create_sockets_dir, :roles=>[:app] do
    run "cd #{deploy_to}/shared && mkdir sockets"
  end
  
  task :after_deploy, :roles=>[:app] do
    cleanup
  end
end