# lib/tasks/bower.rake
namespace :bower do
  desc "Run `bower install --production` after assets:precompile"
  task :install do
    sh "./node_modules/bower/bin/bower install --production"
  end
end

task "assets:precompile" => ["bower:install"]