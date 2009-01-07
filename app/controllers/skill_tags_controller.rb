class SkillTagsController < ApplicationController
  # GET /skill_tags
  # GET /skill_tags.xml
  def index
    @skill_tags = SkillTag.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @skill_tags }
    end
  end

  # GET /skill_tags/1
  # GET /skill_tags/1.xml
  def show
    @skill_tag = SkillTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @skill_tag }
    end
  end

  # GET /skill_tags/new
  # GET /skill_tags/new.xml
  def new
    @skill_tag = SkillTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @skill_tag }
    end
  end

  # GET /skill_tags/1/edit
  def edit
    @skill_tag = SkillTag.find(params[:id])
  end

  # POST /skill_tags
  # POST /skill_tags.xml
  def create
    @skill_tag = SkillTag.new(params[:skill_tag])

    respond_to do |format|
      if @skill_tag.save
        flash[:notice] = 'SkillTag was successfully created.'
        format.html { redirect_to(@skill_tag) }
        format.xml  { render :xml => @skill_tag, :status => :created, :location => @skill_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @skill_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /skill_tags/1
  # PUT /skill_tags/1.xml
  def update
    @skill_tag = SkillTag.find(params[:id])

    respond_to do |format|
      if @skill_tag.update_attributes(params[:skill_tag])
        flash[:notice] = 'SkillTag was successfully updated.'
        format.html { redirect_to(@skill_tag) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @skill_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_tags/1
  # DELETE /skill_tags/1.xml
  def destroy
    @skill_tag = SkillTag.find(params[:id])
    @skill_tag.destroy

    respond_to do |format|
      format.html { redirect_to(skill_tags_url) }
      format.xml  { head :ok }
    end
  end
end
