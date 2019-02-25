
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"

  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @art = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
   @art = Article.find(params[:id])
   @art.update(title: params[:title], content: params[:content])
   redirect "/articles/#{@art.id}"
 end

 delete "/articles/:id" do
   Article.destroy(params[:id])
   redirect to "/articles"
 end



end
