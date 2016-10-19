require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Feed the babies"
  end

  get '/' do
    erb :'index'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @parent = Parents.new(:username => params[:username], :password => params[:password], :name => params[:name])
    binding.pry

  end




  helpers do

    def is_logged_in?
      !!session[:user_id]
    end

    def current_user
      Parent.find(session[:user_id])
    end
  end

end
