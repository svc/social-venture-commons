set :application, "svc.itthugs.com"
set :user, "nginx"
set :use_sudo, false
set :scm, :git
 
set :repository, "git://github.com/svc/social-venture-commons.git"
 
set :deploy_to, "/var/www/applications/#{application}"
set :deploy_via, :copy
set :copy_exclude, [".git"]

 
set   :domain, 'ssh.itthugs.com'
role  :app, domain
 
set :runner, user
 
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