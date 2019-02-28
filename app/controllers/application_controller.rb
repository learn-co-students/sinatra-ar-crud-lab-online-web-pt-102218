
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/new' do
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find(params['id'])
    erb :show
  end
  
  post '/articles' do
    @new_article = Article.create( title: params["title"], content: params["content"] )
    # binding.pry
    redirect "/articles/#{@new_article.id}" 
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params['id'])
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{params[:id]}"
  end
  
  delete '/articles/:id' do
    # binding.pry
    Article.find(params[:id]).delete
    redirect '/articles'
  end
  
end
