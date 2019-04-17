class FavoritesController < ApplicationController

  def by_user
    @favorites = Favorite.select{ |f| f.user_id == params[:id].to_i }
    render json: @favorites
  end

  def by_puzzle
    @favorites = Favorite.select{ |f| f.puzzle_id == params[:id].to_i }
    render json: @favorites
  end

  def create
    @favorite = Favorite.create(favorite_params)
    render json: @favorite
  end

  def destroy
    Favorite.destroy(params[:id])
  end

  private

  def favorite_params
    params.permit(:puzzle_id, :user_id)
  end

end
