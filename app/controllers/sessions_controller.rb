class SessionsController < ApplicationController

  def new
  end

  def create
    @current_user = User.find_by_login_and_password(params[:login], params[:password])
    if @current_user # dang nhap thanh cong.
      session[:user_id] = @current_user.id # tao session moi.
      if session[:return_to]
        redirect_to session[:return_to]
        session[:return_to] = nil
      else # dang nhap thanh cong.
        redirect_to stories_path
      end
    else # dang nhap khong thanh cong.
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
  end
end
