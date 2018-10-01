module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(owner)
    session[:owner_id] = owner.id
  end

  # ユーザーのセッションを永続的にする
  def remember(owner)
    owner.remember
    cookies.permanent.signed[:owner_id] = owner.id
    cookies.permanent[:remember_token] = owner.remember_token
  end


    # 記憶トークンcookieに対応するユーザーを返す
    def current_owner
      if (owner_id = session[:owner_id])
        @current_owner ||= Owner.find_by(id: owner_id)
      elsif (owner_id = cookies.signed[:owner_id])
        owner = Owner.find_by(id: owner_id)
        if owner && Owner.authenticated?(cookies[:remember_token])
          log_in owner
          @current_owner = owner
        end
      end
    end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_owner.nil?
  end

   # 現在のユーザーをログアウトする
  def log_out
    forget(current_owner)
    session.delete(:owner_id)
    @current_owner = nil
  end

    # 永続的セッションを破棄する
  def forget(owner)
    owner.forget
    cookies.delete(:owner_id)
    cookies.delete(:remember_token)
  end

end
