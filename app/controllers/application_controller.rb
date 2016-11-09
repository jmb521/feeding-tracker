
require 'sinatra'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  use Rack::Flash

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

    @parent = Parent.find_by(username: params[:username])

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
      redirect to '/'

    else
        redirect to "/parents/#{@parent.id}"
    end
  end


  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if !is_logged_in?
      if !params[:username].empty? && !params[:password].empty? && !params[:name].empty? && !params[:email].empty? && !params[:password_verify].empty?
        if params[:password] == params[:password_verify]
          @parent = Parent.new(:username => params[:username], :password => params[:password], :name => params[:name], :email => params[:email])
          if @parent.save
            session[:id] = @parent.id

            redirect to "/parents/#{@parent.id}"
          else
            redirect to '/signup'
          end
        else
          flash[:message] = "Passwords do not match"
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
      Parent.find(session[:id])
    end
  end

end
