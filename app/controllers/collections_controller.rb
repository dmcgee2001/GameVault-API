class CollectionsController < ApplicationController
  before_action :authenticate_user

  def index
    @collections = current_user.collections
    render :index
  end

  def create
    @collection = Collection.new(
      user_id: current_user.id,
      game_id: params[:game_id],
    )

    if @collection.save
      render json: @collection.as_json
    else
      render json: { errors: @collection.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    collection = current_user.collections.find_by(id: params[:id])
    collection.delete
    render json: { message: "Game removed from collection" }
  end
end
