class PostsController < ApplicationController

def index
  @posts = Post.all
end

def new
  @post = Post.new
end

def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def create
  @post = Post.new(post_params)
  if @post.save
    redirect_to @post
  else
    render :new, status: :unprocessable_entity
  end
end

def update
  @post = Post.find(params[:id])
  if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
end

def destroy
end

private
def post_params
  params.require(:post).permit(:title, :text)
end

end
