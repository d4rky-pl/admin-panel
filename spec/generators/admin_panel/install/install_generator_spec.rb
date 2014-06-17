require 'spec_helper'
require 'generators/admin_panel/install/install_generator'

describe AdminPanel::Generators::InstallGenerator do
	destination File.expand_path('../../../../../tmp', __FILE__)

	before do
		prepare_destination
		prepare_rails_dummy
	end

	describe 'installer' do
		before { run_generator }
		describe 'devise:install' do
			it_should_exist 'config/initializers/devise.rb'
		end

		describe 'simple_form:install' do
			it_should_exist 'config/initializers/simple_form.rb'
		end

		describe 'copying layout' do
			it_should_exist 'app/views/layouts/admin/application.html.erb'
			it_should_exist 'app/views/layouts/admin/_messages.html.erb'
			it_should_exist 'app/views/layouts/admin/_navigation.html.erb'
		end

		describe 'copying assets' do
			it_should_exist 'app/assets/javascripts/admin.js'
			it_should_exist 'app/assets/stylesheets/admin.css.scss'
		end

		describe 'copying helper' do
			it_should_exist 'app/helpers/admin_helper.rb'
		end

		describe 'copying controllers' do
			it_should_exist 'app/controllers/admin/dashboard_controller.rb'
			it_should_exist 'app/controllers/admin/passwords_controller.rb'
			it_should_exist 'app/controllers/admin/sessions_controller.rb'
		end

		describe 'copying views' do
			it_should_exist 'app/views/admin/dashboard/index.html.erb'
			it_should_exist 'app/views/admin/passwords/edit.html.erb'
			it_should_exist 'app/views/admin/passwords/new.html.erb'
			it_should_exist 'app/views/admin/sessions/new.html.erb'
		end

		describe 'active_record:devise' do
			it_should_exist 'app/models/admin.rb'
		end

		describe 'seeding default admin user' do
			describe 'seeds.rb' do
				subject { file('db/seeds.rb')}
				it { should exist }
				it { should contain %Q(Admin.create!({ email: 'admin@example.com', password: 'administrator' })) }
			end
		end

		describe 'routing generation' do
			describe 'routes.rb' do
				subject { file('config/routes.rb') }
				it { should exist }
				it { should contain %Q(
  devise_for :admin,
           :only => [:sessions, :passwords],
           :controllers => { :sessions => 'admin/sessions', :passwords => 'admin/passwords' }

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
  end
) }

			end
		end
	end
end