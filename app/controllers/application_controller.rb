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
      redirect to '/parents'
    else
      if !params[:username].empty? && !params[:password].empty? && !params[:name].empty? && !params[:email].empty?

          @parent = Parents.new(:username => params[:username], :password => params[:password], :name => params[:name], :email => params[:email])
          if @parent.save
            session[:id] = @parent.id
            binding.pry
            redirect to '/parents'
          else
            redirect to '/signup'
          end

      else
        redirect to '/signup'
      end

    end
  end







  helpers do

    def is_logged_in?
      !!session[:id]
    end

    def current_user
      Parent.find(session[:id])
    end
  end

end
