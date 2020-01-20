class SessionsController < ApplicationController
  def new
  end
  
  def create
  user = User.find_by(params_email)
  if user && user.authenticate(params_password[:password])
    log_in user
    redirect_to root_path, success: "ログインに成功しました。"
  else
    flash.now[:danger] = "ログインに失敗しました。"
    render :new
  end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: "ログアウトしました。"
  end
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
    
  end
  
  def params_email
    params.require(:session).permit(:email)
  end
  
  def params_password
    params.require(:session).permit(:password)
  end
  
end