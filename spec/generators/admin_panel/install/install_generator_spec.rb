require 'spec_helper'
require 'generators/admin_panel/install/install_generator'

describe AdminPanel::Generators::InstallGenerator do
  destination File.expand_path('../../../../../tmp', __FILE__)

  before do
    prepare_destination
    prepare_rails_dummy
  end

  describe 'installer' do
    before { run_generator(%w(--template-engine=erb)) }
    describe 'installing external gems correctly' do
      %w(devise.rb simple_form.rb kaminari_config.rb).each do |initializer|
        subject { file("config/initializers/#{initializer}") }
        it { should exist.and have_correct_syntax }
      end
    end

    describe 'copying layout files' do
      %w(application _messages _navigation).each do |filename|
        subject { file("app/views/layouts/admin/#{filename}.html.erb") }
        it { should exist.and have_correct_syntax }
      end
    end

    describe 'copying assets' do
      %w(javascripts/admin.js stylesheets/admin.css.scss).each do |filename|
        subject { file("app/assets/#{filename}") }
        it { should exist }
      end
    end

    describe 'copying helper, controllers, models and views' do
      %w(
        app/helpers/admin_helper.rb

        app/controllers/admin/dashboard_controller.rb
        app/controllers/admin/passwords_controller.rb
        app/controllers/admin/sessions_controller.rb

        app/models/admin.rb

        app/views/admin/dashboard/index.html.erb
        app/views/admin/passwords/edit.html.erb
        app/views/admin/passwords/new.html.erb
        app/views/admin/sessions/new.html.erb
     ).each do |filename|
        subject { file(filename)}
        it { should exist.and have_correct_syntax }
      end
    end

    describe 'seeding default admin user' do
      describe 'seeds.rb' do
        subject { file('db/seeds.rb') }
        it { should exist.and have_correct_syntax.and contain %Q(Admin.create!({ email: 'admin@example.com', password: 'administrator' })) }
      end
    end

    describe 'routing generation' do
      describe 'routes.rb' do
        subject { file('config/routes.rb') }
        it { should exist.and have_correct_syntax.and contain %Q(
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

  describe 'installer with haml' do
    before { run_generator(%w(--template-engine=haml))  }
    describe 'copying layout files' do
      %w(application _messages _navigation).each do |filename|
        subject { file("app/views/layouts/admin/#{filename}.html.haml") }
        it { should exist.and have_correct_syntax }
      end
    end

    describe 'copying helper, controllers, models and views' do
      %w(
        app/views/admin/dashboard/index.html.haml
        app/views/admin/passwords/edit.html.haml
        app/views/admin/passwords/new.html.haml
        app/views/admin/sessions/new.html.haml
     ).each do |filename|
        subject { file(filename)}
        it { should exist.and have_correct_syntax }
      end
    end
  end
end