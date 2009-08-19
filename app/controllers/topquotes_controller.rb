class TopquotesController < ApplicationController
  # GET /topquotes
  # GET /topquotes.xml
  def index
    @topquotes = Topquote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topquotes }
    end
  end

  # GET /topquotes/1
  # GET /topquotes/1.xml
  def show
    @topquote = Topquote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topquote }
    end
  end

  # GET /topquotes/new
  # GET /topquotes/new.xml
  def new
    @topquote = Topquote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topquote }
    end
  end

  # GET /topquotes/1/edit
  def edit
    @topquote = Topquote.find(params[:id])
  end

  # POST /topquotes
  # POST /topquotes.xml
  def create
    @topquote = Topquote.new(params[:topquote])

    respond_to do |format|
      if @topquote.save
        flash[:notice] = 'Topquote was successfully created.'
        format.html { redirect_to(@topquote) }
        format.xml  { render :xml => @topquote, :status => :created, :location => @topquote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topquote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topquotes/1
  # PUT /topquotes/1.xml
  def update
    @topquote = Topquote.find(params[:id])

    respond_to do |format|
      if @topquote.update_attributes(params[:topquote])
        flash[:notice] = 'Topquote was successfully updated.'
        format.html { redirect_to(@topquote) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topquote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topquotes/1
  # DELETE /topquotes/1.xml
  def destroy
    @topquote = Topquote.find(params[:id])
    @topquote.destroy

    respond_to do |format|
      format.html { redirect_to(topquotes_url) }
      format.xml  { head :ok }
    end
  end
end
