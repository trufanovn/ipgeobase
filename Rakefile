# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

Gem::Specification.new do |s|
  s.name        = 'ipgeobase_truf'
  s.version     = '0.1.0'
  s.summary     = "For Hexlet!"
  s.authors     = ["trufanovn"]
  s.email       = 'trufanovwork@gmail.com'
  s.files       = ["lib/ipgeobase.rb"]
  s.homepage    = 'https://rubygems.org/gems/ipgeobase_truf'
  s.metadata    = { "source_code_uri" => "https://github.com/trufanovn/ipgeobase_truf" }
end

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[test rubocop]
