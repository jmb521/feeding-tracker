class ParentsController < ApplicationController

  get '/parents/:id' do
    if is_logged_in?
      @parent = Parents.find_by_id(session[:id])

      @children = Children.all


      erb :'/parents/index'
          # binding.pry
    else
      redirect to '/login'
    end #closes if statement
  end #closes get



end #closes class
