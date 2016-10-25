class ChildrensController < ApplicationController



  get '/children/add_child' do

    erb :'/add_children'

  end
  post '/children/add_child' do
    if is_logged_in?
      @child = Children.new(:child_name => params[:child][:name])

       if @child.save
         @parent = Parents.find_by_id(session[:id])
         @parent.child_ids = @child.id


         redirect to '/parents'
       end
    end
  end

  get '/children/:id' do
    if is_logged_in?
      @children = Children.find_by_id(params[:id])
      erb :'/children/index'
    else
      redirect to '/login'
    end
  end

  post '/children/:id/add_feeding' do
    if is_logged_in?
      @children = Children.find_by_id(params[:id])

      @children.last_feeding = params[:current_time]
      binding.pry
    else
      redirect to '/login'
    end

  end
end
