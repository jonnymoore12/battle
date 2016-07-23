require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  #enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    # There two player names are POST-ed from index.erb
    # as the name= part of input
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    erb(:attack)
  end

  post '/attack_type' do
    # attack_type corresponds to the whatever is input as value=
    # in play.erb i.e. whichever attack is selected before being
    # POST-ed to this route as the value="attack" parameter.
    $attack_type = params[:attack].to_s
    @game.attack($attack_type)
    redirect '/attack'
  end

  post '/switch' do
    @game.switch_turn
    redirect '/play'
  end

  get '/game_over' do
    erb(:game_over)
  end

  run! if app_file == $0

end
