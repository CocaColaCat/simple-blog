class SessionsController < ApplicationController
  def new
  end

  def create
    user = AdminUser.find_by(password: params[:password], email: params[:email])

    if user
      session[:user_id] = user.id
      redirect_to articles_path
    else
      flash[:notice] = '密码或邮箱错误'
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = '您已成功登出'
    redirect_to articles_path
  end

end
