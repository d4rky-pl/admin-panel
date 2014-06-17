class Admin::SessionsController < Devise::SessionsController
  helper AdminHelper
  layout 'admin/application'
end