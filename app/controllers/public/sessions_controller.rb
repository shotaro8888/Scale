# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  #退会しているかを判断するメソッド
  def user_state 
    #入力されたemailからアカウントを１件取得
    @user = User.find_by(email: params[:customer][:email])
    #アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    #取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if@user.valid_password?(params[:customer][:password])
      #もし上記の条件が一致していた場合、次の処理を行う
      #該当アカウントのis_deleteカラムの値がtrueの場合、次の処理を行う
      if @user.is_deleted == true
        redirect_to new_user_registration_path
      end
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
