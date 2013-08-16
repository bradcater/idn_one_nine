require "bundler/gem_tasks"
require "rspec/core/rake_task"

begin
  require 'rake/extensiontask'
rescue LoadError
  abort "This Rakefile requires rake-compiler (gem install rake-compiler)"
end

desc "idn_one_nine unit tests"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/*_spec.rb"
  t.verbose = true
end

gemspec = Gem::Specification.load('idn_one_nine.gemspec')
Rake::ExtensionTask.new do |ext|
  ext.name = 'idn'
  ext.ext_dir = 'ext'
  ext.lib_dir = 'lib'
  ext.gem_spec = gemspec
  ext.source_pattern = "*.{c,h}"
  ext.cross_compile  = true
end

task :default => [:compile, :test]
