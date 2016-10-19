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
    if is_logged_in?
      redirect to '/parents/index'
    else
      if !params[:username].empty? && !params[:password].empty? && !params[:name].empty? && !params[:email].empty?
        if Parent.find_by(params[:username]) == nil
          @parent = Parents.new(:username => params[:username], :password => params[:password], :name => params[:name], :email => params[:email])
          if @parent.save
            @session[:id] = @parent.id
            redirect to '/parents/index'
          else
            redirect to '/signup'
        end
      else
        redirect to '/signup'
      end
    end

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
