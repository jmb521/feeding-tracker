class ParentsController < ApplicationController

  get '/parents' do
    if is_logged_in?
      @parent = Parents.find_by_id(session[:id])

      @children = Children.all
      binding.pry

      erb :'/parents/index'
          # binding.pry
    else
      redirect to '/login'
    end #closes if statement
  end #closes get



end #closes class
