module Administrable
	extend ActiveSupport::Concern

	included do
		before_filter :authenticate_user!
		helper AdminHelper
	end
end