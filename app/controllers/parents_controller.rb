class ParentsController < ApplicationController

  get '/parents' do
    if is_logged_in?
      @parent = Parents.find_by_id(session[:id])

      erb :'/parents/index'
    else
      redirect to '/login'
    end #closes if statement
  end #closes get


  post '/parents/add_child' do

    binding.pry
    @child = Children.new(:name => params[:child][:name])
     if @child.save
       @parent = Parents.find_by_id(session[:id])
       @parent.child_id = @child.id
     end
  end
end #closes class
