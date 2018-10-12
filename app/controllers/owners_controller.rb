class OwnersController < ApplicationController

  def index  #オーナー一覧

  end

  def show #オーナー詳細
  end

  def new #オーナー新規登録画面
    @owner = Owner.new
  end

  def create #オーナーログイン認証

    @owner = Owner.new(owner_params)
    if @owner.save
      log_in @owner
      redirect_to "/top"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
   end

  end

  def edit #オーナー編集
  end

  def update #オーナーアップデート
  end

  def destroy #オーナー削除
  end


  private

    def owner_params
      params.require(:owner).permit(:name, :email, :password,
                                  :password_confirmation)
    end
end
