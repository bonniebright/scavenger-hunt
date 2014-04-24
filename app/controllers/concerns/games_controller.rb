class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    separated_coords = Location.separate_lat_lon(params[:game][:location])
    @location = Location.create(latitude: separated_coords[0], longitude: separated_coords[1])
    @game = @location.games.new(game_params)
    if @game.save
      flash[:notice] = "Game created"
      redirect_to root_url
    else
      render 'new'
    end
  end


  private
    def game_params
      params.require(:game).permit(:name, :user_id)
    end
end
