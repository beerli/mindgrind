class MainController < ApplicationController

  def index
    @posts = Post.find(:all, :order =>  "id DESC")
    @user = current_user
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

end
