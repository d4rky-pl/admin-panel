require 'spec_helper'
require 'generators/admin_panel/scaffold/scaffold_generator'

describe AdminPanel::Generators::ScaffoldGenerator do
  destination File.expand_path('../../../../../tmp', __FILE__)

  before do
    prepare_destination
    prepare_rails_dummy
  end

  describe 'scaffolder' do
    before { run_generator(%w(post title:string description:text public:boolean --template-engine=erb)) }
    # @see spec/dummy/bin/rails
    it { expect(file('app/models/post.rb')).to exist }

    describe 'migration' do
      subject { migration_file('db/migrate/create_posts.rb') }
      it { is_expected.to be_a_migration }
      it { is_expected.to contain(/t.string :title/) }
    end

    describe 'controller' do
      subject { file('app/controllers/admin/posts_controller.rb') }

      it 'exists and is a proper ruby file' do
        expect(subject).to exist.and have_correct_syntax
      end

      it 'does not have default scaffolding method' do
        expect(subject).to_not have_method(:index).containing '@posts = Post.all'
      end

      it 'contains all necessary methods' do
        expect(subject).to have_method(:index).containing   '@posts = Post.page(params[:page]).per(params[:per_page])'
        expect(subject).to have_method(:show)
        expect(subject).to have_method(:new).containing     '@post = Post.new'
        expect(subject).to have_method(:create).containing  '@post = Post.new(post_params)'
        expect(subject).to have_method(:edit)
        expect(subject).to have_method(:update).containing  '@post.update(post_params)'
        expect(subject).to have_method(:destroy).containing '@post.destroy'
      end

    end

    %w(index edit show new _form).each do |view|
      describe "view '#{view}'" do
        subject { file("app/views/admin/posts/#{view}.html.erb") }
        it 'exists and is a proper ruby file' do
          expect(subject).to exist.and have_correct_syntax
        end
      end
    end
  end

  describe 'scaffolder with haml' do
    before { run_generator(%w(order title:string description:text --template-engine=haml))}

    %w(index edit show new _form).each do |view|
      describe "view '#{view}'" do
        subject { file("app/views/admin/orders/#{view}.html.haml") }
        it 'exists and is a proper haml file' do
          expect(subject).to exist.and have_correct_syntax
        end
      end
    end
  end
end