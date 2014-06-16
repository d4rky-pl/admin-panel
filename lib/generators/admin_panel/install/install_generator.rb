require 'rails/generators'

module AdminPanel
	module Generators
		class InstallGenerator < ::Rails::Generators::Base
			desc 'Generate basic admin panel with authentication namespaced as Admin'
			source_root ::File.expand_path('../templates', __FILE__)

			class_option :template_engine
			class_option :stylesheet_engine
			class_option :namespace, :type => :string, :default => 'admin', :desc => "Set namespace (default: admin)"
			class_option :skip_turbolinks, :type => :boolean, :default => false, :desc => "Skip Turbolinks on assets"

			def install_devise
				invoke 'devise:install'
			end

			def install_simple_form
				invoke 'simple_form:install', [], ['--bootstrap']
			end

			def copy_layout
				template "layouts/application.html.#{options[:template_engine]}", "app/views/layouts/admin/application.html.#{options[:template_engine]}"
			end

			def copy_assets
				directory 'assets', 'app/assets'
			end

			def copy_scaffold
				directory 'controllers', 'app/controllers'
				directory 'views', 'app/views'
			end

			def create_admin_model
o
			end

		end
	end
end
