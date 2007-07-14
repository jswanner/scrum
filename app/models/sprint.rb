class Sprint < ActiveRecord::Base
  has_many :projects
  
  validates_presence_of :start_on
  validates_presence_of :end_on
end
