set :application, "the_shib_dummy"
set :repository,  "git://github.com/joegoggins/php_shib_dummy1.git"
set :deploy_to, "/var/www/html/php_shib_dummy1"

set :scm, :git
set :user, "root" 
set :use_sudo,              false

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "shib-local-vm1.asr.umn.edu"                          # Your HTTP server, Apache/etc
role :app, "shib-local-vm1.asr.umn.edu"                          # This may be the same as your `Web` server

before 'deploy', 'copy_shib_files'
task :copy_shib_files do
  run "cp shibboleths_lil_helper/generated/default/shib-local-vm1.asr.umn.edu/shibboleth2.xml /etc/shibboleth/"
  run "cp shibboleths_lil_helper/generated/default/shib-local-vm1.asr.umn.edu/attribute-map.xml /etc/shibboleth/"
  run "cp shibboleths_lil_helper/generated/default/shib-local-vm1.asr.umn.edu/idp_metadata.xml /etc/shibboleth/"
end

after  'deploy', 'restart_shibd'
task :restart_shibd do
  run "service shibd restart"
end
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
