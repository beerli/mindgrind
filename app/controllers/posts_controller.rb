class PostsController < ApplicationController
  before_filter :require_user, :only => [:edit, :destroy, :update]
  
  # GET /posts
  # GET /posts.xml
  def index
   
   
    @posts = Post.paginate :page => params[:page], :per_page  => 10, :order  => "created_at DESC"
#    @posts = Post.find(:all, :order =>  "id DESC")
#    @posts = Post.find_tagged_with("test")
    @user = current_user
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def tag
    @posts = Post.find_tagged_with(params[:id])
    @user = current_user
    
    render "index"
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @posts }
#    end
  end

  # GET /posts/1
  # GET /posts/1.xml

  def show
    @post = Post.find(params[:id])
    @newcomment = Comment.new 
    @comment = Comment.find(:all, :conditions => {:post_id => params[:id]})
      
  
      
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @user = current_user
  if @post.owner == @user.id
    @post.destroy
  else
    flash[:notice] = "das ist nicht dein posting, punk!"
  end

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
