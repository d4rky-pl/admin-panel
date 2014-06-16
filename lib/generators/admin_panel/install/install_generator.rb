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

			attr_reader :app_name

			def copy_layout
				@app_name = ::Rails.application.class.to_s.split("::").first.humanize
				template "layouts/admin/application.html.#{options[:template_engine]}", "app/views/layouts/admin/application.html.#{options[:template_engine]}"
				copy_file "layouts/admin/_messages.html.#{options[:template_engine]}", "app/views/layouts/admin/_messages.html.#{options[:template_engine]}"
				copy_file "layouts/admin/_navigation.html.#{options[:template_engine]}", "app/views/layouts/admin/_navigation.html.#{options[:template_engine]}"
			end

			def copy_assets
				directory 'assets', 'app/assets'
			end

			def copy_scaffold
				directory 'controllers', 'app/controllers'
				directory 'views', 'app/views'
			end

			def create_admin_model
				invoke 'active_record:devise', ['admin'], ['--routes', false]
				append_to_file 'db/seeds.rb', %Q(
Admin.create!({ email: 'admin@example.com', password: 'administrator' })
)
			end

			def create_routes
				route %Q(
  devise_for :admin,
           :only => [:sessions, :passwords],
           :controllers => { :sessions => 'admin/sessions', :passwords => 'admin/passwords' }

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
  end
)
			end

			def show_install_message
				readme "README"
			end
		end
	end
end
