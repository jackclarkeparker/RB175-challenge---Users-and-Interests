require 'yaml'

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

helpers do
  def count_interests
    @user_data.map do |user, data|
      data[:interests]
    end.flatten.count
  end
end

before do
  @user_data = YAML.load_file("users.yaml")
end

get "/" do
  redirect "/index"
end

get "/index" do
  @title = "Facebonkers"

  erb :index
end

get "/users/:name" do
  @user = params[:name]
  @display_name = @user.capitalize
  @title = "#{@display_name}'s page"

  erb :user
end