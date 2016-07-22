require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  #enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
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
    #@game.attack
    erb(:attack)
  end

  post '/attack_type' do
    $attack = params[:attack]
    @game.attack($attack.to_s)
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
