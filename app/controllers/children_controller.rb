class ChildrensController < ApplicationController



  get '/children/add_child' do

    erb :'/children/add_children'

  end
  post '/children/add_child' do
    if is_logged_in?
      @child = Children.new(:child_name => params[:child][:name])

       if @child.save
         @parent = Parents.find_by_id(session[:id])
         @parent_child = ParentsChildren.new()

         @parent_child.child_id = @child.id
         @parent_child.parent_id = @parent.id
         @parent_child.save
         

         redirect to '/parents'
       end
    end
  end

end
