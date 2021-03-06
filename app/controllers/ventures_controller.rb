class VenturesController < ApplicationController
  # GET /ventures
  # GET /ventures.xml
  def index
    @svc_messages = Message.paginate(:order=>'created_at DESC',:page => params[:page])

		@newest_ventures = Venture.all(:order=>'id DESC', :limit => 10)
    @top_ventures = Venture.with_message_counts(:limit=>10)
    
    @top_contributors = Account.with_message_counts(:limit=>10)

		@newest_threads = Need.all(:order=>'id DESC', :limit => 10)
		@top_threads    = Need.with_message_counts(:limit=>10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ventures }
    end
  end

  # GET /ventures/1
  # GET /ventures/1.xml
  def show
    @venture = Venture.find_by_tag(params[:id])
    @venture_messages = @venture.messages.paginate(:order=>'created_at DESC',:page=>params[:page])
    @contributors = @venture.messages.tweets.collect{|m| m.account}.uniq
    
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
    @venture = Venture.find_by_tag(params[:id])

    respond_to do |format|
      if @venture.update_attributes(params[:venture])
        format.html do
          flash[:notice] = 'Venture was successfully updated.'
          redirect_to(@venture) 
        end
        format.xml  { head :ok }
				format.part do
					if params[:venture].key?(:tag)
						value = @venture.tag
					elsif params[:venture].key?(:description)
						value = @venture.description
					elsif params[:venture].key?(:url)
						value = @venture.url
					elsif params[:venture].key?(:name)
						value = @venture.name
					elsif params[:venture].key?(:feed)
						value = @venture.feed.url
					end
					render :partial => 'shared/editable_value', :locals => {:value => value}
				end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venture.errors, :status => :unprocessable_entity }
      end
    end
  end
end
