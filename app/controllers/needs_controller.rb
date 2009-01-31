class NeedsController < ApplicationController
  before_filter :load_parent
  
  # GET /needs
  # GET /needs.xml
  def index
    @needs = @venture.needs.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @needs }
    end
  end

  # GET /needs/1
  # GET /needs/1.xml
  def show
    @need = Need.find(params[:id])
    @need_messages = @need.messages.paginate(:order=>'created_at DESC',:page=>params[:page])
    @contributors = @need.messages.collect{|m| m.account}.uniq
    @ventures = @need.ventures

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @need }
    end
  end

  # GET /needs/new
  # GET /needs/new.xml
  def new
    @need = @venture.needs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @need }
    end
  end

  # GET /needs/1/edit
  def edit
    @need = @venture.needs.find(params[:id])
  end

  # POST /needs
  # POST /needs.xml
  def create
    @need = @venture.needs.new(params[:need])

    respond_to do |format|
      if @need.save
        flash[:notice] = 'Need was successfully created.'
        format.html { redirect_to([@venture, @need]) }
        format.xml  { render :xml => @need, :status => :created, :location => @need }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @need.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /needs/1
  # PUT /needs/1.xml
  def update
    @need = @venture.needs.find(params[:id])

    respond_to do |format|
      if @need.update_attributes(params[:need])
        flash[:notice] = 'Need was successfully updated.'
        format.html { redirect_to([@venture, @need]) }
        format.xml  { head :ok }
				format.part do
					if params[:need].key?(:description)
						value = @need.description
					elsif params[:need].key?(:name)
						value = @need.name
					end
					render :partial => 'shared/editable_value', :locals => {:value => value}
				end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @need.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /needs/1
  # DELETE /needs/1.xml
  def destroy
    @need = Need.find(params[:id])
    @need.destroy

    respond_to do |format|
      format.html { redirect_to(venture_needs_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
    def load_parent
      @venture = Venture.find(params[:venture_id]) if params[:venture_id]
    end
end
