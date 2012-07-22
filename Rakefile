require 'rake'

desc "`rake` will default to running `rake:spec`"
task :default => :spec

desc "Run all the rspec examples"
task :spec do
  system "bundle exec rspec -c spec"
end

desc "Start guard"
task :guard do
  system "bundle exec guard"
end

desc "Delete fixtures to run tests with new data"
task :cleanup do
  system "rm -rf spec/fixtures"
end
