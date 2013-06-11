#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SampleApp::Application.load_tasks

desc "run rspec tests in requests/static_pages_spec.rb"
task :reqtest do
  sh "bundle exec rspec spec/requests/static_pages_spec.rb"
end
