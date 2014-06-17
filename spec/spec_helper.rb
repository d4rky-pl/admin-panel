require 'rails/all'
require 'rspec/rails/adapters'
require 'rspec/rails/example/rails_example_group'
require 'tmpdir'
require 'fileutils'
require 'ammeter/init'

def prepare_rails_dummy
	FileUtils.cp_r('spec/dummy/.', destination_root)
end

def it_should_exist(path)
	describe "file #{File.basename(path)}" do
		subject { file(path)}
		it { should exist }
	end
end