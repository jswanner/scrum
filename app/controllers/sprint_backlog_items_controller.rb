class SprintBacklogItemsController < ApplicationController
  
  before_filter(:get_pbi)
  
  def new
    @sprint_backlog_item = SprintBacklogItem.new
    respond_to do |format|
      format.html
      format.js { render  :partial => 'redbox',
                          :locals => {  :sprint_backlog_item => @sprint_backlog_item,
                                        :pbi => @pbi,
                                        :project => @pbi.project,
                                        :sprint => @pbi.project.sprint } }
    end
  end
  
  # POST /sprint_backlog_items
  # POST /sprint_backlog_items.xml
  def create
    @sbis = @pbi.sprint_backlog_items
    sbi = @sbis.create(params[:sprint_backlog_item])
    @project = @pbi.project
    @sprint = @pbi.project.sprint
    render :action => 'new' unless sbi.valid?
  end
  
  def delete
    @sprint_backlog_item = SprintBacklogItem.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render  :partial => 'delete',
                          :locals => {  :sprint_backlog_item => @sprint_backlog_item,
                                        :pbi => @pbi,
                                        :project => @pbi.project,
                                        :sprint => @pbi.project.sprint } }
    end
  end
  
  def destroy
    SprintBacklogItem.find(params[:id]).destroy
    @sbis = @pbi.sprint_backlog_items
    @project = @pbi.project
    @sprint = @pbi.project.sprint
    
    respond_to do |format|
      format.html { redirect_to sprint_backlog_item_url }
      format.js
      format.xml  { head :ok }
    end
  end

  private
  
  def get_pbi
    @pbi = ProductBacklogItem.find(params[:product_backlog_item_id])
  end
end