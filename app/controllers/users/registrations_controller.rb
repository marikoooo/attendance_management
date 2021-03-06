class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  prepend_before_action :authenticate_admin!, only: [:new, :create, :cancel]
  prepend_before_action :authenticate_admin, only: [:new, :create]
  before_action :configure_account_update_params, only: [:update]
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?



  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  # def create
  
  #   super
  #   build_resource(sign_up_params)

  #   resource.save
  #   yield resource if block_given?
  #     if resource.persisted?
  #       if resource.active_for_authentication?
  #         set_flash_message :notice, :signed_up if is_flashing_format?

  #         # 他の管理者からアカウント作成するので、登録後に自身のアカウントでログインし直す
  #         original_user = current_user
  #         sign_up(resource_name, resource)
  #         Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  #         sign_in(resource_name, original_user)

  #         respond_with resource, location: after_sign_up_path_for(resource)
  #       else
  #         set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
  #         expire_data_after_sign_in!
  #         respond_with resource, location: after_inactive_sign_up_path_for(resource)
  #       end
  #     else
  #       clean_up_passwords resource
  #       set_minimum_password_length
  #       respond_with resource
  #     end
  #   end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:encrypted_password, :name, :birthday, :gender, :contract, :address, :phone])
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :gender, :contract, :address, :phone])
  # end

  # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:encrypted_password, :name, :birthday, :gender, :contract, :address, :phone])
    end

    def authenticate_admin
      redirect_to user_session_path unless current_admin   
    end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
