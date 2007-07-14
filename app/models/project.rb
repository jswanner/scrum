class Project < ActiveRecord::Base
  belongs_to :sprint
  has_many :product_backlog_items, :dependent => :destroy, :order => "position"
  has_many :sprint_backlog_items, :through => :product_backlog_items, :source => :project
  
  acts_as_list :scope => :sprint
  
  validates_presence_of :title
end
