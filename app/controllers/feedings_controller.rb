class FeedingsController < ApplicationController


  get '/feedings/:id/edit' do
    if is_logged_in?
      @feeding = Feeding.find_by_id(params[:id])
      @parent = current_user

      @children = Child.find_by_id(@feeding.child_id)
      
      erb :'/feedings/edit'

    else
      redirect to '/login'

    end
  end



  patch '/feedings/:id' do
    if is_logged_in?
      @feedings = Feeding.find_by_id(params[:id])
      @feedings.update(params[:feeding])
      @feedings.save


      redirect to "/children/#{@feedings.child_id}"
    else
      redirect to '/login'
    end
  end

  delete '/feedings/:id/delete' do
    if is_logged_in?
      @feedings = Feeding.find_by_id(params[:id])

      @feedings.delete

      redirect to "/parents/#{current_user.id}"
    else
      redirect to '/login'
    end
  end

end
