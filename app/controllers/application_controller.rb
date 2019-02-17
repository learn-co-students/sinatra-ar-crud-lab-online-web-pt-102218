
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Artist.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end


  get '/articles' do
   @articles = Article.all
   erb :index
 end

  post '/articles' do
   article = Article.new
   article.title = params[:title]
   article.content = params[:content]
   article.save
   redirect "/articles/#{article.id}"
 end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

 patch '/articles/:id' do
  article = Article.find(params[:id])
  article.title = params[:title]
  article.content = params[:content]
  article.save

   redirect "/articles/#{article.id}"
 end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  delete '/articles/:id/delete' do
    article = Article.find(params[:id])
    article.destroy
  end
end



#  get '/articles/:id/edit' do
#    @article = Article.find(params["id"])
#  erb :edit
#  end

#  patch '/articles/:id' do
#    @article = Article.find(params["id"])
#    @article.update(params["article"])
#    redirect "articles/#{@article.id}"
#  end

#  delete '/articles/:id/delete' do
#    @article = Article.find(params["id"])
##    @article.delete
#    erb :index
#  end
#end
