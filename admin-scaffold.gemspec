$:.push File.expand_path("../lib", __FILE__)
require 'admin-scaffold/version'

Gem::Specification.new do |spec|
	spec.name          = 'admin-scaffold'
	spec.version       = AdminScaffold::VERSION

	spec.authors       = ['Michał Matyas']
	spec.email         = ['michal@higher.lv']
	spec.summary       = 'Admin-scaffold generates Twitter Bootstrap based admin panel scaffolder'
	spec.description   = 'Admin-scaffold generates Twitter Bootstrap based admin panel scaffolder. Requires Rails 4.'
	spec.homepage      = 'https://github.com/d4rky-pl/admin-scaffold'
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
	spec.add_runtime_dependency 'simple_form', '~> 3.0'
	spec.add_runtime_dependency 'devise', '~> 3.2'
end
