class Admin::PasswordsController < Devise::PasswordsController
  helper AdminHelper
  layout 'admin/application'
end