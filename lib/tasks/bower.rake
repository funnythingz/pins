# lib/tasks/bower.rake
namespace :bower do
  desc "Run `bower install --production` after assets:precompile"
end

task "assets:precompile" => ["bower:install"]