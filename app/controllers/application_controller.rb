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
  get '/login' do
    if !is_logged_in?
      erb :login
    else
      @parent = current_user
      redirect to "/parents/#{@parent.id}"
    end
  end

  post '/login' do

    @parent = Parents.find_by(username: params[:username])

      if @parent && @parent.authenticate(params[:password])
       session[:id] = @parent.id
       redirect to "/parents/#{@parent.id}"

     else
       redirect to '/login'
     end
  end
  get '/logout' do
    if is_logged_in?
      session.destroy
      redirect to '/login'

    else
        redirect to "/parents/#{@parent.id}"
    end
  end


  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if !is_logged_in?
      if !params[:username].empty? && !params[:password].empty? && !params[:name].empty? && !params[:email].empty?

          @parent = Parents.new(:username => params[:username], :password => params[:password], :name => params[:name], :email => params[:email])
          if @parent.save
            # session[:id] = @parent.id

            redirect to "/parents/#{@parent.id}"
          else
            redirect to '/signup'
          end

      else
        redirect to '/signup'
      end
    else
      redirect to "/signup"

    end


  end



  helpers do

    def is_logged_in?
      !!session[:id]
    end

    def current_user
      Parents.find(session[:id])
    end
  end

end
