class SessionsController < ApplicationController

  def new #ログイン画面へ
    @owner = Owner.new
  end

  def create#ログイン処理
    owner = Owner.find_by(email: params[:session][:email].downcase)
    if owner && owner.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in owner
      params[:session][:remember_me] == '1' ? remember(owner) : forget(owner)
      redirect_to "/top"
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
