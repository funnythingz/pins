# lib/tasks/bower.rake
namespace :bower do
  desc "Run `bower install --p` after assets:precompile"
  task :install do
    sh "rake bower:install"
  end
end

task "assets:precompile" => ["bower:install"]