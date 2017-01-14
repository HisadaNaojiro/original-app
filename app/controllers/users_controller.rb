class UsersController < ApplicationController

  before_action :authorize ,except: [:new,:create]

  def new
    set_meta({
        'title' => 'sign_up',
        'h1' => 'sign_up'
      })
    @user = User.new
    @errorMessages = {}
  end

  def create
    set_meta({
        'title' => 'sign_up',
        'h1' => 'sign_up'
    })
    @user = User.new(user_params)

    unless @user.save
      @errorMessages = @user.errors.messages
      return render action: 'new'
    end

    flash.notice = 'notice.complete_register_user'
    redirect_to :users
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,:last_name,:email,:email_confirmation,:password,
      :password_confirmation,:gender,:birthday
    )
  end

end
