class FeedingsController < ApplicationController


  get '/feedings/:id/edit' do
    if is_logged_in?
      @feeding = Feedings.find_by_id(params[:id])
      erb :'/feedings/edit'

    else
      redirect to '/login'

    end
  end

  patch '/feedings/:id' do
    if is_logged_in?
      @feedings = Feedings.find_by_id(params[:id])
      @feedings.update(params[:feedings])
      @feedings.save
      redirect to "/feedings/#{@feedings.id}"
    else
      redirect to '/login'
    end
  end

  delete '/feedings/:id/delete' do
    if is_logged_in?
      @feedings = Feedings.find_by_id(params[:id])

      @feedings.delete
      @parent = current_user
      redirect("/children/#{@children.id}")
    else
      redirect to '/login'
    end
  end

end
