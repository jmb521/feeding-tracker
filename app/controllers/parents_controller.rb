class ParentsController < ApplicationController

  get '/parents/:id' do
    if is_logged_in?
      @parent = current_user

      

      erb :'/parents/index'

    else
      redirect to '/login'
    end #closes if statement
  end #closes get



end #closes class
