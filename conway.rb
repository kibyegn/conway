require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra'
require 'json'

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
end
