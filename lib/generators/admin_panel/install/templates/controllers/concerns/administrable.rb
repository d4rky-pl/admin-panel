module Administrable
  extend ActiveSupport::Concern

  included do
    before_filter :authenticate_admin!
    helper AdminHelper
    layout 'admin/application'
  end
end