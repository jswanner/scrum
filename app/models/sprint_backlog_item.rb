class SprintBacklogItem < BacklogItem
  belongs_to :product_backlog_item
  
  acts_as_list :scope => :product_backlog_item
end
