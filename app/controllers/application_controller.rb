class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index, :about, :contact, :search, :get_search_results]

  def index
  end

  def about
  end

  def contact
  end

  def search
    @results = PgSearch.multisearch(params[:q]) if params[:q]
  end

  def get_search_results
    redirect_to search_path q: params[:q]
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :address, :city, :description, :avatar) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :address, :city, :description, :avatar) }
  end
end
