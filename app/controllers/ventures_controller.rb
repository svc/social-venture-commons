class VenturesController < ApplicationController
  # GET /ventures
  # GET /ventures.xml
  def index
    @ventures = Venture.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ventures }
    end
  end

  # GET /ventures/1
  # GET /ventures/1.xml
  def show
    @venture = Venture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venture }
    end
  end

  # GET /ventures/new
  # GET /ventures/new.xml
  def new
    @venture = Venture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venture }
    end
  end

  # GET /ventures/1/edit
  def edit
    @venture = Venture.find(params[:id])
  end

  # POST /ventures
  # POST /ventures.xml
  def create
    @venture = Venture.new(params[:venture])

    respond_to do |format|
      if @venture.save
        flash[:notice] = 'Venture was successfully created.'
        format.html { redirect_to(@venture) }
        format.xml  { render :xml => @venture, :status => :created, :location => @venture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ventures/1
  # PUT /ventures/1.xml
  def update
    @venture = Venture.find(params[:id])

    respond_to do |format|
      if @venture.update_attributes(params[:venture])
        flash[:notice] = 'Venture was successfully updated.'
        format.html { redirect_to(@venture) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ventures/1
  # DELETE /ventures/1.xml
  def destroy
    @venture = Venture.find(params[:id])
    @venture.destroy

    respond_to do |format|
      format.html { redirect_to(ventures_url) }
      format.xml  { head :ok }
    end
  end
end
