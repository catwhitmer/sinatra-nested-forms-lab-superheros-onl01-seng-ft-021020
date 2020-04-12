require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :super_hero
  end
  
  get '/teams' do 
    @heroes = Hero.all
    erb :team
  end
  

  post '/teams' do
    @team = Team.new(params[:team][:name], params[:team][:motto])
       
    @hero = Hero.new(params[:name], params[:power], params[:bio])

    erb :team
  end
end