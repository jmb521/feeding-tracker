
class ChildrensController < ApplicationController



  get '/children/add_child' do
    @parent = current_user
    erb :'/children/add_children'

  end
  post '/children/add_child' do
    if is_logged_in?
      @parent = current_user
      @parent.children.create(params[:children])



      redirect to "/parents/#{current_user.id}"

    end
  end

  get '/children/:id' do
    if is_logged_in?
      @children = Children.find_by_id(params[:id])
      @parent = current_user

      erb :'/children/index'
    else
      redirect to '/login'
    end
  end

  post '/children/:id/add_feeding' do
    if is_logged_in?
      @children = Children.find_by_id(params[:id])
      @children.feedings.create(params[:feeding])
      @children.save
      redirect to "/children/#{@children.id}"
    else
      redirect to '/login'
    end

  end

  get '/children/:id/edit' do
    if is_logged_in?
      @children = Children.find_by_id(params[:id])
      erb :'/children/edit'
    else
      redirect to '/login'
    end
  end

  patch '/children/:id' do
    if is_logged_in?
      @children = Children.find_by_id(params[:id])
      @children.update(params[:children])
      @children.save
      redirect to "/parents/#{current_user.id}"
    else
      redirect to '/login'
    end
  end


  delete '/children/:id/delete' do
    if is_logged_in?
      @children = Children.find_by_id(params[:id])

      @children.delete
      @parent = current_user
      redirect("/parents/#{@parent.id}")
    else
      redirect to '/login'
    end
  end

end
