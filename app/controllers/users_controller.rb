class UsersController < ApplicationController
  skip_before_action :login_required, only: %i(new create)
  before_action :set_user,  only: %i(show edit update)
  before_action :user_check, only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました！"
    else
      render :edit, notice: "ユーザー情報の更新に失敗しました。"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image, :image_cache)
  end

  def user_check
    if current_user != @user
      redirect_to user_path(@user), notice: "他人のプロフィールの更新はできません"
    end
  end

end
