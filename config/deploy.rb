set :application, 'muddle'
set :branch, 'master'
set :deploy_via, :remote_cache
set :repository,  'git://github.com/geemus/muddle.git'
set :scm, 'git'

role :app, 'geemus.com'
role :web, 'geemus.com'
role :db,  'geemus.com', :primary => true

deploy.task :start do
  run "cd #{current_path}; merb -a thin -c 2 -p 4000 -e production"
end

deploy.task :stop do
  run "cd #{current_path}; merb -a thin -c 2 -p 4000 -e production -K all"
end

deploy.task :restart do
  deploy.stop
  deploy.start
end

task :after_symlink do
  sudo "ln -nfs #{shared_path}/log #{release_path}/log"
  run "rm #{current_path}/config/database.yml"
  sudo "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
end
