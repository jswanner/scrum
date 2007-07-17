class ProductBacklogItemsController < ApplicationController
  
  before_filter :login_required
  before_filter(:get_project)
  
  def new
    @pbi = ProductBacklogItem.new
  end
  
  # POST /product_backlog_items
  # POST /product_backlog_items.xml
  def create
    @pbis = @project.product_backlog_items
    @pbi = @pbis.create(params[:product_backlog_item])
    
    @sprint = @project.sprint
    
    render :action => 'new' unless @pbi.valid?
  end

  def delete
    @product_backlog_item = ProductBacklogItem.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render  :partial => 'delete',
                          :locals => {  :product_backlog_item => @product_backlog_item,
                                        :project => @project,
                                        :sprint => @project.sprint } }
    end
  end
  
  def destroy
    ProductBacklogItem.find(params[:id]).destroy
    @pbis = @project.product_backlog_items
    
    @sprint = @project.sprint

    respond_to do |format|
      format.html { redirect_to product_backlog_item_url }
      format.js
    end
  end

  def edit
    @product_backlog_item = ProductBacklogItem.find(params[:id])
    @sprint = @project.sprint

    respond_to do |format|
      format.html
      format.js { render  :partial => 'edit_remote',
                          :locals => {  :project => @project,
                                        :sprint => @sprint } }
    end
  end

  def update
    pbi = ProductBacklogItem.find(params[:id])
    pbi.update_attributes(params[:product_backlog_item])
    @pbis = @project.product_backlog_items
    @sprint = @project.sprint

    respond_to do |format|
      format.html { redirect_to product_backlog_item_url }
      format.js
      format.xml  { head :ok }
    end
  end
  
  def order
    @pbi = ProductBacklogItem.find(params[:id])
    order = params["sbis_for_#{@pbi.id}".to_sym]

    order.each_with_index do |id, position|
      SprintBacklogItem.find(id).update_attribute(:position, position + 1)
    end
    
    @sprint = @project.sprint
    @sbis = SprintBacklogItem.find( :all,
                                    :conditions => ["product_backlog_item_id = ?", @pbi.id],
                                    :order => "position ASC")
  end
  
  private
  
  def get_project
    @project = Project.find(params[:project_id])
  end
end
