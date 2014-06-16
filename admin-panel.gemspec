$:.push File.expand_path("../lib", __FILE__)
require 'admin-panel/version'

Gem::Specification.new do |spec|
	spec.name          = 'admin-panel'
	spec.version       = AdminPanel::VERSION

	spec.authors       = ['Michał Matyas']
	spec.email         = ['michal@higher.lv']
	spec.summary       = 'Generates Twitter Bootstrap based admin panel with scaffolder'
	spec.description   = 'Generates Twitter Bootstrap based admin panel with scaffolder. Project is quite opinionated, requires Rails 4, SASS, SimpleForm and Devise.'
	spec.homepage      = 'https://github.com/d4rky-pl/admin-panel'
	spec.license       = 'MIT'

	spec.files         = `git ls-files`.split($/)
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]

	spec.add_development_dependency 'bundler', '~> 1.5'
	spec.add_development_dependency 'rake', '~> 10.0'
	spec.add_development_dependency 'rspec', '~> 3.0'
	spec.add_development_dependency 'ammeter', '~> 1.0'

	spec.add_runtime_dependency 'railties', '>= 4.0.0'
	spec.add_runtime_dependency 'sass-rails', '>= 4.0.0'
	spec.add_runtime_dependency 'bootstrap-sass', '~> 3.1'
	spec.add_runtime_dependency 'simple_form', '>= 3.1.0.rc1'
	spec.add_runtime_dependency 'devise', '~> 3.2'
end
