require "sinatra"
require "pg"
require 'pry'
require_relative "models/insult.rb"

configure :development do
  set :db_config, { dbname: "shakespeare" }
end

configure :test do
  set :db_config, { dbname: "shakespeare_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  redirect "/shakespeare/insults"
end

get "/shakespeare/insults" do
  @num = 1
  @insult_rand = Insult.random_insult_id
  @insult = Insult.find(@num)
  erb :index
end

get "/shakespeare/insults/:num" do
@num = params[:num]
@insult_rand = Insult.random_insult_id
@insult = Insult.find(@num)

erb :index
end
