class ParentsController < ApplicationController

  get '/parents' do
    if is_logged_in?
      erb :index
    else
      redirect to '/login'
    end #closes if statement
  end #closes get
end #closes class
