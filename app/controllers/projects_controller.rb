class ProjectsController < ApplicationController
  
  before_filter :login_required
  before_filter :get_sprint
  
  # GET /projects
  # GET /projects.xml
  def index
    @projects = @sprint.projects.find(:all, :order => 'position ASC')

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @projects.to_xml }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = @sprint.projects.find( params[:id],
                                      :include => [:product_backlog_items, :sprint_backlog_items],
                                      :order => "backlog_items.position ASC")

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @project.to_xml }
    end
  end

  # GET /projects/new
  def new
    @project = @sprint.projects.new
  end

  # GET /projects/1;edit
  def edit
    @project = @sprint.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = @sprint.projects.create(params[:project])

    respond_to do |format|
      if @project.valid?
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to project_url(@sprint, @project) }
        format.xml  { head :created, :location => project_url(@project) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors.to_xml }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = @sprint.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to project_url(@sprint, @project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors.to_xml }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = @sprint.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.xml  { head :ok }
    end
  end
  
  def order
      @project = @sprint.projects.find(params[:id])
      order = params[:pbis]

      order.each_with_index do |id, position|
        ProductBacklogItem.find(id).update_attribute(:position, position + 1)
      end

      @pbis = @project.product_backlog_items.find(:all, :order => "position ASC")
  end
  
  private
  
  def get_sprint
    @sprint = Sprint.find(params[:sprint_id])
  end
end
