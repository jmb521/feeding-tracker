require './config/environment'
require 'sinatra/base'
if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end



use Rack::MethodOverride
use ParentsController
use ChildrensController
use FeedingsController
run ApplicationController
