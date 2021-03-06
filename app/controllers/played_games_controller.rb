class PlayedGamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new

  end

  def create
   @played_game = Played_game.create(game_id: params[:game_id], user_id: current_user.id)
    redirect_to played_game_path(@played_game)
  end

  def show
    respond_to do |f|
      f.html do
        @guess = Guess.new
        @played_game = Played_game.find(params[:id])
      end
      f.js do
        redirect_to root_path
      end
    end
  end
end
