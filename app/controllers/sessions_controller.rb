class SessionsController < ApplicationController

  def new
    set_meta({
        'title' => 'login',
        'h1' => 'login'
      })
    @form = LoginForm.new
  end

  def create
    set_meta({
        'title' => 'login',
        'h1' => 'login'
      })
    @form = LoginForm.new(params[:login_form])
    user = User.find_by(email: @form.email)
    unless user && user.authenticate(@form.password)
      return render action: 'new'
    end
    session[:user_id] = user.id
    flash[:notice] = 'ログインしました'
    redirect_to :users
  end
end
