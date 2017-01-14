class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def set_meta(params)
    @title = params['title'] if params['title'].present?
    @h1 = params['h1'] if params['h1'].present?
  end

  private
  def authorize
    unless logged_in?
      store_location
      flash[:danger] = 'alert.please_log_in'
      redirect_to :login
    end
  end
end
