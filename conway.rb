require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra'
# require 'json'
require File.expand_path("../lib/cell", __FILE__)
require File.expand_path("../lib/game_of_life", __FILE__)

class Conway < Sinatra::Base
  set :static, true
  set :public, 'public'
  set :show_execptions, true
  
  get '/' do
    erb :index
  end
  
  get '/conway.json' do
    content_type :json
    { :key1 => 'value1', :key2 => 'value2' }.to_json
  end
  
  get '/conway' do
    @game = GameOfLife.new(30)
    @world = @game.create_connections
    @world.to_json
  end
end
