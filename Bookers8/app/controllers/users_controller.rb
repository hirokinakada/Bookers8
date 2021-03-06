class UsersController < ApplicationController
	#before_action :baria_user, only: [:update]

 # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, only: [:edit,:show,:index]
# 編集画面表示、修正内容の更新アクション実行時はログインしているユーザーの場合のみ実行可とする。
  before_action :correct_user, only: [:edit, :update]


  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
    @booknew = Book.new
  end


  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
    @booknew = Book.new
end


  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user.id), notice: "successfully updated user!"
  	else
  		render "edit"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def correct_user
    unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end

def user_params
      params.require(:user).permit(:postcode, :prefecture_name, :address_city, :address_street)
    end
  #def correct_user
  #user = User.find(params[:id])
  #if current_user != user
  #redirect_to user_path(current_user)
  #end
  #end


end
