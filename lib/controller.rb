require 'bundler'
require 'gossip'
Bundler.require

class ApplicationController < Sinatra::Base

    get '/' do
      erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/new/' do
      erb :new_gossip
    end

    post '/gossips/new/' do
      Gossip.new(params["gossip_author"], params["gossip_content"], params["gossip_id"]).save
      redirect '/'
    end

    get '/hello/:name' do
      # matches "GET /hello/foo" and "GET /hello/bar"
      # params['name'] is 'foo' or 'bar'
      erb :show, locals: {gossip: Gossip.find(params['id'])}
    end

    

end

