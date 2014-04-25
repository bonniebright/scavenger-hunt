class PlayedGamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @playedgame = PlayedGame.new
  end

  def create
   @playedgame = PlayedGame.create(game_id: params[:game][:game_id], user_id: current_user.id)

   redirect_to played_game_path(@playedgame)
  end

  def show
    respond_to do |f|
      f.html do
        @guess = Guess.new
        @playedgame = PlayedGame.find(params[:id])
        @clues = @playedgame.game.clues
      end
      f.js do
        @guesses = @PlayedGame.guesses
      end
    end
  end
end
