class ProductBacklogItem < BacklogItem
  belongs_to :project
  has_many :sprint_backlog_items, :dependent => :destroy, :order => "position"
  
  acts_as_list :scope => :project
end
