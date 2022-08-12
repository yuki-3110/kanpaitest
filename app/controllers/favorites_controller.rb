class FavoritesController < ApplicationController

  def index
    @favorite = Favorite.all.where(user_id: current_user.id)
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんの投稿をお気に入りしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんの投稿のお気に入りを解除しました"
  end

end
