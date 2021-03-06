require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'pg'

# db setup
before do
  @db = PG.connect(dbname: 'memetube', host: 'localhost')
end

after do
  @db.close
end

#Home
get '/' do
  redirect to '/videos'
end

#Index
get '/videos' do
  sql = 'SELECT * FROM memetubes'
  @videos = @db.exec(sql)

  erb :index
end

#New
get '/videos/new' do
  erb :new
end

#Create
post '/videos' do
  sql = "INSERT INTO memetubes (title, url, genre, description) VALUES ('#{params[:title]}', '#{params[:url]}', '#{params[:genre]}', '#{params[:description]}') returning *"
  # sql_tags = "INSERT INTO tags (tags) VALUES ('#{params[:tags]}) returning *"
    video = @db.exec(sql).first
    # tag = @db.exec(tags).first
end

#Show
get '/videos/:id' do
  sql = "SELECT * FROM memetubes WHERE id = #{params[:id]}"
  @video = @db.exec(sql).first

  erb :show
end

#Edit
get '/videos/:id/edit' do
  sql = "SELECT * FROM memetubes WHERE id = #{params[:id]}"
  @video = @db.exec(sql).first

  erb :edit
end

#Update
post '/videos/:id' do
  sql = "UPDATE memetubes SET title = '#{params[:title]}', url = '#{params[:url]}', genre = '#{params[:genre]}', description = '#{params[:description]}', tags = '#{params[:tags]}' WHERE id = #{params[:id]}"
  @db.exec(sql)

  redirect to "/videos/#{params[:id]}"
end

#Delete
post 'videos/:id/delete' do
   "Hello World"
  sql = "DELETE from memetubes WHERE id = #{params[:id]}"
  @db.exec(sql)

  redirect to '/videos'
end



