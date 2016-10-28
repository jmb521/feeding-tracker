class FamilyController < ApplicationController

  get '/family' do

  end

  post '/family/add_name' do
    if is_logged_in?
      
    else
      redirect to '/login'
    end
  end


end
