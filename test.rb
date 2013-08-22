class TestApp < Sinatra::Base

  get '/' do
    "Hello World!"
  end

  get '/cache' do
    cache_control :private, max_age: 60
    "should cache. #{Time.now.utc}\n"
  end

  get '/no-cache' do
    cache_control :no_cache, max_age: 0 
    "should not cache. #{Time.now.utc}\n"
  end

  get '/cache/sleep/:time' do
    sleep params[:time].to_f
    cache_control :private, max_age: 60
    "should cache. #{Time.now.utc}\n"
  end

  get '/no-cache/sleep/:time' do
    sleep params[:time].to_f
    cache_control :no_cache, max_age: 0 
    "should not cache. #{Time.now.utc}\n"
  end



end
