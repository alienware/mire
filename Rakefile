require "bundler/gem_tasks"
Bundler::GemHelper.install_tasks
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

task :pry do
  require "pry"
  require "awesome_print"
  require_relative "lib/mire"
  include Mire
  ARGV.clear
  Pry.start
end

require "rubocop/rake_task"
desc "Run RuboCop on the lib directory"
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns      = ["lib/**/*.rb"]
  task.formatters    = ["files"]
  task.fail_on_error = false
end

task default: [:spec, :rubocop]
