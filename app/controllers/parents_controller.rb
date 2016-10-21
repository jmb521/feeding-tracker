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
    if is_logged_in?
      @child = Children.new(:child_name => params[:child][:name])

       if @child.save
         @parent = Parents.find_by_id(session[:id])
         @parent_child = ParentsChildren.new()

         @parent_child.child_id = @child.id
         @parent_child.parent_id = @parent.id
         @children = Children.all
         @children.each do |child|
           if @children.id == @parent_child.child_id
             @each_child << child
           end
           @each_child
         end
         redirect to '/parents'
       end
    end
  end
end #closes class
