require 'spec_helper'
require 'generators/admin_panel/scaffold/scaffold_generator'

describe AdminPanel::Generators::ScaffoldGenerator do
	destination File.expand_path('../../../../../tmp', __FILE__)

	before do
		prepare_destination
		prepare_rails_dummy
	end

	describe 'scaffolder' do
		before { run_generator(%w(post title:string description:text public:boolean)) }
		# @see spec/dummy/bin/rails
		it_should_exist 'app/models/post.rb'

		describe 'posts controller' do
			subject { file('app/controllers/admin/posts_controller.rb')}
			it { should exist }
			it { should contain 'include Administrable' }
			it { should contain '@posts = Post.all' }
		end

		it_should_exist 'app/views/admin/posts/index.html.erb'
		it_should_exist 'app/views/admin/posts/edit.html.erb'
		it_should_exist 'app/views/admin/posts/show.html.erb'
		it_should_exist 'app/views/admin/posts/new.html.erb'
		it_should_exist 'app/views/admin/posts/_form.html.erb'

	end
end