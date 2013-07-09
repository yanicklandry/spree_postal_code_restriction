# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_postal_code_restriction'
  s.version     = '1.3.1'
  s.summary     = 'Add the possibility to restrict purchase to certain postal codes'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Yanick Landry'
  s.email     = 'yanick.landry@gmail.com'
  s.homepage  = 'http://www.nurun.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1'
  s.add_dependency 'spree_detaillant'

  s.add_development_dependency 'capybara', '~> 1.1.2'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
