get "/" do
  redirect '/posts'
end

get "/posts" do
  @posts = Post.all
  erb :"posts/index"
end

get "/posts/new" do
  erb :"posts/new"
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :"posts/show"
end

get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  erb :"posts/edit"
end

post "/posts" do
  post = Post.create(
    title: params[:title],
    body: params[:body]
  )
  redirect "/posts/#{post.id}"
end

post "/posts/:id" do
  post = Post.find(params[:id])
  post.update(
    title: params[:title],
    body: params[:body]
  )
  redirect "/posts/#{post.id}"
end

post "/posts/:id/destroy" do
  Post.destroy(params[:id])
  redirect "/posts"
end
