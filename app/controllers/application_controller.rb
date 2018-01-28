class ApplicationController < ActionController::Base

  before_action :authenticate_user!, only: [:new]
  # , :set_current_user
  # :set_current_user


  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後各々のマイページに飛ばす
  def after_sign_in_path_for(resource)
    # @user = User.find(params[:id])
    user_path(current_user)
  end

  # def ensure_correct_user
  #   @book = Book.find_by(id:params[:id])
  #   if @book.user_id != @current_user.id
  #     flash[:notice] = "権限がありません"
  #     redirect_to("/")
  # 	end
  # end

  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:log_in, keys: [:name, :email])
  end
end


