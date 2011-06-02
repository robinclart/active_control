require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask.rb'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test_*.rb']
end

require File.expand_path("../lib/active_control/version", __FILE__)
desc "Build the documentation"
task :doc do
  sh [
    "rm -rf doc/",
    "sdoc -N -x test -x pkg -x '(Rake|Gem)file(.lock)?' -x 'active_control.gemspec' -m README.rdoc -t 'ActiveControl #{ActiveControl::VERSION}'",
    "open doc/index.html"
  ].join(" && ")
end
