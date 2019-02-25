
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    #puts @articles[0].title
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles/' do
    #puts params
    @new_article = Article.create(params)
    #puts @new_article.id
    redirect to "/articles/#{ @new_article.id }"
  end

  get '/articles/:id' do
    params["id"]
    @article = Article.find(params["id"].to_i)
    #puts @article.content
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params["id"].to_i)
    erb :edit
  end

  patch "/articles/:id" do
    puts params
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  delete "/articles/:id" do
    puts params
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
