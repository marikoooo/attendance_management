class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

 

  
  #  def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     admin_path
  #   when User
  #     edit_user_registration_path
  #   end
  # end

  def after_sign_out_path_for(resource)
    root_path
  end

#   private
#     def sign_in_required
#       redirect_to new_user_session_path unless user_signed_in?
#     end
end
