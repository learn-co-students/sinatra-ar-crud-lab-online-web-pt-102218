
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id' do
    erb :show
  end
end
