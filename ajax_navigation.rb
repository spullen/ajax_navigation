require 'bundler/setup'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/static_assets'

class AjaxNavigation < Sinatra::Base
  register Sinatra::StaticAssets
  
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    erb :index, :layout => (request.xhr? ? false : :layout)
  end
  
  get '/page1' do
    erb :page1, :layout => (request.xhr? ? false : :layout)
  end
  
  get '/page2' do
    erb :page2, :layout => (request.xhr? ? false : :layout)
  end
  
  not_found do
    erb :'404'
  end
end

at_exit { AjaxNavigation.run! if $!.nil? && AjaxNavigation.run? }
